Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6E1A79FD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:46:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOK1h-00059w-Il; Tue, 14 Apr 2020 11:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOK1f-00059g-Gg
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:46:47 +0000
X-Inumbo-ID: 9e86310e-7e45-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e86310e-7e45-11ea-9e09-bc764e2007e4;
 Tue, 14 Apr 2020 11:46:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3812AAC44;
 Tue, 14 Apr 2020 11:46:45 +0000 (UTC)
Subject: [PATCH v6 05/10] x86/HVM: scale MPERF values reported to guests (on
 AMD)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Message-ID: <d37edec9-5a87-e095-18d8-6b4d3fa8dced@suse.com>
Date: Tue, 14 Apr 2020 13:46:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

AMD's PM specifies that MPERF (and its r/o counterpart) reads are
affected by the TSC ratio. Hence when processing such reads in software
we too should scale the values. While we don't currently (yet) expose
the underlying feature flags, besides us allowing the MSRs to be read
nevertheless, RDPRU is going to expose the values even to user space.

Furthermore, due to the not exposed feature flags, this change has the
effect of making properly inaccessible (for reads) the two MSRs.

Note that writes to MPERF (and APERF) continue to be unsupported.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.
---
I did consider whether to put the code in guest_rdmsr() instead, but
decided that it's better to have it next to TSC handling.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3454,6 +3454,22 @@ int hvm_msr_read_intercept(unsigned int
         *msr_content = v->arch.hvm.msr_tsc_adjust;
         break;
 
+    case MSR_MPERF_RD_ONLY:
+        if ( !d->arch.cpuid->extd.efro )
+        {
+            goto gp_fault;
+
+    case MSR_IA32_MPERF:
+            if ( !(d->arch.cpuid->basic.raw[6].c &
+                   CPUID6_ECX_APERFMPERF_CAPABILITY) )
+                goto gp_fault;
+        }
+        if ( rdmsr_safe(msr, *msr_content) )
+            goto gp_fault;
+        if ( d->arch.cpuid->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+            *msr_content = hvm_get_guest_tsc_fixed(v, *msr_content);
+        break;
+
     case MSR_APIC_BASE:
         *msr_content = vcpu_vlapic(v)->hw.apic_base_msr;
         break;
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -397,6 +397,9 @@
 #define MSR_IA32_MPERF			0x000000e7
 #define MSR_IA32_APERF			0x000000e8
 
+#define MSR_MPERF_RD_ONLY		0xc00000e7
+#define MSR_APERF_RD_ONLY		0xc00000e8
+
 #define MSR_IA32_THERM_CONTROL		0x0000019a
 #define MSR_IA32_THERM_INTERRUPT	0x0000019b
 #define MSR_IA32_THERM_STATUS		0x0000019c



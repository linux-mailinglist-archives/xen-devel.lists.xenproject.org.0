Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F23332E545
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 10:51:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93550.176507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI76U-00013K-6A; Fri, 05 Mar 2021 09:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93550.176507; Fri, 05 Mar 2021 09:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI76U-00012t-1b; Fri, 05 Mar 2021 09:50:38 +0000
Received: by outflank-mailman (input) for mailman id 93550;
 Fri, 05 Mar 2021 09:50:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lI76S-00012Y-FA
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 09:50:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce551b54-da3f-4b04-b17a-3ff2d3a02bd2;
 Fri, 05 Mar 2021 09:50:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B058AD2B;
 Fri,  5 Mar 2021 09:50:34 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ce551b54-da3f-4b04-b17a-3ff2d3a02bd2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614937834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbp0ZeIs23as1aSnoDDNOra/cmQasCaFDr5FahgqHRA=;
	b=XisvG7VddzkHwQEWLGbNbccD2tZvfvbco3mvOAkUIG2iVdxwB/+FZrtW6KLPbdzqwXtbIT
	r2DbWmY7RT1ONJg6B3KKI57NFSoCJHYqArXX3jjNjnLSPTOLqNkRKioAuwRoFJxfSfBg/r
	7ybUj9DDgvnW702WJsJq4i+eUkS5UQE=
Subject: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
Message-ID: <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
Date: Fri, 5 Mar 2021 10:50:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Prior to 4.15 Linux, when running in PV mode, did not install a #GP
handler early enough to cover for example the rdmsrl_safe() of
MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
of MSR_K7_HWCR later in the same function). The respective change
(42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
backported to 4.14, but no further - presumably since it wasn't really
easy because of other dependencies.

Therefore, to prevent our change in the handling of guest MSR accesses
to render PV Linux 4.13 and older unusable on at least AMD systems, make
the raising of #GP on this paths conditional upon the guest having
installed a handler, provided of course the MSR can be read in the first
place (we would have raised #GP in that case even before). Producing
zero for reads isn't necessarily correct and may trip code trying to
detect presence of MSRs early, but since such detection logic won't work
without a #GP handler anyway, this ought to be a fair workaround.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Probe MSR read. Exclude hypervisor range. Avoid issuing two log
    messages (in debug builds). Don't alter WRMSR behavior.
---
I'm not convinced we can get away without also making the WRMSR path
somewhat more permissive again, e.g. tolerating attempts to set bits
which are already set. But of course this would require keeping in sync
for which MSRs we "fake" reads, as then a kernel attempt to set a bit
may also appear as an attempt to clear others (because of the zero value
that we gave it for the read).

--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
     const struct cpuid_policy *cp = currd->arch.cpuid;
-    bool vpmu_msr = false;
+    bool vpmu_msr = false, warn = false;
     int ret;
 
     if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
@@ -882,7 +882,7 @@ static int read_msr(unsigned int reg, ui
         if ( ret == X86EMUL_EXCEPTION )
             x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
 
-        return ret;
+        goto done;
     }
 
     switch ( reg )
@@ -986,7 +986,7 @@ static int read_msr(unsigned int reg, ui
         }
         /* fall through */
     default:
-        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
+        warn = true;
         break;
 
     normal:
@@ -995,7 +995,19 @@ static int read_msr(unsigned int reg, ui
         return X86EMUL_OKAY;
     }
 
-    return X86EMUL_UNHANDLEABLE;
+ done:
+    if ( ret != X86EMUL_OKAY && !curr->arch.pv.trap_ctxt[X86_EXC_GP].address &&
+         (reg >> 16) != 0x4000 && !rdmsr_safe(reg, *val) )
+    {
+        gprintk(XENLOG_WARNING, "faking RDMSR 0x%08x\n", reg);
+        *val = 0;
+        x86_emul_reset_event(ctxt);
+        ret = X86EMUL_OKAY;
+    }
+    else if ( warn )
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
+
+    return ret;
 }
 
 static int write_msr(unsigned int reg, uint64_t val,



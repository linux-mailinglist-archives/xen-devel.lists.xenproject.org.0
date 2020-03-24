Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EF519166F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 17:30:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGmQA-0003So-Kj; Tue, 24 Mar 2020 16:28:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGmQ9-0003Sd-Hx
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 16:28:53 +0000
X-Inumbo-ID: 8c5952ae-6dec-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c5952ae-6dec-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 16:28:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CCAF5ABF4;
 Tue, 24 Mar 2020 16:28:51 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Message-ID: <7c4b7701-0840-1e06-3b54-e259c223e61c@suse.com>
Date: Tue, 24 Mar 2020 17:28:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH 6/7] x86emul: vendor specific SYSCALL behavior
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

AMD CPUs permit the insn everywhere (even outside of protected mode),
while Intel ones restrict it to 64-bit mode. While at it also add the
so far missing CPUID bit check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1870,6 +1870,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_f16c()        (ctxt->cpuid->basic.f16c)
 #define vcpu_has_rdrand()      (ctxt->cpuid->basic.rdrand)
 
+#define vcpu_has_syscall()     (ctxt->cpuid->extd.syscall)
 #define vcpu_has_mmxext()      (ctxt->cpuid->extd.mmxext || vcpu_has_sse())
 #define vcpu_has_3dnow_ext()   (ctxt->cpuid->extd._3dnowext)
 #define vcpu_has_3dnow()       (ctxt->cpuid->extd._3dnow)
@@ -5897,13 +5898,13 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x05): /* syscall */
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
-
+        vcpu_must_have(syscall);
         /* Inject #UD if syscall/sysret are disabled. */
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
         generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);
+        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
 
         if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;



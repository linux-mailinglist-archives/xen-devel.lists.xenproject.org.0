Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E49199AA4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 18:01:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJHV-0007M7-3g; Tue, 31 Mar 2020 15:58:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJJHT-0007Lx-VC
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 15:58:23 +0000
X-Inumbo-ID: 72ee9c80-7368-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72ee9c80-7368-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 15:58:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9D9D3AE4B;
 Tue, 31 Mar 2020 15:58:22 +0000 (UTC)
Subject: [PATCH v2 1/2] x86emul: vendor specific SYSCALL behavior
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4b15b26-4492-efb0-c19a-288c0fd65ba9@suse.com>
Message-ID: <d87ee7fe-b658-2b6d-e492-55589cadc7b5@suse.com>
Date: Tue, 31 Mar 2020 17:58:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e4b15b26-4492-efb0-c19a-288c0fd65ba9@suse.com>
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

AMD CPUs permit the insn everywhere (even outside of protected mode),
while Intel ones restrict it to 64-bit mode. While at it also comment
about the apparently missing CPUID bit check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Replace CPUID bit check by comment.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5897,13 +5897,16 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC(0x0f, 0x05): /* syscall */
-        generate_exception_if(!in_protmode(ctxt, ops), EXC_UD);
-
-        /* Inject #UD if syscall/sysret are disabled. */
+        /*
+         * Inject #UD if syscall/sysret are disabled. EFER.SCE can't be set
+         * with the respective CPUID bit clear, so no need for an explicit
+         * check of that one.
+         */
         fail_if(ops->read_msr == NULL);
         if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
         generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);
+        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
 
         if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;



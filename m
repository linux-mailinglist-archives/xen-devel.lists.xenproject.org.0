Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706323682C4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115526.220444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZahY-0005S5-8E; Thu, 22 Apr 2021 14:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115526.220444; Thu, 22 Apr 2021 14:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZahY-0005Rg-4H; Thu, 22 Apr 2021 14:53:08 +0000
Received: by outflank-mailman (input) for mailman id 115526;
 Thu, 22 Apr 2021 14:53:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZahX-0005Ra-99
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:53:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5a7a2ae-3752-4c6a-a4f1-b1c71f1aebc7;
 Thu, 22 Apr 2021 14:53:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6228B12C;
 Thu, 22 Apr 2021 14:53:05 +0000 (UTC)
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
X-Inumbo-ID: c5a7a2ae-3752-4c6a-a4f1-b1c71f1aebc7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3YA7TeiA4XEzSJsFpFCqRC4Ay1WG3ZSQOmpYlC59ls=;
	b=r5Z3tPJLVcwGOEtqjSxBpldVS0yvlI56I7r2/8H4JXvKLeoi/rQQl1S6Hl6RpemlmklXQV
	GhrToU6siwujuJBRrR970qEXTIO4MBfBoN/Yn43i4doVwpLnNKfU3TxYx3HBn+LUg982VA
	yVjnK3+O7BTOOh6dx9vzlx9rg79F5mc=
Subject: [PATCH v3 14/22] x86emul: introduce X86EMUL_FPU_{tilecfg,tile}
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <3472a5ac-3b59-157f-ba21-997f5e726e4b@suse.com>
Date: Thu, 22 Apr 2021 16:53:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These will be used by AMX insns. They're not sensitive to CR0.TS, but
instead some are sensitive to XFD.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Separate X86EMUL_FPU_tilecfg. Use XFD alternative logic instead of
    checking CR0.TS.
v2: New.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1420,6 +1420,13 @@ static int _get_fpu(
             return X86EMUL_UNHANDLEABLE;
         break;
 
+    case X86EMUL_FPU_tilecfg:
+    case X86EMUL_FPU_tile:
+        ASSERT(mode_64bit());
+        if ( !(xcr0 & X86_XCR0_TILECFG) || !(xcr0 & X86_XCR0_TILEDATA) )
+            return X86EMUL_UNHANDLEABLE;
+        break;
+
     default:
         break;
     }
@@ -1429,6 +1436,7 @@ static int _get_fpu(
     if ( rc == X86EMUL_OKAY )
     {
         unsigned long cr0;
+        uint64_t xcr0_needed = 0;
 
         fail_if(type == X86EMUL_FPU_fpu && !ops->put_fpu);
 
@@ -1453,15 +1461,45 @@ static int _get_fpu(
             /* Should be unreachable if VEX decoding is working correctly. */
             ASSERT((cr0 & X86_CR0_PE) && !(ctxt->regs->eflags & X86_EFLAGS_VM));
         }
-        if ( cr0 & X86_CR0_EM )
+
+        switch ( type )
+        {
+        default:
+            if ( cr0 & X86_CR0_EM )
+            {
+                generate_exception_if(type == X86EMUL_FPU_fpu, EXC_NM);
+                generate_exception_if(type == X86EMUL_FPU_mmx, EXC_UD);
+                generate_exception_if(type == X86EMUL_FPU_xmm, EXC_UD);
+            }
+            generate_exception_if((cr0 & X86_CR0_TS) &&
+                                  (type != X86EMUL_FPU_wait ||
+                                   (cr0 & X86_CR0_MP)),
+                                  EXC_NM);
+            break;
+
+        case X86EMUL_FPU_tilecfg:
+            break;
+
+        case X86EMUL_FPU_tile:
+            xcr0_needed = X86_XCR0_TILEDATA;
+            break;
+        }
+
+        if ( xcr0_needed && ctxt->cpuid->xstate.xfd )
         {
-            generate_exception_if(type == X86EMUL_FPU_fpu, EXC_NM);
-            generate_exception_if(type == X86EMUL_FPU_mmx, EXC_UD);
-            generate_exception_if(type == X86EMUL_FPU_xmm, EXC_UD);
+            uint64_t xfd;
+
+            fail_if(!ops->read_msr);
+            rc = ops->read_msr(MSR_XFD, &xfd, ctxt);
+            if ( rc == X86EMUL_OKAY && (xfd & xcr0_needed) )
+            {
+                fail_if(!ops->write_msr);
+                rc = ops->read_msr(MSR_XFD_ERR, &xfd, ctxt);
+                if ( rc == X86EMUL_OKAY )
+                    rc = ops->write_msr(MSR_XFD_ERR, xfd | xcr0_needed, ctxt);
+                generate_exception_if(rc == X86EMUL_OKAY, EXC_NM);
+            }
         }
-        generate_exception_if((cr0 & X86_CR0_TS) &&
-                              (type != X86EMUL_FPU_wait || (cr0 & X86_CR0_MP)),
-                              EXC_NM);
     }
 
  done:
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -172,6 +172,8 @@ enum x86_emulate_fpu_type {
     X86EMUL_FPU_ymm, /* AVX/XOP instruction set (%ymm0-%ymm7/15) */
     X86EMUL_FPU_opmask, /* AVX512 opmask instruction set (%k0-%k7) */
     X86EMUL_FPU_zmm, /* AVX512 instruction set (%zmm0-%zmm7/31) */
+    X86EMUL_FPU_tilecfg, /* AMX configuration (tilecfg) */
+    X86EMUL_FPU_tile, /* AMX instruction set (%tmm0-%tmmN) */
     /* This sentinel will never be passed to ->get_fpu(). */
     X86EMUL_FPU_none
 };



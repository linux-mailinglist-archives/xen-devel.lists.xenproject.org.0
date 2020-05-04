Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600B51C3E17
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 17:07:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVcg1-0005Xc-D9; Mon, 04 May 2020 15:06:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVcg0-0005XR-2k
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 15:06:36 +0000
X-Inumbo-ID: d8625fdc-8e18-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8625fdc-8e18-11ea-b9cf-bc764e2007e4;
 Mon, 04 May 2020 15:06:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 13E88ABCC;
 Mon,  4 May 2020 15:06:36 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: extend x86_insn_is_mem_write() coverage
Message-ID: <5bf829b6-c60d-7849-e2a5-f84485849197@suse.com>
Date: Mon, 4 May 2020 17:06:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

Several insns were missed when this function was first added. As far as
insns already supported by the emulator go - SMSW and {,V}STMXCSR were
wrongly considered r/o insns so far.

Insns like the VMX, SVM, or CET-SS ones, PTWRITE, or AMD's new SNP ones
are intentionally not covered just yet. VMPTRST is put there just to
complete the respective group.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -11551,13 +11551,39 @@ x86_insn_is_mem_write(const struct x86_e
         break;
 
     case X86EMUL_OPC(0x0f, 0x01):
-        return !(state->modrm_reg & 6); /* SGDT / SIDT */
+        switch ( state->modrm_reg & 7 )
+        {
+        case 0: /* SGDT */
+        case 1: /* SIDT */
+        case 4: /* SMSW */
+            return true;
+        }
+        break;
+
+    case X86EMUL_OPC(0x0f, 0xae):
+        switch ( state->modrm_reg & 7 )
+        {
+        case 0: /* FXSAVE */
+        case 3: /* {,V}STMXCSR */
+        case 4: /* XSAVE */
+        case 6: /* XSAVEOPT */
+            return true;
+        }
+        break;
 
     case X86EMUL_OPC(0x0f, 0xba):
         return (state->modrm_reg & 7) > 4; /* BTS / BTR / BTC */
 
     case X86EMUL_OPC(0x0f, 0xc7):
-        return (state->modrm_reg & 7) == 1; /* CMPXCHG{8,16}B */
+        switch ( state->modrm_reg & 7 )
+        {
+        case 1: /* CMPXCHG{8,16}B */
+        case 4: /* XSAVEC */
+        case 5: /* XSAVES */
+        case 7: /* VMPTRST */
+            return true;
+        }
+        break;
     }
 
     return false;


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B82A19166A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 17:29:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGmP0-0003FI-0h; Tue, 24 Mar 2020 16:27:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGmOy-0003F5-VS
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 16:27:40 +0000
X-Inumbo-ID: 60b06264-6dec-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60b06264-6dec-11ea-a6c1-bc764e2007e4;
 Tue, 24 Mar 2020 16:27:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89F6CACC2;
 Tue, 24 Mar 2020 16:27:38 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Message-ID: <fbabdcdb-3123-75e7-896c-9c7dd844f409@suse.com>
Date: Tue, 24 Mar 2020 17:27:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH 4/7] x86emul: vendor specific near indirect
 branch behavior in 64-bit mode
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

Intel CPUs ignore operand size overrides here, while AMD ones don't.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -813,6 +813,17 @@ static const struct {
         .opcode = { 0x66, 0x67, 0xe3, 0x10 },
         .opc_len = { 4, 4 },
         .disp = { 4 + 16 - MMAP_ADDR, 4 + 16 },
+    }, {
+        .descr = "jmpw *(%rsp)",
+        .opcode = { 0x66, 0xff, 0x24, 0x24 },
+        .opc_len = { 4, 4 },
+        .disp = { STKVAL_DISP - MMAP_ADDR, STKVAL_DISP },
+    }, {
+        .descr = "callw *(%rsp)",
+        .opcode = { 0x66, 0xff, 0x14, 0x24 },
+        .opc_len = { 4, 4 },
+        .stkoff = { -2, -8 },
+        .disp = { STKVAL_DISP - MMAP_ADDR, STKVAL_DISP },
     },
 };
 #endif
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2524,8 +2524,7 @@ x86_decode_onebyte(
         {
         case 2: /* call (near) */
         case 4: /* jmp (near) */
-        case 6: /* push */
-            if ( mode_64bit() && op_bytes == 4 )
+            if ( mode_64bit() && (op_bytes == 4 || !amd_like(ctxt)) )
                 op_bytes = 8;
             state->desc = DstNone | SrcMem | Mov;
             break;
@@ -2537,6 +2536,12 @@ x86_decode_onebyte(
                 op_bytes = 4;
             state->desc = DstNone | SrcMem | Mov;
             break;
+
+        case 6: /* push */
+            if ( mode_64bit() && op_bytes == 4 )
+                op_bytes = 8;
+            state->desc = DstNone | SrcMem | Mov;
+            break;
         }
         break;
     }



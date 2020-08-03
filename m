Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9C23A8EB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 16:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2bpQ-0005Kf-7s; Mon, 03 Aug 2020 14:52:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2bpP-0005KW-7k
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 14:52:39 +0000
X-Inumbo-ID: f8d0e709-d598-11ea-af3a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8d0e709-d598-11ea-af3a-12813bfff9fa;
 Mon, 03 Aug 2020 14:52:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F16DCAC24;
 Mon,  3 Aug 2020 14:52:52 +0000 (UTC)
Subject: [PATCH 06/10] x86emul: AVX512{F, BW} down conversion moves are memory
 writes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
Message-ID: <1995835d-62f8-a372-25f0-80c20ada54c8@suse.com>
Date: Mon, 3 Aug 2020 16:52:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
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

For this to be properly reported, the case labels need to move to a
different switch() block.

Fixes: 30e0bdf79828 ("x86emul: support AVX512{F,BW} down conversion moves")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -12359,6 +12359,14 @@ x86_insn_is_mem_write(const struct x86_e
         case X86EMUL_OPC_F2(0x0f38, 0xf8): /* ENQCMD */
         case X86EMUL_OPC_F3(0x0f38, 0xf8): /* ENQCMDS */
             return true;
+
+        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x10) ...
+             X86EMUL_OPC_EVEX_F3(0x0f38, 0x15): /* VPMOVUS* */
+        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x20) ...
+             X86EMUL_OPC_EVEX_F3(0x0f38, 0x25): /* VPMOVS* */
+        case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30) ...
+             X86EMUL_OPC_EVEX_F3(0x0f38, 0x35): /* VPMOV{D,Q,W}* */
+            return state->modrm_mod != 3;
         }
 
         return false;
@@ -12400,12 +12408,6 @@ x86_insn_is_mem_write(const struct x86_e
     case X86EMUL_OPC(0x0f, 0xab):        /* BTS */
     case X86EMUL_OPC(0x0f, 0xb3):        /* BTR */
     case X86EMUL_OPC(0x0f, 0xbb):        /* BTC */
-    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x10) ...
-         X86EMUL_OPC_EVEX_F3(0x0f38, 0x15): /* VPMOVUS* */
-    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x20) ...
-         X86EMUL_OPC_EVEX_F3(0x0f38, 0x25): /* VPMOVS* */
-    case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30) ...
-         X86EMUL_OPC_EVEX_F3(0x0f38, 0x35): /* VPMOV{D,Q,W}* */
         return true;
 
     case 0xd9:



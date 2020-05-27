Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28F1E4E08
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1aH-00042T-V6; Wed, 27 May 2020 19:19:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1aG-00041w-2S
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:24 +0000
X-Inumbo-ID: f518fc1a-a04e-11ea-a777-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f518fc1a-a04e-11ea-a777-12813bfff9fa;
 Wed, 27 May 2020 19:19:17 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: AqhgHtvucTXh9gKrfysPQjfVwMB0aAHR29VpIB06eomiAmpiSuq6TuZPrORn6qj4+x6hCO6gd+
 SVfFlrKExbY8F3Atho7vCyhxi4fAZnu21BA2HyMi3ltCqkKkS4O8jkHQ0LfIaBT+ViAzXYjlRf
 Xck5nRfYrDK76ervV5In3SK6anRX5eygGGYsEbTEJFpVcojs6VfxwOnIpP2Znpfl3pX2t9h21I
 tR35FF9r5Bug6GxwSAg4sHJIuukG+UQV578hX0usflysaIbNriaUFgS9dDOVaDrsVJHsfWh3+3
 0vA=
X-SBRS: 2.7
X-MesageID: 19333922
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="19333922"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 09/14] x86/spec-ctrl: Adjust DO_OVERWRITE_RSB to be shadow
 stack compatible
Date: Wed, 27 May 2020 20:18:42 +0100
Message-ID: <20200527191847.17207-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The 32 calls need dropping from the shadow stack as well as the regular stack.
To shorten the code, we can use the 32bit forms of RDSSP/INCSSP, but need to
double up the input to INCSSP to counter the operand size based multiplier.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/spec_ctrl_asm.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/include/asm-x86/spec_ctrl_asm.h b/xen/include/asm-x86/spec_ctrl_asm.h
index c60093b090..cb34299a86 100644
--- a/xen/include/asm-x86/spec_ctrl_asm.h
+++ b/xen/include/asm-x86/spec_ctrl_asm.h
@@ -83,9 +83,9 @@
  * Requires nothing
  * Clobbers \tmp (%rax by default), %rcx
  *
- * Requires 256 bytes of stack space, but %rsp has no net change. Based on
- * Google's performance numbers, the loop is unrolled to 16 iterations and two
- * calls per iteration.
+ * Requires 256 bytes of {,shadow}stack space, but %rsp/SSP has no net
+ * change. Based on Google's performance numbers, the loop is unrolled to 16
+ * iterations and two calls per iteration.
  *
  * The call filling the RSB needs a nonzero displacement.  A nop would do, but
  * we use "1: pause; lfence; jmp 1b" to safely contains any ret-based
@@ -114,6 +114,16 @@
     sub $1, %ecx
     jnz .L\@_fill_rsb_loop
     mov %\tmp, %rsp                 /* Restore old %rsp */
+
+#ifdef CONFIG_XEN_SHSTK
+    mov $1, %ecx
+    rdsspd %ecx
+    cmp $1, %ecx
+    je .L\@_shstk_done
+    mov $64, %ecx                   /* 64 * 4 bytes, given incsspd */
+    incsspd %ecx                    /* Restore old SSP */
+.L\@_shstk_done:
+#endif
 .endm
 
 .macro DO_SPEC_CTRL_ENTRY_FROM_HVM
-- 
2.11.0



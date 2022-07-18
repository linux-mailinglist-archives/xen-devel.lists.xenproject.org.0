Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649F578C1D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 22:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370096.601741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDXhP-000875-QH; Mon, 18 Jul 2022 20:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370096.601741; Mon, 18 Jul 2022 20:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDXhP-000844-Mt; Mon, 18 Jul 2022 20:50:39 +0000
Received: by outflank-mailman (input) for mailman id 370096;
 Mon, 18 Jul 2022 20:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDXhN-0007oP-VX
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 20:50:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455c523b-06db-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 22:50:36 +0200 (CEST)
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
X-Inumbo-ID: 455c523b-06db-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658177436;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yC7Ivklf/14kVov/1I8JhhkTzzgro3S/5NGgUE9lPQE=;
  b=YCVVRtFC7b9TsY7uUIMEpYYkkEd+Ro1DOQfy204avQU5hpeBFMEvqbwb
   ntFlGDN7xZFSJx8kgteY/I5nTBRrMLNAU07ESYu9jQk/6Ebxea1AMRsBp
   iU1czMaa1jh54w8xRO7nwF89xsFytl+zDv/1yKwULSdWqR39uj0xL8Eej
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76073064
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AZcyVSqzokyGBA+lJ/up6t4n5zX1e4sY/ZkZSj?=
 =?us-ascii?q?/bM1gqfGCHpmQ7xbLELH0zjCQM2EUT3yIhaqDbNUz4aq/+7Nahbx0wH00GjT?=
 =?us-ascii?q?fXMwrY/o/tueGjOdIleLRyLAEtySNUbZmKTaQ9Vkdo/FPeseATPf28m9G/Uo?=
 =?us-ascii?q?gv4NssvxUGUdKvorEtYhuhcQRweQZ4i60FD7Fnr+qG8YcAZNFVqL7sS/+nQq?=
 =?us-ascii?q?leRV/EDR+WuSxE6WBLQsA1l7vCADXk954Ixb+Oa1esjZb3Zpu+FmTxQFI7lB?=
 =?us-ascii?q?D+rOlVubESwtFzTuBHRSzP0Iy4/hIiu+vn35ZLuwv4NpFjRkbYdOgQ5PcrOO?=
 =?us-ascii?q?5BkOJj3bMf2PNPcvo99QMY+mvm3liVNDkKTHb1LDvCeyzk8M2GxvIk9FcnE8?=
 =?us-ascii?q?2o3ZcaDEsQNTadDO3DFpANwTGr1OCerAo3oi+NET2t2cxnVpjX0WQrf/geSx?=
 =?us-ascii?q?XzrSl5+IWShlJANxGpmozi2DBxERM+cdzrMWmXBjCu2muiQb8CPYoPV/Rhch?=
 =?us-ascii?q?ihxq37UjUI5O+2rStAkTMbDqQqFEJF8MhKpmXL/cFIJVOjM3wtEMtuNLDCFq?=
 =?us-ascii?q?jQ6ibzoxMeG2g8KjvSXAdh8HBTHA1Uj70kUA64r39+eOd2Yxshb8N6z/B0xV?=
 =?us-ascii?q?zV9NOXEqmJ7UFHiOYcKH8ieAySVcVRZVk+6HL5VxpUU7SHCM7rmnVEVaNVxh?=
 =?us-ascii?q?iW1Dcz/xtXHjm9kw9Rm7k9Mh0tcVv8xDpWPE96R4eDwknqS4GiGAxSe4wKwb?=
 =?us-ascii?q?CqhmRB9Zz0xqFgQjBHPcWUoYUhFAgyMaxbq+RBB7BLnnYrvD196X5nDKKhWT?=
 =?us-ascii?q?P55YYNKSWhNc15WzpmvbFedImnTa6Z6JIAKfpFKKXX3lnLoTuxV6VnGbKjy2?=
 =?us-ascii?q?JAjRZmpARg0oAGrLHmoCD2rdKv0LrXZNP0WJkXH+V/yTXe9sVweR4u4iLEil?=
 =?us-ascii?q?te5OWPw+hfvBPplQgZY4HWQckhjNPld1zy+0fnF+4o+l/ulFxKyt8FM8kA3A?=
 =?us-ascii?q?uIuD7IgMukcR9hJYxo+Dle5LrJw2Mo8PWm214RZ0H6oHWWg5co3UOEdQPxXc?=
 =?us-ascii?q?RYCR0ELA5bntnqGLgj++JYdUI46rrj5n0Zyu3MS181JNu5VX4uVXh+CY3z5B?=
 =?us-ascii?q?YwTP5ZeU71tPjgCj8+ewTvWJ/BDap95VxXOSccbLzTATi2MZ9M65GqaLaT19?=
 =?us-ascii?q?ojSi/jEzyQArl1EC39jaopTEgoeqBhZ8bwsVSwS0vge9tdJZRik2lRknRPrO?=
 =?us-ascii?q?0EkPrznEpRcnPbwdPp3BIqZGygkfFkZ0+/JPbGo1ap9cB9WwsdGrpGLwxffi?=
 =?us-ascii?q?1gklMMEgATLVjr6MdIqTECWWFbZpBn4sMfR1VrRs0Uj/Kh4u53Ba032kXyOb?=
 =?us-ascii?q?0ScIUoqZi2O/btd4yD1pPI1WtDJQvliA0VyTP8MotwINiU3zS8mJTM0Q+eby?=
 =?us-ascii?q?0a86RIfeSNCJKiJ8+BTBhKFlLaM2aezfBw20TTRjyXnWWJpd2LQnteEKMyWC?=
 =?us-ascii?q?/YEoUkzbtDNWt/z5DMV9erjRUNOU1MPN5ignxAWql0oyKf8vZIhIFvSkYXpf?=
 =?us-ascii?q?CC04V6XgMLNyf6YwJvXLjRu1hKcunuOsRtlbvs3fRjuaU7HNmdTIEhZ/O2Mu?=
 =?us-ascii?q?CHEKq09+z5hC2iwOo4o8Qw8zV9521l4807XgyDdiysB/X2cDOBnTN+btCerd?=
 =?us-ascii?q?htaMy8+OWu1YQfDMfDttr/ePyNyHeDD84ExYG6brRfde/LS5tbioeBXEH6Fe?=
 =?us-ascii?q?gm5tvmgLBvO8cdvtNnVVw6iv1ZtFMOcjJ3ew4p9wb9CT/n0D3748rZOa7GAd?=
 =?us-ascii?q?a72AS7/IFl+La2S7lIKC161Xlfv9Osk401GZxlFnBRwrXPKqP4NxtyQE6u6c?=
 =?us-ascii?q?IenwA0FHhyQP1wTg3LjgvISkn4IMinrqfi6XqY3RzHKao1XFNgnO68VS9cHB?=
 =?us-ascii?q?eYaM6EpDi7gRsaYAnSKbEA8HhAPNJ925BOdo0NJSiArr7cGGD8ofjFGu1D8S?=
 =?us-ascii?q?3tmzXnE3PhmURQ3ucUfR5PEXp9rMeSmtW/ii0Y+vRfJ+YVtyUjChR0rvBTVk?=
 =?us-ascii?q?n6Fmjxv1gzD0kpvYWO7+MI2lwUNmAUaqJ/WUC0L7ceovpTpCFMtLL1/CjoDD?=
 =?us-ascii?q?sgWfcBSH4wg8SbGabEJv8VEpuFsK8ljZAS2VGlWT+2oEL4jvUwcmlUAsLfvH?=
 =?us-ascii?q?xP7XclKZ/TBfNrw3MzCpQEIYAtCKW9WavWZOD/dC1nR53mj+P0dVXzz9IR1q?=
 =?us-ascii?q?rTp5J7cs5JFcFjviZwvPT/+wP71Jc6HPQNSVWeq+6SEsSXoLZen0mqYm5Mhw?=
 =?us-ascii?q?bhBI6HuWPSJvLbAbTY750PhRPG8/oWE+buMOj0CPg/A4OdE858f9T6m22vyw?=
 =?us-ascii?q?MELPQizn5+rHW1NcjocAidXfFT3nr+roYi6hY/c52NWaV6h0P3cGH0+TdI6i?=
 =?us-ascii?q?tOVn02Iba/GIh6FueSbYwZd1Pc26g+IprvHhiYAGSqAohBSKRGi2iF0PiE/I?=
 =?us-ascii?q?mhBW1hY3qHCWTWP/qmRVRNHduFn9ys/iDsjehWBOAwS908GAwsWRNiCXpKDP?=
 =?us-ascii?q?UYmabtAX00g1rpZisGBLdFT7o8IHXp+Lctb3S3jKEE6SnnDhgt77Pn1JJp4i?=
 =?us-ascii?q?9nyLkvMvDQHbFXjfNZNoHdRgKiiXuMVhvlpRw8jTj9Rz+87tgdRFwfybY1el?=
 =?us-ascii?q?vAFI/tM2hGioLRvkMLfUQssAbC3BZMQ7e4zRCuMMwAUCuKpztGyShNKFdTFR?=
 =?us-ascii?q?ZJZrBsA9FpGycVQnjdj4WH+UmPk9KNYD2b1vHoxa67ebzDZtvrGvGex8dfbj?=
 =?us-ascii?q?VbAq2JemmVn7ONB3EWazVc=3D?=
X-IronPort-AV: E=Sophos;i="5.92,282,1650945600"; 
   d="scan'208";a="76073064"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/spec-ctrl: Consistently halt speculation using int3
Date: Mon, 18 Jul 2022 21:50:07 +0100
Message-ID: <20220718205009.3557-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220718205009.3557-1-andrew.cooper3@citrix.com>
References: <20220718205009.3557-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The RSB stuffing loop and retpoline thunks date from the very beginning, when
halting speculation was a brand new field.

These days, we've largely settled on int3 for halting speculation in
non-architectural paths.  It's a single byte, and is fully serialising - a
requirement for delivering #BP if it were to execute.

Update the thunks.  Mostly for consistency across the codebase, but it does
shrink every entrypath in Xen by 6 bytes which is a marginal win.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 11 +++--------
 xen/arch/x86/indirect-thunk.S            |  6 ++----
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 9eb4ad9ab71d..fab27ff5532b 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -126,9 +126,8 @@
  * change. Based on Google's performance numbers, the loop is unrolled to 16
  * iterations and two calls per iteration.
  *
- * The call filling the RSB needs a nonzero displacement.  A nop would do, but
- * we use "1: pause; lfence; jmp 1b" to safely contains any ret-based
- * speculation, even if the loop is speculatively executed prematurely.
+ * The call filling the RSB needs a nonzero displacement, and int3 halts
+ * speculation.
  *
  * %rsp is preserved by using an extra GPR because a) we've got plenty spare,
  * b) the two movs are shorter to encode than `add $32*8, %rsp`, and c) can be
@@ -141,11 +140,7 @@
 
     .irp n, 1, 2                    /* Unrolled twice. */
     call .L\@_insert_rsb_entry_\n   /* Create an RSB entry. */
-
-.L\@_capture_speculation_\n:
-    pause
-    lfence
-    jmp .L\@_capture_speculation_\n /* Capture rogue speculation. */
+    int3                            /* Halt rogue speculation. */
 
 .L\@_insert_rsb_entry_\n:
     .endr
diff --git a/xen/arch/x86/indirect-thunk.S b/xen/arch/x86/indirect-thunk.S
index 7cc22da0ef93..de6aef606832 100644
--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -12,11 +12,9 @@
 #include <asm/asm_defns.h>
 
 .macro IND_THUNK_RETPOLINE reg:req
-        call 2f
+        call 1f
+        int3
 1:
-        lfence
-        jmp 1b
-2:
         mov %\reg, (%rsp)
         ret
 .endm
-- 
2.11.0



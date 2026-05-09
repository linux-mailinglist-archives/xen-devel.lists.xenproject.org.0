Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ar6NCcR/2kz1wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 12:49:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A314FF5B9
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 12:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304605.1577558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEU-0002ja-Mh; Sat, 09 May 2026 10:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304605.1577558; Sat, 09 May 2026 10:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEU-0002h7-HI; Sat, 09 May 2026 10:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1304605;
 Sat, 09 May 2026 10:48:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>) id 1wLfES-0002X5-Gq
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 10:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLfER-007lJU-Tw
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 12:48:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10ec-5cb7-0a2a0a5109dd-0a2a4508be8e-6
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:27 +0200
Received: from [49.212.243.89] (helo=www3579.sakura.ne.jp)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10f9-63b5-0a2a45080019-31d4f359d6d7-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:27 +0200
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.183]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 649AlY2B090834
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 9 May 2026 19:47:59 +0900 (JST)
 (envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=temperror header.s=rs20250326 header.d=rsg.ci.i.u-tokyo.ac.jp header.i="@rsg.ci.i.u-tokyo.ac.jp"
DKIM-Signature: a=rsa-sha256; bh=ROUhaRxtDzPB8FJJRyCm0S9ppDBULPhLkvEBb93D+50=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1778323679; v=1;
        b=lzTC9DyfFbto9QQqJIWX4TjTyGPPBAJyLLupmTJeGxRQGJSl/m+z8PbzrGj5hs5Y
         84QpcOTGt4CAoUiRUmz6+tjrT/UqoeEQb9qAfhRxtUf7YNGY1wd1b3Lf8a0T6c11
         vor9zI6VjIBEyD7sutt1sCCc/pt+vyuQiA4Lr+CzuVgmzPORLpPOaycOiNXJy1aR
         KB2DGB0ETvv4v37fuYY7QfFxlZDJE9F4XyhrMnY5UaUcbnwTnYSm5SVr4SuKM/aQ
         E/5b8EMUHyI+CPmrnRojYg9V7ff5dRTjDhRpOe1G4l0ZZ3zplR32h3OZGA5AouHL
         XzFQzM4WKw9gg6KvIq+S0g==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 09 May 2026 19:34:22 +0900
Subject: [PATCH RFC 10/28] hw/input/adb-kbd: Use Linux key codes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-input-v1-10-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
References: <20260509-input-v1-0-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260509-input-v1-0-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Thomas Huth <th.huth+qemu@posteo.eu>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
        qemu-ppc@nongnu.org,
        =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-16047
X-Developer-Signature: v=1; a=openpgp-sha256; l=11545;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=IuNc0nZq13Cfg85XfjaPn1/m1nF4glzSwdiuAeVhaoQ=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ+Z/gUu3xSqPLlG2uVqgmuKU9vDaMn/3f4kTXl74G97Rw
 mkd//9PRykLgxgXg6yYIktK0W5ujejaT4UJ8S0wc1iZQIYwcHEKwEQi8hn+x/GuUVd/6lP7xX1l
 htXZq2nLzl24X71jt8LHrOe79m7oMGP4Xyd7QKOyrOl61MacbtUXanklidZJsRM2Meeov2i8r/u
 FAwA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-purgate-ID: tlsNG-c1860d/1778323707-C4E78DB1-4D55FD79/0/0
X-purgate-type: clean
X-purgate-size: 11547
X-Rspamd-Queue-Id: B1A314FF5B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:marcandre.lureau@redhat.com,m:pbonzini@redhat.com,m:jan.kiszka@web.de,m:peter.maydell@linaro.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:mark.cave-ayland@ilande.co.uk,m:kraxel@redhat.com,m:mst@redhat.com,m:th.huth+qemu@posteo.eu,m:alex.bennee@linaro.org,m:qemu-arm@nongnu.org,m:xen-devel@lists.xenproject.org,m:qemu-ppc@nongnu.org,m:philmd@linaro.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:edgariglesias@gmail.com,m:th.huth@posteo.eu,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	DBL_BLOCKED_OPENRESOLVER(0.00)[u-tokyo.ac.jp:email];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[redhat.com,web.de,linaro.org,kernel.org,xenproject.org,gmail.com,ilande.co.uk,posteo.eu,nongnu.org,lists.xenproject.org,rsg.ci.i.u-tokyo.ac.jp];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	NEURAL_SPAM(0.00)[0.672];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,qemu];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

QemuInputEvent now stores Linux key codes for key events. Use those
codes directly instead of translating between internal key code
representations.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 hw/input/adb-kbd.c | 242 ++++++++++++++++++++++++++---------------------------
 1 file changed, 120 insertions(+), 122 deletions(-)

diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index 060481d0db6d..c4ef9ebb90c8 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -26,6 +26,7 @@
 #include "hw/input/adb.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "standard-headers/linux/input-event-codes.h"
 #include "ui/input.h"
 #include "hw/input/adb-keys.h"
 #include "adb-internal.h"
@@ -55,124 +56,122 @@ struct ADBKeyboardClass {
 /* The adb keyboard doesn't have every key imaginable */
 #define NO_KEY 0xff
 
-int qcode_to_adb_keycode[] = {
+int linux_to_adb_keycode[] = {
      /* Make sure future additions are automatically set to NO_KEY */
-    [0 ... 0xff]               = NO_KEY,
-
-    [Q_KEY_CODE_SHIFT]         = ADB_KEY_LEFT_SHIFT,
-    [Q_KEY_CODE_SHIFT_R]       = ADB_KEY_RIGHT_SHIFT,
-    [Q_KEY_CODE_ALT]           = ADB_KEY_LEFT_OPTION,
-    [Q_KEY_CODE_ALT_R]         = ADB_KEY_RIGHT_OPTION,
-    [Q_KEY_CODE_CTRL]          = ADB_KEY_LEFT_CONTROL,
-    [Q_KEY_CODE_CTRL_R]        = ADB_KEY_RIGHT_CONTROL,
-    [Q_KEY_CODE_META_L]        = ADB_KEY_COMMAND,
-    [Q_KEY_CODE_META_R]        = ADB_KEY_COMMAND,
-    [Q_KEY_CODE_SPC]           = ADB_KEY_SPACEBAR,
-
-    [Q_KEY_CODE_ESC]           = ADB_KEY_ESC,
-    [Q_KEY_CODE_1]             = ADB_KEY_1,
-    [Q_KEY_CODE_2]             = ADB_KEY_2,
-    [Q_KEY_CODE_3]             = ADB_KEY_3,
-    [Q_KEY_CODE_4]             = ADB_KEY_4,
-    [Q_KEY_CODE_5]             = ADB_KEY_5,
-    [Q_KEY_CODE_6]             = ADB_KEY_6,
-    [Q_KEY_CODE_7]             = ADB_KEY_7,
-    [Q_KEY_CODE_8]             = ADB_KEY_8,
-    [Q_KEY_CODE_9]             = ADB_KEY_9,
-    [Q_KEY_CODE_0]             = ADB_KEY_0,
-    [Q_KEY_CODE_MINUS]         = ADB_KEY_MINUS,
-    [Q_KEY_CODE_EQUAL]         = ADB_KEY_EQUAL,
-    [Q_KEY_CODE_BACKSPACE]     = ADB_KEY_DELETE,
-    [Q_KEY_CODE_TAB]           = ADB_KEY_TAB,
-    [Q_KEY_CODE_Q]             = ADB_KEY_Q,
-    [Q_KEY_CODE_W]             = ADB_KEY_W,
-    [Q_KEY_CODE_E]             = ADB_KEY_E,
-    [Q_KEY_CODE_R]             = ADB_KEY_R,
-    [Q_KEY_CODE_T]             = ADB_KEY_T,
-    [Q_KEY_CODE_Y]             = ADB_KEY_Y,
-    [Q_KEY_CODE_U]             = ADB_KEY_U,
-    [Q_KEY_CODE_I]             = ADB_KEY_I,
-    [Q_KEY_CODE_O]             = ADB_KEY_O,
-    [Q_KEY_CODE_P]             = ADB_KEY_P,
-    [Q_KEY_CODE_BRACKET_LEFT]  = ADB_KEY_LEFT_BRACKET,
-    [Q_KEY_CODE_BRACKET_RIGHT] = ADB_KEY_RIGHT_BRACKET,
-    [Q_KEY_CODE_RET]           = ADB_KEY_RETURN,
-    [Q_KEY_CODE_A]             = ADB_KEY_A,
-    [Q_KEY_CODE_S]             = ADB_KEY_S,
-    [Q_KEY_CODE_D]             = ADB_KEY_D,
-    [Q_KEY_CODE_F]             = ADB_KEY_F,
-    [Q_KEY_CODE_G]             = ADB_KEY_G,
-    [Q_KEY_CODE_H]             = ADB_KEY_H,
-    [Q_KEY_CODE_J]             = ADB_KEY_J,
-    [Q_KEY_CODE_K]             = ADB_KEY_K,
-    [Q_KEY_CODE_L]             = ADB_KEY_L,
-    [Q_KEY_CODE_SEMICOLON]     = ADB_KEY_SEMICOLON,
-    [Q_KEY_CODE_APOSTROPHE]    = ADB_KEY_APOSTROPHE,
-    [Q_KEY_CODE_GRAVE_ACCENT]  = ADB_KEY_GRAVE_ACCENT,
-    [Q_KEY_CODE_BACKSLASH]     = ADB_KEY_BACKSLASH,
-    [Q_KEY_CODE_Z]             = ADB_KEY_Z,
-    [Q_KEY_CODE_X]             = ADB_KEY_X,
-    [Q_KEY_CODE_C]             = ADB_KEY_C,
-    [Q_KEY_CODE_V]             = ADB_KEY_V,
-    [Q_KEY_CODE_B]             = ADB_KEY_B,
-    [Q_KEY_CODE_N]             = ADB_KEY_N,
-    [Q_KEY_CODE_M]             = ADB_KEY_M,
-    [Q_KEY_CODE_COMMA]         = ADB_KEY_COMMA,
-    [Q_KEY_CODE_DOT]           = ADB_KEY_PERIOD,
-    [Q_KEY_CODE_SLASH]         = ADB_KEY_FORWARD_SLASH,
-    [Q_KEY_CODE_ASTERISK]      = ADB_KEY_KP_MULTIPLY,
-    [Q_KEY_CODE_CAPS_LOCK]     = ADB_KEY_CAPS_LOCK,
-
-    [Q_KEY_CODE_F1]            = ADB_KEY_F1,
-    [Q_KEY_CODE_F2]            = ADB_KEY_F2,
-    [Q_KEY_CODE_F3]            = ADB_KEY_F3,
-    [Q_KEY_CODE_F4]            = ADB_KEY_F4,
-    [Q_KEY_CODE_F5]            = ADB_KEY_F5,
-    [Q_KEY_CODE_F6]            = ADB_KEY_F6,
-    [Q_KEY_CODE_F7]            = ADB_KEY_F7,
-    [Q_KEY_CODE_F8]            = ADB_KEY_F8,
-    [Q_KEY_CODE_F9]            = ADB_KEY_F9,
-    [Q_KEY_CODE_F10]           = ADB_KEY_F10,
-    [Q_KEY_CODE_F11]           = ADB_KEY_F11,
-    [Q_KEY_CODE_F12]           = ADB_KEY_F12,
-    [Q_KEY_CODE_PRINT]         = ADB_KEY_F13,
-    [Q_KEY_CODE_SYSRQ]         = ADB_KEY_F13,
-    [Q_KEY_CODE_SCROLL_LOCK]   = ADB_KEY_F14,
-    [Q_KEY_CODE_PAUSE]         = ADB_KEY_F15,
-
-    [Q_KEY_CODE_NUM_LOCK]      = ADB_KEY_KP_CLEAR,
-    [Q_KEY_CODE_KP_EQUALS]     = ADB_KEY_KP_EQUAL,
-    [Q_KEY_CODE_KP_DIVIDE]     = ADB_KEY_KP_DIVIDE,
-    [Q_KEY_CODE_KP_MULTIPLY]   = ADB_KEY_KP_MULTIPLY,
-    [Q_KEY_CODE_KP_SUBTRACT]   = ADB_KEY_KP_SUBTRACT,
-    [Q_KEY_CODE_KP_ADD]        = ADB_KEY_KP_PLUS,
-    [Q_KEY_CODE_KP_ENTER]      = ADB_KEY_KP_ENTER,
-    [Q_KEY_CODE_KP_DECIMAL]    = ADB_KEY_KP_PERIOD,
-    [Q_KEY_CODE_KP_0]          = ADB_KEY_KP_0,
-    [Q_KEY_CODE_KP_1]          = ADB_KEY_KP_1,
-    [Q_KEY_CODE_KP_2]          = ADB_KEY_KP_2,
-    [Q_KEY_CODE_KP_3]          = ADB_KEY_KP_3,
-    [Q_KEY_CODE_KP_4]          = ADB_KEY_KP_4,
-    [Q_KEY_CODE_KP_5]          = ADB_KEY_KP_5,
-    [Q_KEY_CODE_KP_6]          = ADB_KEY_KP_6,
-    [Q_KEY_CODE_KP_7]          = ADB_KEY_KP_7,
-    [Q_KEY_CODE_KP_8]          = ADB_KEY_KP_8,
-    [Q_KEY_CODE_KP_9]          = ADB_KEY_KP_9,
-
-    [Q_KEY_CODE_UP]            = ADB_KEY_UP,
-    [Q_KEY_CODE_DOWN]          = ADB_KEY_DOWN,
-    [Q_KEY_CODE_LEFT]          = ADB_KEY_LEFT,
-    [Q_KEY_CODE_RIGHT]         = ADB_KEY_RIGHT,
-
-    [Q_KEY_CODE_HELP]          = ADB_KEY_HELP,
-    [Q_KEY_CODE_INSERT]        = ADB_KEY_HELP,
-    [Q_KEY_CODE_DELETE]        = ADB_KEY_FORWARD_DELETE,
-    [Q_KEY_CODE_HOME]          = ADB_KEY_HOME,
-    [Q_KEY_CODE_END]           = ADB_KEY_END,
-    [Q_KEY_CODE_PGUP]          = ADB_KEY_PAGE_UP,
-    [Q_KEY_CODE_PGDN]          = ADB_KEY_PAGE_DOWN,
-
-    [Q_KEY_CODE_POWER]         = ADB_KEY_POWER
+    [0 ... KEY_MAX]  = NO_KEY,
+
+    [KEY_LEFTSHIFT]  = ADB_KEY_LEFT_SHIFT,
+    [KEY_RIGHTSHIFT] = ADB_KEY_RIGHT_SHIFT,
+    [KEY_LEFTALT]    = ADB_KEY_LEFT_OPTION,
+    [KEY_RIGHTALT]   = ADB_KEY_RIGHT_OPTION,
+    [KEY_LEFTCTRL]   = ADB_KEY_LEFT_CONTROL,
+    [KEY_RIGHTCTRL]  = ADB_KEY_RIGHT_CONTROL,
+    [KEY_LEFTMETA]   = ADB_KEY_COMMAND,
+    [KEY_RIGHTMETA]  = ADB_KEY_COMMAND,
+    [KEY_SPACE]      = ADB_KEY_SPACEBAR,
+
+    [KEY_ESC]        = ADB_KEY_ESC,
+    [KEY_1]          = ADB_KEY_1,
+    [KEY_2]          = ADB_KEY_2,
+    [KEY_3]          = ADB_KEY_3,
+    [KEY_4]          = ADB_KEY_4,
+    [KEY_5]          = ADB_KEY_5,
+    [KEY_6]          = ADB_KEY_6,
+    [KEY_7]          = ADB_KEY_7,
+    [KEY_8]          = ADB_KEY_8,
+    [KEY_9]          = ADB_KEY_9,
+    [KEY_0]          = ADB_KEY_0,
+    [KEY_MINUS]      = ADB_KEY_MINUS,
+    [KEY_EQUAL]      = ADB_KEY_EQUAL,
+    [KEY_BACKSPACE]  = ADB_KEY_DELETE,
+    [KEY_TAB]        = ADB_KEY_TAB,
+    [KEY_Q]          = ADB_KEY_Q,
+    [KEY_W]          = ADB_KEY_W,
+    [KEY_E]          = ADB_KEY_E,
+    [KEY_R]          = ADB_KEY_R,
+    [KEY_T]          = ADB_KEY_T,
+    [KEY_Y]          = ADB_KEY_Y,
+    [KEY_U]          = ADB_KEY_U,
+    [KEY_I]          = ADB_KEY_I,
+    [KEY_O]          = ADB_KEY_O,
+    [KEY_P]          = ADB_KEY_P,
+    [KEY_LEFTBRACE]  = ADB_KEY_LEFT_BRACKET,
+    [KEY_RIGHTBRACE] = ADB_KEY_RIGHT_BRACKET,
+    [KEY_ENTER]      = ADB_KEY_RETURN,
+    [KEY_A]          = ADB_KEY_A,
+    [KEY_S]          = ADB_KEY_S,
+    [KEY_D]          = ADB_KEY_D,
+    [KEY_F]          = ADB_KEY_F,
+    [KEY_G]          = ADB_KEY_G,
+    [KEY_H]          = ADB_KEY_H,
+    [KEY_J]          = ADB_KEY_J,
+    [KEY_K]          = ADB_KEY_K,
+    [KEY_L]          = ADB_KEY_L,
+    [KEY_SEMICOLON]  = ADB_KEY_SEMICOLON,
+    [KEY_APOSTROPHE] = ADB_KEY_APOSTROPHE,
+    [KEY_GRAVE]      = ADB_KEY_GRAVE_ACCENT,
+    [KEY_BACKSLASH]  = ADB_KEY_BACKSLASH,
+    [KEY_Z]          = ADB_KEY_Z,
+    [KEY_X]          = ADB_KEY_X,
+    [KEY_C]          = ADB_KEY_C,
+    [KEY_V]          = ADB_KEY_V,
+    [KEY_B]          = ADB_KEY_B,
+    [KEY_N]          = ADB_KEY_N,
+    [KEY_M]          = ADB_KEY_M,
+    [KEY_COMMA]      = ADB_KEY_COMMA,
+    [KEY_DOT]        = ADB_KEY_PERIOD,
+    [KEY_SLASH]      = ADB_KEY_FORWARD_SLASH,
+    [KEY_CAPSLOCK]   = ADB_KEY_CAPS_LOCK,
+
+    [KEY_F1]         = ADB_KEY_F1,
+    [KEY_F2]         = ADB_KEY_F2,
+    [KEY_F3]         = ADB_KEY_F3,
+    [KEY_F4]         = ADB_KEY_F4,
+    [KEY_F5]         = ADB_KEY_F5,
+    [KEY_F6]         = ADB_KEY_F6,
+    [KEY_F7]         = ADB_KEY_F7,
+    [KEY_F8]         = ADB_KEY_F8,
+    [KEY_F9]         = ADB_KEY_F9,
+    [KEY_F10]        = ADB_KEY_F10,
+    [KEY_F11]        = ADB_KEY_F11,
+    [KEY_F12]        = ADB_KEY_F12,
+    [KEY_SYSRQ]      = ADB_KEY_F13,
+    [KEY_SCROLLLOCK] = ADB_KEY_F14,
+    [KEY_PAUSE]      = ADB_KEY_F15,
+
+    [KEY_NUMLOCK]    = ADB_KEY_KP_CLEAR,
+    [KEY_KPEQUAL]    = ADB_KEY_KP_EQUAL,
+    [KEY_KPSLASH]    = ADB_KEY_KP_DIVIDE,
+    [KEY_KPASTERISK] = ADB_KEY_KP_MULTIPLY,
+    [KEY_KPMINUS]    = ADB_KEY_KP_SUBTRACT,
+    [KEY_KPPLUS]     = ADB_KEY_KP_PLUS,
+    [KEY_KPENTER]    = ADB_KEY_KP_ENTER,
+    [KEY_KPDOT]      = ADB_KEY_KP_PERIOD,
+    [KEY_KP0]        = ADB_KEY_KP_0,
+    [KEY_KP1]        = ADB_KEY_KP_1,
+    [KEY_KP2]        = ADB_KEY_KP_2,
+    [KEY_KP3]        = ADB_KEY_KP_3,
+    [KEY_KP4]        = ADB_KEY_KP_4,
+    [KEY_KP5]        = ADB_KEY_KP_5,
+    [KEY_KP6]        = ADB_KEY_KP_6,
+    [KEY_KP7]        = ADB_KEY_KP_7,
+    [KEY_KP8]        = ADB_KEY_KP_8,
+    [KEY_KP9]        = ADB_KEY_KP_9,
+
+    [KEY_UP]         = ADB_KEY_UP,
+    [KEY_DOWN]       = ADB_KEY_DOWN,
+    [KEY_LEFT]       = ADB_KEY_LEFT,
+    [KEY_RIGHT]      = ADB_KEY_RIGHT,
+
+    [KEY_HELP]       = ADB_KEY_HELP,
+    [KEY_INSERT]     = ADB_KEY_HELP,
+    [KEY_DELETE]     = ADB_KEY_FORWARD_DELETE,
+    [KEY_HOME]       = ADB_KEY_HOME,
+    [KEY_END]        = ADB_KEY_END,
+    [KEY_PAGEUP]     = ADB_KEY_PAGE_UP,
+    [KEY_PAGEDOWN]   = ADB_KEY_PAGE_DOWN,
+
+    [KEY_POWER]      = ADB_KEY_POWER
 };
 
 static void adb_kbd_put_keycode(void *opaque, int keycode)
@@ -309,14 +308,13 @@ static void adb_keyboard_event(DeviceState *dev, QemuConsole *src,
                                QemuInputEvent *evt)
 {
     KBDState *s = (KBDState *)dev;
-    int qcode, keycode;
+    int keycode;
 
-    qcode = qemu_input_linux_to_qcode(evt->key.key);
-    if (qcode >= ARRAY_SIZE(qcode_to_adb_keycode)) {
+    if (evt->key.key >= ARRAY_SIZE(linux_to_adb_keycode)) {
         return;
     }
-    /* FIXME: take handler into account when translating qcode */
-    keycode = qcode_to_adb_keycode[qcode];
+    /* FIXME: take handler into account when translating evt->key.key */
+    keycode = linux_to_adb_keycode[evt->key.key];
     if (keycode == NO_KEY) {  /* We don't want to send this to the guest */
         trace_adb_device_kbd_no_key();
         return;

-- 
2.54.0



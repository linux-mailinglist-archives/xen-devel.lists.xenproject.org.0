Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tVOENScR/2lY1wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 12:49:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67074FF5BA
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 12:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304602.1577525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEQ-0001qP-RZ; Sat, 09 May 2026 10:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304602.1577525; Sat, 09 May 2026 10:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEQ-0001gc-Lz; Sat, 09 May 2026 10:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1304602;
 Sat, 09 May 2026 10:48:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>) id 1wLfEO-0001aX-Db
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 10:48:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLfEN-00FIIk-Qi
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 12:48:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10e4-bab6-0a2a0a5309dd-0a2a4505bea4-12
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:23 +0200
Received: from [49.212.243.89] (helo=www3579.sakura.ne.jp)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10f4-aaa8-0a2a45050019-31d4f359d627-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:23 +0200
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.183]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 649AlY2T090834
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 9 May 2026 19:48:03 +0900 (JST)
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
DKIM-Signature: a=rsa-sha256; bh=xdQOdc7TBZKnyuoO4opRDkTrA3cJx8lBTarnEJcV0aU=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1778323683; v=1;
        b=GIZRVXUprHxdgxXu37WO+oDE2tz2qK9qCDhUVa6i501Q91fZ3ewidrfX+a8lpkAF
         6GqCbMHjs4ZNM/T0U3JUUNO0lOuRgt45WaPhjxfRUQzQ7L41jedjZJWipNEubGOE
         phEjj2/PsKnUryJDy3atw73TABpx0Y4RKe2xapC3S35WIb2p/Sj+GgbMhxfd+I70
         AZYj1bbqe2j25S7YFoc+uJIXEsy4Kj2NTOTGcdZAcyrOD159de5VRjVD/hXBc01L
         nZ1SauA8vcN6tXKEc/UJt4UHl2gikPAmNjculIMWV+molbtmhbb9DaqjVYaa6FS5
         4ThCfIkHGRDhexBedKxrCQ==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 09 May 2026 19:34:40 +0900
Subject: [PATCH RFC 28/28] ui/input: Remove unused QKeyCode helpers and
 keymaps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-input-v1-28-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10998;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=C1sfssKpLnbwImq0G/bJG/Pt5wdJQR3NAMSed0uq3qA=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ+Z/gTsvbv/RVWZK0P/Ye32FUfvZF0LeavN4fqxacE/m2
 LZffzYc7yhlYRDjYpAVU2RJKdrNrRFd+6kwIb4FZg4rE8gQBi5OAZiINAfD/zyXjrvBn7VsX/38
 oJZuI3cv/2e13IRlN6JljeY/jlVWsWX4nz7hxrV1iZZ5b0xCA5OvZrmoHWAssvl9n2vl1as9GzJ
 yuQE=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-purgate-ID: tlsNG-c201ff/1778323703-D8B78443-CA7F16EE/0/0
X-purgate-type: clean
X-purgate-size: 11000
X-Rspamd-Queue-Id: B67074FF5BA
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
	NEURAL_SPAM(0.00)[0.280];
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

Their users have migrated to Linux key codes.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 include/ui/input.h | 50 --------------------------------------------------
 ui/input-keymap.c  | 39 ---------------------------------------
 ui/input.c         | 18 +-----------------
 ui/meson.build     | 15 ---------------
 4 files changed, 1 insertion(+), 121 deletions(-)

diff --git a/include/ui/input.h b/include/ui/input.h
index caa757ea1c2e..6e4892b73155 100644
--- a/include/ui/input.h
+++ b/include/ui/input.h
@@ -58,18 +58,13 @@ void qemu_input_event_send_impl(QemuConsole *src, QemuInputEvent *evt);
 void qemu_input_event_sync(void);
 void qemu_input_event_sync_impl(void);
 
-void qemu_input_event_send_key(QemuConsole *src, KeyValue *key, bool down);
 void qemu_input_event_send_key_linux(QemuConsole *src, unsigned int lnx,
                                      bool down);
 void qemu_input_event_send_key_number(QemuConsole *src, int num, bool down);
-void qemu_input_event_send_key_qcode(QemuConsole *src, QKeyCode q, bool down);
 void qemu_input_event_send_key_delay(uint32_t delay_ms);
 int qemu_input_key_number_to_qcode(unsigned int nr);
 unsigned int qemu_input_key_number_to_linux(unsigned int nr);
-int qemu_input_key_value_to_number(const KeyValue *value);
-int qemu_input_key_value_to_qcode(const KeyValue *value);
 unsigned int qemu_input_key_value_to_linux(const KeyValue *value);
-int qemu_input_qcode_to_scancode(QKeyCode qcode, bool down, int *codes);
 int qemu_input_linux_to_scancode(unsigned int lnx, bool down, int *codes);
 int qemu_input_linux_to_qcode(unsigned int lnx);
 
@@ -94,96 +89,51 @@ void qemu_input_check_mode_change(void);
 void qemu_add_mouse_mode_change_notifier(Notifier *notify);
 void qemu_remove_mouse_mode_change_notifier(Notifier *notify);
 
-extern const guint qemu_input_map_atset1_to_qcode_len;
-extern const guint16 qemu_input_map_atset1_to_qcode[];
-
 extern const guint qemu_input_map_atset1_to_linux_len;
 extern const guint16 qemu_input_map_atset1_to_linux[];
 
 extern const guint qemu_input_map_linux_to_qcode_len;
 extern const guint16 qemu_input_map_linux_to_qcode[];
 
-extern const guint qemu_input_map_qcode_to_atset1_len;
-extern const guint16 qemu_input_map_qcode_to_atset1[];
-
 extern const guint qemu_input_map_linux_to_atset1_len;
 extern const guint16 qemu_input_map_linux_to_atset1[];
 
-extern const guint qemu_input_map_qcode_to_atset2_len;
-extern const guint16 qemu_input_map_qcode_to_atset2[];
-
 extern const guint qemu_input_map_linux_to_atset2_len;
 extern const guint16 qemu_input_map_linux_to_atset2[];
 
-extern const guint qemu_input_map_qcode_to_atset3_len;
-extern const guint16 qemu_input_map_qcode_to_atset3[];
-
 extern const guint qemu_input_map_linux_to_atset3_len;
 extern const guint16 qemu_input_map_linux_to_atset3[];
 
 extern const guint qemu_input_map_qcode_to_linux_len;
 extern const guint16 qemu_input_map_qcode_to_linux[];
 
-extern const guint qemu_input_map_qcode_to_qnum_len;
-extern const guint16 qemu_input_map_qcode_to_qnum[];
-
 extern const guint qemu_input_map_linux_to_qnum_len;
 extern const guint16 qemu_input_map_linux_to_qnum[];
 
-extern const guint qemu_input_map_qcode_to_sun_len;
-extern const guint16 qemu_input_map_qcode_to_sun[];
-
 extern const guint qemu_input_map_linux_to_sun_len;
 extern const guint16 qemu_input_map_linux_to_sun[];
 
-extern const guint qemu_input_map_qnum_to_qcode_len;
-extern const guint16 qemu_input_map_qnum_to_qcode[];
-
 extern const guint qemu_input_map_qnum_to_linux_len;
 extern const guint16 qemu_input_map_qnum_to_linux[];
 
-extern const guint qemu_input_map_usb_to_qcode_len;
-extern const guint16 qemu_input_map_usb_to_qcode[];
-
 extern const guint qemu_input_map_usb_to_linux_len;
 extern const guint16 qemu_input_map_usb_to_linux[];
 
-extern const guint qemu_input_map_win32_to_qcode_len;
-extern const guint16 qemu_input_map_win32_to_qcode[];
-
 extern const guint qemu_input_map_win32_to_linux_len;
 extern const guint16 qemu_input_map_win32_to_linux[];
 
-extern const guint qemu_input_map_x11_to_qcode_len;
-extern const guint16 qemu_input_map_x11_to_qcode[];
-
 extern const guint qemu_input_map_x11_to_linux_len;
 extern const guint16 qemu_input_map_x11_to_linux[];
 
-extern const guint qemu_input_map_xorgevdev_to_qcode_len;
-extern const guint16 qemu_input_map_xorgevdev_to_qcode[];
-
-extern const guint qemu_input_map_xorgkbd_to_qcode_len;
-extern const guint16 qemu_input_map_xorgkbd_to_qcode[];
-
 extern const guint qemu_input_map_xorgkbd_to_linux_len;
 extern const guint16 qemu_input_map_xorgkbd_to_linux[];
 
-extern const guint qemu_input_map_xorgxquartz_to_qcode_len;
-extern const guint16 qemu_input_map_xorgxquartz_to_qcode[];
-
 extern const guint qemu_input_map_xorgxquartz_to_linux_len;
 extern const guint16 qemu_input_map_xorgxquartz_to_linux[];
 
-extern const guint qemu_input_map_xorgxwin_to_qcode_len;
-extern const guint16 qemu_input_map_xorgxwin_to_qcode[];
-
 extern const guint qemu_input_map_xorgxwin_to_linux_len;
 extern const guint16 qemu_input_map_xorgxwin_to_linux[];
 
-extern const guint qemu_input_map_osx_to_qcode_len;
-extern const guint16 qemu_input_map_osx_to_qcode[];
-
 extern const guint qemu_input_map_osx_to_linux_len;
 extern const guint16 qemu_input_map_osx_to_linux[];
 
diff --git a/ui/input-keymap.c b/ui/input-keymap.c
index 2b77ef09fd66..ec2a1fbc1a95 100644
--- a/ui/input-keymap.c
+++ b/ui/input-keymap.c
@@ -4,36 +4,21 @@
 
 #include "standard-headers/linux/input.h"
 
-#include "ui/input-keymap-atset1-to-qcode.c.inc"
 #include "ui/input-keymap-atset1-to-linux.c.inc"
 #include "ui/input-keymap-linux-to-qcode.c.inc"
-#include "ui/input-keymap-qcode-to-atset1.c.inc"
 #include "ui/input-keymap-linux-to-atset1.c.inc"
-#include "ui/input-keymap-qcode-to-atset2.c.inc"
 #include "ui/input-keymap-linux-to-atset2.c.inc"
-#include "ui/input-keymap-qcode-to-atset3.c.inc"
 #include "ui/input-keymap-linux-to-atset3.c.inc"
 #include "ui/input-keymap-qcode-to-linux.c.inc"
-#include "ui/input-keymap-qcode-to-qnum.c.inc"
 #include "ui/input-keymap-linux-to-qnum.c.inc"
-#include "ui/input-keymap-qcode-to-sun.c.inc"
 #include "ui/input-keymap-linux-to-sun.c.inc"
-#include "ui/input-keymap-qnum-to-qcode.c.inc"
 #include "ui/input-keymap-qnum-to-linux.c.inc"
-#include "ui/input-keymap-usb-to-qcode.c.inc"
 #include "ui/input-keymap-usb-to-linux.c.inc"
-#include "ui/input-keymap-win32-to-qcode.c.inc"
 #include "ui/input-keymap-win32-to-linux.c.inc"
-#include "ui/input-keymap-x11-to-qcode.c.inc"
 #include "ui/input-keymap-x11-to-linux.c.inc"
-#include "ui/input-keymap-xorgevdev-to-qcode.c.inc"
-#include "ui/input-keymap-xorgkbd-to-qcode.c.inc"
 #include "ui/input-keymap-xorgkbd-to-linux.c.inc"
-#include "ui/input-keymap-xorgxquartz-to-qcode.c.inc"
 #include "ui/input-keymap-xorgxquartz-to-linux.c.inc"
-#include "ui/input-keymap-xorgxwin-to-qcode.c.inc"
 #include "ui/input-keymap-xorgxwin-to-linux.c.inc"
-#include "ui/input-keymap-osx-to-qcode.c.inc"
 #include "ui/input-keymap-osx-to-linux.c.inc"
 
 int qemu_input_linux_to_qcode(unsigned int lnx)
@@ -44,19 +29,6 @@ int qemu_input_linux_to_qcode(unsigned int lnx)
     return qemu_input_map_linux_to_qcode[lnx];
 }
 
-int qemu_input_key_value_to_number(const KeyValue *value)
-{
-    if (value->type == KEY_VALUE_KIND_QCODE) {
-        if (value->u.qcode.data >= qemu_input_map_qcode_to_qnum_len) {
-            return 0;
-        }
-        return qemu_input_map_qcode_to_qnum[value->u.qcode.data];
-    } else {
-        assert(value->type == KEY_VALUE_KIND_NUMBER);
-        return value->u.number.data;
-    }
-}
-
 int qemu_input_key_number_to_qcode(unsigned int nr)
 {
     return qemu_input_linux_to_qcode(qemu_input_key_number_to_linux(nr));
@@ -70,11 +42,6 @@ unsigned int qemu_input_key_number_to_linux(unsigned int nr)
     return qemu_input_map_qnum_to_linux[nr];
 }
 
-int qemu_input_key_value_to_qcode(const KeyValue *value)
-{
-    return qemu_input_linux_to_qcode(qemu_input_key_value_to_linux(value));
-}
-
 unsigned int qemu_input_key_value_to_linux(const KeyValue *value)
 {
     switch (value->type) {
@@ -89,12 +56,6 @@ unsigned int qemu_input_key_value_to_linux(const KeyValue *value)
     }
 }
 
-int qemu_input_qcode_to_scancode(QKeyCode qcode, bool down, int *codes)
-{
-    return qemu_input_linux_to_scancode(qemu_input_map_qcode_to_linux[qcode],
-                                        down, codes);
-}
-
 int qemu_input_linux_to_scancode(unsigned int lnx, bool down, int *codes)
 {
     int keycode = lnx < qemu_input_map_linux_to_qnum_len ?
diff --git a/ui/input.c b/ui/input.c
index e3e277117949..2524abaedf7b 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -352,14 +352,6 @@ void qemu_input_event_sync(void)
     replay_input_sync_event();
 }
 
-void qemu_input_event_send_key(QemuConsole *src, KeyValue *key, bool down)
-{
-    unsigned int lnx = qemu_input_key_value_to_linux(key);
-
-    g_free(key);
-    qemu_input_event_send_key_linux(src, lnx, down);
-}
-
 void qemu_input_event_send_key_linux(QemuConsole *src, unsigned int lnx,
                                      bool down)
 {
@@ -383,15 +375,7 @@ void qemu_input_event_send_key_linux(QemuConsole *src, unsigned int lnx,
 void qemu_input_event_send_key_number(QemuConsole *src, int num, bool down)
 {
     unsigned int lnx = qemu_input_key_number_to_linux(num);
-    qemu_input_event_send_key_qcode(src, lnx, down);
-}
-
-void qemu_input_event_send_key_qcode(QemuConsole *src, QKeyCode q, bool down)
-{
-    KeyValue *key = g_new0(KeyValue, 1);
-    key->type = KEY_VALUE_KIND_QCODE;
-    key->u.qcode.data = q;
-    qemu_input_event_send_key(src, key, down);
+    qemu_input_event_send_key_linux(src, lnx, down);
 }
 
 void qemu_input_event_send_key_delay(uint32_t delay_ms)
diff --git a/ui/meson.build b/ui/meson.build
index 4aa2a38c52f4..0b810925d2db 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -149,36 +149,21 @@ if spice.found()
 endif
 
 keymaps = [
-  ['atset1', 'qcode'],
   ['atset1', 'linux'],
   ['linux', 'qcode'],
-  ['qcode', 'atset1'],
   ['linux', 'atset1'],
-  ['qcode', 'atset2'],
   ['linux', 'atset2'],
-  ['qcode', 'atset3'],
   ['linux', 'atset3'],
   ['qcode', 'linux'],
-  ['qcode', 'qnum'],
   ['linux', 'qnum'],
-  ['qcode', 'sun'],
   ['linux', 'sun'],
-  ['qnum', 'qcode'],
   ['qnum', 'linux'],
-  ['usb', 'qcode'],
   ['usb', 'linux'],
-  ['win32', 'qcode'],
   ['win32', 'linux'],
-  ['x11', 'qcode'],
   ['x11', 'linux'],
-  ['xorgevdev', 'qcode'],
-  ['xorgkbd', 'qcode'],
   ['xorgkbd', 'linux'],
-  ['xorgxquartz', 'qcode'],
   ['xorgxquartz', 'linux'],
-  ['xorgxwin', 'qcode'],
   ['xorgxwin', 'linux'],
-  ['osx', 'qcode'],
   ['osx', 'linux'],
 ]
 

-- 
2.54.0



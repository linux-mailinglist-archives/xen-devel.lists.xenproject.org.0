Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RLOxMicR/2lW1wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 12:49:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD154FF5B8
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 12:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304604.1577554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEU-0002hA-EC; Sat, 09 May 2026 10:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304604.1577554; Sat, 09 May 2026 10:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEU-0002fN-8Q; Sat, 09 May 2026 10:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1304604;
 Sat, 09 May 2026 10:48:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>) id 1wLfES-0002X2-FY
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 10:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLfER-007lJU-Sq
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 12:48:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10ec-5cb7-0a2a0a5109dd-0a2a4508be8e-4
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:27 +0200
Received: from [49.212.243.89] (helo=www3579.sakura.ne.jp)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10f8-63b5-0a2a45080019-31d4f359d6d6-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:27 +0200
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.183]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 649AlY2A090834
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 9 May 2026 19:47:58 +0900 (JST)
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
DKIM-Signature: a=rsa-sha256; bh=SBZa0nIoCp0ki8/Oc5ku4abkqOmqJgEICyF8p7mx+3g=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1778323679; v=1;
        b=jMm6FSTg3+WzoljBa1xx0VEIo3rCyipLRB/bXqKMrcdNR+6DvkjrOPX+E8rgREyl
         fuoDukk7jeWjRH1RJb//0ZivG9KN+Ul5uESgLkuohDwIcRoPNt8uRy5T0Gp++vJT
         4ljy4BIr3xPq7yw9Gpv9nXQvfz4i8pRAk2U38IxKW5FtOqeKZ0ntoI+Lqs3KyDDv
         nDjEcHNRD6ijVNCuvkoaQ5cAbV5r1D3Dhm5B8CbAEzMIQN3EJEZr5W6C+DSMzgNd
         cVHxAtdtdiH/vXly+xP1n9bu5GWF/sZlyQ+nRmXFWnTsPqR04jZ5qyvejk2hAT2O
         axrvfxvwxSeG40g+JiQtnw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 09 May 2026 19:34:21 +0900
Subject: [PATCH RFC 09/28] hw/display/xenfb: Use Linux key codes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-input-v1-9-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=Q2mGMH2ClWf3nbm1bPmZWB8Bg9tg0j4lbTXQFfwDMGE=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ+Z/gUtdcxRqAx2EuLe8LbbcLJ3V2baEYQqb3WGOpp0vp
 j7/IbKxo5SFQYyLQVZMkSWlaDe3RnTtp8KE+BaYOaxMIEMYuDgFYCI9RQy/2Q8qiKx+tYp1h+il
 SjZJSbOzDF2vF/9SspNzeul288a9zYwMdxVK8qJ7uQ2LMkV3Hb/AejX38skJoiU7t+x5kynJVxz
 DBgA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-purgate-ID: tlsNG-c1860d/1778323707-C4A7ADB1-63265AD0/0/0
X-purgate-type: clean
X-purgate-size: 1606
X-Rspamd-Queue-Id: ABD154FF5B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	NEURAL_SPAM(0.00)[0.427];
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
 hw/display/xenfb.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 9bf89a1e6223..ee23c483499f 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -191,29 +191,14 @@ static int xenfb_send_position(struct XenInput *xenfb,
     return xenfb_kbd_event(xenfb, &event);
 }
 
-/*
- * Send a key event from the client to the guest OS
- * QEMU gives us a QCode.
- * We have to turn this into a Linux Input layer keycode.
- *
- * Wish we could just send scancodes straight to the guest which
- * already has code for dealing with this...
- */
+/* Send a key event from the client to the guest OS */
 static void xenfb_key_event(DeviceState *dev, QemuConsole *src,
                             QemuInputEvent *evt)
 {
     struct XenInput *xenfb = (struct XenInput *)dev;
-    int qcode = qemu_input_linux_to_qcode(evt->key.key);
-    int lnx;
 
-    if (qcode < qemu_input_map_qcode_to_linux_len) {
-        lnx = qemu_input_map_qcode_to_linux[qcode];
-
-        if (lnx) {
-            trace_xenfb_key_event(xenfb, lnx, evt->key.down);
-            xenfb_send_key(xenfb, evt->key.down, lnx);
-        }
-    }
+    trace_xenfb_key_event(xenfb, evt->key.key, evt->key.down);
+    xenfb_send_key(xenfb, evt->key.down, evt->key.key);
 }
 
 /*

-- 
2.54.0



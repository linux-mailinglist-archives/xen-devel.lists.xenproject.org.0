Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3A76483B9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 15:27:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457951.715885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3eKm-00073O-MV; Fri, 09 Dec 2022 14:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457951.715885; Fri, 09 Dec 2022 14:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3eKm-00071Y-Jb; Fri, 09 Dec 2022 14:26:40 +0000
Received: by outflank-mailman (input) for mailman id 457951;
 Fri, 09 Dec 2022 14:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bplO=4H=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1p3eKl-00071S-Qc
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 14:26:39 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dceb8bf-77cd-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 15:26:38 +0100 (CET)
Received: by mail-qt1-x82c.google.com with SMTP id x28so3611813qtv.13
 for <xen-devel@lists.xenproject.org>; Fri, 09 Dec 2022 06:26:38 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 bb12-20020a05622a1b0c00b003a530a32f67sm944094qtb.65.2022.12.09.06.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 06:26:36 -0800 (PST)
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
X-Inumbo-ID: 7dceb8bf-77cd-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z26CJkV4bYBR7Igz8UtlKjC+5Be28A36hbOcGnHeAHA=;
        b=lOXPlqVDsCU/iT7WgJtYT6+UXxMsr9qT3EOt0VEoisMXgRg2R6Cue68/yFc610oSNh
         QnEoyGDMtbIXZ0bcGN7E9cL+XqHtaulIlfCJ0SrkEn1pk0KCvOb68uQDaVEEyvCs58xN
         iP0YGW9B+VQG0wWOE4wnxp/GFMyOLOlHRRYGrOvkYDAvxI6ra/Ckgj1Po8LdgacBnJ/q
         5/XMqgDXCxsb8uI9/IVSBogDGas/MITu53Pz8u8YEn0nyhweWfxfITv4XODmPn/pzoS7
         ql5V6+gmKsRgqwaGRdIxKnH/74vE3hD8AEUEPiqyCMnv3Du3zlp6FVPDvVf7G09I8/0e
         hK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z26CJkV4bYBR7Igz8UtlKjC+5Be28A36hbOcGnHeAHA=;
        b=A/ltP0RuX9Vea+R9/V0yKIvILGilmTKoKwl8d0ytckC6b0aAdMtLCvi5qRg9Y5nAEL
         bbcwEIJrpIjl2eQX7XaHmKUc7UUu9vV4og3hGtIONln52vmEzgm7YfxffbXTLlCtjl3Z
         39d0g3rzLP+eRWUV2Kk4N8KBuhv5HE40naiJ/6QT64ID68bXHp0z8Z4D9my+11Ytrp3X
         BvVMW+AWwqELXjlqgg2/wp7gwnSAvajIa2tfVnb6uJGl2qFQwzYyiKAlPJVo9/byWhBh
         DHaOzwOTnLd4ealaTOrLcX4s4HM1fIHNfr4X1NogRog9tofqn50RrfeFRRzydKcub3JU
         Wc7A==
X-Gm-Message-State: ANoB5pkkemcndDM3F9TiPFlQ+NAGUhRxlXPIqOozegiXrvqIFQf+RM1w
	0yUvrGgTo4UlESzwqoSbFfQ=
X-Google-Smtp-Source: AA0mqf7cBf3HtEfnMTHbn2B9g1hb6GZYhiARbmje9pr3rZIgEL0K9R+JMsEs+TSJ3w/N9SLufELTUQ==
X-Received: by 2002:a05:622a:1e11:b0:3a5:fa33:917f with SMTP id br17-20020a05622a1e1100b003a5fa33917fmr8841541qtb.37.1670595997584;
        Fri, 09 Dec 2022 06:26:37 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
	Jason Andryuk <jandryuk@gmail.com>,
	Phillip Susi <phill@thesusis.net>,
	stable@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v2] Input: xen-kbdfront - drop keys to shrink modalias
Date: Fri,  9 Dec 2022 09:26:14 -0500
Message-Id: <20221209142615.33574-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen kbdfront registers itself as being able to deliver *any* key since
it doesn't know what keys the backend may produce.

Unfortunately, the generated modalias gets too large and uevent creation
fails with -ENOMEM.

This can lead to gdm not using the keyboard since there is no seat
associated [1] and the debian installer crashing [2].

Trim the ranges of key capabilities by removing some BTN_* ranges.
While doing this, some neighboring undefined ranges are removed to trim
it further.

An upper limit of KEY_KBD_LCD_MENU5 is still too large.  Use an upper
limit of KEY_BRIGHTNESS_MENU.

This removes:
BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
Empty space 0x224..0x229

Empty space 0x28a..0x28f
KEY_MACRO1(0x290)..KEY_MACRO30(0x2ad)
KEY_MACRO_RECORD_START          0x2b0
KEY_MACRO_RECORD_STOP           0x2b1
KEY_MACRO_PRESET_CYCLE          0x2b2
KEY_MACRO_PRESET1(0x2b3)..KEY_MACRO_PRESET3(0xb5)
Empty space 0x2b6..0x2b7
KEY_KBD_LCD_MENU1(0x2b8)..KEY_KBD_LCD_MENU5(0x2bc)
Empty space 0x2bd..0x2bf
BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
Empty space 0x2e8..0x2ff

The modalias shrinks from 2082 to 1550 bytes.

A chunk of keys need to be removed to allow the keyboard to be used.
This may break some functionality, but the hope is these macro keys are
uncommon and don't affect any users.

[1] https://github.com/systemd/systemd/issues/22944
[2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net/T/

Cc: Phillip Susi <phill@thesusis.net>
Cc: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 drivers/input/misc/xen-kbdfront.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

v2:
Remove more keys: v1 didn't remove enough and modalias was still broken.

diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
index 8d8ebdc2039b..4ecb579df748 100644
--- a/drivers/input/misc/xen-kbdfront.c
+++ b/drivers/input/misc/xen-kbdfront.c
@@ -256,7 +256,14 @@ static int xenkbd_probe(struct xenbus_device *dev,
 		__set_bit(EV_KEY, kbd->evbit);
 		for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
 			__set_bit(i, kbd->keybit);
-		for (i = KEY_OK; i < KEY_MAX; i++)
+		/* In theory we want to go KEY_OK..KEY_MAX, but that grows the
+		 * modalias line too long.  There is a gap of buttons from
+		 * BTN_DPAD_UP..BTN_DPAD_RIGHT and KEY_ALS_TOGGLE is the next
+		 * defined. Then continue up to KEY_BRIGHTNESS_MENU as an upper
+		 * limit. */
+		for (i = KEY_OK; i < BTN_DPAD_UP; i++)
+			__set_bit(i, kbd->keybit);
+		for (i = KEY_ALS_TOGGLE; i <= KEY_BRIGHTNESS_MENU; i++)
 			__set_bit(i, kbd->keybit);
 
 		ret = input_register_device(kbd);
-- 
2.38.1



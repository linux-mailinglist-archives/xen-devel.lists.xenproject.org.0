Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3AD605121
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 22:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426019.674199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olFT3-0003Du-QO; Wed, 19 Oct 2022 20:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426019.674199; Wed, 19 Oct 2022 20:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olFT3-0003B3-N6; Wed, 19 Oct 2022 20:15:09 +0000
Received: by outflank-mailman (input) for mailman id 426019;
 Wed, 19 Oct 2022 20:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3fJ=2U=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1olFT1-0003Ak-I1
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 20:15:07 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8b65fa2-4fea-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 22:15:06 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id b25so11496045qkk.7
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 13:15:06 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 bj3-20020a05620a190300b006eeca296c00sm5813448qkb.104.2022.10.19.13.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 13:15:04 -0700 (PDT)
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
X-Inumbo-ID: b8b65fa2-4fea-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6ehJmZtaKjHfWDooxLByyg7Qm8nO8821wCtlJKz2+4=;
        b=TybltSlWY2qkowVbGkbhGUhl8GW5569umxbF7Wp6iG+ZXAuhuOylG8yjLXPo43vTZA
         dAabbW135Irpmk/ZJVBz1w3a4szDvKd7Dqfim+MtPKw7HA6Q6rElVHH1UEeH+Bwq16qk
         qtW6K4LiAVNCwVj+YAVZK2AVdn05XYfHM+5Zisi1UnbBb4mgqL/djqPx60S1WgFMFGxf
         DT8E7ijLIq5TjewGJ6yZvF33qampqKD28bJPN/sHzTIgAu7pKWqfOL0WwZGdiC77iomF
         uV6PwFQBRaOKse1ujXcu1EBwRjxIiPRbXDvBDCURMMUnwQne/kqKCqQ443yFSL/XonOU
         vKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6ehJmZtaKjHfWDooxLByyg7Qm8nO8821wCtlJKz2+4=;
        b=3Gu1zmAcg+TC/DnDT1xaDcPtJuxcKvrCERVbmDtS2TuNFdxi4WTtScRIEeMemJrDQy
         8qdSAEPXuJf7J4ZMmTzX4snKw/Z10sSLeq0psS4VYxJsZ5DCGt6BCqST1JCVbb0/e0Ef
         uJprA01WYZPqgkwQ6UwmHZCRU353njhDCYrxVE2oN1g8TKG3cxuOqC2Yl4eXF1Fe6wYG
         +nFu5sSL22LHFe5oOSVLf1L7tMgyY8oyVJ4Om1L2AzZtu0hNnoc5Po4mvoQOGyMbCAOH
         VEm41L/yHFO7cI7etvvV3KFheoAfWjLtoUGT3n7t1MiYSEjnXyCNj6zslpgpIhlgRW5O
         Z4SQ==
X-Gm-Message-State: ACrzQf2DQH2vbGiMEM6zwfAFAqO5j1wDkDJ/pe1xC1l7f7qY/MI6+irU
	rIr5D96lNdATskKHIok430TrToSYfCc=
X-Google-Smtp-Source: AMsMyM4ZHmOVoj5agvIt9yLlHK+ps82y567FzoPncwvnc5+QX6N88fZlpsF0dCXNDa/n+eOBD4dBCg==
X-Received: by 2002:a05:620a:3708:b0:6ee:d16f:b780 with SMTP id de8-20020a05620a370800b006eed16fb780mr6861107qkb.144.1666210505337;
        Wed, 19 Oct 2022 13:15:05 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
	Jason Andryuk <jandryuk@gmail.com>,
	Phillip Susi <phill@thesusis.net>,
	stable@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: xen-kbdfront - drop keys to shrink modalias
Date: Wed, 19 Oct 2022 16:14:57 -0400
Message-Id: <20221019201458.21803-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.3
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

This removes:
BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
Empty space 0x224..0x229

Emtpy space 0x2bd..0x2bf
BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
Empty space 0x2e8..0x2ff

The modalias shrinks from 2082 to 1754 bytes.

[1] https://github.com/systemd/systemd/issues/22944
[2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net/T/

Cc: Phillip Susi <phill@thesusis.net>
Cc: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 drivers/input/misc/xen-kbdfront.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
index 8d8ebdc2039b..23f37211be78 100644
--- a/drivers/input/misc/xen-kbdfront.c
+++ b/drivers/input/misc/xen-kbdfront.c
@@ -256,7 +256,14 @@ static int xenkbd_probe(struct xenbus_device *dev,
 		__set_bit(EV_KEY, kbd->evbit);
 		for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
 			__set_bit(i, kbd->keybit);
-		for (i = KEY_OK; i < KEY_MAX; i++)
+		/* In theory we want to go KEY_OK..KEY_MAX, but that grows the
+		 * modalias line too long.  KEY_KBD_LCD_MENU5 is the last
+		 * defined non-button key. There is a gap of buttons from
+		 * BTN_DPAD_UP..BTN_DPAD_RIGHT and KEY_ALS_TOGGLE is the next
+		 * defined. */
+		for (i = KEY_OK; i < BTN_DPAD_UP; i++)
+			__set_bit(i, kbd->keybit);
+		for (i = KEY_ALS_TOGGLE; i <= KEY_KBD_LCD_MENU5; i++)
 			__set_bit(i, kbd->keybit);
 
 		ret = input_register_device(kbd);
-- 
2.37.3



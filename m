Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D63755C3
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123608.233183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lef7z-0000q2-Ub; Thu, 06 May 2021 14:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123608.233183; Thu, 06 May 2021 14:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lef7z-0000nJ-QO; Thu, 06 May 2021 14:37:23 +0000
Received: by outflank-mailman (input) for mailman id 123608;
 Thu, 06 May 2021 14:37:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5QE=KB=thesusis.net=phill@srs-us1.protection.inumbo.net>)
 id 1lef7y-0000n3-2n
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:37:22 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83adba90-03e3-426e-bcd9-924df4c61081;
 Thu, 06 May 2021 14:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id 5B79E2F0DC;
 Thu,  6 May 2021 10:37:21 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OyGslXEEArnl; Thu,  6 May 2021 10:37:21 -0400 (EDT)
Received: from debian.. (097-068-109-042.biz.spectrum.com [97.68.109.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: psusi)
 by vps.thesusis.net (Postfix) with ESMTPSA id E857B2F0DB;
 Thu,  6 May 2021 10:37:20 -0400 (EDT)
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
X-Inumbo-ID: 83adba90-03e3-426e-bcd9-924df4c61081
From: Phillip Susi <phill@thesusis.net>
To: phill@thesusis.net
Cc: xen-devel@lists.xenproject.org,
	linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH] Xen Keyboard: don't advertise every key known to man
Date: Thu,  6 May 2021 14:36:54 +0000
Message-Id: <20210506143654.17924-1-phill@thesusis.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <87o8dw52jc.fsf@vps.thesusis.net>
References: <87o8dw52jc.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For reasons I still don't understand, the input subsystem allows
input devices to advertise what keys they have, and adds this
information to the modalias for the device.  The Xen Virtual
Keyboard was advertising every known key, which resulted in a
modalias string over 2 KiB in length, which caused uevents to
fail with -ENOMEM ( when trying to add the modalias to the env ).
Remove this advertisement.
---
 drivers/input/misc/xen-kbdfront.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
index 4ff5cd2a6d8d..d4bd558afda9 100644
--- a/drivers/input/misc/xen-kbdfront.c
+++ b/drivers/input/misc/xen-kbdfront.c
@@ -254,11 +254,6 @@ static int xenkbd_probe(struct xenbus_device *dev,
 		kbd->id.product = 0xffff;
 
 		__set_bit(EV_KEY, kbd->evbit);
-		for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
-			__set_bit(i, kbd->keybit);
-		for (i = KEY_OK; i < KEY_MAX; i++)
-			__set_bit(i, kbd->keybit);
-
 		ret = input_register_device(kbd);
 		if (ret) {
 			input_free_device(kbd);
-- 
2.30.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D3B32C51
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 00:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091562.1448105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upwhS-00024I-PW; Sat, 23 Aug 2025 22:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091562.1448105; Sat, 23 Aug 2025 22:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upwhS-00022P-M1; Sat, 23 Aug 2025 22:27:02 +0000
Received: by outflank-mailman (input) for mailman id 1091562;
 Sat, 23 Aug 2025 22:27:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rFF/=3D=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1upwhR-0001Mm-EN
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 22:27:01 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49a4005f-8070-11f0-a32b-13f23c93f187;
 Sun, 24 Aug 2025 00:27:01 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6188b72d690so450916a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 23 Aug 2025 15:27:01 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fd37fbsm252045166b.47.2025.08.23.15.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 15:26:59 -0700 (PDT)
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
X-Inumbo-ID: 49a4005f-8070-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755988020; x=1756592820; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/s2AGi+UpKxEGtbj5W5HX0hMz+DM0tpmm0fVHROyTA=;
        b=b+Onh4/v7Czx4MZUbL/tynr4SGNKiwpmMA4KeYYS00AvvNq3maK7ibBUV07rfEHsNb
         GrNOKAVOg3iifyQ/sGWOokYyL0h0QQQA9bgN2jNJnmtPxw2CfeKTZbLaUhOMTGV/SMW1
         FaVCNrYrm1hpNseIJq2IX9GNorQfby+bNY8WwVT+eL/GEJxiSIh3ZRNrkh9pngF+JYeW
         V/oNGcCVXMfzYHc1Ou/tzQR1IintYuH3Xwgx917ixwYsFqjDO8jBjuunpn75gtu0h7A+
         lneJ3pcYsV/KKFil31q7mZnsPG9ZIn/KXXVakC/+gdeKO77AKl90naLdC0Somnban2od
         iwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755988020; x=1756592820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/s2AGi+UpKxEGtbj5W5HX0hMz+DM0tpmm0fVHROyTA=;
        b=oV8AhGsu8JiAW47DFLw5HsHfTXLnkt/4IWmPp0aZJlphpyo7RXcES3hkU3SU+h0MqP
         5djvUk1QAYLMtGTwt8HpZYiIWCtcuya0t7DZfk+SAPQMjmP3O6CPQwfo/deLyLrK5AQv
         j0PlXqiJdeZU9ULfxUzFw3z4hER06JB3H9AQX7YU9wy7xlMqzaTj/gTnAjkgW7YkWgU3
         bzHSsRNVOzBof55pRGmMLNa6HEKFXgX4aZpoNtGIBxYYJVm8qo9XKFb08BN7vdJD+5k2
         HReuHRZ1KYplhFcb5i4J9pgM8nOJoFw0ajw5O+tgawzxtYnRGLjHUp59Nw60GBPfstXg
         pghA==
X-Gm-Message-State: AOJu0YxuHw2zViZ6vDCxL2rXQodTQNGinyhSV5xUhQ2xTaI683RREZKg
	vYAXLbDyBCDYT0QJeDuZaWFFI50PVETLwNWM8pE/SUlvadWyOCt6xPs9c+ZE3A==
X-Gm-Gg: ASbGncuZg5JLmH5Lni9/Ylk9Guk5LMmqqjFOLIBMmHNSwUzNGModF+NYaf4rEZKcp6z
	bG4hC/zlDv4qkp81iQzDJdL7de3zyoPS4qZndPI+CUw98hook3FCjTTXLApVnNZtdZVHTd5+Ydd
	eAh0nSYV9jQ6IotljNJCfwKV0IjI+YTO1xelrqLS51Jfgjkh5xlTrab3eixq/hF7Zo62AT+f55C
	bQdn/VxpH3qzIyldt7p6481DJGH9fSva7PzPHKFXCJHk/BF6m7yhYeAoW+UuuMMQLrlvqrZj7EX
	ewWA9iSsCjfHEIlW5D2lnyDp3l1TwzFT7MHsRCW/lPmC8YoLy7DqlE4byIPwQQzdwbgP7+IPMJb
	oO085OqJZ6k+iFLxovjW7Z9t02jQYDpMNouHtAVPka5itPDaYiZRAhWZIwJ+/epV8JowXfA4cJi
	Dfuafm7Q/CSZuz17hrvp8eMoUx9qTk/P36
X-Google-Smtp-Source: AGHT+IGf/E2dGFpEjsjyXWOodYnyuATtTqSt72S5E1ty0jq77FE+VHvH7pCTBwOFHmb0tQdnI7aqKQ==
X-Received: by 2002:a17:907:3da1:b0:af9:67ef:96d2 with SMTP id a640c23a62f3a-afe294b0f6emr365696466b.11.1755988020097;
        Sat, 23 Aug 2025 15:27:00 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v5 4/4] CHANGELOG.md: add new SMBIOS tables (7, 8, 9, 26, 27, 28)
Date: Sat, 23 Aug 2025 22:26:52 +0000
Message-Id: <3c9c7c48c9d8633b4c36bb0bb91fab88c03ae279.1755987697.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1755987697.git.w1benny@gmail.com>
References: <cover.1755987697.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 271ac73a0a..2fd65b90a9 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -32,6 +32,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      capability usage is not yet supported on PVH dom0).
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
    - PVH xenstore-stubdom now supports Live Update.
+   - Support for new SMBIOS tables: 7, 8, 9, 26, 27, 28.
 
  - On Arm:
     - Ability to enable stack protector
-- 
2.34.1



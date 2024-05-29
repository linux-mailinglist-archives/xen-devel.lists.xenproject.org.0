Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF828D377F
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 15:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731908.1137670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJFs-0000iZ-HF; Wed, 29 May 2024 13:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731908.1137670; Wed, 29 May 2024 13:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJFs-0000fR-Eb; Wed, 29 May 2024 13:22:12 +0000
Received: by outflank-mailman (input) for mailman id 731908;
 Wed, 29 May 2024 13:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vA4L=NA=gmail.com=yskelg@srs-se1.protection.inumbo.net>)
 id 1sCJFq-0000fL-KT
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 13:22:10 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73200855-1dbe-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 15:22:09 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1f44b594deeso15478065ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 06:22:09 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c760a21sm99183205ad.4.2024.05.29.06.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 06:22:07 -0700 (PDT)
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
X-Inumbo-ID: 73200855-1dbe-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716988928; x=1717593728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kur8IddoyK7auUB0DpsJfjxMjtBncw932qUbr08xEk=;
        b=UOYXeg3gOzC7/rpJqFKx4f8bohFdAcQSXZRp/ZXQ3qDoWm1cIIbvKIlWZKbCTGt6OD
         MoDR+jH9Snrk49d7p+wanMLPezE/MWg1eCxYuugyRk4zb5aGjO0Qblv/FlyubdMIyeGa
         Wf83s7zPbA/arjuio93z3AOUBr22UzUnYaGsF2PDI4chfW7F78FG0Qvym1GypT3hjVca
         a842IRyEqyj/S7HRJvd8Uy9XSLhk4BvpeioiKM3rORDZqhNbaKuOfNd1nW+Bcv2P5KZq
         d6oCjVJaFTIvWSBQAXFSsZWobjOSK6YLPirvkF+VKvjTRzaN7XvbougFRxi+GHbmr6qt
         LaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988928; x=1717593728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Kur8IddoyK7auUB0DpsJfjxMjtBncw932qUbr08xEk=;
        b=s7cj++RyKoIIR5oXhK8LsascEaXXCWDzzzN1a+FTyBKPK3VrriN7+QVn+sBaj2wW+y
         P/JcVesE3qk/Emx1Y3XZraonQgssZ8tJtvFtVmp2yKI1pyHRQRI84Meyh6e7YJgDY8zo
         k+PsImiDkqA50zUjDvM+mVDZNxTUeDzqNWUY0W2hZj5P9DMpNweTZOjnMKC2IteIjSmB
         RCuADrf5yjiJpKyeYZs7A+VunSVOEG4a4jPDutyyQeBbefkl7exVaCvROM76Qkt5heFs
         KOfeP2M7a4aM3ZzTrTasm6wnFYMdGgp93+JqqwV8rOTaw9SHFB5GbwoBgl6m7hMEZD08
         Px8w==
X-Forwarded-Encrypted: i=1; AJvYcCXgKW8MjuhrMNXvqpQ9VOls7pkU100/0UMd6uZNr6775mXEvB8Cyc9VI5dJT0W7j3W7xSfm/yBOa3VLYVL2aEWTSY5MQKzecfi65pLX17I=
X-Gm-Message-State: AOJu0YwL5h6OgXp6hCykIpl9/1aZj0UIamJUZtxTTH9bGRqFZRv0T27n
	5F5v57NBAego4pyfwLYW0ncYhq0Ba6Jh5KF6j3gTr8Lkda1eLVZo
X-Google-Smtp-Source: AGHT+IEsBv5bIxgTY/q47JQPTYogoxqv6LI2GlfX+nm0L8UY7lG45NwaKZRAtWholBUpgq2B4dfkIg==
X-Received: by 2002:a17:902:e84f:b0:1f4:990c:5ef1 with SMTP id d9443c01a7336-1f4990c5fecmr96953905ad.31.1716988927615;
        Wed, 29 May 2024 06:22:07 -0700 (PDT)
From: yskelg@gmail.com
To: Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: skhan@linuxfoundation.org,
	sj@kernel.org,
	Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: [PATCH] xen/xenbus: handle pointer to NULL in alloc/free_pdev
Date: Wed, 29 May 2024 22:19:28 +0900
Message-Id: <20240529131926.29590-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

Modify 'alloc_pdev()' to set 'pdev->xdev' to NULL
if 'xen_pcibk_init_devices()' fails. This ensures that 'pdev->xdev' does
not point to 'xdev' when 'pdev' is freed.
And modify 'free_pdev()' to set 'pdev' to NULL.

Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 drivers/xen/xen-pciback/xenbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/xen/xen-pciback/xenbus.c b/drivers/xen/xen-pciback/xenbus.c
index b11e401f1b1e..f1709b8e284a 100644
--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -54,6 +54,7 @@ static struct xen_pcibk_device *alloc_pdev(struct xenbus_device *xdev)
 	INIT_WORK(&pdev->op_work, xen_pcibk_do_op);
 
 	if (xen_pcibk_init_devices(pdev)) {
+		pdev->xdev = NULL;
 		kfree(pdev);
 		pdev = NULL;
 	}
@@ -102,6 +103,7 @@ static void free_pdev(struct xen_pcibk_device *pdev)
 	pdev->xdev = NULL;
 
 	kfree(pdev);
+	pdev = NULL;
 }
 
 static int xen_pcibk_do_attach(struct xen_pcibk_device *pdev, int gnt_ref,
-- 
2.34.1



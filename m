Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CB989FA3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 12:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807153.1218496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDtU-00041f-GU; Mon, 30 Sep 2024 10:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807153.1218496; Mon, 30 Sep 2024 10:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDtU-0003z5-Dm; Mon, 30 Sep 2024 10:44:44 +0000
Received: by outflank-mailman (input) for mailman id 807153;
 Mon, 30 Sep 2024 09:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FPD6=Q4=redhat.com=lbulwahn@srs-se1.protection.inumbo.net>)
 id 1svCMz-00049Z-EZ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 09:07:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b95099e-7f0b-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 11:07:04 +0200 (CEST)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-_AxtpD-4NdqNE62mzFmqYg-1; Mon, 30 Sep 2024 05:07:00 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7ac8d3dbe5bso482032285a.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 02:07:00 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb
 ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae377f0ea7sm394435285a.61.2024.09.30.02.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 02:06:59 -0700 (PDT)
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
X-Inumbo-ID: 5b95099e-7f0b-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727687222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4u01cAsPRXMfLMKHduDcaVv7r4IZcMZeUecRC7OIn6Q=;
	b=SOXZtvQp42rYzhfhe79AyHJf15BigtBJZuA2TKJMzT0mVOCvMX/44Mjcs6oQZjJ0itQiMO
	8WUyxzcZxquHK6plsNAlmv1VxIeoAhBl44QAJcCKz34KnB1RoP6waUrA+RPeGzdrnMrENW
	6H3Jq2m4GGzSjlbynhhliXu0DLZcnkY=
X-MC-Unique: _AxtpD-4NdqNE62mzFmqYg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727687220; x=1728292020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4u01cAsPRXMfLMKHduDcaVv7r4IZcMZeUecRC7OIn6Q=;
        b=SlHCzqtln5vd5YPdac2gHp7pLJtVDRFrkCHcp+iJO2X1Lajx5QviRoxbbx9J33fS6H
         hExUIM/FRGPZ7uJGrl4u6jB1ZFgNiwfwPM4pCXvNLVT9L7vBRjIpbhd2vA9n66MJ6t6c
         NCVPNjSr0cFHcM/MKYFlbJQ20P67/5Wgx9Ik9WNbwUXvecVv581YOY5v3uMeGA1ArWgt
         F+dMcCat6bDoMeYfTVyLJI24gIr5TVMC9xJXgG9GHLV5E4pgYfRch7IqcGvuxV066Q6q
         Ns8xiTvuQPo5S9mCX6o9XkHOwR2+6d1vnfO0mbgAamf6ffy/J2S7Srh8AfoUsO1zoq2P
         rSXA==
X-Forwarded-Encrypted: i=1; AJvYcCWolTfFIb2s2QQkaTf5NgMwXmdi3CLuAjckZqrqWOa0b9Hw3xSqEyyUtT92Xk6+lybOOzNjtTS8L3Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYBSvcxnZ5G4n2NXArw9RU/pfLRF5/hI+pTIyXZ/skuYk44LQM
	YdsZO97FV3q1JznTu/1MtIpLbIGpVJwUXkRlmRyZqR9RJbQiDXlmOXpTZNOAGBZfQP1xcmZ58MO
	mvEV5vZHQC4oUBJjeYllYWdCrzDkfnNTBRBaeNLD3AlFyVQQbrXQ619vkilQ26VOj
X-Received: by 2002:a05:620a:4411:b0:7a3:785a:dc1c with SMTP id af79cd13be357-7ae378c2881mr1647589685a.50.1727687220323;
        Mon, 30 Sep 2024 02:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY5T8VGvZ3aIE0DDn8rVPjKRXbu6y6uMYwxygTdlRa8sPUaFmTF1esGtF8Kbf2pgk46TSyvw==
X-Received: by 2002:a05:620a:4411:b0:7a3:785a:dc1c with SMTP id af79cd13be357-7ae378c2881mr1647588585a.50.1727687219962;
        Mon, 30 Sep 2024 02:06:59 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] xen: Fix config option reference in XEN_PRIVCMD definition
Date: Mon, 30 Sep 2024 11:06:50 +0200
Message-ID: <20240930090650.429813-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
adds a weak reverse dependency to the config XEN_PRIVCMD definition,
referring to CONFIG_XEN_PCIDEV_BACKEND. In Kconfig files, one refers to
config options without the CONFIG prefix, though. So in its current form,
this does not create the reverse dependency as intended, but is an
attribute with no effect.

Refer to the intended config option XEN_PCIDEV_BACKEND in the XEN_PRIVCMD
definition.

Fixes: 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 62035fe16bb8..72ddee4c1544 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -261,7 +261,7 @@ config XEN_SCSI_BACKEND
 config XEN_PRIVCMD
 	tristate "Xen hypercall passthrough driver"
 	depends on XEN
-	imply CONFIG_XEN_PCIDEV_BACKEND
+	imply XEN_PCIDEV_BACKEND
 	default m
 	help
 	  The hypercall passthrough driver allows privileged user programs to
-- 
2.46.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0328442111B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201470.356006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhY-0001S5-41; Mon, 04 Oct 2021 14:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201470.356006; Mon, 04 Oct 2021 14:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhY-0001OC-04; Mon, 04 Oct 2021 14:12:20 +0000
Received: by outflank-mailman (input) for mailman id 201470;
 Mon, 04 Oct 2021 14:12:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOhW-0008QG-E8
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:12:18 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b54face-c132-49cc-8c13-b830f68026ae;
 Mon, 04 Oct 2021 14:12:03 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m3so71513774lfu.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:12:03 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:11:54 -0700 (PDT)
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
X-Inumbo-ID: 2b54face-c132-49cc-8c13-b830f68026ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IBrpPALaHgEu2bRfUzTni2BaAuDBWtjiAy9s9dEtWuo=;
        b=Ez3QUU4M+ZzyRJzYI7PxNH6KFybpw2X52IIyCfolA/goD64BD0H1ylyW/UjcmfXbQm
         T9LUfCMCd3cOx44P7lzDKzq6KTS04CXPeOjx3ExEBRD6chKSC8hwx+jzUciYnpJh+Q9x
         xJh0RPoWKHUuZGpX41d2p6iEbR4DbO6Yjd85Fk5ZRu7Dcj/sAXHyv5QZewIDyPOrbbWf
         Uj1298AJ46nwJev0K9WD/T4PsdnpR0B7Q32JIVWIs4+SOeN3ey1J1yEOxkEVddEpkjGw
         ADp+s6yhOEDIMVO4uG7g5QzmzXKwqkgE1JmHfTe+wak/eKZ3zBIoxyjR158UG5pHKTAL
         +EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBrpPALaHgEu2bRfUzTni2BaAuDBWtjiAy9s9dEtWuo=;
        b=aa6fEVcu68NwYYn3aCywFJk7NwPSk8RorkdQPg9V6DdfCr/13jNoFrqllZkwMcA+/t
         68gJFB9+HNk17IA0aOksf7wnSHrw/YQwTUuDpxfb97cd1v23qBey6sfty18mMiYUPdvH
         JQqeXYVmM/2t3h7OAuiM3KqznuzBoylmpAzzR5zR18BtFLgCtOa6hFWg1DOBdW54Yz28
         CNsmWSeUsZmTnBYCQMYxnJlhgWFJFbJhsaTCYZIZp9SwpWIDWz6BjEG7n7pHyZj16eZo
         KDMLZe3dXytJALAqAacB2Yd9hbEopnM9fGSk5zHZ2nAeEd41nblNpmIJGbXYVDDLccmy
         6Rpg==
X-Gm-Message-State: AOAM532eE2z13AjRfdckATepEJ7RaTChM99IgTxPBX1b3uhgEugVbRrY
	APJUntPNmquJzMFjKdZl0/vIbkA73iQ=
X-Google-Smtp-Source: ABdhPJz1SHMt2ZTDbeA6PPu/8DUsuEKadrrUL9iIVMY3wTj3Updc7wVxwvB7+bWha+S4A5GsivnE5A==
X-Received: by 2002:a05:6512:3d86:: with SMTP id k6mr15180736lfv.120.1633356715255;
        Mon, 04 Oct 2021 07:11:55 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH v4 01/11] xen/arm: Fix dev_is_dt macro definition
Date: Mon,  4 Oct 2021 17:11:41 +0300
Message-Id: <20211004141151.132231-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This macro is not currently used, but still has an error in it:
a missing parenthesis. Fix this, so the macro is properly defined.

Fixes: 6c5d3075d97e ("xen/arm: Introduce a generic way to describe device")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
---
New in v2
---
 xen/include/asm-arm/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index 5ecd5e7bd15e..ebe84ea853cd 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -27,7 +27,7 @@ typedef struct device device_t;
 
 /* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
 #define dev_is_pci(dev) ((void)(dev), 0)
-#define dev_is_dt(dev)  ((dev->type == DEV_DT)
+#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
 
 enum device_class
 {
-- 
2.25.1



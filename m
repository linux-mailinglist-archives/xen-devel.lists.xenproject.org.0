Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6705F7EE4
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 22:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418321.663103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogu3k-000419-14; Fri, 07 Oct 2022 20:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418321.663103; Fri, 07 Oct 2022 20:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogu3j-0003y8-Tu; Fri, 07 Oct 2022 20:35:03 +0000
Received: by outflank-mailman (input) for mailman id 418321;
 Fri, 07 Oct 2022 20:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvqn=2I=gmail.com=colin.i.king@srs-se1.protection.inumbo.net>)
 id 1ogu3i-0002Po-JT
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 20:35:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8486f87a-467f-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 22:35:01 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso5209562wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Oct 2022 13:35:01 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003c3c2df83ddsm1603609wmo.26.2022.10.07.13.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 13:35:00 -0700 (PDT)
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
X-Inumbo-ID: 8486f87a-467f-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAZ+qkXDXQxhybmpEVudKGXqy+FOYvvtvTW3/3P6xc4=;
        b=OEH5qQ9HbftMfggzW1MXzuzAbSXlsGWSI8v2Y7HW6NJ9gyPAy+DbHUdn1YOVoE7Q2S
         OeEwH6yXMTGDC8b998q7Lp4o9s1oMt4K6pu04HBI7G9D/XdocUnSMjVv8OGoXNWGRMBN
         qW15Whnb5fAgQH47L/TMvxX2wMYtZZGe2uk8R8DMBv5YAhUDhOmnNk0w2/4Xw8DYE5A3
         Oqxt2KEBMxFf+j+quLL+QW/2W3JUZoUv0SXZHZiZI+MGnLSkEZQWV8UHB6plAwQ1iIb4
         8FI4xY2mUJjcRF6ASxESDbP6leSAmZc36/agmiv7gsD3wT8d6+DeAAxdmk9+bEz94Ffg
         tI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAZ+qkXDXQxhybmpEVudKGXqy+FOYvvtvTW3/3P6xc4=;
        b=PT84Uk0ajPNXoCwDAjqok18zvsZKcNzp9AWRX1VqGH+Kg/uMPedQBXKdKOqSt7/fjW
         BtfbApAeIgTmik84/GLqg/D4B8oK39GHPUtw2n3xGRc3Qm6Gf3jh9UoEZpuL7Gv2zOeA
         x90jEFkSZ1aza8iCv3pE8MWI97iWS5XD3Slhpx0I8p6lQpLzDbfUkDIMT1MSx+Nu4EsK
         ejfIL7zqKmzWA5KnhtapKGnFdbcNe88zLOp5a918cMO0IHrLdiMYUnoHz1ROcCFSIYg7
         OWJqiaL9hrY+JUIUQ+YVNQRJXyPjp6uubeENKJQcDs3TNEbxj/ZK18LCEhVexFFCYVB7
         wayQ==
X-Gm-Message-State: ACrzQf2XQYpQG2LAwweR3DFsxAda8XyetDgHq6OVhOJaKEA3CICgZLpQ
	WbIlqT595S4W6czK5GCNhWUCPVBXBVvMJE+S
X-Google-Smtp-Source: AMsMyM4CKIHDZoGddh2wMguI39VshoESTcUZatEZKQ9RPfSxxCAvYDZIiTWTWyr5m5Cyec5F076sYg==
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id fc11-20020a05600c524b00b003b48c0cf3b6mr12110120wmb.50.1665174901421;
        Fri, 07 Oct 2022 13:35:01 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen: Kconfig: Fix spelling mistake "Maxmium" -> "Maximum"
Date: Fri,  7 Oct 2022 21:35:00 +0100
Message-Id: <20221007203500.2756787-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a Kconfig description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index a65bd92121a5..d5d7c402b651 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -56,7 +56,7 @@ config XEN_MEMORY_HOTPLUG_LIMIT
 	depends on XEN_HAVE_PVMMU
 	depends on MEMORY_HOTPLUG
 	help
-	  Maxmium amount of memory (in GiB) that a PV guest can be
+	  Maximum amount of memory (in GiB) that a PV guest can be
 	  expanded to when using memory hotplug.
 
 	  A PV guest can have more memory than this limit if is
-- 
2.37.3



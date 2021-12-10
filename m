Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE61E46FDC0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243636.421485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcCU-0003lK-0m; Fri, 10 Dec 2021 09:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243636.421485; Fri, 10 Dec 2021 09:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcCT-0003jG-Tt; Fri, 10 Dec 2021 09:28:21 +0000
Received: by outflank-mailman (input) for mailman id 243636;
 Fri, 10 Dec 2021 09:28:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=At30=Q3=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mvcCT-0003jA-As
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:28:21 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 832ff8fa-599b-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 10:28:20 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id x10so10627109edd.5
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 01:28:20 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id u10sm1100969edo.16.2021.12.10.01.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 01:28:19 -0800 (PST)
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
X-Inumbo-ID: 832ff8fa-599b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wo+kEjPRCNOeRmpc24VwDoZ3sGXxzMQEGIk47myQMF4=;
        b=D25x5s7aOfBvkoF1TAnTBMhjleDypIR/jVNd0p2Z75eSnIZErDAv1fx6EJlzyYEERD
         rWV5T4fMEPDldGHGy4lzjbH3kK0SbORPAwBxvAUGhcNaDSrirLbvpNIXQFsSlrLISZpT
         8EOim2hyYjFNofT0F/PjVWXDxbocKSnhkeWUqI5OyqmPf2t4jS2iSgJ3Mtzqt5Hr1Fpm
         oXJkmh2A/7omfykgSbnPUptdgPB7L2dfxgU0jrKd8c9WMhF2cwUEQg0p7Ikio0NbJu9d
         uKeBFO4Egbg/KQ0sOh+YG+ckeIcBg/bMkIkQpCJxqs5lWNnFvg6wHJ/eSZ4h2OX3+avB
         HkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wo+kEjPRCNOeRmpc24VwDoZ3sGXxzMQEGIk47myQMF4=;
        b=LOgku2zzZnrD8A9xDgiKQ4e19+hSCwzO+LT+RKkydTt1kSVlDPkQ4mmijOHQ9z3Nt7
         N8wB/lFqRc+J0zNCiNBc4X9AMn0U/g6x4dckxFM3g98f9SLT3ji/7SKcW6+OCslGU4DM
         gHsMETNFMsXlbvxwB63GZ8WkMYFRDR5/U9k5xbM+XDXtsG4MuIUQTrTBJXNrfNPSvXU9
         yPxfx3p4eagpozbBmcW+npnwhOGgejyid1dEK0FNL2O95cuEEUw/VgbP4y2/d1fKtuS7
         I8UVpxokFXMfdvx2juluYDXI5r0gv9FNFz2lA9TZLsZaVEk4F5VvEbOvxVEcLOtrLk2D
         SU6A==
X-Gm-Message-State: AOAM531Boc0RJATPs7Agu2UMeDlrx9+VjryXXolYU35LTtxLi6zW0RSe
	KkG1r6FgIOERuC5vFN6TPZY8b8FohHxPWA==
X-Google-Smtp-Source: ABdhPJwcTAzhR9JhHlzlbR4kehZa3+II/LWyggzIRg1fSi6WukM1ZJJNUF2G5HcniWyScx8qbyyG8g==
X-Received: by 2002:a05:6402:1e95:: with SMTP id f21mr38172357edf.139.1639128499650;
        Fri, 10 Dec 2021 01:28:19 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	stable@vger.kernel.org
Subject: [PATCH] xen/gntdev: fix unmap notification order
Date: Fri, 10 Dec 2021 11:28:17 +0200
Message-Id: <20211210092817.580718-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

While working with Xen's libxenvchan library I have faced an issue with
unmap notifications sent in wrong order if both UNMAP_NOTIFY_SEND_EVENT
and UNMAP_NOTIFY_CLEAR_BYTE were requested: first we send an event channel
notification and then clear the notification byte which renders in the below
inconsistency (cli_live is the byte which was requested to be cleared on unmap):

[  444.514243] gntdev_put_map UNMAP_NOTIFY_SEND_EVENT map->notify.event 6
libxenvchan_is_open cli_live 1
[  444.515239] __unmap_grant_pages UNMAP_NOTIFY_CLEAR_BYTE at 14

Thus it is not possible to reliably implement the checks like
- wait for the notification (UNMAP_NOTIFY_SEND_EVENT)
- check the variable (UNMAP_NOTIFY_CLEAR_BYTE)
because it is possible that the variable gets checked before it is cleared
by the kernel.

To fix that we need to re-order the notifications, so the variable is first
gets cleared and then the event channel notification is sent.
With this fix I can see the correct order of execution:

[   54.522611] __unmap_grant_pages UNMAP_NOTIFY_CLEAR_BYTE at 14
[   54.537966] gntdev_put_map UNMAP_NOTIFY_SEND_EVENT map->notify.event 6
libxenvchan_is_open cli_live 0

Cc: stable@vger.kernel.org
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/xen/gntdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index fec1b6537166..59ffea800079 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -250,13 +250,13 @@ void gntdev_put_map(struct gntdev_priv *priv, struct gntdev_grant_map *map)
 	if (!refcount_dec_and_test(&map->users))
 		return;
 
+	if (map->pages && !use_ptemod)
+		unmap_grant_pages(map, 0, map->count);
+
 	if (map->notify.flags & UNMAP_NOTIFY_SEND_EVENT) {
 		notify_remote_via_evtchn(map->notify.event);
 		evtchn_put(map->notify.event);
 	}
-
-	if (map->pages && !use_ptemod)
-		unmap_grant_pages(map, 0, map->count);
 	gntdev_free_map(map);
 }
 
-- 
2.25.1



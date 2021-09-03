Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D3A3FFC13
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177840.323591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eL-0008Lh-ON; Fri, 03 Sep 2021 08:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177840.323591; Fri, 03 Sep 2021 08:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eL-0008FR-Jr; Fri, 03 Sep 2021 08:34:13 +0000
Received: by outflank-mailman (input) for mailman id 177840;
 Fri, 03 Sep 2021 08:34:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4eJ-0006kQ-Cz
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:11 +0000
Received: from mail-ed1-x531.google.com (unknown [2a00:1450:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abac851f-78b0-46af-ba55-f6067286fe72;
 Fri, 03 Sep 2021 08:33:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g22so6893686edy.12
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:33:55 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:53 -0700 (PDT)
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
X-Inumbo-ID: abac851f-78b0-46af-ba55-f6067286fe72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gT/ZFZNUCDilPZAOY4tWpXuhNvzOpcakatBoOBy/O1k=;
        b=AeeHVvoDQgATpWSZNB/AO4OIyw4Mg9oLVflwbPYmCY/dNrU1qFSQB6Db3RqYWroQIm
         7dL4DAlFEW2GS7PnIsgS7gE9t4WMgwHb0M5oO5gEtI/deFPJO4ufJeIIE6jGpdTIuNXv
         HO3CaROk5N0KkNEEdY7x1NBl3FxGPdgHarce5VLXc0j0PuLaobvKmi3gSljvQcSX+aPc
         //aaqhRjf3R96XiFwTYuAJ4GXlwIF3VVYkQFUG2Fu1uqXBJPRpNuEPYYXKO2Xf6aeIxP
         zG8rAY1KwYJ2z5GY75QLpNcSi/kpSMO3mJAHsjUmpyFmB7ff8JMJd20fYfkj258kxD4V
         PMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gT/ZFZNUCDilPZAOY4tWpXuhNvzOpcakatBoOBy/O1k=;
        b=AKT9Qirdlz2Tnu9mJr/AmWdARIaR25QIApx9cutv45Bb8poD82/RxZ+GlwzIWWK/jN
         vwH8m6sZI1dOy9tWslgbkcPUfjFkdXf/028gzwqLHU3N8EvrlBeGusD9iRJC4YyaDzYr
         ibmj6MAF23RwNDdatmZ5QKlYkPnTikZS5jTe3lxS1NFhPLwiT0spVHuhLSbMydSznAA3
         y2Nupp/ycyftCrSsBpYimh3hRpN4QPUrfwGmETZo7ldY324LnAeYB6VQbPxDzaORkEfK
         O+PecLffVpdYBV8Uj+cgaYzP7EtrQZ7KnHLZtm6Y/y1cev/RIbr5pYbGhoDiAy5nKaHK
         cEsQ==
X-Gm-Message-State: AOAM531b95LbkD8D/U3k/TYzb2/vrmJ7a8/LrjtzlF8XrJDv464yiVDU
	fWc4zqUnUhEkVvt/LHw8+E62ttNAkn4=
X-Google-Smtp-Source: ABdhPJwY8ZltlgwVhwjnryt/5IUzAOzh/IBbZ1FvlM/J72PFOBmQxVLdVpjv5yPJL3sHkLXKtBoe/g==
X-Received: by 2002:a05:6402:b9c:: with SMTP id cf28mr2924531edb.356.1630658034045;
        Fri, 03 Sep 2021 01:33:54 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 04/11] xen/device-tree: Make dt_find_node_by_phandle global
Date: Fri,  3 Sep 2021 11:33:40 +0300
Message-Id: <20210903083347.131786-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Make dt_find_node_by_phandle globally visible, so it can be re-used by
other frameworks.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/common/device_tree.c      | 2 +-
 xen/include/xen/device_tree.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 03d25a81cea8..c2e33b99832f 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -986,7 +986,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
  *
  * Returns a node pointer.
  */
-static struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
+struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
 {
     struct dt_device_node *np;
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index b02696be9416..07393da1df90 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -776,6 +776,8 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
                                const char *list_name,
                                const char *cells_name);
 
+struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
+
 #ifdef CONFIG_DEVICE_TREE_DEBUG
 #define dt_dprintk(fmt, args...)  \
     printk(XENLOG_DEBUG fmt, ## args)
-- 
2.25.1



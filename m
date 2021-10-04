Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE3421118
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201469.355996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhS-0000yA-QO; Mon, 04 Oct 2021 14:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201469.355996; Mon, 04 Oct 2021 14:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOhS-0000vv-Lf; Mon, 04 Oct 2021 14:12:14 +0000
Received: by outflank-mailman (input) for mailman id 201469;
 Mon, 04 Oct 2021 14:12:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOhR-0008QG-Do
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:12:13 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0caa8cc2-efeb-4b20-b8a3-ef921042cb49;
 Mon, 04 Oct 2021 14:12:02 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id e15so72226530lfr.10
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:12:02 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:11:58 -0700 (PDT)
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
X-Inumbo-ID: 0caa8cc2-efeb-4b20-b8a3-ef921042cb49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SW5l0COaWEZ5SQENULoKJ23OIO+t8l75C/PAXs3yYFM=;
        b=ntx/K3knoi+iSrMn9p7uItv9/iGeeiMOipiMNZeTVU5nuNZ81z0AVPCeDVNH6fFtXj
         n4FD7JaU0nV+5PfWFuErnZCLpfEGURbI5pWJ8pdUjEWUCEG5tIoS3GHEep1WgXBw9DI6
         reXVG2AwzazcS8x51rUKNBCpWtXXpuTD2hy5qg2TirkzLqK+HpYfJCO0maaOvqIFJIJd
         64CyohDiVBjsHgKJvrjFqwRLJ7OguMNaRRdZXnnsVTRUVl/HSWGqUMc2bVXrQbAiPgyw
         X8TKrtziWgyknLX3aLJouNNqrAVC72J8mtXnjzMY6gbZhVVtR+O9yrNPJLxd4ik0UcI1
         frRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SW5l0COaWEZ5SQENULoKJ23OIO+t8l75C/PAXs3yYFM=;
        b=yaB5SkjynifH43GaVYOJXW9S2nnBeokShVQC7o1HV00fUblIlFsxqqk5s2HcBsAC2Y
         qP9tQW+d2Dzk6nH2zbAWPfZzU2Bfsw/ZNS7eveNmkITzlZjSuCrACI0uJ7CIrlPoHFoI
         epIOfoljEcHHhnz8chdKg3Y5eibFgYG17GCditvz8Ezm6uTCJT7zh2Z1pnLIN5cSu9QY
         MA3yml5jo3oPjhsyUMbgKEmYeRfX/haPoy7PKdZW/5bimkdeIPimMd2bwlxwK6D/BfS3
         5iDckt+8dcR6aGAO2TAiNLwJsZxGJW1Qxq2LLSVROUhLpvRlEjd0jQ9YrjnAnNLh4kEh
         m8XQ==
X-Gm-Message-State: AOAM533cC6M5ZZG70Q7UwrBx/s7awn7nZtq73RoboFkr2YggJ1fgCI4A
	lYMZDWyNp1EMVAvnrLdMtzm4G8J2zx4=
X-Google-Smtp-Source: ABdhPJyavFO/o6GxpHltCcx8E2ZFYORwrVAopkK4TzGlo178OgdWxxMtjW60ncVsqyVALdP4IhHpKA==
X-Received: by 2002:a05:6512:114d:: with SMTP id m13mr2588483lfg.382.1633356719174;
        Mon, 04 Oct 2021 07:11:59 -0700 (PDT)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 04/11] xen/device-tree: Make dt_find_node_by_phandle global
Date: Mon,  4 Oct 2021 17:11:44 +0300
Message-Id: <20211004141151.132231-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Make dt_find_node_by_phandle globally visible, so it can be re-used by
other frameworks.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/device_tree.c      | 2 +-
 xen/include/xen/device_tree.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index ea93da1725f6..4aae281e89bf 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -1047,7 +1047,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
  *
  * Returns a node pointer.
  */
-static struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
+struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
 {
     struct dt_device_node *np;
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 2297c59ce66d..fd6cd00b433a 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -849,6 +849,8 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
  */
 int dt_get_pci_domain_nr(struct dt_device_node *node);
 
+struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
+
 #ifdef CONFIG_DEVICE_TREE_DEBUG
 #define dt_dprintk(fmt, args...)  \
     printk(XENLOG_DEBUG fmt, ## args)
-- 
2.25.1



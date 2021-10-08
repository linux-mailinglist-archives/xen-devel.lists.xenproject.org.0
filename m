Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DB1426455
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204331.359497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirN-0000DF-73; Fri, 08 Oct 2021 05:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204331.359497; Fri, 08 Oct 2021 05:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirN-00008v-1j; Fri, 08 Oct 2021 05:55:57 +0000
Received: by outflank-mailman (input) for mailman id 204331;
 Fri, 08 Oct 2021 05:55:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYirL-0007cA-K2
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:55:55 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90c4cf70-19b2-48f6-9e40-8cadf5208682;
 Fri, 08 Oct 2021 05:55:42 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y26so34944657lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:42 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:41 -0700 (PDT)
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
X-Inumbo-ID: 90c4cf70-19b2-48f6-9e40-8cadf5208682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+5xYEIb/HFPwhli6DC0XzWGZZlF9uvm17LAFke7DVg=;
        b=hpYqLI7plP5qH91EWtG+D9aX04Y6LRpU3DZFsjpYQgeYsKI2j/2su1CTssUSk8KGWN
         OvGcyCem5ovg1JTYQ1CqUITJam7LGBNj1MGUU6cW5nE6OIoLvs/gpmrUv4vOq7RycgiF
         zTRrz7JwqH3Geb/HOlgFjhjwR6JW7b7WZqYQrVaJagGJJ0I0plKNljDSL+jXhPECbGxU
         /KRWvy8upzo0c4BUA5+cx19afGxQf/qX9mW9pw5MhFswdfv4AdC3gSLYcB+99BcxHp8f
         46Z+ekb67TK3FZ4/QMXeH0DmpTwrOInfee0lESXwnVM1UJRl629tyvKMaPvBam4R09Fo
         kHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+5xYEIb/HFPwhli6DC0XzWGZZlF9uvm17LAFke7DVg=;
        b=Dud2ikU6soUYs1rOdQAiOgzjmJyE2C+j7VgfsQy8SPhFWEBbe04KFiTTo3dZAkvk/E
         o9o60u4uW9zWRu1fDBWN52ZheCCaHw02xvsj/Z++3kM9wfiN1UU1NfMqY1hyulNVBjox
         Pdf48KBqg5QIg6+jJO8HkzTI1FCcDaEsmFiYKjmkffUJVYux+V5DRPO8Tg/yK8GJYRv+
         j7tyfdWc/bVb3j+yZTWyF8Rj3r42kQM1fQJ5eToI1vvZY2zfHDW469wro8e6pPMFoRd3
         ziB6e3WUJGj+7QHju404zxr3erudrNU9WzaeYMX+thwfvFWstXur0AmttJKZHWGzcWwT
         XM+g==
X-Gm-Message-State: AOAM530W9Kgg4WBbXxFUNp8CMnUyTXImJyVe5KEVpD8W3VR72gfzJ0vU
	6oCCvnTWPY4NvjObgITScGnf3IsPC2Y=
X-Google-Smtp-Source: ABdhPJzot14ubwqEzFWSPCYc/moe+/KXUuMlro56Giypeef3N7rKA3JUcaJ3ZqVpmF8VHsmY/HRH9A==
X-Received: by 2002:a05:651c:169c:: with SMTP id bd28mr1466459ljb.476.1633672541674;
        Thu, 07 Oct 2021 22:55:41 -0700 (PDT)
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
Subject: [PATCH v5 03/10] xen/device-tree: Make dt_find_node_by_phandle global
Date: Fri,  8 Oct 2021 08:55:28 +0300
Message-Id: <20211008055535.337436-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Make dt_find_node_by_phandle globally visible, so it can be re-used by
other frameworks.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
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



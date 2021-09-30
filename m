Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC2E41D43E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199399.353463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGN-0005pm-OL; Thu, 30 Sep 2021 07:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199399.353463; Thu, 30 Sep 2021 07:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqGN-0005nT-Jn; Thu, 30 Sep 2021 07:13:51 +0000
Received: by outflank-mailman (input) for mailman id 199399;
 Thu, 30 Sep 2021 07:13:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqGM-0004B3-9m
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:13:50 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa0297e2-f1ca-4583-8ec1-5ceb5ab925c1;
 Thu, 30 Sep 2021 07:13:32 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g41so21251914lfv.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:32 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:31 -0700 (PDT)
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
X-Inumbo-ID: fa0297e2-f1ca-4583-8ec1-5ceb5ab925c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SW5l0COaWEZ5SQENULoKJ23OIO+t8l75C/PAXs3yYFM=;
        b=IbIUqXrhJTRPq6lhYGZqZrFXaKdmScTrbfzt7COuq+xkWXbioejqNA/Y81bZGni0mz
         98aJ1/kDEQYY1t9G1uY4Vn/Mpm4lKTGKEyd0B1IJsN0oJcZ0n5KFDQSo68GdWPoSxQ65
         L70hoLDq8j/gb+pmvkEe7e+xHxvf6sX/LsKV3cACJeJ/jjOQzJU+OoWYgn7xu8bLsB8N
         NjrMiJZ5t6oIU8CWOCFQkJIO0TbtO+dvxmZ3rVc7fX6m+1CZ5qdH8hVP01cZfQYvkld9
         6wiJ9zs61SYCV8jFTtBCKU3PZ8eTqxcrIabpWKfr8eAD914vLrDflYY4GrW952B8nvZA
         IegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SW5l0COaWEZ5SQENULoKJ23OIO+t8l75C/PAXs3yYFM=;
        b=tz+x2rEDvWaXtWaXfA/vjCpyBXHzULcRQNLM2K2qwj0sNIUZW0NQVSd5FyveREU75U
         EWhV5lXJkJ618tqG/S1A2vkYgLCW2evxp56HDB7AvUy7Tug9nml4k+bkxR7KqBnGiDKm
         SNJ8yfufL922bDQGLdC3XB8M8bAL02DnspgoV0dUfRSBL5M+WMFN+J/NlItIN1pm3JO7
         rPDs8b2zGzYtc7X81+jqgMM+ubrzK4w8iFVmisl3TWDAb91wqBdf30nPvW7KnUm5f2rh
         rANh1yDCag338Ko19ZY35+mWKZ2zcuPcy2rxITE8uxavL1NAGQBPH+yII/0lFe1yHG17
         rg8w==
X-Gm-Message-State: AOAM5326USpvQscraBt7p88QsFsv1LBjBv1zhpneSQ1R7c6DYIzHxdns
	IC5Nki+uaA2gDmyphM0NbNb0TiqRb6M=
X-Google-Smtp-Source: ABdhPJwauDS6x9R7+bWvRGCmKDDA9RWkLxAH63+3ofu4OaajWPa6y1TqRujWamY2ecr6eMk5JJHDuA==
X-Received: by 2002:a2e:974b:: with SMTP id f11mr4336756ljj.385.1632986011655;
        Thu, 30 Sep 2021 00:13:31 -0700 (PDT)
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
Subject: [PATCH v3 04/11] xen/device-tree: Make dt_find_node_by_phandle global
Date: Thu, 30 Sep 2021 10:13:19 +0300
Message-Id: <20210930071326.857390-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
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



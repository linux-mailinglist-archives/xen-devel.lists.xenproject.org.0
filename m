Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA37507E76
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 03:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308537.524326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngzTB-0008AO-S8; Wed, 20 Apr 2022 01:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308537.524326; Wed, 20 Apr 2022 01:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngzTB-00088b-L9; Wed, 20 Apr 2022 01:49:25 +0000
Received: by outflank-mailman (input) for mailman id 308537;
 Wed, 20 Apr 2022 01:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZnnQ=U6=gmail.com=linmq006@srs-se1.protection.inumbo.net>)
 id 1ngzT9-00088V-Ky
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 01:49:23 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18b2eeb9-c04c-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 03:49:21 +0200 (CEST)
Received: by mail-pg1-x536.google.com with SMTP id 203so194238pgb.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 18:49:21 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 x20-20020aa79574000000b005061f4782c5sm17543755pfq.183.2022.04.19.18.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 18:49:19 -0700 (PDT)
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
X-Inumbo-ID: 18b2eeb9-c04c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/UuWmXAeK3wDg34COXqd7JHzyxxdodWHUXeYP3t+DVM=;
        b=jNy+tVOlKTuaYase1uWbsaybUMzAQOYmfdHlgLhP/+zTF8xCAUk/rP1NoLEGiss6Ci
         8qkBAnee5LdixG9PAXR78Oh8mQtv1kvTWP7aD6/ans2MUS8VItAiXi29L6eVczGyZ5Gk
         O9Qyer2uqerzeN7dx4kFdxCkpGRACMwyQmfXq9KmBIv5s6TxXgXU3PpOziZzKuX5PLik
         9ciG9eSVuwEK8pTOA4H+l7gR4xJegCf7bUg2hDXyi8H6nGdC/fypU7slc7C2UTtKBBa4
         naCTHZbfiuCV7cDhsc64yGZCVU7gLq8M7oy4C2pkMiGKaNe3L6SmTIuAh9u21UEuE1rU
         2q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/UuWmXAeK3wDg34COXqd7JHzyxxdodWHUXeYP3t+DVM=;
        b=HmPj6xp0x+181KhOdRq4W7bPnLMM48aZ3rT31ZxDzEE4xUOY1yg0mhjnDRZQxbzRGq
         nTI0Nd+DnIcDDows5pnSE97HmT3KBQFQEshxdRCxDL66DlgvWeA1ZCwd4LB1rzyJ0gOJ
         5Pbv13AZdn+fHqdHGXFhIIlLDlgx6DA1vhu5IHoqrM7e0PPPrOgzO0pusyWEqoKeTWOC
         JM56zfByFPcpaz2YmGbBninrJDtDYlJuVik+EwA6XEYgm+MF2t49kyKBvRC+EvaPQQ9w
         qWHMHj5hYLy1iFszpgdYD4IVPzZMYlZnbnyfKnXuul30xoglnk3zVQa7j3BG6O1iTJaw
         Gfww==
X-Gm-Message-State: AOAM533aw0ACPaTS9wvwJlwzgq9CnnrUJqF9MkSHe0Vgsq+C5Lw7S1tA
	0ZsUym/WQ2/7QkASe6eWsF8=
X-Google-Smtp-Source: ABdhPJw58IDvs8PX3F7lrr3iHelhvA0R312SWs14z9YL08C1HaVgt0xmXyKbe63xjiK6qsGJlYlidA==
X-Received: by 2002:a05:6a00:2489:b0:50a:754c:c557 with SMTP id c9-20020a056a00248900b0050a754cc557mr13590297pfv.37.1650419359982;
        Tue, 19 Apr 2022 18:49:19 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Julien Grall <julien.grall@arm.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH v2] arm/xen: Fix some refcount leaks
Date: Wed, 20 Apr 2022 01:49:13 +0000
Message-Id: <20220420014913.2586-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220406021905.GA30436@8345e2a12d0c>
References: <20220406021905.GA30436@8345e2a12d0c>

The of_find_compatible_node() function returns a node pointer with
refcount incremented, We should use of_node_put() on it when done
Add the missing of_node_put() to release the refcount.

Fixes: 9b08aaa3199a ("ARM: XEN: Move xen_early_init() before efi_init()")
Fixes: b2371587fe0c ("arm/xen: Read extended regions from DT and init Xen resource")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- call of_node_put in non-error path in xen_dt_guest_init
- fix same refcount leak error in arch_xen_unpopulated_init
---
 arch/arm/xen/enlighten.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index ec5b082f3de6..07eb69f9e7df 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -337,12 +337,15 @@ int __init arch_xen_unpopulated_init(struct resource **res)
 
 	if (!nr_reg) {
 		pr_err("No extended regions are found\n");
+		of_node_put(np);
 		return -EINVAL;
 	}
 
 	regs = kcalloc(nr_reg, sizeof(*regs), GFP_KERNEL);
-	if (!regs)
+	if (!regs) {
+		of_node_put(np);
 		return -ENOMEM;
+	}
 
 	/*
 	 * Create resource from extended regions provided by the hypervisor to be
@@ -403,8 +406,8 @@ int __init arch_xen_unpopulated_init(struct resource **res)
 	*res = &xen_resource;
 
 err:
+	of_node_put(np);
 	kfree(regs);
-
 	return rc;
 }
 #endif
@@ -424,8 +427,10 @@ static void __init xen_dt_guest_init(void)
 
 	if (of_address_to_resource(xen_node, GRANT_TABLE_INDEX, &res)) {
 		pr_err("Xen grant table region is not found\n");
+		of_node_put(xen_node);
 		return;
 	}
+	of_node_put(xen_node);
 	xen_grant_frames = res.start;
 }
 
-- 
2.17.1



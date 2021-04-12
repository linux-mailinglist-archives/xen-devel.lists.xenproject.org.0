Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9430235CB78
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 18:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109371.208794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVzMM-0004QB-Bj; Mon, 12 Apr 2021 16:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109371.208794; Mon, 12 Apr 2021 16:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVzMM-0004Pm-8X; Mon, 12 Apr 2021 16:24:22 +0000
Received: by outflank-mailman (input) for mailman id 109371;
 Mon, 12 Apr 2021 16:24:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=senq=JJ=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1lVzMK-0004Pe-Ii
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 16:24:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f49a0939-51e5-4899-b89a-2ac2edfc5232;
 Mon, 12 Apr 2021 16:24:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACE4C6136C;
 Mon, 12 Apr 2021 16:24:18 +0000 (UTC)
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
X-Inumbo-ID: f49a0939-51e5-4899-b89a-2ac2edfc5232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618244659;
	bh=KgQAhTj6sUm8dp2+WQQSK3nP7Y2J/NZ4Vx5xWPL84os=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WAZ2k0TGS7fcDzgO/l5cyt1+kbKIy3KOprSX+Oof1qwOrQCqJn43qurWJL572xnrK
	 d82uakrXnbB80Jy76TzMAjVnhqPE7BRhwIGGFCfAFQS7Nq2juLriWg8PGlo5cEFTIZ
	 KV8v4Km5NOb05qGIXSRPuRMsKkw6h1cq7x0l1+YHlTs78GS+1EgsHoHpDxWDxO5rBI
	 S1u+a8NWXYIpag04iTlSOAB9XQErsgbvGyiTEl/Z55EAYkcy6ZXjeUH5UQ2hesV6ur
	 7zUSKR0ZWJ18lliDhKkftbu+HqySGyAKqwa1jXjESPPuif6M3pzaP/dBBaPDuAoGAC
	 /NZlAew11qndQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lv Yunlong <lyl2019@mail.ustc.edu.cn>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Sasha Levin <sashal@kernel.org>,
	dri-devel@lists.freedesktop.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.10 14/46] gpu/xen: Fix a use after free in xen_drm_drv_init
Date: Mon, 12 Apr 2021 12:23:29 -0400
Message-Id: <20210412162401.314035-14-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162401.314035-1-sashal@kernel.org>
References: <20210412162401.314035-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Lv Yunlong <lyl2019@mail.ustc.edu.cn>

[ Upstream commit 52762efa2b256ed1c5274e5177cbd52ee11a2f6a ]

In function displback_changed, has the call chain
displback_connect(front_info)->xen_drm_drv_init(front_info).
We can see that drm_info is assigned to front_info->drm_info
and drm_info is freed in fail branch in xen_drm_drv_init().

Later displback_disconnect(front_info) is called and it calls
xen_drm_drv_fini(front_info) cause a use after free by
drm_info = front_info->drm_info statement.

My patch has done two things. First fixes the fail label which
drm_info = kzalloc() failed and still free the drm_info.
Second sets front_info->drm_info to NULL to avoid uaf.

Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210323014656.10068-1-lyl2019@mail.ustc.edu.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index cc93a8c9547b..8ea91542b567 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -531,7 +531,7 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
 	drm_dev = drm_dev_alloc(&xen_drm_driver, dev);
 	if (IS_ERR(drm_dev)) {
 		ret = PTR_ERR(drm_dev);
-		goto fail;
+		goto fail_dev;
 	}
 
 	drm_info->drm_dev = drm_dev;
@@ -561,8 +561,10 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
 	drm_kms_helper_poll_fini(drm_dev);
 	drm_mode_config_cleanup(drm_dev);
 	drm_dev_put(drm_dev);
-fail:
+fail_dev:
 	kfree(drm_info);
+	front_info->drm_info = NULL;
+fail:
 	return ret;
 }
 
-- 
2.30.2



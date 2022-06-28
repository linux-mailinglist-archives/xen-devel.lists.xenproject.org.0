Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8DA55BD55
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 04:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356950.585317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o60q4-0007jI-1i; Tue, 28 Jun 2022 02:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356950.585317; Tue, 28 Jun 2022 02:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o60q3-0007gS-S0; Tue, 28 Jun 2022 02:20:27 +0000
Received: by outflank-mailman (input) for mailman id 356950;
 Tue, 28 Jun 2022 02:20:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XMom=XD=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1o60q1-0007gM-Td
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 02:20:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd3b7f25-f688-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 04:20:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E28EB81C0B;
 Tue, 28 Jun 2022 02:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C61C34115;
 Tue, 28 Jun 2022 02:20:19 +0000 (UTC)
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
X-Inumbo-ID: dd3b7f25-f688-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656382821;
	bh=Asz9ew2hFmI18bnYpVbWeSIOuLQ9FU4MX/wfshCkR5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wm5qD/N3uSHISZ4abRUbRUHGlbp6c62EBG4ghbYADH1y0iqvooDAeYFKu/Z8xHajv
	 O/ZOgu6IvwnB6w8oofFgvGBub5Zr6RPiv7OivKBznV4zq/J4jkiV6G7LvJ/X68gN2r
	 qyyg1lE3bsqKR+K/IhuhYkGYqa9dT142qZwXaplHvhr3mxLjdx2RWa/G6eycCF+VKI
	 OD3SSDc2tyubnptvlVVLa4Zb4XIDX9XoYpQFxJ/aqNp4Jl6kZyXactH5c0MlnGdY8v
	 KmAI1V1sln3R00n6ZXBKb42phdZMC1rSbCowJ+57RxcYspLkdt8J1iEFw5CmPQL9up
	 B9cKq3/Ukrs8w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.18 38/53] drm/xen: Add missing VM_DONTEXPAND flag in mmap callback
Date: Mon, 27 Jun 2022 22:18:24 -0400
Message-Id: <20220628021839.594423-38-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

[ Upstream commit ca6969013d13282b42cb5edcc13db731a08e0ad8 ]

With Xen PV Display driver in use the "expected" VM_DONTEXPAND flag
is not set (neither explicitly nor implicitly), so the driver hits
the code path in drm_gem_mmap_obj() which triggers the WARNING.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Link: https://lore.kernel.org/r/1652104303-5098-1-git-send-email-olekstysh@gmail.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 5a5bf4e5b717..e31554d7139f 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -71,7 +71,7 @@ static int xen_drm_front_gem_object_mmap(struct drm_gem_object *gem_obj,
 	 * the whole buffer.
 	 */
 	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
 	vma->vm_pgoff = 0;
 
 	/*
-- 
2.35.1



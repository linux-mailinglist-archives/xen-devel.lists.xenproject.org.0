Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F300F3A1261
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 13:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139207.257482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqwFx-0003gl-EW; Wed, 09 Jun 2021 11:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139207.257482; Wed, 09 Jun 2021 11:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqwFx-0003dp-BH; Wed, 09 Jun 2021 11:20:21 +0000
Received: by outflank-mailman (input) for mailman id 139207;
 Wed, 09 Jun 2021 11:20:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYhx=LD=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1lqwFv-0003db-4M
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 11:20:19 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c94584d9-69f0-4241-9ee9-02f938e33b3c;
 Wed, 09 Jun 2021 11:20:15 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 322EA1FD2A;
 Wed,  9 Jun 2021 11:20:14 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8991F118DD;
 Wed,  9 Jun 2021 11:20:13 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Pn27IO2jwGBTUgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 11:20:13 +0000
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
X-Inumbo-ID: c94584d9-69f0-4241-9ee9-02f938e33b3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623237614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oCiBA5IQR9wf4+Cc+r3nE+xIhszdcMtCPYXz7tk1DUc=;
	b=fY/lBPn1RzheTsgcxOOcUlu2A6QxXJzVzaZKYGY8dQ/N9dkPZxAh+IzMlWy3Mdw4YcifeB
	euR+HK45GJ3f0u+/7nmbJqJDLXGEJmIB2cOWMU93FBBin5A1MqrE27Y9jBklc67vNLz8q3
	MEB05kirgOr7hJDXocRIMCqdq+d45FY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623237614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oCiBA5IQR9wf4+Cc+r3nE+xIhszdcMtCPYXz7tk1DUc=;
	b=qtPzutLGd6X37XBCAvAZ4AuMX1bEEdUc0wqN5VeNSoa0OrIM4LVgceME8x2WEfyyR258wQ
	Jhvg0YtWBnitxsBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623237614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oCiBA5IQR9wf4+Cc+r3nE+xIhszdcMtCPYXz7tk1DUc=;
	b=fY/lBPn1RzheTsgcxOOcUlu2A6QxXJzVzaZKYGY8dQ/N9dkPZxAh+IzMlWy3Mdw4YcifeB
	euR+HK45GJ3f0u+/7nmbJqJDLXGEJmIB2cOWMU93FBBin5A1MqrE27Y9jBklc67vNLz8q3
	MEB05kirgOr7hJDXocRIMCqdq+d45FY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623237614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oCiBA5IQR9wf4+Cc+r3nE+xIhszdcMtCPYXz7tk1DUc=;
	b=qtPzutLGd6X37XBCAvAZ4AuMX1bEEdUc0wqN5VeNSoa0OrIM4LVgceME8x2WEfyyR258wQ
	Jhvg0YtWBnitxsBg==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	christian.gmeiner@gmail.com,
	inki.dae@samsung.com,
	jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzysztof.kozlowski@canonical.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	robdclark@gmail.com,
	sean@poorly.run,
	airlied@redhat.com,
	kraxel@redhat.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	oleksandr_andrushchenko@epam.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] drm: Implement gem_prime_mmap with drm_gem_prime_mmap()
Date: Wed,  9 Jun 2021 13:20:03 +0200
Message-Id: <20210609112012.10019-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all remaining implementations of struct drm_driver.gem_prime_mmap
with use drm_gem_prime_mmap(). For each affected driver, put the mmap code
into struct drm_gem_object_funcs.mmap. With the latter change in place,
create struct file_operations via DEFINE_DRM_GEM_FOPS().

As next steps, remaining drivers can be converted to use drm_gem_prime_mmap()
and drm_gem_mmap() (e.g., Tegra). The default mmap code in drm_gem_prime_mmap()
can be pushed into affected drivers or a helper function. The gem_prime_mmap
hook can probably be removed at some point.

Testing is welcome. I don't have all the necessary hardware.

Thomas Zimmermann (9):
  drm/etnaviv: Implement mmap as GEM object function
  drm/exynox: Implement mmap as GEM object function
  drm/mediatek: Implement mmap as GEM object function
  drm/msm: Implement mmap as GEM object function
  drm/qxl: Remove empty qxl_gem_prime_mmap()
  drm/vgem: Implement mmap as GEM object function
  drm/xen: Implement mmap as GEM object function
  drm/rockchip: Implement mmap as GEM object function
  drm: Update documentation and TODO of gem_prime_mmap hook

 Documentation/gpu/todo.rst                    |  11 --
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  14 +--
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   3 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  18 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 ---
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  13 +--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  20 +---
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  43 ++-----
 drivers/gpu/drm/exynos/exynos_drm_gem.h       |   5 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  13 +--
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  44 ++-----
 drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   3 -
 drivers/gpu/drm/msm/msm_drv.c                 |  14 +--
 drivers/gpu/drm/msm/msm_drv.h                 |   1 -
 drivers/gpu/drm/msm/msm_fbdev.c               |  10 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  67 +++++------
 drivers/gpu/drm/msm/msm_gem.h                 |   3 -
 drivers/gpu/drm/msm/msm_gem_prime.c           |  11 --
 drivers/gpu/drm/qxl/qxl_drv.c                 |   1 -
 drivers/gpu/drm/qxl/qxl_drv.h                 |   2 -
 drivers/gpu/drm/qxl/qxl_prime.c               |   6 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  13 +--
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |   3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  44 ++-----
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   7 --
 drivers/gpu/drm/vgem/vgem_drv.c               |  46 +-------
 drivers/gpu/drm/xen/xen_drm_front.c           |  16 +--
 drivers/gpu/drm/xen/xen_drm_front_gem.c       | 108 +++++++-----------
 drivers/gpu/drm/xen/xen_drm_front_gem.h       |   7 --
 include/drm/drm_drv.h                         |  11 +-
 30 files changed, 136 insertions(+), 434 deletions(-)


base-commit: 70e4d80795934312a3853a4f4f49445ce6db1271
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.31.1



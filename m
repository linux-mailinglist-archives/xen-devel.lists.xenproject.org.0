Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E1727D268
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.253.627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHLF-00072P-O3; Tue, 29 Sep 2020 15:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253.627; Tue, 29 Sep 2020 15:14:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHLF-00071Z-KF; Tue, 29 Sep 2020 15:14:57 +0000
Received: by outflank-mailman (input) for mailman id 253;
 Tue, 29 Sep 2020 15:14:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kNHLD-0006qd-V1
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e524a8a-7e24-461a-9c99-259f947b2629;
 Tue, 29 Sep 2020 15:14:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78C88AE85;
 Tue, 29 Sep 2020 15:14:46 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kNHLD-0006qd-V1
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:55 +0000
X-Inumbo-ID: 6e524a8a-7e24-461a-9c99-259f947b2629
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6e524a8a-7e24-461a-9c99-259f947b2629;
	Tue, 29 Sep 2020 15:14:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 78C88AE85;
	Tue, 29 Sep 2020 15:14:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	kraxel@redhat.com,
	l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	christian.gmeiner@gmail.com,
	inki.dae@samsung.com,
	jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	kgene@kernel.org,
	krzk@kernel.org,
	yuq825@gmail.com,
	bskeggs@redhat.com,
	robh@kernel.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	hdegoede@redhat.com,
	sean@poorly.run,
	eric@anholt.net,
	oleksandr_andrushchenko@epam.com,
	ray.huang@amd.com,
	sumit.semwal@linaro.org,
	emil.velikov@collabora.com,
	luben.tuikov@amd.com,
	apaneers@amd.com,
	linus.walleij@linaro.org,
	melissa.srw@gmail.com,
	chris@chris-wilson.co.uk,
	miaoqinglang@huawei.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	lima@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 7/7] drm/todo: Update entries around struct dma_buf_map
Date: Tue, 29 Sep 2020 17:14:37 +0200
Message-Id: <20200929151437.19717-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929151437.19717-1-tzimmermann@suse.de>
References: <20200929151437.19717-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instances of struct dma_buf_map should be useful throughout DRM's
memory management code. Furthermore, several drivers can now use
generic fbdev emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 3751ac976c3e..023626c1837b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -197,8 +197,10 @@ Convert drivers to use drm_fbdev_generic_setup()
 ------------------------------------------------
 
 Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
-atomic modesetting and GEM vmap support. Current generic fbdev emulation
-expects the framebuffer in system memory (or system-like memory).
+atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
+expected the framebuffer in system memory or system-like memory. By employing
+struct dma_buf_map, drivers with frambuffers in I/O memory can be supported
+as well.
 
 Contact: Maintainer of the driver you plan to convert
 
@@ -446,6 +448,24 @@ Contact: Ville Syrjälä, Daniel Vetter
 
 Level: Intermediate
 
+Use struct dma_buf_map throughout codebase
+------------------------------------------
+
+Pointers to shared device memory are stored in struct dma_buf_map. Each
+instance knows whether it refers to system or I/O memory. Most of the DRM-wide
+interface have been converted to use struct dma_buf_map, but implementations
+often still use raw pointers.
+
+The task is to use struct dma_buf_map where it makes sense.
+
+* Memory managers should use struct dma_buf_map for dma-buf-imported buffers.
+* TTM might benefit from using struct dma_buf_map internally.
+* Framebuffer copying and blitting helpers should operate on struct dma_buf_map.
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vetter
+
+Level: Intermediate
+
 
 Core refactorings
 =================
-- 
2.28.0



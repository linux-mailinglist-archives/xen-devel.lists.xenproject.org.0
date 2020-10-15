Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877F28F271
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 14:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7295.19048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT2WT-0000ah-RC; Thu, 15 Oct 2020 12:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7295.19048; Thu, 15 Oct 2020 12:38:21 +0000
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
	id 1kT2WT-0000aA-Lz; Thu, 15 Oct 2020 12:38:21 +0000
Received: by outflank-mailman (input) for mailman id 7295;
 Thu, 15 Oct 2020 12:38:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CmRu=DW=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kT2WR-0000WT-VX
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:38:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 424df50f-8960-4cde-b5ba-509bb32a06fe;
 Thu, 15 Oct 2020 12:38:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB403B195;
 Thu, 15 Oct 2020 12:38:12 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CmRu=DW=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kT2WR-0000WT-VX
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:38:20 +0000
X-Inumbo-ID: 424df50f-8960-4cde-b5ba-509bb32a06fe
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 424df50f-8960-4cde-b5ba-509bb32a06fe;
	Thu, 15 Oct 2020 12:38:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AB403B195;
	Thu, 15 Oct 2020 12:38:12 +0000 (UTC)
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
Subject: [PATCH v4 00/10] Support GEM object mappings from I/O memory
Date: Thu, 15 Oct 2020 14:37:56 +0200
Message-Id: <20201015123806.32416-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DRM's fbdev console uses regular load and store operations to update
framebuffer memory. The bochs driver on sparc64 requires the use of
I/O-specific load and store operations. We have a workaround, but need
a long-term solution to the problem.

This patchset changes GEM's vmap/vunmap interfaces to forward pointers
of type struct dma_buf_map and updates the generic fbdev emulation to
use them correctly. This enables I/O-memory operations on all framebuffers
that require and support them.

Patches #1 to #4 prepare VRAM helpers and drivers.

Next is the update of the GEM vmap functions. Patch #5 adds vmap and vunmap
that is usable with TTM-based GEM drivers, and patch #6 updates GEM's
vmap/vunmap callback to forward instances of type struct dma_buf_map. While
the patch touches many files throughout the DRM modules, the applied changes
are mostly trivial interface fixes. Several TTM-based GEM drivers now use
the new vmap code. Patch #7 updates GEM's internal vmap/vunmap functions to
forward struct dma_buf_map.

With struct dma_buf_map propagated through the layers, patches #9 and #10
convert DRM clients and generic fbdev emulation to use it. Updating the
fbdev framebuffer will select the correct functions, either for system or
I/O memory.

v4:
	* provide TTM vmap/vunmap plus GEM helpers and convert drivers
	  over (Christian, Daniel)
	* remove several empty functions
	* more TODOs and documentation (Daniel)

v3:
	* recreate the whole patchset on top of struct dma_buf_map

v2:
	* RFC patchset

Thomas Zimmermann (10):
  drm/vram-helper: Remove invariant parameters from internal kmap
    function
  drm/cma-helper: Remove empty drm_gem_cma_prime_vunmap()
  drm/etnaviv: Remove empty etnaviv_gem_prime_vunmap()
  drm/exynos: Remove empty exynos_drm_gem_prime_{vmap,vunmap}()
  drm/ttm: Add vmap/vunmap to TTM and TTM GEM helpers
  drm/gem: Use struct dma_buf_map in GEM vmap ops and convert GEM
    backends
  drm/gem: Update internal GEM vmap/vunmap interfaces to use struct
    dma_buf_map
  drm/gem: Store client buffer mappings as struct dma_buf_map
  dma-buf-map: Add memcpy and pointer-increment interfaces
  drm/fb_helper: Support framebuffers in I/O memory

 Documentation/gpu/todo.rst                  |  37 ++-
 drivers/gpu/drm/Kconfig                     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  36 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |   1 -
 drivers/gpu/drm/ast/ast_cursor.c            |  27 ++-
 drivers/gpu/drm/ast/ast_drv.h               |   7 +-
 drivers/gpu/drm/bochs/bochs_kms.c           |   1 -
 drivers/gpu/drm/drm_client.c                |  38 ++--
 drivers/gpu/drm/drm_fb_helper.c             | 238 ++++++++++++++++++--
 drivers/gpu/drm/drm_gem.c                   |  29 ++-
 drivers/gpu/drm/drm_gem_cma_helper.c        |  27 +--
 drivers/gpu/drm/drm_gem_shmem_helper.c      |  48 ++--
 drivers/gpu/drm/drm_gem_ttm_helper.c        |  38 ++++
 drivers/gpu/drm/drm_gem_vram_helper.c       | 117 +++++-----
 drivers/gpu/drm/drm_internal.h              |   5 +-
 drivers/gpu/drm/drm_prime.c                 |  14 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |   1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  12 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c     |  12 -
 drivers/gpu/drm/exynos/exynos_drm_gem.h     |   2 -
 drivers/gpu/drm/lima/lima_gem.c             |   6 +-
 drivers/gpu/drm/lima/lima_sched.c           |  11 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c      |  10 +-
 drivers/gpu/drm/nouveau/Kconfig             |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.h        |   2 -
 drivers/gpu/drm/nouveau/nouveau_gem.c       |   6 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h       |   2 -
 drivers/gpu/drm/nouveau/nouveau_prime.c     |  20 --
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  14 +-
 drivers/gpu/drm/qxl/qxl_display.c           |  11 +-
 drivers/gpu/drm/qxl/qxl_draw.c              |  14 +-
 drivers/gpu/drm/qxl/qxl_drv.h               |  11 +-
 drivers/gpu/drm/qxl/qxl_object.c            |  31 ++-
 drivers/gpu/drm/qxl/qxl_object.h            |   2 +-
 drivers/gpu/drm/qxl/qxl_prime.c             |  12 +-
 drivers/gpu/drm/radeon/radeon.h             |   1 -
 drivers/gpu/drm/radeon/radeon_gem.c         |   7 +-
 drivers/gpu/drm/radeon/radeon_prime.c       |  20 --
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  22 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h |   4 +-
 drivers/gpu/drm/tiny/cirrus.c               |  10 +-
 drivers/gpu/drm/tiny/gm12u320.c             |  10 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c           |  72 ++++++
 drivers/gpu/drm/udl/udl_modeset.c           |   8 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c       |  11 +-
 drivers/gpu/drm/vc4/vc4_bo.c                |   7 +-
 drivers/gpu/drm/vc4/vc4_drv.h               |   2 +-
 drivers/gpu/drm/vgem/vgem_drv.c             |  16 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |  18 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.h     |   6 +-
 include/drm/drm_client.h                    |   7 +-
 include/drm/drm_gem.h                       |   5 +-
 include/drm/drm_gem_cma_helper.h            |   3 +-
 include/drm/drm_gem_shmem_helper.h          |   4 +-
 include/drm/drm_gem_ttm_helper.h            |   6 +
 include/drm/drm_gem_vram_helper.h           |  14 +-
 include/drm/drm_mode_config.h               |  12 -
 include/drm/ttm/ttm_bo_api.h                |  28 +++
 include/linux/dma-buf-map.h                 |  92 +++++++-
 62 files changed, 817 insertions(+), 423 deletions(-)

-- 
2.28.0



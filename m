Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32127D25E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.249.581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHL5-0006rC-3A; Tue, 29 Sep 2020 15:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249.581; Tue, 29 Sep 2020 15:14:47 +0000
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
	id 1kNHL4-0006qn-VT; Tue, 29 Sep 2020 15:14:46 +0000
Received: by outflank-mailman (input) for mailman id 249;
 Tue, 29 Sep 2020 15:14:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kNHL4-0006qd-1K
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae94a130-7abd-430e-bc9f-34a4c869012a;
 Tue, 29 Sep 2020 15:14:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C5B0B053;
 Tue, 29 Sep 2020 15:14:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5GuN=DG=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kNHL4-0006qd-1K
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:14:46 +0000
X-Inumbo-ID: ae94a130-7abd-430e-bc9f-34a4c869012a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ae94a130-7abd-430e-bc9f-34a4c869012a;
	Tue, 29 Sep 2020 15:14:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9C5B0B053;
	Tue, 29 Sep 2020 15:14:43 +0000 (UTC)
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
Subject: [PATCH v3 0/7] Support GEM object mappings from I/O memory
Date: Tue, 29 Sep 2020 17:14:30 +0200
Message-Id: <20200929151437.19717-1-tzimmermann@suse.de>
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

Patches #1 and #2 prepare VRAM helpers and TTM for the changes in patch
#3. Patch #3 updates GEM's vmap/vunmap callback to forward instances of
type struct dma_buf_map. While the patch touches many files throughout the
DRM modules, the applied changes are mostly trivial interface fixes.

Patch #4 updates GEM's internal vmap/vunmap functions to forward struct
dma_buf_map.

Patches #5 and #6 convert DRM clients and generic fbdev emulation to use
struct dma_buf_map. Updating the fbdev framebuffer will select the correct
functions, either for system or I/O memory.

The patch set is just enough to fix the bochs issue on sparc64 and a
correct way. Patch #7 updates the TODO list with ideas for further
improvements

v3:
	* recreate the whole patchset on top of struct dma_buf_map

v2:
	* RFC patchset

Thomas Zimmermann (7):
  drm/vram-helper: Remove invariant parameters from internal kmap
    function
  drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for type conversion
  drm/gem: Use struct dma_buf_map in GEM vmap ops and convert GEM
    backends
  drm/gem: Update internal GEM vmap/vunmap interfaces to use struct
    dma_buf_map
  drm/gem: Store client buffer mappings as struct dma_buf_map
  drm/fb_helper: Support framebuffers in I/O memory
  drm/todo: Update entries around struct dma_buf_map

 Documentation/gpu/todo.rst                  |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |   4 +-
 drivers/gpu/drm/ast/ast_cursor.c            |  29 ++-
 drivers/gpu/drm/ast/ast_drv.h               |   7 +-
 drivers/gpu/drm/bochs/bochs_kms.c           |   1 -
 drivers/gpu/drm/drm_client.c                |  38 ++--
 drivers/gpu/drm/drm_fb_helper.c             | 238 ++++++++++++++++++--
 drivers/gpu/drm/drm_gem.c                   |  28 ++-
 drivers/gpu/drm/drm_gem_cma_helper.c        |  14 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c      |  48 ++--
 drivers/gpu/drm/drm_gem_vram_helper.c       |  93 ++++----
 drivers/gpu/drm/drm_internal.h              |   5 +-
 drivers/gpu/drm/drm_prime.c                 |  14 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  11 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c     |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.h     |   4 +-
 drivers/gpu/drm/lima/lima_gem.c             |   6 +-
 drivers/gpu/drm/lima/lima_sched.c           |  11 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c      |  12 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c     |   9 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  14 +-
 drivers/gpu/drm/qxl/qxl_display.c           |  13 +-
 drivers/gpu/drm/qxl/qxl_draw.c              |  16 +-
 drivers/gpu/drm/qxl/qxl_drv.h               |   8 +-
 drivers/gpu/drm/qxl/qxl_object.c            |  23 +-
 drivers/gpu/drm/qxl/qxl_object.h            |   2 +-
 drivers/gpu/drm/qxl/qxl_prime.c             |  12 +-
 drivers/gpu/drm/radeon/radeon_gem.c         |   4 +-
 drivers/gpu/drm/radeon/radeon_prime.c       |   9 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  22 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h |   4 +-
 drivers/gpu/drm/tiny/cirrus.c               |  10 +-
 drivers/gpu/drm/tiny/gm12u320.c             |  10 +-
 drivers/gpu/drm/udl/udl_modeset.c           |   8 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c       |  11 +-
 drivers/gpu/drm/vc4/vc4_bo.c                |   6 +-
 drivers/gpu/drm/vc4/vc4_drv.h               |   2 +-
 drivers/gpu/drm/vgem/vgem_drv.c             |  16 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |  18 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.h     |   6 +-
 include/drm/drm_client.h                    |   7 +-
 include/drm/drm_gem.h                       |   5 +-
 include/drm/drm_gem_cma_helper.h            |   4 +-
 include/drm/drm_gem_shmem_helper.h          |   4 +-
 include/drm/drm_gem_vram_helper.h           |   4 +-
 include/drm/drm_mode_config.h               |  12 -
 include/drm/ttm/ttm_bo_api.h                |  24 ++
 include/linux/dma-buf-map.h                 |  92 +++++++-
 51 files changed, 685 insertions(+), 305 deletions(-)

--
2.28.0



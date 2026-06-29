Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6VsQJqzIQmrpBwoAu9opvQ:T2
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 21:34:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0E6DE72D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 21:34:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=INJnmFsC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1348106.1605993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjf-0003wB-NW; Mon, 29 Jun 2026 19:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348106.1605993; Mon, 29 Jun 2026 19:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjf-0003oS-CQ; Mon, 29 Jun 2026 19:33:39 +0000
Received: by outflank-mailman (input) for mailman id 1348106;
 Mon, 29 Jun 2026 19:26:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1weHcc-0001VW-2d
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:26:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHcb-0035uk-DB
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 21:26:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6cf-bab6-0a2a0a5309dd-0a2a4504b24a-22
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:26:21 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6db-a01d-0a2a45040019-aceafc1f922c-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:26:21 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 80CF141872;
 Mon, 29 Jun 2026 19:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946CA1F000E9;
 Mon, 29 Jun 2026 19:26:18 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782761179;
	bh=3/FJFvBs5xYxV+OsC+b/AJP15U4xxvb0yHAIYzsVez4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=INJnmFsCeswPGd5Z3fFBG/WeaWLYUvMWgDRZZYe3irP6gSJ+6DHTAAXCt90m5glr6
	 EXegO2ROZ9BTm2d45RB2EkzkZFFJEBrfNwdsMfp1JOAo97PMbWnV6dMcr0kQEfwGvv
	 83bR89Sldh+7DKS35Ifvq+o187a+RmRyfMm1EQNaD97jAXQRDEr+mYzHfKiC9z6aij
	 ZkYd2vUewlU1eH0y0TxPpLMcEYwODh29MVEhZMnzVdUECT8YCRP37fJR2EqGl8HQn6
	 UykD6xCAzPDLDBYA0IiYoqMEetsHjygPxIu92+DBLfJFYVy5+U7OoifoY+4OlKhxmZ
	 BJ288/bOIlhQQ==
From: Lorenzo Stoakes <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Helge Deller <deller@gmx.de>,
	Benjamin LaHaise <bcrl@kvack.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Kees Cook <kees@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	etnaviv@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	linux-fbdev@vger.kernel.org,
	linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 08/13] mm: introduce vma_get_page_prot() and use it
Date: Mon, 29 Jun 2026 20:25:31 +0100
Message-ID: <3bb8bdc4788230c33102166d56cbc5abfad9d4cb.1782760670.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782760670.git.ljs@kernel.org>
References: <cover.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782761181-2D3AC1CC-9409598F/0/0
X-purgate-type: clean
X-purgate-size: 17658
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:bra
 uner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.o
 rg,m:linux-aio@kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ljs@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16C0E6DE72D

There's a large number of vm_get_page_prot(vma->vm_flags) invocations. Make
life easier by introducing vma_get_page_prot() parameterised by the VMA.

This also makes converting vm_get_page_prot() to vma_flags_t easier.

Also update the userland VMA tests to reflect the change.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 drivers/gpu/drm/drm_gem.c                   |  2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c        |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c      |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c     |  6 +++---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c    | 12 ++++++------
 drivers/gpu/drm/msm/msm_gem.c               |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c        |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c          |  6 +++---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  2 +-
 drivers/gpu/drm/tegra/gem.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c  |  2 +-
 drivers/gpu/drm/xe/xe_device.c              |  2 +-
 drivers/gpu/drm/xe/xe_mmio_gem.c            |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |  2 +-
 drivers/video/fbdev/core/fb_io_fops.c       |  2 +-
 include/linux/mm.h                          | 10 +++++++++-
 mm/vma.c                                    |  2 +-
 mm/vma_exec.c                               |  2 +-
 sound/core/memalloc.c                       |  2 +-
 tools/testing/vma/include/dup.h             |  4 ++++
 23 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index e3ed684ddcf2..32a05d889b9a 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1252,7 +1252,7 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 		}
 
 		vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
-		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+		vma->vm_page_prot = pgprot_writecombine(vma_get_page_prot(vma));
 		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 1c00a71ab3c9..7d9612075d31 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -540,7 +540,7 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 	vm_flags_mod(vma, VM_DONTDUMP | VM_DONTEXPAND, VM_PFNMAP);
 
 	if (dma_obj->map_noncoherent) {
-		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+		vma->vm_page_prot = vma_get_page_prot(vma);
 
 		ret = dma_mmap_pages(drm_dev_dma_dev(dma_obj->base.dev),
 				     vma, vma->vm_end - vma->vm_start,
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index c989459eb215..06d019d51d3e 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -764,7 +764,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 		return ret;
 
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = vma_get_page_prot(vma);
 	if (shmem->map_wc)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 2e4d6d117ee2..f9c8b7b2bfc7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -133,7 +133,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 
-	vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vm_page_prot = vma_get_page_prot(vma);
 
 	if (etnaviv_obj->flags & ETNA_BO_WC) {
 		vma->vm_page_prot = pgprot_writecombine(vm_page_prot);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 9a6270f3dca6..0208c9259572 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -377,13 +377,13 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 	/* non-cachable as default. */
 	if (exynos_gem->flags & EXYNOS_BO_CACHABLE)
-		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+		vma->vm_page_prot = vma_get_page_prot(vma);
 	else if (exynos_gem->flags & EXYNOS_BO_WC)
 		vma->vm_page_prot =
-			pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+			pgprot_writecombine(vma_get_page_prot(vma));
 	else
 		vma->vm_page_prot =
-			pgprot_noncached(vm_get_page_prot(vma->vm_flags));
+			pgprot_noncached(vma_get_page_prot(vma));
 
 	ret = exynos_drm_gem_mmap_buffer(exynos_gem, vma);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 0644f85c6c8e..9ca90c1bb5b4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -112,7 +112,7 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
 		vma = find_vma(mm, addr);
 		if (vma && __vma_matches(vma, obj->base.filp, addr, args->size))
 			vma->vm_page_prot =
-				pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+				pgprot_writecombine(vma_get_page_prot(vma));
 		else
 			addr = -ENOMEM;
 		mmap_write_unlock(mm);
@@ -1024,7 +1024,7 @@ i915_gem_object_mmap(struct drm_i915_gem_object *obj,
 	fput(anon);
 
 	if (obj->ops->mmap_ops) {
-		vma->vm_page_prot = pgprot_decrypted(vm_get_page_prot(vma->vm_flags));
+		vma->vm_page_prot = pgprot_decrypted(vma_get_page_prot(vma));
 		vma->vm_ops = obj->ops->mmap_ops;
 		vma->vm_private_data = obj->base.vma_node.driver_private;
 		return 0;
@@ -1035,7 +1035,7 @@ i915_gem_object_mmap(struct drm_i915_gem_object *obj,
 	switch (mmo->mmap_type) {
 	case I915_MMAP_TYPE_WC:
 		vma->vm_page_prot =
-			pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+			pgprot_writecombine(vma_get_page_prot(vma));
 		vma->vm_ops = &vm_ops_cpu;
 		break;
 
@@ -1043,19 +1043,19 @@ i915_gem_object_mmap(struct drm_i915_gem_object *obj,
 		GEM_WARN_ON(1);
 		fallthrough;
 	case I915_MMAP_TYPE_WB:
-		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+		vma->vm_page_prot = vma_get_page_prot(vma);
 		vma->vm_ops = &vm_ops_cpu;
 		break;
 
 	case I915_MMAP_TYPE_UC:
 		vma->vm_page_prot =
-			pgprot_noncached(vm_get_page_prot(vma->vm_flags));
+			pgprot_noncached(vma_get_page_prot(vma));
 		vma->vm_ops = &vm_ops_cpu;
 		break;
 
 	case I915_MMAP_TYPE_GTT:
 		vma->vm_page_prot =
-			pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+			pgprot_writecombine(vma_get_page_prot(vma));
 		vma->vm_ops = &vm_ops_gtt;
 		break;
 	}
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index cbf723a5d86f..6a78e242de7c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1125,7 +1125,7 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
-	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
+	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vma_get_page_prot(vma));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 20dba02d6175..9a6ee2e880c0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -55,7 +55,7 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
 		goto error_unlock;
 
 	nouveau_bo_del_io_reserve_lru(bo);
-	prot = vm_get_page_prot(vma->vm_flags);
+	prot = vma_get_page_prot(vma);
 	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
 	nouveau_bo_add_io_reserve_lru(bo);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index ca3fb186bf19..4881777642d2 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -84,7 +84,7 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var, struct fb_info
 
 static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
-	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+	vma->vm_page_prot = pgprot_writecombine(vma_get_page_prot(vma));
 
 	return fb_deferred_io_mmap(info, vma);
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 00404fb6c29a..fb0e6f556b31 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -538,9 +538,9 @@ static int omap_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP | VM_IO | VM_MIXEDMAP);
 
 	if (omap_obj->flags & OMAP_BO_WC) {
-		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+		vma->vm_page_prot = pgprot_writecombine(vma_get_page_prot(vma));
 	} else if (omap_obj->flags & OMAP_BO_UNCACHED) {
-		vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
+		vma->vm_page_prot = pgprot_noncached(vma_get_page_prot(vma));
 	} else {
 		/*
 		 * We do have some private objects, at least for scanout buffers
@@ -558,7 +558,7 @@ static int omap_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 		vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
 		vma_set_file(vma, obj->filp);
 
-		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+		vma->vm_page_prot = vma_get_page_prot(vma);
 	}
 
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index b188539dca0b..9a1dc9f12072 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -255,7 +255,7 @@ static int rockchip_drm_gem_object_mmap(struct drm_gem_object *obj,
 	 */
 	vm_flags_mod(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
 
-	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+	vma->vm_page_prot = pgprot_writecombine(vma_get_page_prot(vma));
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
 	if (rk_obj->pages)
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 1d8d27a5ea89..f76af733ea79 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -602,7 +602,7 @@ int __tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma)
 
 		vma->vm_pgoff = vm_pgoff;
 	} else {
-		pgprot_t prot = vm_get_page_prot(vma->vm_flags);
+		pgprot_t prot = vma_get_page_prot(vma);
 
 		vm_flags_mod(vma, VM_MIXEDMAP, VM_PFNMAP);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 4ae3cbc35dd3..544a6abddbc8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -55,7 +55,7 @@ static int virtio_gpu_vram_mmap(struct drm_gem_object *obj,
 
 	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
 	vm_flags_set(vma, VM_MIXEDMAP | VM_DONTEXPAND);
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = vma_get_page_prot(vma);
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	vma->vm_ops = &virtio_gpu_vram_vm_ops;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index 45561bc1c9ef..a9fd4015a0ca 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -481,7 +481,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 	if (vbo->dirty && vbo->dirty->method == VMW_BO_DIRTY_MKWRITE)
 		prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
 	else
-		prot = vm_get_page_prot(vma->vm_flags);
+		prot = vma_get_page_prot(vma);
 
 	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d224861b6f6f..758acaae85d3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -281,7 +281,7 @@ static vm_fault_t barrier_fault(struct vm_fault *vmf)
 	pgprot_t prot;
 	int idx;
 
-	prot = vm_get_page_prot(vma->vm_flags);
+	prot = vma_get_page_prot(vma);
 
 	if (drm_dev_enter(dev, &idx)) {
 		unsigned long pfn;
diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
index 8c803ef233cc..3741ae60f532 100644
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -149,7 +149,7 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
 
 	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
 	vma->vm_pgoff = 0;
-	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
+	vma->vm_page_prot = pgprot_noncached(vma_get_page_prot(vma));
 	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
 		     VM_DONTCOPY | VM_NORESERVE);
 
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index eec4c1da3f9e..dd158443f55f 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -80,7 +80,7 @@ static int xen_drm_front_gem_object_mmap(struct drm_gem_object *gem_obj,
 	 * which is mapped as Normal Inner Write-Back Outer Write-Back
 	 * Inner-Shareable.
 	 */
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = vma_get_page_prot(vma);
 
 	/*
 	 * vm_operations_struct.fault handler will be called if CPU access
diff --git a/drivers/video/fbdev/core/fb_io_fops.c b/drivers/video/fbdev/core/fb_io_fops.c
index 6ab60fcd0050..6d0a8c8e141a 100644
--- a/drivers/video/fbdev/core/fb_io_fops.c
+++ b/drivers/video/fbdev/core/fb_io_fops.c
@@ -161,7 +161,7 @@ int fb_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 		len = info->fix.mmio_len;
 	}
 
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = vma_get_page_prot(vma);
 	vma->vm_page_prot = pgprot_framebuffer(vma->vm_page_prot, vma->vm_start,
 					       vma->vm_end, start);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c8336f68d7bb..b55790c75038 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4575,6 +4575,10 @@ static inline pgprot_t vma_flags_to_page_prot(vma_flags_t vma_flags)
 	return vm_get_page_prot(vm_flags);
 }
 
+static inline pgprot_t vma_get_page_prot(const struct vm_area_struct *vma)
+{
+	return vma_flags_to_page_prot(vma->flags);
+}
 void vma_set_page_prot(struct vm_area_struct *vma);
 #else
 static inline pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
@@ -4585,9 +4589,13 @@ static inline pgprot_t vma_flags_to_page_prot(vma_flags_t vma_flags)
 {
 	return __pgprot(0);
 }
+static inline pgprot_t vma_get_page_prot(const struct vm_area_struct *vma)
+{
+	return __pgprot(0);
+}
 static inline void vma_set_page_prot(struct vm_area_struct *vma)
 {
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = vma_get_page_prot(vma);
 }
 #endif
 
diff --git a/mm/vma.c b/mm/vma.c
index fcdd2ac3ac68..b81c05e67a61 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -3429,7 +3429,7 @@ struct vm_area_struct *__install_special_mapping(
 	if (pgtable_supports_soft_dirty())
 		vm_flags |= VM_SOFTDIRTY;
 	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = vma_get_page_prot(vma);
 
 	vma->vm_ops = ops;
 	vma->vm_private_data = priv;
diff --git a/mm/vma_exec.c b/mm/vma_exec.c
index c0f7ba2cfb27..b01c4964f2c9 100644
--- a/mm/vma_exec.c
+++ b/mm/vma_exec.c
@@ -146,7 +146,7 @@ int create_init_stack_vma(struct mm_struct *mm, struct vm_area_struct **vmap,
 	if (pgtable_supports_soft_dirty())
 		flags |= VM_SOFTDIRTY;
 	vm_flags_init(vma, flags);
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = vma_get_page_prot(vma);
 
 	err = insert_vm_struct(mm, vma);
 	if (err)
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 9320671dfcc8..5bc7e586b430 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -851,7 +851,7 @@ static void snd_dma_noncoherent_free(struct snd_dma_buffer *dmab)
 static int snd_dma_noncoherent_mmap(struct snd_dma_buffer *dmab,
 				    struct vm_area_struct *area)
 {
-	area->vm_page_prot = vm_get_page_prot(area->vm_flags);
+	area->vm_page_prot = vma_get_page_prot(area);
 	return dma_mmap_pages(dmab->dev.dev, area,
 			      area->vm_end - area->vm_start,
 			      virt_to_page(dmab->area));
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 1ffac38a5377..d86bef8cb37f 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1577,3 +1577,7 @@ static inline pgoff_t linear_page_index(const struct vm_area_struct *vma,
 	pgoff += vma_start_pgoff(vma);
 	return pgoff;
 }
+static inline pgprot_t vma_get_page_prot(const struct vm_area_struct *vma)
+{
+	return vma_flags_to_page_prot(vma->flags);
+}
-- 
2.54.0



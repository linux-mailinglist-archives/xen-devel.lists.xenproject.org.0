Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6VsQJqzIQmrpBwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 21:34:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F66DE726
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 21:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WOjc9JyG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1348090.1605940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjd-0002zy-3X; Mon, 29 Jun 2026 19:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348090.1605940; Mon, 29 Jun 2026 19:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjc-0002xv-TY; Mon, 29 Jun 2026 19:33:36 +0000
Received: by outflank-mailman (input) for mailman id 1348090;
 Mon, 29 Jun 2026 19:25:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1weHcF-0001RT-Bu
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:25:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHcE-00FK17-LH
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 21:25:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6a9-5cb7-0a2a0a5109dd-0a2a4504a5ee-30
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:25:58 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6c5-a01d-0a2a45040019-ac6904fee83c-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:25:58 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 723DC60008;
 Mon, 29 Jun 2026 19:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F6D1F000E9;
 Mon, 29 Jun 2026 19:25:55 +0000 (UTC)
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
	s=k20260515; t=1782761156;
	bh=uYIw6aQ9I+77XwEcGZ5sLAkEEwuPzF6gubx9MILGtr0=;
	h=From:To:Cc:Subject:Date;
	b=WOjc9JyG02UBcXhhgV9ic0phr0uZCFD5k0ILdv6ONhCv8Z1XYDxBYiwvpukl7K1Fg
	 a8aIrsAXippHTg2Wibb6tHWkzlE4E0fWXgBDrHzByOJL4F8jISF06sHckyYY+PF7tK
	 OiAiSmS9jz9wRn1oMBm18e5Uavo00IhgOxFuVQdHvJLDYYtq4uXlvS/eQXpk6KaIDD
	 GN3rVLuuxb69YleGJzixCH/hWeHWpFDPzoCr2KQROO1CK5H8VnjBM1FKT5hXUj42/o
	 WOenPbgoWzQyVU21Y69V/YrWJ0M+K8b+G7Zlo5u3zMESofU5MsPpKfLAYEn9kt+uGS
	 wlAF5pba2Dehg==
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
Subject: [PATCH 00/13] convert more vm_flags_t users to vma_flags_t
Date: Mon, 29 Jun 2026 20:25:23 +0100
Message-ID: <cover.1782760670.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782761158-2F15F1CC-38506203/0/0
X-purgate-type: clean
X-purgate-size: 3713
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
X-Rspamd-Queue-Id: 832F66DE726

This series makes further progress in converting usage of the deprecated
vm_flags_t type to its replacement, vma_flags_t.

It focuses on mm, though updates some users of mm APIs also.

It updates:

* The core do_mmap() code path for VMA mapping.
* Unmapped area logic.
* The usage of mm->def_vma_flags.
* VMA page protection bit logic.
* General usage of VMA flags in core mm code, mlock, mprotect, mremap.


REVIEWER/MERGER NOTE: This is dependent on [0], which must be merged before
this.

[0]:https://lore.kernel.org/linux-mm/cover.1782735110.git.ljs@kernel.org/

Lorenzo Stoakes (13):
  mm: introduce vma_flags_can_grow() and vma_can_grow()
  mm/vma: update do_mmap() to use vma_flags_t
  mm: convert __get_unmapped_area() to use vma_flags_t
  mm: update generic_get_unmapped_area[_topdown]() to use vma_flags_t
  mm: prefer mm->def_vma_flags in mm logic
  mm/vma: convert vm_pgprot_modify() to use vma_flags_t and rename
  mm/vma: rename vma_get_page_prot to vma_flags_to_page_prot
  mm: introduce vma_get_page_prot() and use it
  mm/vma: update create_init_stack_vma() to use vma_flags_t
  mm/vma: convert miscellaneous uses of VMA flags in core mm
  mm/mlock: convert mlock code to use vma_flags_t
  mm/mprotect: convert mprotect code to use vma_flags_t
  mm/mremap: convert mremap code to use vma_flags_t

 arch/mips/kernel/vdso.c                     |   4 +-
 arch/powerpc/mm/book3s64/slice.c            |   6 +-
 drivers/gpu/drm/drm_gem.c                   |   2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c        |   2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c      |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c     |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c    |  12 +-
 drivers/gpu/drm/msm/msm_gem.c               |   2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       |   2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c        |   2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c          |   6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |   2 +-
 drivers/gpu/drm/tegra/gem.c                 |   2 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c  |   2 +-
 drivers/gpu/drm/xe/xe_device.c              |   2 +-
 drivers/gpu/drm/xe/xe_mmio_gem.c            |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |   2 +-
 drivers/video/fbdev/core/fb_io_fops.c       |   2 +-
 fs/aio.c                                    |   2 +-
 fs/hugetlbfs/inode.c                        |   3 +-
 include/linux/huge_mm.h                     |  10 +-
 include/linux/memfd.h                       |   6 +-
 include/linux/mm.h                          |  51 ++++--
 include/linux/sched/mm.h                    |  16 +-
 ipc/shm.c                                   |   3 +-
 mm/debug.c                                  |   2 +-
 mm/huge_memory.c                            |  21 +--
 mm/memfd.c                                  |  15 +-
 mm/mlock.c                                  |  97 ++++++------
 mm/mmap.c                                   | 164 +++++++++++---------
 mm/mprotect.c                               |  16 +-
 mm/mremap.c                                 |  38 ++---
 mm/nommu.c                                  |   3 +-
 mm/util.c                                   |  10 +-
 mm/vma.c                                    |  27 ++--
 mm/vma.h                                    |   8 +-
 mm/vma_exec.c                               |  20 ++-
 sound/core/memalloc.c                       |   2 +-
 tools/testing/vma/include/dup.h             |  22 ++-
 41 files changed, 339 insertions(+), 261 deletions(-)

--
2.54.0


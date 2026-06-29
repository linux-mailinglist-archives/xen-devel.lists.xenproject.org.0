Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rRI0KKzIQmruBwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 21:34:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FF6DE729
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 21:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mh42CEnV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1348096.1605955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjd-0003JK-Pj; Mon, 29 Jun 2026 19:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348096.1605955; Mon, 29 Jun 2026 19:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjd-000399-LV; Mon, 29 Jun 2026 19:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1348096;
 Mon, 29 Jun 2026 19:26:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1weHcO-0001Sk-Jz
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:26:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHcN-0035uk-Cd
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 21:26:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6cf-bab6-0a2a0a5309dd-0a2a4504b24a-0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:26:07 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6ce-a01d-0a2a45040019-ac6904fe84a4-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:26:07 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 77E68601C0;
 Mon, 29 Jun 2026 19:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB941F00A3A;
 Mon, 29 Jun 2026 19:26:04 +0000 (UTC)
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
	s=k20260515; t=1782761165;
	bh=MaO3ayQRsy4eLXJAr5Gtftk/d6G7w4vRnYQhd7ERP88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mh42CEnVAN4v5nNg2E2/FA5haGMowMalAtIhiu+jbLMz622FqQ/mkU+OD8A8R+yDp
	 aKYJaUUgJ3tLX8cfrvsmlfZK49qR6WEvGGkeQVA64WyFjSC1BsdkpQ0ktF0R74pkvC
	 mSSIA94MxJ06qZ+pMsoJll3Jsje3muSqIB9/In1/WqYQgCP0+YuPVyG8eVcQbvvNkT
	 XJrCQmi5s5QyHIrhwBlICQZohXF426NyGqUWSgXGrkaMRD9dbErFFKyaoBkMJ1D/QV
	 VeE4pk4MUcm2iFemV68BZLTTbFYfaHPCaDovkn6E5AV34oefv6H0Y/5nizqKm8EYK/
	 k5bPckliCXy3Q==
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
Subject: [PATCH 03/13] mm: convert __get_unmapped_area() to use vma_flags_t
Date: Mon, 29 Jun 2026 20:25:26 +0100
Message-ID: <b1ad7c4443f5cba622e4c48c5a9ef15427001a93.1782760670.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782760670.git.ljs@kernel.org>
References: <cover.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782761167-2E95B1CC-F7111EDB/0/0
X-purgate-type: clean
X-purgate-size: 9377
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
X-Rspamd-Queue-Id: E67FF6DE729

Update __get_unmapped_area() to be parameterised by vma_flags_t rather than
vm_flags_t as part of the effort to move VMA flags from a system word to a
bitmap.

We cascade the changes up to arch_get_unmapped_area_topdown() and
arch_get_unmapped_area(), where, for now, we use vma_flags_to_legacy() in
order to propagate the VMA flags.

No functional change intended.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 fs/hugetlbfs/inode.c     |  3 ++-
 include/linux/huge_mm.h  | 10 +++++-----
 include/linux/mm.h       |  6 ++++--
 include/linux/sched/mm.h | 12 ++++++------
 mm/huge_memory.c         | 21 ++++++++++++---------
 mm/mmap.c                | 27 ++++++++++++++-------------
 6 files changed, 43 insertions(+), 36 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 894d02e73302..fe7d5a5d60bd 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -184,7 +184,8 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 	if (addr)
 		addr0 = ALIGN(addr, huge_page_size(h));
 
-	return mm_get_unmapped_area_vmflags(file, addr0, len, pgoff, flags, 0);
+	return mm_get_unmapped_area_vmaflags(file, addr0, len, pgoff, flags,
+					     EMPTY_VMA_FLAGS);
 }
 
 /*
diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 653b81d08fe7..ae84a714907f 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -391,9 +391,9 @@ static inline bool thp_disabled_by_hw(void)
 
 unsigned long thp_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags);
-unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
+unsigned long thp_get_unmapped_area_vmaflags(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags,
-		vm_flags_t vm_flags);
+		vma_flags_t vma_flags);
 
 enum split_type {
 	SPLIT_TYPE_UNIFORM,
@@ -615,9 +615,9 @@ static inline unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
 #define thp_get_unmapped_area	NULL
 
 static inline unsigned long
-thp_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
-			      unsigned long len, unsigned long pgoff,
-			      unsigned long flags, vm_flags_t vm_flags)
+thp_get_unmapped_area_vmaflags(struct file *filp, unsigned long addr,
+			       unsigned long len, unsigned long pgoff,
+			       unsigned long flags, vma_flags_t vma_flags)
 {
 	return 0;
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cc2a87755adb..474b3698f565 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4160,13 +4160,15 @@ unsigned long randomize_page(unsigned long start, unsigned long range);
 
 unsigned long
 __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
-		    unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags);
+		    unsigned long pgoff, unsigned long flags,
+		    vma_flags_t vma_flags);
 
 static inline unsigned long
 get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 		  unsigned long pgoff, unsigned long flags)
 {
-	return __get_unmapped_area(file, addr, len, pgoff, flags, 0);
+	return __get_unmapped_area(file, addr, len, pgoff, flags,
+				   EMPTY_VMA_FLAGS);
 }
 
 unsigned long do_mmap(struct file *file, unsigned long addr,
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 95d0040df584..b301ec90740a 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -193,12 +193,12 @@ unsigned long mm_get_unmapped_area(struct file *filp, unsigned long addr,
 				   unsigned long len, unsigned long pgoff,
 				   unsigned long flags);
 
-unsigned long mm_get_unmapped_area_vmflags(struct file *filp,
-					   unsigned long addr,
-					   unsigned long len,
-					   unsigned long pgoff,
-					   unsigned long flags,
-					   vm_flags_t vm_flags);
+unsigned long mm_get_unmapped_area_vmaflags(struct file *filp,
+					    unsigned long addr,
+					    unsigned long len,
+					    unsigned long pgoff,
+					    unsigned long flags,
+					    vma_flags_t vma_flags);
 
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e94f56487225..d6c5f51ee399 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1196,7 +1196,7 @@ static inline bool is_transparent_hugepage(const struct folio *folio)
 static unsigned long __thp_get_unmapped_area(struct file *filp,
 		unsigned long addr, unsigned long len,
 		loff_t off, unsigned long flags, unsigned long size,
-		vm_flags_t vm_flags)
+		vma_flags_t vma_flags)
 {
 	loff_t off_end = off + len;
 	loff_t off_align = round_up(off, size);
@@ -1212,8 +1212,9 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	if (len_pad < len || (off + len_pad) < off)
 		return 0;
 
-	ret = mm_get_unmapped_area_vmflags(filp, addr, len_pad,
-					   off >> PAGE_SHIFT, flags, vm_flags);
+	ret = mm_get_unmapped_area_vmaflags(filp, addr, len_pad,
+					    off >> PAGE_SHIFT, flags,
+					    vma_flags);
 
 	/*
 	 * The failure might be due to length padding. The caller will retry
@@ -1238,25 +1239,27 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	return ret;
 }
 
-unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
+unsigned long thp_get_unmapped_area_vmaflags(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags,
-		vm_flags_t vm_flags)
+		vma_flags_t vma_flags)
 {
 	unsigned long ret;
 	loff_t off = (loff_t)pgoff << PAGE_SHIFT;
 
-	ret = __thp_get_unmapped_area(filp, addr, len, off, flags, PMD_SIZE, vm_flags);
+	ret = __thp_get_unmapped_area(filp, addr, len, off, flags, PMD_SIZE,
+				      vma_flags);
 	if (ret)
 		return ret;
 
-	return mm_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags,
-					    vm_flags);
+	return mm_get_unmapped_area_vmaflags(filp, addr, len, pgoff, flags,
+					     vma_flags);
 }
 
 unsigned long thp_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags)
 {
-	return thp_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags, 0);
+	return thp_get_unmapped_area_vmaflags(filp, addr, len, pgoff, flags,
+					      EMPTY_VMA_FLAGS);
 }
 EXPORT_SYMBOL_GPL(thp_get_unmapped_area);
 
diff --git a/mm/mmap.c b/mm/mmap.c
index 547352183214..461ce510e12a 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -411,8 +411,7 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	/* Obtain the address to map to. we verify (or select) it and ensure
 	 * that it represents a valid section of the address space.
 	 */
-	addr = __get_unmapped_area(file, addr, len, pgoff, flags,
-				   vma_flags_to_legacy(vma_flags));
+	addr = __get_unmapped_area(file, addr, len, pgoff, flags, vma_flags);
 	if (IS_ERR_VALUE(addr))
 		return addr;
 
@@ -812,19 +811,20 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 }
 #endif
 
-unsigned long mm_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
-					   unsigned long len, unsigned long pgoff,
-					   unsigned long flags, vm_flags_t vm_flags)
+unsigned long mm_get_unmapped_area_vmaflags(struct file *filp, unsigned long addr,
+					    unsigned long len, unsigned long pgoff,
+					    unsigned long flags, vma_flags_t vma_flags)
 {
 	if (mm_flags_test(MMF_TOPDOWN, current->mm))
 		return arch_get_unmapped_area_topdown(filp, addr, len, pgoff,
-						      flags, vm_flags);
-	return arch_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
+				flags, vma_flags_to_legacy(vma_flags));
+	return arch_get_unmapped_area(filp, addr, len, pgoff, flags,
+			vma_flags_to_legacy(vma_flags));
 }
 
 unsigned long
 __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
-		unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+		unsigned long pgoff, unsigned long flags, vma_flags_t vma_flags)
 {
 	unsigned long (*get_area)(struct file *, unsigned long,
 				  unsigned long, unsigned long, unsigned long)
@@ -859,11 +859,11 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 		   && !addr /* no hint */
 		   && IS_ALIGNED(len, PMD_SIZE)) {
 		/* Ensures that larger anonymous mappings are THP aligned. */
-		addr = thp_get_unmapped_area_vmflags(file, addr, len,
-						     pgoff, flags, vm_flags);
+		addr = thp_get_unmapped_area_vmaflags(file, addr, len,
+						      pgoff, flags, vma_flags);
 	} else {
-		addr = mm_get_unmapped_area_vmflags(file, addr, len,
-						    pgoff, flags, vm_flags);
+		addr = mm_get_unmapped_area_vmaflags(file, addr, len,
+						     pgoff, flags, vma_flags);
 	}
 	if (IS_ERR_VALUE(addr))
 		return addr;
@@ -881,7 +881,8 @@ unsigned long
 mm_get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
 		     unsigned long pgoff, unsigned long flags)
 {
-	return mm_get_unmapped_area_vmflags(file, addr, len, pgoff, flags, 0);
+	return mm_get_unmapped_area_vmaflags(file, addr, len, pgoff, flags,
+					     EMPTY_VMA_FLAGS);
 }
 EXPORT_SYMBOL(mm_get_unmapped_area);
 
-- 
2.54.0



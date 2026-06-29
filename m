Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9hvQKqzIQmrqBwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 21:34:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAEE6DE727
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 21:34:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VVxN7eTc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1348110.1606010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjg-0004Mu-Un; Mon, 29 Jun 2026 19:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348110.1606010; Mon, 29 Jun 2026 19:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weHjg-0004Ad-Bq; Mon, 29 Jun 2026 19:33:40 +0000
Received: by outflank-mailman (input) for mailman id 1348110;
 Mon, 29 Jun 2026 19:26:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1weHch-0001WP-FK
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:26:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weHcg-00FK8K-SU
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 21:26:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6cc-2eae-0a2a0a5409dd-0a2a4507d962-26
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:26:26 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6a42c6e1-9c8e-0a2a45070019-ac6904febb04-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 21:26:26 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 619A6601F7;
 Mon, 29 Jun 2026 19:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481981F00A3D;
 Mon, 29 Jun 2026 19:26:24 +0000 (UTC)
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
	s=k20260515; t=1782761185;
	bh=+hx6YQln3kmnIYttbugYmffLNSWoV++2751PXUv+A2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VVxN7eTcPtYg/oOvvhetcNu5z5GDnbGBvlUDJjnkVPWbhn4Y+GS1HukaVG0587SeF
	 W2qCaAjwvGomyD6AiM8c4q0Fd+EhRCjnMSIyaEAf+cCF6xsiJ7Xp3RCIKqvSAj1sE4
	 XhY4s2csFyWBBqxTBqAcY2cpJi2KjGLb6KUOQQ4R/UUE1l20BXEHJm3T4FJCanAHVN
	 HfQTrKDFcjlb8QS3+ToQPXfDmtOH0k4zshLqyu5BZu3VWeh11M/0QfE0pgU6uSdTor
	 JbSQjrdBVjOhQbdZYDNvwLhifN7Dn/ym5jAGy5VZka+d7RhxYT5aDQ4KmOqXtdqtHl
	 oq/VyUIl/b1VQ==
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
Subject: [PATCH 10/13] mm/vma: convert miscellaneous uses of VMA flags in core mm
Date: Mon, 29 Jun 2026 20:25:33 +0100
Message-ID: <1e7d834c887b6a65627d730addcff13d458c6268.1782760670.git.ljs@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782760670.git.ljs@kernel.org>
References: <cover.1782760670.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1782761186-7F93225E-456CEE4D/0/0
X-purgate-type: clean
X-purgate-size: 6451
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
X-Rspamd-Queue-Id: BDAEE6DE727

Update various uses of legacy flags in vma.c and mmap.c to the new
vma_flags_t type, updating comments alongside them to be consistent.

Also update __install_special_mapping() to rearrange things slightly to
accommodate the changes.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mmap.c | 39 +++++++++++++++++++++------------------
 mm/vma.c  | 16 ++++++++++------
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index e834ec9273e3..a8546c9250a0 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -557,8 +557,8 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	}
 
 	/*
-	 * Set 'VM_NORESERVE' if we should not account for the
-	 * memory use of this mapping.
+	 * Set VMA_NORESERVE_BIT if we should not account for the memory use
+	 * of this mapping.
 	 */
 	if (flags & MAP_NORESERVE) {
 		/* We honor MAP_NORESERVE if allowed to overcommit */
@@ -985,7 +985,7 @@ struct vm_area_struct *find_extend_vma_locked(struct mm_struct *mm, unsigned lon
 		return NULL;
 	if (expand_stack_locked(prev, addr))
 		return NULL;
-	if (prev->vm_flags & VM_LOCKED)
+	if (vma_test(prev, VMA_LOCKED_BIT))
 		populate_vma_page_range(prev, addr, prev->vm_end, NULL);
 	return prev;
 }
@@ -1009,7 +1009,7 @@ struct vm_area_struct *find_extend_vma_locked(struct mm_struct *mm, unsigned lon
 	start = vma->vm_start;
 	if (expand_stack_locked(vma, addr))
 		return NULL;
-	if (vma->vm_flags & VM_LOCKED)
+	if (vma_test(vma, VMA_LOCKED_BIT))
 		populate_vma_page_range(vma, addr, start, NULL);
 	return vma;
 }
@@ -1134,18 +1134,18 @@ SYSCALL_DEFINE5(remap_file_pages, unsigned long, start, unsigned long, size,
 	 */
 	vma = vma_lookup(mm, start);
 
-	if (!vma || !(vma->vm_flags & VM_SHARED)) {
+	if (!vma || !vma_test(vma, VMA_SHARED_BIT)) {
 		mmap_read_unlock(mm);
 		return -EINVAL;
 	}
 
-	prot |= vma->vm_flags & VM_READ ? PROT_READ : 0;
-	prot |= vma->vm_flags & VM_WRITE ? PROT_WRITE : 0;
-	prot |= vma->vm_flags & VM_EXEC ? PROT_EXEC : 0;
+	prot |= vma_test(vma, VMA_READ_BIT) ? PROT_READ : 0;
+	prot |= vma_test(vma, VMA_WRITE_BIT) ? PROT_WRITE : 0;
+	prot |= vma_test(vma, VMA_EXEC_BIT) ? PROT_EXEC : 0;
 
 	flags &= MAP_NONBLOCK;
 	flags |= MAP_SHARED | MAP_FIXED | MAP_POPULATE;
-	if (vma->vm_flags & VM_LOCKED)
+	if (vma_test(vma, VMA_LOCKED_BIT))
 		flags |= MAP_LOCKED;
 
 	/* Save vm_flags used to calculate prot and flags, and recheck later. */
@@ -1271,7 +1271,7 @@ unsigned long tear_down_vmas(struct mm_struct *mm, struct vma_iterator *vmi,
 	mmap_assert_write_locked(mm);
 	vma_iter_set(vmi, vma->vm_end);
 	do {
-		if (vma->vm_flags & VM_ACCOUNT)
+		if (vma_test(vma, VMA_ACCOUNT_BIT))
 			nr_accounted += vma_pages(vma);
 		vma_mark_detached(vma);
 		remove_vma(vma);
@@ -1420,7 +1420,7 @@ static int special_mapping_split(struct vm_area_struct *vma, unsigned long addr)
 {
 	/*
 	 * Forbid splitting special mappings - kernel has expectations over
-	 * the number of pages in mapping. Together with VM_DONTEXPAND
+	 * the number of pages in mapping. Together with VMA_DONTEXPAND_BIT
 	 * the size of vma should stay the same over the special mapping's
 	 * lifetime.
 	 */
@@ -1692,7 +1692,7 @@ bool mmap_read_lock_maybe_expand(struct mm_struct *mm,
 		return true;
 	}
 
-	if (!(new_vma->vm_flags & VM_GROWSDOWN))
+	if (!vma_test(new_vma, VMA_GROWSDOWN_BIT))
 		return false;
 
 	mmap_write_lock(mm);
@@ -1742,7 +1742,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 		retval = vma_start_write_killable(mpnt);
 		if (retval < 0)
 			goto loop_out;
-		if (mpnt->vm_flags & VM_DONTCOPY) {
+		if (vma_test(mpnt, VMA_DONTCOPY_BIT)) {
 			retval = vma_iter_clear_gfp(&vmi, mpnt->vm_start,
 						    mpnt->vm_end, GFP_KERNEL);
 			if (retval)
@@ -1752,7 +1752,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 			continue;
 		}
 		charge = 0;
-		if (mpnt->vm_flags & VM_ACCOUNT) {
+		if (vma_test(mpnt, VMA_ACCOUNT_BIT)) {
 			unsigned long len = vma_pages(mpnt);
 
 			if (security_vm_enough_memory_mm(oldmm, len)) /* sic */
@@ -1770,16 +1770,19 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 		retval = dup_userfaultfd(tmp, &uf);
 		if (retval)
 			goto fail_nomem_anon_vma_fork;
-		if (tmp->vm_flags & VM_WIPEONFORK) {
+
+		if (vma_test(tmp, VMA_WIPEONFORK_BIT)) {
 			/*
-			 * VM_WIPEONFORK gets a clean slate in the child.
+			 * VMA_WIPEONFORK_BIT gets a clean slate in the child.
 			 * Don't prepare anon_vma until fault since we don't
 			 * copy page for current vma.
 			 */
 			tmp->anon_vma = NULL;
 		} else if (anon_vma_fork(tmp, mpnt))
 			goto fail_nomem_anon_vma_fork;
-		vm_flags_clear(tmp, VM_LOCKED_MASK);
+
+		vma_start_write(tmp);
+		vma_clear_flags_mask(tmp, VMA_LOCKED_MASK);
 		/*
 		 * Copy/update hugetlb private vma information.
 		 */
@@ -1812,7 +1815,7 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
 			i_mmap_unlock_write(mapping);
 		}
 
-		if (!(tmp->vm_flags & VM_WIPEONFORK))
+		if (!vma_test(tmp, VMA_WIPEONFORK_BIT))
 			retval = copy_page_range(tmp, mpnt);
 
 		if (retval) {
diff --git a/mm/vma.c b/mm/vma.c
index b81c05e67a61..ab2ef0f04420 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -3417,23 +3417,27 @@ struct vm_area_struct *__install_special_mapping(
 	vm_flags_t vm_flags, void *priv,
 	const struct vm_operations_struct *ops)
 {
-	int ret;
+	vma_flags_t vma_flags = legacy_to_vma_flags(vm_flags);
 	struct vm_area_struct *vma;
+	int ret;
 
 	vma = vm_area_alloc(mm);
-	if (unlikely(vma == NULL))
+	if (unlikely(!vma))
 		return ERR_PTR(-ENOMEM);
 
-	vma_set_range(vma, addr, addr + len, 0);
-	vm_flags |= vma_flags_to_legacy(mm->def_vma_flags) | VM_DONTEXPAND;
+	vma_flags_set_mask(&vma_flags, mm->def_vma_flags);
+	vma_flags_set(&vma_flags, VMA_DONTEXPAND_BIT);
 	if (pgtable_supports_soft_dirty())
-		vm_flags |= VM_SOFTDIRTY;
-	vm_flags_init(vma, vm_flags & ~VM_LOCKED_MASK);
+		vma_flags_set(&vma_flags, VMA_SOFTDIRTY_BIT);
+	vma_flags_clear_mask(&vma_flags, VMA_LOCKED_MASK);
+	vma->flags = vma_flags;
 	vma->vm_page_prot = vma_get_page_prot(vma);
 
 	vma->vm_ops = ops;
 	vma->vm_private_data = priv;
 
+	vma_set_range(vma, addr, addr + len, 0);
+
 	ret = insert_vm_struct(mm, vma);
 	if (ret)
 		goto out;
-- 
2.54.0



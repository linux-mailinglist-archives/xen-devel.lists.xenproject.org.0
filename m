Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +Uk2MDsmU2oJYAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 07:29:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB1743EDA
	for <lists+xen-devel@lfdr.de>; Sun, 12 Jul 2026 07:29:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cWfdCojd;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1360574.1613465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wimkI-0008KR-Lc; Sun, 12 Jul 2026 05:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360574.1613465; Sun, 12 Jul 2026 05:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wimkI-00087w-F7; Sun, 12 Jul 2026 05:28:54 +0000
Received: by outflank-mailman (input) for mailman id 1360574;
 Sat, 11 Jul 2026 18:47:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1wicju-0005Xq-TQ
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 18:47:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wicju-003keY-AS
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 20:47:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a528f9c-2eae-0a2a0a5409dd-0a2a45029662-18
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 20:47:50 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <ljs@kernel.org>)
 id 6a528fd4-64c6-0a2a45020019-aceafc1fce58-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 20:47:49 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3AAA141655;
 Sat, 11 Jul 2026 18:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4801F000E9;
 Sat, 11 Jul 2026 18:47:27 +0000 (UTC)
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
	s=k20260515; t=1783795668;
	bh=mLC9P7bLR/Uoa69VZ1d0HzztKwzCdHVcxkdSF4M05FQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cWfdCojd9BEVdJixJem5fW1yN2WMCBSqX49JBrY8VEVdZfJU2N7N3Nxjti2dd1PAY
	 jHUCK8DxeZrKYnvyB+RT9x7Cp2M5SoYFjZcIsDmFeaH1lqF767UeNHIIBPY+Sng5Fp
	 MK+9v3J7Qa9RSE25T4WS2oSi8fTCtKzWW6Odi2CaiQPPbEjTa8vRRaWJWdUuMUts4O
	 cA9jeJjD4VBwS0DTGUMhgeHN9UmX28wOStoae3Af6e7oQlz0+Dgt1jAYXhFRrvXj3V
	 aDj9iQonQd8MmaaAgMBdzyflHOa0sh1Ocs8CIFYwiYPnS5VCh7VghyS+RJDWLO0kSW
	 ijUTjw6rx6hTw==
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 19:45:03 +0100
Subject: [PATCH v2 06/13] mm/vma: convert vm_pgprot_modify() to use
 vma_flags_t and rename
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-b4-vma-flags-mm-v2-6-0fa2357d5431@kernel.org>
References: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
In-Reply-To: <20260711-b4-vma-flags-mm-v2-0-0fa2357d5431@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Helge Deller <deller@gmx.de>, Kees Cook <kees@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
 linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4379; i=ljs@kernel.org;
 h=from:subject:message-id; bh=zyqVv3UzBLKq1hjuUUCPSl3cGoER1z2LvGWjiRKvzK0=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKC+i1XKLHOjEnRP75gpcyaV01nzvXnrX6+LO73lGlC/
 +aJsv8/0VHKwiDGxSArpsjy/Iv4/iCRsHmdF/zdYOawMoEMYeDiFICJBNoyMuzw9q5WXt7gt/vl
 TK3NR7uCs2/mFnmo127Y8Mp28h/pyrmMDPe0ts0S3/2Ix3jO9zPB+xdkc/g3qqdk5hRZZBpk9Qb
 58QMA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-purgate-ID: tlsNG-720697/1783795670-3EF43A87-CDF4D48B/0/0
X-purgate-type: clean
X-purgate-size: 4381
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:tsbogend@alpha.franken.de,m:bcrl@kvack.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:jannh@google.com,m:pfalcato@suse.de,m:muchun.song@linux.dev,m:osalvador@suse.de,m:ziy@nvidia.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:usama.arif@linux.dev,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:linux+etnaviv@armlinux.org.uk,m:christian.gmeiner@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:jani.ni
 kula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:ljs@kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-aio@kvack.org,m:l
 inux-fsdevel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,infradead.org,google.com,suse.com,alpha.franken.de,kvack.org,zeniv.linux.org.uk,suse.cz,linux.alibaba.com,suse.de,linux.dev,nvidia.com,redhat.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.intel.com,ffwll.ch,pengutronix.de,armlinux.org.uk,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,poorly.run,somainline.org,ideasonboard.com,rock-chips.com,sntech.de,collabora.com,chromium.org,broadcom.com,epam.com,gmx.de,perex.cz];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ljs@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[100];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,etnaviv];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04DB1743EDA

Update vm_pgprot_modify() to use the new VMA flags type vma_flags_t, and
rename to vma_pgprot_modify() accordingly.

This is part of the ongoing work to convert vm_flags_t to vma_flags_t, in
order to eliminate the arbitrary limit of the number of bits in a system
word on available VMA flags.

Update VMA userland tests accordingly, updating vma_set_page_prot() to no
longer inline vma_pgprot_modify(), rather we can simply define
vma_pgprot_modify() as a static inline function and the tests will pick it
up from vma.h.

No functional change intended.

Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 mm/mmap.c                       |  8 ++++----
 mm/vma.c                        |  2 +-
 mm/vma.h                        |  6 ++++--
 tools/testing/vma/include/dup.h | 12 +++++-------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index ae9a5018e20e..2076c70e7700 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -80,13 +80,13 @@ core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
 /* Update vma->vm_page_prot to reflect vma->vm_flags. */
 void vma_set_page_prot(struct vm_area_struct *vma)
 {
-	vm_flags_t vm_flags = vma->vm_flags;
+	vma_flags_t vma_flags = vma->flags;
 	pgprot_t vm_page_prot;
 
-	vm_page_prot = vm_pgprot_modify(vma->vm_page_prot, vm_flags);
+	vm_page_prot = vma_pgprot_modify(vma->vm_page_prot, vma_flags);
 	if (vma_wants_writenotify(vma, vm_page_prot)) {
-		vm_flags &= ~VM_SHARED;
-		vm_page_prot = vm_pgprot_modify(vm_page_prot, vm_flags);
+		vma_flags_clear(&vma_flags, VMA_SHARED_BIT);
+		vm_page_prot = vma_pgprot_modify(vm_page_prot, vma_flags);
 	}
 	/* remove_protection_ptes reads vma->vm_page_prot without mmap_lock */
 	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
diff --git a/mm/vma.c b/mm/vma.c
index 1f443d979a7d..a74a0e467c63 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2176,7 +2176,7 @@ bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot)
 	/* The open routine did something to the protections that pgprot_modify
 	 * won't preserve? */
 	if (pgprot_val(vm_page_prot) !=
-	    pgprot_val(vm_pgprot_modify(vm_page_prot, vma->vm_flags)))
+	    pgprot_val(vma_pgprot_modify(vm_page_prot, vma->flags)))
 		return false;
 
 	/*
diff --git a/mm/vma.h b/mm/vma.h
index 4eb85b4a6adc..8ca6e7e8ae28 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -541,9 +541,11 @@ static inline bool vma_wants_manual_pte_write_upgrade(struct vm_area_struct *vma
 }
 
 #ifdef CONFIG_MMU
-static inline pgprot_t vm_pgprot_modify(pgprot_t oldprot, vm_flags_t vm_flags)
+static inline pgprot_t vma_pgprot_modify(pgprot_t oldprot, vma_flags_t vma_flags)
 {
-	return pgprot_modify(oldprot, vm_get_page_prot(vm_flags));
+	const pgprot_t prot = vma_get_page_prot(vma_flags);
+
+	return pgprot_modify(oldprot, prot);
 }
 #endif
 
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 773e23303e26..24955a1e318a 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1424,20 +1424,18 @@ struct vm_area_struct *vma_iter_next_range(struct vma_iterator *vmi)
 }
 
 bool vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
+static inline pgprot_t vma_pgprot_modify(pgprot_t oldprot, vma_flags_t vma_flags);
 
 /* Update vma->vm_page_prot to reflect vma->vm_flags. */
 static inline void vma_set_page_prot(struct vm_area_struct *vma)
 {
-	vm_flags_t vm_flags = vma->vm_flags;
+	vma_flags_t vma_flags = vma->flags;
 	pgprot_t vm_page_prot;
 
-	/* testing: we inline vm_pgprot_modify() to avoid clash with vma.h. */
-	vm_page_prot = pgprot_modify(vma->vm_page_prot, vm_get_page_prot(vm_flags));
-
+	vm_page_prot = vma_pgprot_modify(vma->vm_page_prot, vma_flags);
 	if (vma_wants_writenotify(vma, vm_page_prot)) {
-		vm_flags &= ~VM_SHARED;
-		/* testing: we inline vm_pgprot_modify() to avoid clash with vma.h. */
-		vm_page_prot = pgprot_modify(vm_page_prot, vm_get_page_prot(vm_flags));
+		vma_flags_clear(&vma_flags, VMA_SHARED_BIT);
+		vm_page_prot = vma_pgprot_modify(vm_page_prot, vma_flags);
 	}
 	/* remove_protection_ptes reads vma->vm_page_prot without mmap_lock */
 	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);

-- 
2.55.0



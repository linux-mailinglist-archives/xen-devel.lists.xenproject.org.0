Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0+4qENrRTGr0qAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 12:15:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2D71A2E0
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 12:15:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HluYhwOW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356164.1610824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh2pw-0003cr-GM; Tue, 07 Jul 2026 10:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356164.1610824; Tue, 07 Jul 2026 10:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh2pw-0003a9-DK; Tue, 07 Jul 2026 10:15:32 +0000
Received: by outflank-mailman (input) for mailman id 1356164;
 Tue, 07 Jul 2026 10:15:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1wh2pu-0003a3-Kd
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:15:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh2pu-00CtVo-1N
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 12:15:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6a4cd1bf-bab6-0a2a0a5309dd-0a2a4507c924-2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 12:15:29 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6a4cd1c0-9c8e-0a2a45070019-aceafc1fbc1c-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 12:15:29 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 64240424AD;
 Tue,  7 Jul 2026 10:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAC81F00A3D;
 Tue,  7 Jul 2026 10:15:10 +0000 (UTC)
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
	s=k20260515; t=1783419327;
	bh=mNSla9Czr4vFeuTIzrP/cHDzh+yx/IrTUvaJ5OnP34U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HluYhwOWRqwjbw9mnNEjPVnyh7tR+UBSnSv/otgjpUQBigWOwZUJOYkpU0LnGQPOd
	 9JWuafQR68ncbIWqn0jW8jTfwPafpmeDnt2Wvr8VLfjDqTgkyFdLwQrzBX5aGYlPBy
	 bdDr9uov5pNq61DLoYMBBHIrYLPaluS9cGGvVLuwrNNgpnc0PxTOy1Y4Jv6WgqJLPU
	 g8L2HsabDqHedwwaZisYTmwsI8Liu2LIO7hoQNV8VhXPReqA934JiUn5O3mwQK8rxr
	 zZFBy1M3lH7Q7XggDkvTulkUo1eG7DFZ7mTqdd75PKoMBF8VkjG7TCZVSFf+WpnFzU
	 vO+QqUik5Cd9A==
Date: Tue, 7 Jul 2026 11:15:02 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lucas Stach <l.stach@pengutronix.de>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Matthew Brost <matthew.brost@intel.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Helge Deller <deller@gmx.de>, Benjamin LaHaise <bcrl@kvack.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	linux-fbdev@vger.kernel.org, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/13] mm/vma: update do_mmap() to use vma_flags_t
Message-ID: <akzRdIS8ZotxIOFR@lucifer>
References: <cover.1782760670.git.ljs@kernel.org>
 <e0ac58ad2b88ff7e2f0024e3286b2e786f79ca32.1782760670.git.ljs@kernel.org>
 <DJRZ2QCEIVA6.1AZF5S891NKS4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJRZ2QCEIVA6.1AZF5S891NKS4@nvidia.com>
X-purgate-ID: tlsNG-ef75cf/1783419329-7D32F25E-2B07BD59/0/0
X-purgate-type: clean
X-purgate-size: 4300
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,nvidia.com:email];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@zeniv.l
 inux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.o
 rg,m:linux-aio@kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ljs@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94B2D71A2E0

On Mon, Jul 06, 2026 at 10:10:32PM -0400, Zi Yan wrote:
> On Mon Jun 29, 2026 at 3:25 PM EDT, Lorenzo Stoakes wrote:
> > The core do_mmap() function accepts a vm_flags_t parameter which it then
> > manipulates before passing to mmap_region() to do the heavy lifting of the
> > memory mapping.
> >
> > Update do_mmap() to instead accept a vma_flags_t parameter, and adjust all
> > the logic within do_mmap() to manipulate this instead.
> >
> > This is as part of the ongoing effort to convert VMA flags from a system
> > word size to a bitmap type which allows us to unrestrict the number of VMA
> > flags, as well as gain control over how VMA flag manipulation occurs.
> >
> > We do not cascade these changes to all functions which accept vm_flags_t,
> > but rather use vma_flags_to_legacy() where necessary, specifically
> > deferring converting calc_vm_prot_bits(), calc_vm_flag_bits() and
> > __get_unmapped_area() to vma_flags_t.
> >
> > Also utilise the new vma_flags_can_grow() predicate which correctly handles
> > the case of architectures without upward growing stacks.
> >
> > As part of this change, introduce VMA_SHADOW_STACK so we can correctly
> > handle the case of the shadow stack not being defined.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> >  arch/mips/kernel/vdso.c |  4 +--
> >  fs/aio.c                |  2 +-
> >  include/linux/memfd.h   |  6 ++--
> >  include/linux/mm.h      |  6 ++--
> >  ipc/shm.c               |  3 +-
> >  mm/memfd.c              | 15 ++++-----
> >  mm/mmap.c               | 67 ++++++++++++++++++++++++-----------------
> >  mm/nommu.c              |  3 +-
> >  mm/util.c               | 10 +++---
> >  mm/vma.c                |  7 ++---
> >  mm/vma.h                |  2 +-
> >  11 files changed, 69 insertions(+), 56 deletions(-)
> >
>
> <snip>
>
> >
> > -static int check_write_seal(vm_flags_t *vm_flags_ptr)
> > +static int check_write_seal(vma_flags_t *vma_flags_ptr)
> >  {
> > -	vm_flags_t vm_flags = *vm_flags_ptr;
> > -	vm_flags_t mask = vm_flags & (VM_SHARED | VM_WRITE);
> > -
> >  	/* If a private mapping then writability is irrelevant. */
> > -	if (!(mask & VM_SHARED))
> > +	if (!vma_flags_test(vma_flags_ptr, VMA_SHARED_BIT))
> >  		return 0;
> >
> >  	/*
> >  	 * New PROT_WRITE and MAP_SHARED mmaps are not allowed when
> >  	 * write seals are active.
> >  	 */
> > -	if (mask & VM_WRITE)
> > +	if (vma_flags_test(vma_flags_ptr, VMA_WRITE_BIT))
> >  		return -EPERM;
> >
> >  	/*
> >  	 * This is a read-only mapping, disallow mprotect() from making a
> >  	 * write-sealed mapping writable in future.
> >  	 */
> > -	*vm_flags_ptr &= ~VM_MAYWRITE;
> > +	vma_flags_clear(vma_flags_ptr, VMA_MAYWRITE_BIT);
> >
> >  	return 0;
> >  }
>
> This function alone changed its original behavior, since vm_flags is a
> snapshot of *vm_flags_ptr, but after the change this snapshot is gone.
> But its only caller memfd_check_seals_mmap() gets vm_flags_ptr from the
> input parameter of do_mmap(), so the overall behavior does not change.

Right yeah, the snapshot was always just a convenience thing :)

>
> <snip>
>
> > +		case MAP_DROPPABLE: {
> > +			vma_flags_t droppable = VMA_DROPPABLE;
> > +
> > +			if (vma_flags_empty(&droppable))
> >  				return -EOPNOTSUPP;
> > +			vma_flags_set_mask(&vma_flags, droppable);
> > +
> >  			/*
> >  			 * A locked or stack area makes no sense to be droppable.
> >  			 *
> > @@ -515,23 +527,24 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
> >  			 */
> >  			if (flags & (MAP_LOCKED | MAP_HUGETLB))
> >  			        return -EINVAL;
> > -			if (vm_flags & (VM_GROWSDOWN | VM_GROWSUP))
> > +			if (vma_flags_can_grow(&vma_flags))
> >  			        return -EINVAL;
> >
> > -			vm_flags |= VM_DROPPABLE;
> > -
>
> Lance pointed out the reordering of setting VMA_DROPPABLE and checking
> of can_grow, but these flags are not overlapped and there is no parallel
> writer to vma_flags. So it is still no functional change, just not
> mechanical changes. :)

Right yes exactly :)

>
> Otherwise, LGTM.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
> --
> Best Regards,
> Yan, Zi
>

Cheers, Lorenzo


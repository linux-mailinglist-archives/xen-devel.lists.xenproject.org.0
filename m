Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2230267CF06
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 15:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485079.752042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL3f7-0000ih-Vf; Thu, 26 Jan 2023 14:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485079.752042; Thu, 26 Jan 2023 14:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL3f7-0000gi-Sb; Thu, 26 Jan 2023 14:55:37 +0000
Received: by outflank-mailman (input) for mailman id 485079;
 Thu, 26 Jan 2023 14:51:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vvgl=5X=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1pL3bS-0000RC-1B
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 14:51:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5758fce-9d88-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 15:51:48 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EA0C61756;
 Thu, 26 Jan 2023 14:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3695EC433EF;
 Thu, 26 Jan 2023 14:51:09 +0000 (UTC)
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
X-Inumbo-ID: f5758fce-9d88-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674744706;
	bh=vTtNm5B4uxkFGkyUcD6bt7bUv740cC5zoLQ3n4iCXig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r54XDevqCxaIthjhpV90e/3PReNDit6CxkjYziBMldcr+DpwGPcGH7s0yFhPlYu8B
	 NohDoJ7KVIUCX5Zs7V0ydKB7t9XQRchAYOCR8XLnEbVPCZ8e7MIHv0UEcp73VODAq8
	 aFhcsGcrVCc28IZRly/gODnl3cguu4R9trJCc4u2GtQ9ygUwR4IFSGftEKj188geBR
	 3987kGANtDLWA/GzBI6W69E/F450ClXU14kAngo3y+A1wCivQR2InkOef4HeCwIwVj
	 QYEspA95Wv7WS3mfCUr9QMGnsDd2HsZvTUBOWl52ZSZiQBqHvpwy1Yy3PsmXixNWVQ
	 B28KDvwGClVRQ==
Date: Thu, 26 Jan 2023 16:50:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, michel@lespinasse.org, jglisse@google.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	mgorman@techsingularity.net, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, peterz@infradead.org,
	ldufour@linux.ibm.com, paulmck@kernel.org, luto@kernel.org,
	songliubraving@fb.com, peterx@redhat.com, david@redhat.com,
	dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de,
	kent.overstreet@linux.dev, punit.agrawal@bytedance.com,
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com,
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
	jannh@google.com, shakeelb@google.com, tatashin@google.com,
	edumazet@google.com, gthelen@google.com, gurua@google.com,
	arjunroy@google.com, soheil@google.com, hughlynch@google.com,
	leewalsh@google.com, posk@google.com, will@kernel.org,
	aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
	chenhuacai@kernel.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	qianweili@huawei.com, wangzhou1@hisilicon.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	airlied@gmail.com, daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, l.stach@pengutronix.de,
	krzysztof.kozlowski@linaro.org, patrik.r.jakobsson@gmail.com,
	matthias.bgg@gmail.com, robdclark@gmail.com,
	quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
	tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
	ray.huang@amd.com, kraxel@redhat.com, sre@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	dimitri.sivanich@hpe.com, zhangfei.gao@linaro.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	dgilbert@interlog.com, hdegoede@redhat.com, mst@redhat.com,
	jasowang@redhat.com, alex.williamson@redhat.com, deller@gmx.de,
	jayalk@intworks.biz, viro@zeniv.linux.org.uk, nico@fluxnic.net,
	xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, miklos@szeredi.hu,
	mike.kravetz@oracle.com, muchun.song@linux.dev, bhe@redhat.com,
	andrii@kernel.org, yoshfuji@linux-ipv6.org, dsahern@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, perex@perex.cz, tiwai@suse.com,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com,
	linux-ia64@vger.kernel.org, linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org,
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, nvdimm@lists.linux.dev,
	dmaengine@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	linux-accelerators@lists.ozlabs.org, sparclinux@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	target-devel@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	devel@lists.orangefs.org, kexec@lists.infradead.org,
	linux-xfs@vger.kernel.org, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com,
	selinux@vger.kernel.org, alsa-devel@alsa-project.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 1/6] mm: introduce vma->vm_flags modifier functions
Message-ID: <Y9KTUw/04FmBVplw@kernel.org>
References: <20230125083851.27759-1-surenb@google.com>
 <20230125083851.27759-2-surenb@google.com>
 <Y9JFFYjfJf9uDijE@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9JFFYjfJf9uDijE@kernel.org>

On Thu, Jan 26, 2023 at 11:17:09AM +0200, Mike Rapoport wrote:
> On Wed, Jan 25, 2023 at 12:38:46AM -0800, Suren Baghdasaryan wrote:
> > vm_flags are among VMA attributes which affect decisions like VMA merging
> > and splitting. Therefore all vm_flags modifications are performed after
> > taking exclusive mmap_lock to prevent vm_flags updates racing with such
> > operations. Introduce modifier functions for vm_flags to be used whenever
> > flags are updated. This way we can better check and control correct
> > locking behavior during these updates.
> > 
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h       | 37 +++++++++++++++++++++++++++++++++++++
> >  include/linux/mm_types.h |  8 +++++++-
> >  2 files changed, 44 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index c2f62bdce134..b71f2809caac 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -627,6 +627,43 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
> >  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> >  }
> >  
> > +/* Use when VMA is not part of the VMA tree and needs no locking */
> > +static inline void init_vm_flags(struct vm_area_struct *vma,
> > +				 unsigned long flags)
> 
> I'd suggest to make it vm_flags_init() etc.

Thinking more about it, it will be even clearer to name these vma_flags_xyz()

> Except that
> 
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> 

--
Sincerely yours,
Mike.


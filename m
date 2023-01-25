Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4E467C429
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 06:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484543.751508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKuUy-0005U5-3J; Thu, 26 Jan 2023 05:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484543.751508; Thu, 26 Jan 2023 05:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKuUx-0005DF-KP; Thu, 26 Jan 2023 05:08:31 +0000
Received: by outflank-mailman (input) for mailman id 484543;
 Wed, 25 Jan 2023 19:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EtGL=5W=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1pKlLW-00031j-EF
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 19:22:10 +0000
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f4831d9-9ce5-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 20:22:09 +0100 (CET)
Received: by mail-yb1-xb2d.google.com with SMTP id h5so7435313ybj.8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 11:22:09 -0800 (PST)
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
X-Inumbo-ID: 8f4831d9-9ce5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=azRxZ4iz/UmvW0JqPrqtZcKNmaFt9MhDUKzgc4KSKbs=;
        b=idbJO946IIJ5xclJl8K3ScrKphDS9TF1tg1AgsB8MPco32Ta3+qR61NnmqeUtsnx6v
         goCUeETP5lzAzmASwAR43MDdzy2mxaLRi4K6yZE3Q+T5C1FUbuWCmQDSDtqKn5s2e6iw
         g3L5+Ey8VBu5ZDVtB0a1Axssd66xmU+yYweeF+hE6jQwYilC1xMJq5jCj+NjIEVUsfL4
         tw7nY9DM/DzPYd8vrkO+1JZY6FVSYBMjhRJz+WIxF8k5j1BI+Qpdb88Is7APtmnyodC7
         tcl2VYHmnzhTEoT5QVoxpB++zHDpcXCuz10aLB8wrCQNw685txpV1MvZDG3GANSg7b1j
         9Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azRxZ4iz/UmvW0JqPrqtZcKNmaFt9MhDUKzgc4KSKbs=;
        b=atf1gOVlaXFtpQHqq5ihDQ5QScrymePGWzyh75pIHqvb1DEM4OYSIDbro7aZ3T+vyZ
         v+AzqDKIb7Vlg/7gvN8/A4SL7TQpAmT6E20Xg4RfJoCQ+s+RKsxL4ThQrFgMvZdlqeVO
         +U3zg4U4py0H6r8n/dFKLMNV2xQEBFzJhZN1AZRk1cdNDQOhDZvcrqJpA8CYmYtprKKC
         mmPa/a0oCAD6W4y7YXoFgg/iwIWw1CCFDRY0YGn6544i8whZB2PXnInf8moh3kDWGQWy
         TLbK9vkK5qG9z0TKH8+hSV0/niZduQ3b2AFfq8umxTOHlka4wwjmqS7rykn33kicgy3j
         rapQ==
X-Gm-Message-State: AO0yUKXa49kl8aj1dnd6GnGwDDfq3ZbuFXxNzu60UN51KifwD/fMXSmi
	JuN4q4BFTX0Fg9Fxs4beMebzVljpgOleeP2pM5jVMA==
X-Google-Smtp-Source: AK7set9Keebho/efVX9+GO9rxFk2PCEOZWbQBvt6Ld/Tpsz3uuvCSMXu6oGPdxC/ITtQ87qnzhMkMAEzeywlAhveKx4=
X-Received: by 2002:a25:c247:0:b0:80b:6201:bee7 with SMTP id
 s68-20020a25c247000000b0080b6201bee7mr946541ybf.340.1674674527537; Wed, 25
 Jan 2023 11:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com> <20230125083851.27759-2-surenb@google.com>
 <Y9Dx0cPXF2yoLwww@hirez.programming.kicks-ass.net> <CAJuCfpEcVCZaCGzc-Wim25eaV5e6YG1YJAAdKwZ6JHViB0z8aw@mail.gmail.com>
 <Y9F28J9njAtwifuL@casper.infradead.org>
In-Reply-To: <Y9F28J9njAtwifuL@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 11:21:56 -0800
Message-ID: <CAJuCfpHO7g-5GZep0e7r=dFTBhVHpN3R_pHMGOqetgrKyYzMFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] mm: introduce vma->vm_flags modifier functions
To: Matthew Wilcox <willy@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, akpm@linux-foundation.org, michel@lespinasse.org, 
	jglisse@google.com, mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, dave@stgolabs.net, liam.howlett@oracle.com, 
	ldufour@linux.ibm.com, paulmck@kernel.org, luto@kernel.org, 
	songliubraving@fb.com, peterx@redhat.com, david@redhat.com, 
	dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de, 
	kent.overstreet@linux.dev, punit.agrawal@bytedance.com, lstoakes@gmail.com, 
	peterjung1337@gmail.com, rientjes@google.com, axelrasmussen@google.com, 
	joelaf@google.com, minchan@google.com, jannh@google.com, shakeelb@google.com, 
	tatashin@google.com, edumazet@google.com, gthelen@google.com, 
	gurua@google.com, arjunroy@google.com, soheil@google.com, 
	hughlynch@google.com, leewalsh@google.com, posk@google.com, will@kernel.org, 
	aneesh.kumar@linux.ibm.com, npiggin@gmail.com, chenhuacai@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, qianweili@huawei.com, wangzhou1@hisilicon.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, l.stach@pengutronix.de, 
	krzysztof.kozlowski@linaro.org, patrik.r.jakobsson@gmail.com, 
	matthias.bgg@gmail.com, robdclark@gmail.com, quic_abhinavk@quicinc.com, 
	dmitry.baryshkov@linaro.org, tomba@kernel.org, hjc@rock-chips.com, 
	heiko@sntech.de, ray.huang@amd.com, kraxel@redhat.com, sre@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, tfiga@chromium.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, dimitri.sivanich@hpe.com, 
	zhangfei.gao@linaro.org, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	dgilbert@interlog.com, hdegoede@redhat.com, mst@redhat.com, 
	jasowang@redhat.com, alex.williamson@redhat.com, deller@gmx.de, 
	jayalk@intworks.biz, viro@zeniv.linux.org.uk, nico@fluxnic.net, 
	xiang@kernel.org, chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca, 
	miklos@szeredi.hu, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	bhe@redhat.com, andrii@kernel.org, yoshfuji@linux-ipv6.org, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, perex@perex.cz, 
	tiwai@suse.com, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-graphics-maintainer@vmware.com, linux-ia64@vger.kernel.org, 
	linux-arch@vger.kernel.org, loongarch@lists.linux.dev, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-crypto@vger.kernel.org, nvdimm@lists.linux.dev, 
	dmaengine@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-accelerators@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev, 
	target-devel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-aio@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-ext4@vger.kernel.org, devel@lists.orangefs.org, 
	kexec@lists.infradead.org, linux-xfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, 
	selinux@vger.kernel.org, alsa-devel@alsa-project.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 25, 2023 at 10:37 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Jan 25, 2023 at 08:49:50AM -0800, Suren Baghdasaryan wrote:
> > On Wed, Jan 25, 2023 at 1:10 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > > +     /*
> > > > +      * Flags, see mm.h.
> > > > +      * WARNING! Do not modify directly.
> > > > +      * Use {init|reset|set|clear|mod}_vm_flags() functions instead.
> > > > +      */
> > > > +     unsigned long vm_flags;
> > >
> > > We have __private and ACCESS_PRIVATE() to help with enforcing this.
> >
> > Thanks for pointing this out, Peter! I guess for that I'll need to
> > convert all read accesses and provide get_vm_flags() too? That will
> > cause some additional churt (a quick search shows 801 hits over 248
> > files) but maybe it's worth it? I think Michal suggested that too in
> > another patch. Should I do that while we are at it?
>
> Here's a trick I saw somewhere in the VFS:
>
>         union {
>                 const vm_flags_t vm_flags;
>                 vm_flags_t __private __vm_flags;
>         };
>
> Now it can be read by anybody but written only by those using
> ACCESS_PRIVATE.

Huh, this is quite nice! I think it does not save us from the cases
when vma->vm_flags is passed by a reference and modified indirectly,
like in ksm_madvise()? Though maybe such usecases are so rare (I found
only 2 cases) that we can ignore this?


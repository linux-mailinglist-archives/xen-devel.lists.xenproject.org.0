Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002A567C430
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 06:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484545.751510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKuUy-0005Ze-Ad; Thu, 26 Jan 2023 05:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484545.751510; Thu, 26 Jan 2023 05:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKuUy-0005QT-0k; Thu, 26 Jan 2023 05:08:32 +0000
Received: by outflank-mailman (input) for mailman id 484545;
 Wed, 25 Jan 2023 19:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EtGL=5W=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1pKlMC-00032o-6K
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 19:22:52 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a86b1174-9ce5-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 20:22:51 +0100 (CET)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so277874057b3.8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 11:22:51 -0800 (PST)
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
X-Inumbo-ID: a86b1174-9ce5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PCnMypYs8jymH6Ufuva+9r/69Y/DZs8kYxwQEYrzQFk=;
        b=hXTUs83qvSMCw0sqrewtph/1zyRGQA8EwV9VOqASoIhN1O27YlTeLHvU30LwpkaPKE
         6ZtbduOBpeU0Mk6yScQyxHGjdOZ8W8NbAK7HCSbKR2qQVwpslpoP2Mqh8DnM60UrkSEV
         Fy/rJx/xAj6ReR1yQheSDvUeiLsUOZe36GsXUe+/pA5dp4+pot+ScO1k5jhTafZOkoJo
         vEjMe7B3/0BupSIQn5CSlkYjolaKBFMYB73xyId061H8p1ZYZbkvvK9SPdZltanRDpUl
         vOuM+M/xFo7tmOP85pcv8h038+SVqlBqYWxO3Lgun0O5W06va+PJHK2pFsHgrhvmIiGL
         lvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCnMypYs8jymH6Ufuva+9r/69Y/DZs8kYxwQEYrzQFk=;
        b=FnwznxdQno0Pm0YySvq6bWGN2pBtvocxfGVX+Jwm4zCJiBNfwv9K1wLdaSB+16ElMK
         X8knzhHarQGvx2hY5sUg+xdHPaRaNeKifzXhYXRf8RXgpzbKw9JwdKuGaLS1R+B8Vira
         bz4q49Nq7J8VSARfaCUwWvpOyZrWlCe3F5tX8IbbN/BQc9VS5NtNLGoGwiUqxNTr9+tT
         0CQYj4nHKAZbLQLdN37uM1d1AJgGm45pSv1gy9F6D+ezSd6O1OP8itZth8NqCi4ivcPn
         ZCaYH3aONL9+dR1OqTMAnm6v0+vSGUQ3K9zFjIHYUFHUK2De5/WJDlrmQlHeZBzkDjYa
         7vqA==
X-Gm-Message-State: AO0yUKWpT2F04pmakUSi7BD46zTBSJISO6yM6QrVViggQIDCrQRbJ7zu
	xFwC9BNkyNdCxbGG+R5pGllJJFA4NL2OKmc5aMM5AQ==
X-Google-Smtp-Source: AK7set/Rj29H3r8vHaYccCmp943Un+QyMRF/w8dcRdt99GFw8apI+/L+5tSmXBTsBLdlTBniti7hA8kyFbpjr3H10kc=
X-Received: by 2002:a0d:d456:0:b0:507:26dc:ebd with SMTP id
 w83-20020a0dd456000000b0050726dc0ebdmr298632ywd.455.1674674569763; Wed, 25
 Jan 2023 11:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com> <20230125083851.27759-2-surenb@google.com>
 <Y9F19QEDX5d/44EV@casper.infradead.org>
In-Reply-To: <Y9F19QEDX5d/44EV@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 11:22:38 -0800
Message-ID: <CAJuCfpH+LMFX=TT04gSMA05cz_-CXMum6fobRrduWvzm1HWPmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] mm: introduce vma->vm_flags modifier functions
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, michel@lespinasse.org, jglisse@google.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, dave@stgolabs.net, liam.howlett@oracle.com, 
	peterz@infradead.org, ldufour@linux.ibm.com, paulmck@kernel.org, 
	luto@kernel.org, songliubraving@fb.com, peterx@redhat.com, david@redhat.com, 
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

On Wed, Jan 25, 2023 at 10:33 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Jan 25, 2023 at 12:38:46AM -0800, Suren Baghdasaryan wrote:
> > +/* Use when VMA is not part of the VMA tree and needs no locking */
> > +static inline void init_vm_flags(struct vm_area_struct *vma,
> > +                              unsigned long flags)
> > +{
> > +     vma->vm_flags = flags;
>
> vm_flags are supposed to have type vm_flags_t.  That's not been
> fully realised yet, but perhaps we could avoid making it worse?
>
> >       pgprot_t vm_page_prot;
> > -     unsigned long vm_flags;         /* Flags, see mm.h. */
> > +
> > +     /*
> > +      * Flags, see mm.h.
> > +      * WARNING! Do not modify directly.
> > +      * Use {init|reset|set|clear|mod}_vm_flags() functions instead.
> > +      */
> > +     unsigned long vm_flags;
>
> Including changing this line to vm_flags_t

Good point. Will make the change. Thanks!


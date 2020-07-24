Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B5F22CE29
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 20:51:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz2la-0006qU-KI; Fri, 24 Jul 2020 18:49:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3qI=BD=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jz2la-0006qP-38
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 18:49:58 +0000
X-Inumbo-ID: 77e24978-cdde-11ea-887c-bc764e2007e4
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77e24978-cdde-11ea-887c-bc764e2007e4;
 Fri, 24 Jul 2020 18:49:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id j18so8776008wmi.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2020 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=aEuOAjCsOg+5EH37QI7YpqublmeICj17qtr5o/5tYvs=;
 b=D41lDghna6EFpjpSo6IKrp2GiGfk9FXZe4IkDsFcHTVqD2nufp8/y1U0d35hiFZ3b0
 bv0wecl+2K7NiTqi4wIZavzOAsgBY+N+zhH/nscSiEGCiwICTs/XlZq64XdDKak6XYBH
 LYTVzgZAhM45FmyvfKbKGFeR6rPUXa+xYl0jJf1x9X+xPV8dZgu6D1g9ojqET8vETn5q
 AiC+X1ZEgNY/qQLnjgcmuaJSFFoM+JTRFtqVIqZIhxY1g8iodqaqGv+3ni7tI3NoaPIg
 BLPBe5OyZtAf7q8j5M13rijsJ66afAwGVSZmvDhAPkPkSC4YoA+BIA3eWVEfiNOMmrTw
 NuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=aEuOAjCsOg+5EH37QI7YpqublmeICj17qtr5o/5tYvs=;
 b=WC3dPjc6MDoIoQ7rmRA4bOy+VLyoQe2Qyx+xlFaa4GOVycKjBhZkZ/GEhjx5zp7wzL
 Djo9OEOGrg2nZEO1PLBvLIzpkwHvrCOxtD4yilv7mL4eaxMN68ZoC7Pxb5YKIAsMJqrQ
 9kkhf1s/FhuCzM3FN/Pdvs4C2L/2f/R893NtSLFxK+3noiEJn6qNHKuDRBuFIMsfsZnR
 ugqouTdQNjam8dwuwm+jpIgrwP4K/O+WpsxLw3C90J42Sekhl4JOJ/UHibw1d8gKka/N
 EMI45XwKmsuRIeGJTv8kswH5vsyLYEXMdmcjhp6RsX9DRs53y6UZ2ic0/MJdduTR6n33
 pXEA==
X-Gm-Message-State: AOAM530MifB9OwwxCdSFwcrfN8IK09GwXJx6aMWE1r5Y3sJqPXgzUJJY
 vShagKwZ+Zf9/hZsDFCwsg8=
X-Google-Smtp-Source: ABdhPJwUjVL6IGzkkmf9Ut12goObcz/rSnARE8BHFXwwq4BFYxlWcxBVD4/7u0jyAg4zt7+lbXQhmA==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr9847043wmi.95.1595616596228;
 Fri, 24 Jul 2020 11:49:56 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:10dd:8439:6158:5aba])
 by smtp.gmail.com with ESMTPSA id g16sm2165821wrs.88.2020.07.24.11.49.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jul 2020 11:49:55 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-2-paul@xen.org>
 <68b40fdc-e578-7005-aa6e-499c6f04589c@citrix.com>
In-Reply-To: <68b40fdc-e578-7005-aa6e-499c6f04589c@citrix.com>
Subject: RE: [PATCH 1/6] x86/iommu: re-arrange arch_iommu to separate common
 fields...
Date: Fri, 24 Jul 2020 19:49:55 +0100
Message-ID: <000001d661eb$392e1ae0$ab8a50a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJEvXWV1fglpFS8p501Sb8VALJosQK2TIaJAcTpbVioFoErYA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Lukasz Hawrylko' <lukasz.hawrylko@linux.intel.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 24 July 2020 18:29
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Lukasz Hawrylko =
<lukasz.hawrylko@linux.intel.com>; Jan Beulich
> <jbeulich@suse.com>; Wei Liu <wl@xen.org>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Kevin Tian
> <kevin.tian@intel.com>
> Subject: Re: [PATCH 1/6] x86/iommu: re-arrange arch_iommu to separate =
common fields...
>=20
> On 24/07/2020 17:46, Paul Durrant wrote:
> > diff --git a/xen/include/asm-x86/iommu.h =
b/xen/include/asm-x86/iommu.h
> > index 6c9d5e5632..a7add5208c 100644
> > --- a/xen/include/asm-x86/iommu.h
> > +++ b/xen/include/asm-x86/iommu.h
> > @@ -45,16 +45,23 @@ typedef uint64_t daddr_t;
> >
> >  struct arch_iommu
> >  {
> > -    u64 pgd_maddr;                 /* io page directory machine =
address */
> > -    spinlock_t mapping_lock;            /* io page table lock */
> > -    int agaw;     /* adjusted guest address width, 0 is level 2 =
30-bit */
> > -    u64 iommu_bitmap;              /* bitmap of iommu(s) that the =
domain uses */
> > -    struct list_head mapped_rmrrs;
> > -
> > -    /* amd iommu support */
> > -    int paging_mode;
> > -    struct page_info *root_table;
> > -    struct guest_iommu *g_iommu;
> > +    spinlock_t mapping_lock; /* io page table lock */
> > +
> > +    union {
> > +        /* Intel VT-d */
> > +        struct {
> > +            u64 pgd_maddr; /* io page directory machine address */
> > +            int agaw; /* adjusted guest address width, 0 is level 2 =
30-bit */
> > +            u64 iommu_bitmap; /* bitmap of iommu(s) that the domain =
uses */
> > +            struct list_head mapped_rmrrs;
> > +        } vtd;
> > +        /* AMD IOMMU */
> > +        struct {
> > +            int paging_mode;
> > +            struct page_info *root_table;
> > +            struct guest_iommu *g_iommu;
> > +        } amd_iommu;
> > +    };
>=20
> The naming split here is weird.
>=20
> Ideally we'd have struct {vtd,amd}_iommu in appropriate headers, and
> this would be simply
>=20
> union {
>     struct vtd_iommu vtd;
>     struct amd_iommu amd;
> };
>=20
> If this isn't trivial to arrange, can we at least s/amd_iommu/amd/ =
here ?

I was in two minds. I tried to look for a TLA for the AMD IOMMU and =
'amd' seemed a little too non-descript. I don't really mind though if =
there's a strong preference to shorted it.
I can certainly try moving the struct definitions into the =
implementation headers.

  Paul

>=20
> ~Andrew



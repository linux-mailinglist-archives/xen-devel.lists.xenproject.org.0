Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F61A5E524
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 21:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910810.1317437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsSUI-00013p-2E; Wed, 12 Mar 2025 20:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910810.1317437; Wed, 12 Mar 2025 20:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsSUH-000124-Vc; Wed, 12 Mar 2025 20:15:33 +0000
Received: by outflank-mailman (input) for mailman id 910810;
 Wed, 12 Mar 2025 20:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEQM=V7=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1tsSUH-00011y-5R
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 20:15:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf42ad16-ff7e-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 21:15:32 +0100 (CET)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-ek_KVuTEMbC5NcApgIxVhg-1; Wed, 12 Mar 2025 16:15:27 -0400
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-e6345bc7bd7so1892428276.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 13:15:27 -0700 (PDT)
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
X-Inumbo-ID: bf42ad16-ff7e-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741810531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLkIeO0MCQT7MR4XxoTZC2Dt6fLNdFPHwBMGedp21e8=;
	b=MQ9T0lyh0MdnFVflYynmUG7b7t/aHUR7S/AmgTjw94xYR86AIVLuHWDWNzGRsOqi9aFOWi
	Sq6N9TqhVfR5nKvgHScMZ31fXgGnlRMtl3wUUFVK4RpxiFIMnteKpbv3fI+4oNr8NMlmDx
	Kc8T4w0OQK/qpiUyiQuEYOaDxxN5s/g=
X-MC-Unique: ek_KVuTEMbC5NcApgIxVhg-1
X-Mimecast-MFC-AGG-ID: ek_KVuTEMbC5NcApgIxVhg_1741810527
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741810527; x=1742415327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLkIeO0MCQT7MR4XxoTZC2Dt6fLNdFPHwBMGedp21e8=;
        b=VRcRYizFJVEARzfb1/R+261/l/8bdLXUmF48qMcSqSkKD75MW2BE5zKJR5INHBKWNh
         OPew+EJRdPBQXpFM8QzM1yrVTDNotBHmnni4myGvsfUZ15pMvhXPlIt/TNQSKHRYyy71
         QzySk2v4lkmnv8vvbPOkuwHQ7uTB8E9FnufEt4S2kAVhFKrIrDa+6hwGSG+1IBNesc2l
         Q9+kh/HrTYP9RgpNktonf3MEWWRMZyco7jIX3DLKL8+ZIEPewkW7Hl1+85x1VPYK+rZj
         LuMvI90p2tCM4gIjssK7Ka52mOlkoB9f8MczDKW5winlaAvu6WPIePRhbBFCWN4s3IY0
         6z3g==
X-Forwarded-Encrypted: i=1; AJvYcCX41SqS+aIaHGWUxlwibqB4fcCvTcLhD9sWWuVVUwFjAYLukZ5cSXMZEZo2YVeI1b5mSGW8MryCeks=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYpD4sG4f/7doiA1Zu0CIr0ALl1UEvzJ6eRHXwwwRivA8TaJkm
	53r3g7KNOzRnAZc17zhgjS+WG812WTI2b2K0IQi3G2HymhhgKiOrYwceS2PnbsxIn/Ki1o4/Ry3
	gm2iUfOG5VO6ZyR9x+PE63C/lovZmJOF2/f4GVDmf6Kv40ZXBtbc9bpJNn8Z2Xef8ihzvq4hnFu
	OZ4RbIWH3y3tYzjvnIBGTvxbjIx1buV9U2LkmWHts=
X-Gm-Gg: ASbGnctN+tOX7F6zBqsFJVqYPlBp2u9vFpSL9Szl8/TNiJclYK3OU5vMYk4/IEsbNIU
	ASanMK1VDXbLGvg4GR+ruUFHG3/zPg9D1GVK8DyVrnu1OrnU0VD1j3MzqD9wg+NibEyANZ7xhEs
	UIGZIczIECV7g=
X-Received: by 2002:a05:6902:1b8a:b0:e58:cb:70f0 with SMTP id 3f1490d57ef6-e63dd280e5amr1426490276.6.1741810527115;
        Wed, 12 Mar 2025 13:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRjCueQJTtD1Yip12lTSRS0J2WXsza8uUs7pkqkkc4WEhTu9c6Jn8ZqT/i5u+iVlL2g8+CwS2JOOpWtSQA1o0=
X-Received: by 2002:a05:6902:1b8a:b0:e58:cb:70f0 with SMTP id
 3f1490d57ef6-e63dd280e5amr1426459276.6.1741810526854; Wed, 12 Mar 2025
 13:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250312000700.184573-1-npache@redhat.com> <20250312000700.184573-2-npache@redhat.com>
 <oiues63fvb5xx45pue676iso3d3mcqboxdtmcfldwj4xm7q4g7@rxrgpz5l23ok>
In-Reply-To: <oiues63fvb5xx45pue676iso3d3mcqboxdtmcfldwj4xm7q4g7@rxrgpz5l23ok>
From: Nico Pache <npache@redhat.com>
Date: Wed, 12 Mar 2025 14:14:59 -0600
X-Gm-Features: AQ5f1Joh0g4Z83aGfjvoE-bfcrPmBotalHWvxVjzooJnUWJwOvfHN9lhNGt-h0o
Message-ID: <CAA1CXcCG6pdVaU7PGks2n3SdRjT1xxpP=yfsF3Mt-J4eCcshiw@mail.gmail.com>
Subject: Re: [RFC 1/5] meminfo: add a per node counter for balloon drivers
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, jerrin.shaji-george@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, mst@redhat.com, david@redhat.com, 
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
	akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, muchun.song@linux.dev, nphamcs@gmail.com, 
	yosry.ahmed@linux.dev, kanchana.p.sridhar@intel.com, 
	alexander.atanasov@virtuozzo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cQRB5PzQCFSujVWc-jl6hjTZ1wCoVAzdsZahqRfN7zQ_1741810527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 10:21=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.d=
ev> wrote:
>
> On Tue, Mar 11, 2025 at 06:06:56PM -0600, Nico Pache wrote:
> > Add NR_BALLOON_PAGES counter to track memory used by balloon drivers an=
d
> > expose it through /proc/meminfo and other memory reporting interfaces.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  fs/proc/meminfo.c      | 2 ++
> >  include/linux/mmzone.h | 1 +
> >  mm/memcontrol.c        | 1 +
> >  mm/show_mem.c          | 4 +++-
> >  mm/vmstat.c            | 1 +
> >  5 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> > index 8ba9b1472390..83be312159c9 100644
> > --- a/fs/proc/meminfo.c
> > +++ b/fs/proc/meminfo.c
> > @@ -162,6 +162,8 @@ static int meminfo_proc_show(struct seq_file *m, vo=
id *v)
> >       show_val_kb(m, "Unaccepted:     ",
> >                   global_zone_page_state(NR_UNACCEPTED));
> >  #endif
> > +     show_val_kb(m, "Balloon:        ",
> > +                 global_node_page_state(NR_BALLOON_PAGES));
> >
> >       hugetlb_report_meminfo(m);
> >
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index 9540b41894da..71d3ff19267a 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -223,6 +223,7 @@ enum node_stat_item {
> >  #ifdef CONFIG_HUGETLB_PAGE
> >       NR_HUGETLB,
> >  #endif
> > +     NR_BALLOON_PAGES,
> >       NR_VM_NODE_STAT_ITEMS
> >  };
> >
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 4de6acb9b8ec..182b44646bfa 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -1377,6 +1377,7 @@ static const struct memory_stat memory_stats[] =
=3D {
> >  #ifdef CONFIG_HUGETLB_PAGE
> >       { "hugetlb",                    NR_HUGETLB                      }=
,
> >  #endif
> > +     { "nr_balloon_pages",           NR_BALLOON_PAGES                }=
,
>
> Please remove the above counter from memcontrol.c as I don't think this
> memory is accounted towards memcg.

Fixed-- Thank you!
>



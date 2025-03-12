Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F4FA5E516
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 21:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910796.1317428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsSQZ-0000Pz-H2; Wed, 12 Mar 2025 20:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910796.1317428; Wed, 12 Mar 2025 20:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsSQZ-0000OP-DR; Wed, 12 Mar 2025 20:11:43 +0000
Received: by outflank-mailman (input) for mailman id 910796;
 Wed, 12 Mar 2025 20:11:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEQM=V7=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1tsSQY-0000OJ-2F
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 20:11:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34ac63a5-ff7e-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 21:11:39 +0100 (CET)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-Ecrj_fLAO8eCZJuZyk7t1g-1; Wed, 12 Mar 2025 16:11:37 -0400
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6fd541f4b43so2845937b3.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 13:11:37 -0700 (PDT)
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
X-Inumbo-ID: 34ac63a5-ff7e-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741810298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CUM3a6gnZC/3zAtpJFYD7FtGrYIIZpsLuUMo7CMvX0I=;
	b=RlpGPeubXh2/Btu0Ntl/+N0pDf75cmtkmxzBO+JfX7L6tqqwVC1CE7FsgRIf4631OMwLQI
	tTPYuYk+sa8NVB9D3UXS58RJD/ZzrR15lR9yaCNSvW1PvVALBuwDLwihAFP3BJTMD+A5fA
	fVDVEG8wzfSgB7GBclHDtvj+rMqDPWI=
X-MC-Unique: Ecrj_fLAO8eCZJuZyk7t1g-1
X-Mimecast-MFC-AGG-ID: Ecrj_fLAO8eCZJuZyk7t1g_1741810296
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741810296; x=1742415096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUM3a6gnZC/3zAtpJFYD7FtGrYIIZpsLuUMo7CMvX0I=;
        b=l00gAhnxNJd/CCUJRBM5eNxdZn4A+yLUZyRmYkC8HGQdzZUmsxYqFvkqt7YQWquB/F
         QM/kbUGUSeKmqf7uSxb77i7nSVno4r/L5dsdPMALrnceJX+84yJULnE0L6mBb2LHv4mi
         a1LtdiuzkMNRDfRzPXr/6OaBFfTEoTaH3q3gI/biNp04LR8ov37aoNLoU0B5tqE+YfY2
         i0cx/Jb4l4kuLAQaeAk716JvRL1TmNVqnWnWX9KXQWILPB5Gz8aIT7HdiD9ymXXLbz1Z
         ZI28EWCHv83/uIqEpDRuKpdbHuHD5tnOgyvYcP4ah5jl6gqQUMwATppQNzl0xRPwpOH4
         DRTw==
X-Forwarded-Encrypted: i=1; AJvYcCWy97WD+3GHQbY2b+7CyFH0ycyJk9qOfJZwyy6W5rMaZHQmRYxwZ2IZeBLaqw/yRKaegW3cSp5CZrA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMYsMS85YCgaFsm6QvcvXYBBM/I/Y7bgqBB3PAt75tPg2aby9f
	4f2CcmYvJrOoS8OZLdbZeki4/aiMSnx4MAcn7DnB4cZUXyaEgqnJrdi9ppUdlQ3855F0n0HIbXZ
	LkAKbrXOl1lgvEQSh+CI3esWR7z9w9l84vDKM14bWisRBRLAr8O+/52H3N1HM/VtGfy9NbNL9rE
	+LGRWZxRTNpOlNpn64jWWiLNENfD3dzuIA/YqMCmI=
X-Gm-Gg: ASbGnct86EpiVzvHgPz/1lSFuxfkXpo4VnRNGkaEI7P/2XTeHjr6m21ujDY4aUAYKUh
	ocjRv4cBB0x8n3BtKXltvlLmuLkfA2ZW5SqzEA0NMBb2I/W7xPZ2KxZ2sM0WO20Z7NsLJiyRR/P
	Uk8lS/OO5HbKo=
X-Received: by 2002:a05:6902:4908:b0:e63:71cf:7a25 with SMTP id 3f1490d57ef6-e6371cf7f99mr23022172276.19.1741810296408;
        Wed, 12 Mar 2025 13:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFILEwS4y4Eu7CtZytQ1AMLlSYSOVDPPOZAL/URaaVOd4HXzYxT1BzN9xV4mLg1LOlVPDho5H2JPLVwRxAT/sw=
X-Received: by 2002:a05:6902:4908:b0:e63:71cf:7a25 with SMTP id
 3f1490d57ef6-e6371cf7f99mr23022141276.19.1741810296082; Wed, 12 Mar 2025
 13:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250312000700.184573-1-npache@redhat.com> <20250312000700.184573-5-npache@redhat.com>
 <20250312025607-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250312025607-mutt-send-email-mst@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Wed, 12 Mar 2025 14:11:09 -0600
X-Gm-Features: AQ5f1JpCzw-OMEiWJ5oWmnRpNTzG9s0Jia2dTAgWmtQzoaspW3JJPq9uXITvZCU
Message-ID: <CAA1CXcDjEErb2L85gi+W=1sFn73VHLto09nG6f1vS+10o4PctA@mail.gmail.com>
Subject: Re: [RFC 4/5] vmx_balloon: update the NR_BALLOON_PAGES state
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, jerrin.shaji-george@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, david@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com, jgross@suse.com, 
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
	akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	nphamcs@gmail.com, yosry.ahmed@linux.dev, kanchana.p.sridhar@intel.com, 
	alexander.atanasov@virtuozzo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Iybes_z1gV4rEzKeKx1C4bN_yOplOZfd4zc5NAYzzUk_1741810296
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 12:57=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Tue, Mar 11, 2025 at 06:06:59PM -0600, Nico Pache wrote:
> > Update the NR_BALLOON_PAGES counter when pages are added to or
> > removed from the VMware balloon.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  drivers/misc/vmw_balloon.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> > index c817d8c21641..2c70b08c6fb3 100644
> > --- a/drivers/misc/vmw_balloon.c
> > +++ b/drivers/misc/vmw_balloon.c
> > @@ -673,6 +673,8 @@ static int vmballoon_alloc_page_list(struct vmballo=
on *b,
> >
> >                       vmballoon_stats_page_inc(b, VMW_BALLOON_PAGE_STAT=
_ALLOC,
> >                                                ctl->page_size);
> > +                     mod_node_page_state(page_pgdat(page), NR_BALLOON_=
PAGES,
> > +                             vmballoon_page_in_frames(ctl->page_size))=
;
>
>
> same issue as virtio I think - this counts frames not pages.
I agree with the viritio issue since PAGE_SIZE can be larger than
VIRTIO_BALLOON_PFN_SHIFT, resulting in multiple virtio_balloon pages
for each page. I fixed that one, thanks!

For the Vmware one, the code is littered with mentions of counting in
4k or 2M but as far as I can tell from looking at the code it actually
operates in PAGE_SIZE or PMD size chunks and this count would be
correct.
Perhaps I am missing something though.

>
> >               }
> >
> >               if (page) {
> > @@ -915,6 +917,8 @@ static void vmballoon_release_page_list(struct list=
_head *page_list,
> >       list_for_each_entry_safe(page, tmp, page_list, lru) {
> >               list_del(&page->lru);
> >               __free_pages(page, vmballoon_page_order(page_size));
> > +             mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
> > +                     -vmballoon_page_in_frames(page_size));
> >       }
> >
> >       if (n_pages)
> > @@ -1129,7 +1133,6 @@ static void vmballoon_inflate(struct vmballoon *b=
)
> >
> >               /* Update the balloon size */
> >               atomic64_add(ctl.n_pages * page_in_frames, &b->size);
> > -
>
>
> unrelated change
Fixed, Thanks for reviewing!
>
> >               vmballoon_enqueue_page_list(b, &ctl.pages, &ctl.n_pages,
> >                                           ctl.page_size);
> >
> > --
> > 2.48.1
>



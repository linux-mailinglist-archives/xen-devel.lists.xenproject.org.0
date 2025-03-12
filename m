Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E16A5E5CA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 21:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910834.1317455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsT8q-0004QE-71; Wed, 12 Mar 2025 20:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910834.1317455; Wed, 12 Mar 2025 20:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsT8q-0004N8-4M; Wed, 12 Mar 2025 20:57:28 +0000
Received: by outflank-mailman (input) for mailman id 910834;
 Wed, 12 Mar 2025 20:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hgYX=V7=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1tsT8o-0004N2-Ap
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 20:57:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 982a89f8-ff84-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 21:57:23 +0100 (CET)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-ImZwo5cZMkiCrd0ZGThFtQ-1; Wed, 12 Mar 2025 16:57:20 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39131851046so107162f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 13:57:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcb8sm22470458f8f.33.2025.03.12.13.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 13:57:17 -0700 (PDT)
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
X-Inumbo-ID: 982a89f8-ff84-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741813042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slUJe+JHhJOnq30PEtJv6XBCtRVaMaEHLPY3w2dXjCU=;
	b=A0vdGSezksR6SG4T9D+Kr+UxQwtZlIKsr0kXpq774s2dvMrsRYNBUaTXVihaw1BTm2aLs3
	BQ5M2pWGGOs/2b13QUgCrO/uFsp8125SbnXkOcLvLjkGxlTkN79o5aCZvMEKRhNUB+vCJN
	Ld+DLQT0XyBBNe0JBJ9+ld4FDn8Un5c=
X-MC-Unique: ImZwo5cZMkiCrd0ZGThFtQ-1
X-Mimecast-MFC-AGG-ID: ImZwo5cZMkiCrd0ZGThFtQ_1741813040
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741813040; x=1742417840;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=slUJe+JHhJOnq30PEtJv6XBCtRVaMaEHLPY3w2dXjCU=;
        b=HkIbfnzewXVxUxvWC+vyyC3oT7QiSH9I7Ga7zkiJhMshXEcc4IO9iUZwqDva3bfze7
         UHjGEdy21pWzfIznE3ETsyl1/71qYoxCAKO6/3xmwZ9q/6l3bgVZ+ZuIoyY5l1aBscAO
         SEojA9nAKZGmv3dVPAaMIY21U0szkWCMWW52SsAOPdeBt4+6SAFgd1wXTQWBR0X4HVgE
         VUpulZGiodF0vg4pCO1EScJkfxhN8KIAo3zalyYkNuEHZAuUMvCG9hLQVghk7l7LEn0n
         4sgbLbHIXM6IUR9/qlfvx00LAgGZDUuHuw9besBUm3y1BPOvD25K/FAVItBABvyOKKRg
         8qCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO4v4K3bp1VJZ89wQkOFMAw9yv1+GkR42g/xxN5J46NZDUs5OL/IMSFv41fLnH2lbERcc6bN0wAOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkCNeF/4AXDXQs6AAXt1i30wbOyLi2yc1tBRuwRPlhLItTi4eI
	4E8bkNUWihnJ4R4p1wDdsTQS9mJrpqFpZo68hFdZ594plIRrPnWfdnNuWf6BVMscaFPW52KUBzL
	1mnBmp50zIFAuZd8jJYD9zMcQ/kjmT/w+pApS5rOZKembEeSeX2Z7BCW8dHWTwXT8
X-Gm-Gg: ASbGncs2w+pPwyV7ywMjhKastKln9byCUBSpSUUmZYgEtlg51M2vnyaXrxuVUWfLi2A
	bRTglMhqcDoOFvLyLzk0ivLHpLJvZCiZzC/ExrHo4i4tVHyWBuMktqOTxhJKI7TBy3gV012RKL8
	IN5CO/wDMPp68MXfN6O1XKq49Jp7R72Dbgozur1N1NC8lxU4yH/d6786K6UHAflcSio6HIpwmG+
	gq9Clnv2Ncje9F85/U2NowO3sO5qkF198gckiEzwE7rvc71w1fnYY0mu8bCkwjIMZePWZTvWizo
	sx5+Y80QMQ==
X-Received: by 2002:a05:6000:144d:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-39132d9908fmr17334948f8f.40.1741813039710;
        Wed, 12 Mar 2025 13:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3/+BK82Z+aTDjO7POooWoHYU637cwTUeXYPG2W8VKTA2QZ3BgBHzUd7t9xStiQ+fOSVcEVA==
X-Received: by 2002:a05:6000:144d:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-39132d9908fmr17334939f8f.40.1741813039371;
        Wed, 12 Mar 2025 13:57:19 -0700 (PDT)
Date: Wed, 12 Mar 2025 16:57:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nico Pache <npache@redhat.com>
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	cgroups@vger.kernel.org, kys@microsoft.com, haiyangz@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com,
	jerrin.shaji-george@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de,
	gregkh@linuxfoundation.org, david@redhat.com, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, nphamcs@gmail.com, yosry.ahmed@linux.dev,
	kanchana.p.sridhar@intel.com, alexander.atanasov@virtuozzo.com
Subject: Re: [RFC 4/5] vmx_balloon: update the NR_BALLOON_PAGES state
Message-ID: <20250312165302-mutt-send-email-mst@kernel.org>
References: <20250312000700.184573-1-npache@redhat.com>
 <20250312000700.184573-5-npache@redhat.com>
 <20250312025607-mutt-send-email-mst@kernel.org>
 <CAA1CXcDjEErb2L85gi+W=1sFn73VHLto09nG6f1vS+10o4PctA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA1CXcDjEErb2L85gi+W=1sFn73VHLto09nG6f1vS+10o4PctA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GgNhieBzmVc2Tbe9YVtEhq4Pbacamw_vzjuBpsA6ODI_1741813040
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 12, 2025 at 02:11:09PM -0600, Nico Pache wrote:
> On Wed, Mar 12, 2025 at 12:57 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Mar 11, 2025 at 06:06:59PM -0600, Nico Pache wrote:
> > > Update the NR_BALLOON_PAGES counter when pages are added to or
> > > removed from the VMware balloon.
> > >
> > > Signed-off-by: Nico Pache <npache@redhat.com>
> > > ---
> > >  drivers/misc/vmw_balloon.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> > > index c817d8c21641..2c70b08c6fb3 100644
> > > --- a/drivers/misc/vmw_balloon.c
> > > +++ b/drivers/misc/vmw_balloon.c
> > > @@ -673,6 +673,8 @@ static int vmballoon_alloc_page_list(struct vmballoon *b,
> > >
> > >                       vmballoon_stats_page_inc(b, VMW_BALLOON_PAGE_STAT_ALLOC,
> > >                                                ctl->page_size);
> > > +                     mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
> > > +                             vmballoon_page_in_frames(ctl->page_size));
> >
> >
> > same issue as virtio I think - this counts frames not pages.
> I agree with the viritio issue since PAGE_SIZE can be larger than
> VIRTIO_BALLOON_PFN_SHIFT, resulting in multiple virtio_balloon pages
> for each page. I fixed that one, thanks!
> 
> For the Vmware one, the code is littered with mentions of counting in
> 4k or 2M but as far as I can tell from looking at the code it actually
> operates in PAGE_SIZE or PMD size chunks and this count would be
> correct.
> Perhaps I am missing something though.


Can't say for sure. This needs an ack from the maintainer.

> >
> > >               }
> > >
> > >               if (page) {
> > > @@ -915,6 +917,8 @@ static void vmballoon_release_page_list(struct list_head *page_list,
> > >       list_for_each_entry_safe(page, tmp, page_list, lru) {
> > >               list_del(&page->lru);
> > >               __free_pages(page, vmballoon_page_order(page_size));
> > > +             mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
> > > +                     -vmballoon_page_in_frames(page_size));
> > >       }
> > >
> > >       if (n_pages)
> > > @@ -1129,7 +1133,6 @@ static void vmballoon_inflate(struct vmballoon *b)
> > >
> > >               /* Update the balloon size */
> > >               atomic64_add(ctl.n_pages * page_in_frames, &b->size);
> > > -
> >
> >
> > unrelated change
> Fixed, Thanks for reviewing!
> >
> > >               vmballoon_enqueue_page_list(b, &ctl.pages, &ctl.n_pages,
> > >                                           ctl.page_size);
> > >
> > > --
> > > 2.48.1
> >



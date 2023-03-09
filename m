Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64B6B1FE2
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 10:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508204.782621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCU2-0005g7-Rq; Thu, 09 Mar 2023 09:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508204.782621; Thu, 09 Mar 2023 09:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCU2-0005cp-OE; Thu, 09 Mar 2023 09:22:46 +0000
Received: by outflank-mailman (input) for mailman id 508204;
 Thu, 09 Mar 2023 09:22:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnZm=7B=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1paCU1-0005cB-CK
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 09:22:45 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e963f904-be5b-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 10:22:29 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id bw19so1133142wrb.13
 for <xen-devel@lists.xenproject.org>; Thu, 09 Mar 2023 01:22:28 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b002c54fb024b2sm17121215wrj.61.2023.03.09.01.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 01:22:27 -0800 (PST)
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
X-Inumbo-ID: e963f904-be5b-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678353748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hVLZoXAAPmwL3mxc3dmGz5XMmWrMEr7RhdQxrxgi3UA=;
        b=I0FiS1rsCoA1nG+qm1Zwa/waDNf8zA7JLdsCnIsAXxaQ1oX0qql+RLEKluIqvstzDY
         UrxUsl1U/LZzMHT3YNBfEvrjtTu+KmZjLuA9lbEDeBWmulOYia0NyALRXTYuZGhSs54E
         8Ssyt7IFlsHsFkuwC7zdwxeVBHqlAZk+1BZn/89+NzwCwsIPFVF9LB0eMqg1AckQlZhj
         rIz8Mf9UhepNjHDGyeiLxa3zFjidQWbSnqClhUqZ2HwV/4EftBPd0xsqrlNqw5BSBSb1
         8ZhchN4urSp0/8c8LCW+64thJyIS5qV068IzvVxVKwxdJN7jhy0B5HBfXucuQ2nkQXvJ
         qO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678353748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVLZoXAAPmwL3mxc3dmGz5XMmWrMEr7RhdQxrxgi3UA=;
        b=7KkSdxIfu/KRtkF6hXxBEB0ExO7DYZU6PCyanE+T6wOFWn6Flh+Xxq/NJp+tD7ThiY
         4XqzI+atkqKQDMsQconYO6duZyJBY/Jy4BaEA824TQpj7FBcYSaCK8wFIn3IlB25XuvE
         uZY62tgW+I6GKzZHtWugfrFif69AlaXerkchYKJRXvAEmf8Dr0ad5IVI6jwHqEuXuNN3
         Te6nNrGw7icg+9AW3gJLXC3PaFXWtgwn6qXxVawTEqS+m4MDnTJGyc1r1eK9Tukb27iC
         gTTfv5GyuOsqimmR5zqVUxeMceIOpp1EBDn/hZeSvkOQL8QRgqFQ3ta6IirJULg9w8ix
         7d8g==
X-Gm-Message-State: AO0yUKUI+v48qDm4b7KTVT1Gb7VSI5wHvZV7EpSH/OOIXjLTNJr1sSG+
	jA4RtyfWvRvdsNQP/DX0Q14=
X-Google-Smtp-Source: AK7set+Ly99/isEllTrb3y3OetsGmfvFtU1wdYedHFNLGjw7eg918CGuAe6RBuFu/b//eoApMI8mpA==
X-Received: by 2002:adf:e70a:0:b0:2c9:e3d:88ca with SMTP id c10-20020adfe70a000000b002c90e3d88camr13420237wrm.67.1678353747960;
        Thu, 09 Mar 2023 01:22:27 -0800 (PST)
Date: Thu, 9 Mar 2023 10:22:25 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Message-ID: <20230309092225.GA1218485@horizon>
References: <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>
 <20230217085006.GA2281468@horizon>
 <7e79d20d-0922-565a-e46d-e3366c0bcfb4@suse.com>
 <20230217092948.GA2282871@horizon>
 <9864e936-5c77-a790-e36c-766d5359cd83@suse.com>
 <20230223121647.GA3260113@horizon>
 <496b1fd7-4540-66c6-be89-51f20a6666ab@suse.com>
 <20230307144427.GA997565@horizon>
 <29630f27-3de9-ea1a-de2f-f9c8449da2ab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29630f27-3de9-ea1a-de2f-f9c8449da2ab@suse.com>

On Tue, Mar 07, 2023 at 05:55:26PM +0100, Jan Beulich wrote:
> On 07.03.2023 15:44, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Feb 23, 2023 at 01:42:08PM +0100, Jan Beulich wrote:
> >> On 23.02.2023 13:16, Matias Ezequiel Vara Larsen wrote:
> >>> On Fri, Feb 17, 2023 at 03:10:53PM +0100, Jan Beulich wrote:
> >>>> On 17.02.2023 10:29, Matias Ezequiel Vara Larsen wrote:
> >>>>> On Fri, Feb 17, 2023 at 09:57:43AM +0100, Jan Beulich wrote:
> >>>>>> On 17.02.2023 09:50, Matias Ezequiel Vara Larsen wrote:
> >>>>>>> On Wed, Dec 14, 2022 at 08:56:57AM +0100, Jan Beulich wrote:
> >>>>>>>> On 14.12.2022 08:29, Jan Beulich wrote:
> >>>>>>>>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> >>>>>>>>>> +static int stats_vcpu_alloc_mfn(struct domain *d)
> >>>>>>>>>> +{
> >>>>>>>>>> +    struct page_info *pg;
> >>>>>>>>>> +
> >>>>>>>>>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> >>>>>>>>>
> >>>>>>>>> The ioreq and vmtrace resources are also allocated this way, but they're
> >>>>>>>>> HVM-specific. The one here being supposed to be VM-type independent, I'm
> >>>>>>>>> afraid such pages will be accessible by an "owning" PV domain (it'll
> >>>>>>>>> need to guess the MFN, but that's no excuse).
> >>>>>>>>
> >>>>>>>> Which might be tolerable if it then can't write to the page. That would
> >>>>>>>> require "locking" the page r/o (from guest pov), which ought to be
> >>>>>>>> possible by leveraging a variant of what share_xen_page_with_guest()
> >>>>>>>> does: It marks pages PGT_none with a single type ref. This would mean
> >>>>>>>> ...
> >>>>>>>>
> >>>>>>>>>> +    if ( !pg )
> >>>>>>>>>> +        return -ENOMEM;
> >>>>>>>>>> +
> >>>>>>>>>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
> >>>>>>>>
> >>>>>>>> ... using PGT_none here. Afaict this _should_ work, but we have no
> >>>>>>>> precedent of doing so in the tree, and I may be overlooking something
> >>>>>>>> which prevents that from working.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I do not fully understand this. I checked share_xen_page_with_guest() and I
> >>>>>>> think you're talking about doing something like this for each allocated page to
> >>>>>>> set them ro from a pv guest pov:
> >>>>>>>
> >>>>>>> pg->u.inuse.type_info = PGT_none;
> >>>>>>> pg->u.inuse.type_info |= PGT_validated | 1;
> >>>>>>> page_set_owner(page, d); // not sure if this is needed
> >>>>>>>
> >>>>>>> Then, I should use PGT_none instead of PGT_writable_page in
> >>>>>>> get_page_and_type(). Am I right?
> >>>>>>
> >>>>>> No, if at all possible you should avoid open-coding anything. As said,
> >>>>>> simply passing PGT_none to get_page_and_type() ought to work (again, as
> >>>>>> said, unless I'm overlooking something). share_xen_page_with_guest()
> >>>>>> can do what it does because the page isn't owned yet. For a page with
> >>>>>> owner you may not fiddle with type_info in such an open-coded manner.
> >>>>>>
> >>>>>
> >>>>> Thanks. I got the following bug when passing PGT_none:
> >>>>>
> >>>>> (XEN) Bad type in validate_page 0 t=0000000000000001 c=8040000000000002
> >>>>> (XEN) Xen BUG at mm.c:2643
> >>>>
> >>>> The caller of the function needs to avoid the call not only for writable
> >>>> and shared pages, but also for this new case of PGT_none.
> >>>
> >>> Thanks. If I understand correctly, _get_page_type() needs to avoid to call
> >>> validate_page() when type = PGT_none.
> >>
> >> Yes.
> >>
> >>> For the writable and shared pages, this
> >>> is avoided by setting nx |= PGT_validated. Am I right?
> >>
> >> Well, no, I wouldn't describe it like that. The two (soon three) types not
> >> requiring validation simply set the flag without calling validate_page().
> >>
> > 
> > I see, thanks. I added the corresponding check at _get_page_type() to set the
> > flag without calling validate_page() for the PGT_none type. I think I am
> > missing something when I am releasing the pages. I am triggering the following
> > BUG() when issuing put_page_and_type():
> >  
> > (XEN) Xen BUG at mm.c:2698
> > 
> > This is at devalidate_page(). I guess the call to devalidate_page() shall be
> > also avoided.
> 
> Well, yes, symmetry requires a change there as well. Here it's indirect:
> You want to avoid the call to _put_final_page_type(). That's enclosed by
> (nx & PGT_type_mask) <= PGT_l4_page_table, which happens to be true for
> PGT_none as well. There may be more instances of such a comparison, so
> it'll be necessary to find them and check whether they may now also be
> reached with PGT_none (looks like a comparison against PGT_root_page_table
> in _get_page_type() is also affected, albeit in a largely benign way).
> 
Thanks. I could not find any other instance of that comparison except those
that you mention. I'll add a new patch in the series to deal with the
support for PGT_none.

Matias 


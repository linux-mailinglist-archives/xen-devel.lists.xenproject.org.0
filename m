Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A7E6A0868
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 13:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500301.771610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAWs-0003co-3C; Thu, 23 Feb 2023 12:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500301.771610; Thu, 23 Feb 2023 12:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAWr-0003b7-Vv; Thu, 23 Feb 2023 12:16:53 +0000
Received: by outflank-mailman (input) for mailman id 500301;
 Thu, 23 Feb 2023 12:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+N8=6T=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pVAWq-0003au-JS
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 12:16:52 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3a1c5d7-b373-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 13:16:51 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so102575wms.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 04:16:51 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 q31-20020a05600c331f00b003e2243cfe15sm4889187wmp.39.2023.02.23.04.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:16:50 -0800 (PST)
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
X-Inumbo-ID: f3a1c5d7-b373-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vn8t3gxjmF9ZTEmLqwUXuOg0hmdbdBz0DP5HNcPYr5k=;
        b=BPWjZWy42xdLOV+UJb/fY8zTmbsCMyVsvuZShkDNge6Ckj8cCsZ6P13qY9QOfB9FQa
         UMH8cyoYeVL1xN1r0Pkh7sa2x3wW1t+U9Vu6kY+QsnjdWBEzvi+PMwtDKuwj69s0VPp0
         47FWcQDkrz9Qp84SoXXVG8XQ2nyD1f40qC1Ye7MD0tfmfl8PBmRnN6EOfm0dhlICpYa4
         uhAWRfqk0TRKCEVN5R5zSICg7xCamWAcwgAYD83zeVkT4NSgXTW9aU1G43+M0XCOhwyq
         QxniZE5rudea17H1c5jwFPOQS91fNaRv+SFxDW/MPChxzOPo9ZEdmnSwKnEgsHYtU0xg
         8BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn8t3gxjmF9ZTEmLqwUXuOg0hmdbdBz0DP5HNcPYr5k=;
        b=ALjE67bkW0vsAARxWshc4zFpMFGUPwIlQ0Hjqfz8P+0B4IE/cQepU9wLOHxadOUrfz
         bD4TCjmNuJeTZBs/CqZrcWQVaNnaaXomPKxUGpw1nwkufWR7njNKuDemuPvmBJnwDH1h
         PVeF7/e9SdVGJAd2Q+TSHcx4QR3dsgy8h4whRVOb2G/8dswRR8cnJ+uoqwNxBHt4OS8O
         VDsgi6wkjPv6fxgV9MLwpmhuz30TeCumGFBpruq6Bdmg8B+Fo3nLQ4otPuIeoa8aa+pu
         UOie8jkCsP7M/V8VT6disiSE5Do3r5ZrMEYDlObj2V1ThDYNIhsmV45QJvS6A6cFTP0U
         zu2w==
X-Gm-Message-State: AO0yUKUzxxO35/UG9YKZDtSUgWV7gSS5jSc8tAG+ciySdO9Rdr/GG1qV
	X04r6QFXAo3ckW86jVty4rg=
X-Google-Smtp-Source: AK7set/QLaFr4tuJypVkeBmC+JC+8CkRQLX40ibfaZKfdocmvs1m29Td3oZzb3RfDQlNaXSQ6qF1mQ==
X-Received: by 2002:a05:600c:3196:b0:3e1:f8af:8772 with SMTP id s22-20020a05600c319600b003e1f8af8772mr8823133wmp.9.1677154610655;
        Thu, 23 Feb 2023 04:16:50 -0800 (PST)
Date: Thu, 23 Feb 2023 13:16:47 +0100
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
Message-ID: <20230223121647.GA3260113@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>
 <20230217085006.GA2281468@horizon>
 <7e79d20d-0922-565a-e46d-e3366c0bcfb4@suse.com>
 <20230217092948.GA2282871@horizon>
 <9864e936-5c77-a790-e36c-766d5359cd83@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9864e936-5c77-a790-e36c-766d5359cd83@suse.com>

On Fri, Feb 17, 2023 at 03:10:53PM +0100, Jan Beulich wrote:
> On 17.02.2023 10:29, Matias Ezequiel Vara Larsen wrote:
> > On Fri, Feb 17, 2023 at 09:57:43AM +0100, Jan Beulich wrote:
> >> On 17.02.2023 09:50, Matias Ezequiel Vara Larsen wrote:
> >>> On Wed, Dec 14, 2022 at 08:56:57AM +0100, Jan Beulich wrote:
> >>>> On 14.12.2022 08:29, Jan Beulich wrote:
> >>>>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> >>>>>> +static int stats_vcpu_alloc_mfn(struct domain *d)
> >>>>>> +{
> >>>>>> +    struct page_info *pg;
> >>>>>> +
> >>>>>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> >>>>>
> >>>>> The ioreq and vmtrace resources are also allocated this way, but they're
> >>>>> HVM-specific. The one here being supposed to be VM-type independent, I'm
> >>>>> afraid such pages will be accessible by an "owning" PV domain (it'll
> >>>>> need to guess the MFN, but that's no excuse).
> >>>>
> >>>> Which might be tolerable if it then can't write to the page. That would
> >>>> require "locking" the page r/o (from guest pov), which ought to be
> >>>> possible by leveraging a variant of what share_xen_page_with_guest()
> >>>> does: It marks pages PGT_none with a single type ref. This would mean
> >>>> ...
> >>>>
> >>>>>> +    if ( !pg )
> >>>>>> +        return -ENOMEM;
> >>>>>> +
> >>>>>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
> >>>>
> >>>> ... using PGT_none here. Afaict this _should_ work, but we have no
> >>>> precedent of doing so in the tree, and I may be overlooking something
> >>>> which prevents that from working.
> >>>>
> >>>
> >>> I do not fully understand this. I checked share_xen_page_with_guest() and I
> >>> think you're talking about doing something like this for each allocated page to
> >>> set them ro from a pv guest pov:
> >>>
> >>> pg->u.inuse.type_info = PGT_none;
> >>> pg->u.inuse.type_info |= PGT_validated | 1;
> >>> page_set_owner(page, d); // not sure if this is needed
> >>>
> >>> Then, I should use PGT_none instead of PGT_writable_page in
> >>> get_page_and_type(). Am I right?
> >>
> >> No, if at all possible you should avoid open-coding anything. As said,
> >> simply passing PGT_none to get_page_and_type() ought to work (again, as
> >> said, unless I'm overlooking something). share_xen_page_with_guest()
> >> can do what it does because the page isn't owned yet. For a page with
> >> owner you may not fiddle with type_info in such an open-coded manner.
> >>
> > 
> > Thanks. I got the following bug when passing PGT_none:
> > 
> > (XEN) Bad type in validate_page 0 t=0000000000000001 c=8040000000000002
> > (XEN) Xen BUG at mm.c:2643
> 
> The caller of the function needs to avoid the call not only for writable
> and shared pages, but also for this new case of PGT_none.

Thanks. If I understand correctly, _get_page_type() needs to avoid to call
validate_page() when type = PGT_none. For the writable and shared pages, this
is avoided by setting nx |= PGT_validated. Am I right?

Matias


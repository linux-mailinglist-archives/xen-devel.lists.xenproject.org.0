Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E26AE2F2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507460.780991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYYL-0000vF-83; Tue, 07 Mar 2023 14:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507460.780991; Tue, 07 Mar 2023 14:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYYL-0000tA-4d; Tue, 07 Mar 2023 14:44:33 +0000
Received: by outflank-mailman (input) for mailman id 507460;
 Tue, 07 Mar 2023 14:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XRF8=67=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pZYYK-0000sR-44
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:44:32 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 919a946c-bcf6-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 15:44:31 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id k37so7960475wms.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:44:31 -0800 (PST)
Received: from horizon (lfbn-gre-1-246-234.w90-112.abo.wanadoo.fr.
 [90.112.203.234]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003e9ded91c27sm18796101wmo.4.2023.03.07.06.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:44:29 -0800 (PST)
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
X-Inumbo-ID: 919a946c-bcf6-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678200270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uksrb4+N3txK0Dgw/vUdYDorW3X2SBQSdUvTrcwhzFg=;
        b=MxWid/Ol0ic7aFSWZiExdg8hH+Yo9ctr9OZlmsUzrN/kKdAY37XxLbnPFmZbk2Xcsb
         bjI+IrwFreV4mfiuzyfWzE8F3sP4LNEh5FvNKebYb2TyMxWe57QKH3q8FBonbR06Sfev
         No8PHrFDzjBRAU/EWJd4x2jLaj0PdAABdsDG1wEOCwDD82BBViZ+LGSkE7IdV7PpzJcc
         eoSTVqgVmh355mUgTjP8U5RLXdh7eocVcjpwJyvbOaoT5xfK4PNFR88LYuOd3NyDf54G
         +D0NwPVkHi/0OajktEpgl3iU0mYqZfeFKyI3lDPCiorkrOorlfydWSrngeDzJkNPOV9l
         e1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678200270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uksrb4+N3txK0Dgw/vUdYDorW3X2SBQSdUvTrcwhzFg=;
        b=svrpgWNvrmZ1TCuoAHKCyAM1bBid5IeuC9qU6RTlvqH8Z5/C+dnl5bNyJ8tn4iJV2X
         q453bHn+0z6ItmK6EFNEOhvvWtISHmuvB/ezCITn98d7QUAmAuO0qmkprgPsJZOV3lqF
         UFbSOp9OZj2x0QocIXz7uzYdkAzFeRNxG4AEDYVa/NGJtw2zKs+nO5enz6UZYJM1OGDU
         ba0BSsT644NFEXAD4IvZ4mqJiHyYtMeo3jW3fxKOrTomo4DHk/HJartw/GLb+6L7YWOZ
         419rPlaSMZlI81l+/UIGX2buE+yUKL9FYo36NPRzWz/sEl+4vK2d49lhFkSOWn9F5TiF
         myTw==
X-Gm-Message-State: AO0yUKVxytDf1uPrtVy7A4SOCt8fiYPKnuuFR+iRhCocuTRQ9J+tG+gw
	/vVZkBJ3jjpQWRvKEMOYxcM=
X-Google-Smtp-Source: AK7set+2F/zIbh/UG/1NomK3tD46DqiIAbQYWGEIVoUW36VvoDwxPxhi9LhQA20JCPy4S7hH7GN9ag==
X-Received: by 2002:a05:600c:45d2:b0:3eb:39e7:35fe with SMTP id s18-20020a05600c45d200b003eb39e735femr12392862wmo.30.1678200270320;
        Tue, 07 Mar 2023 06:44:30 -0800 (PST)
Date: Tue, 7 Mar 2023 15:44:27 +0100
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
Message-ID: <20230307144427.GA997565@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>
 <20230217085006.GA2281468@horizon>
 <7e79d20d-0922-565a-e46d-e3366c0bcfb4@suse.com>
 <20230217092948.GA2282871@horizon>
 <9864e936-5c77-a790-e36c-766d5359cd83@suse.com>
 <20230223121647.GA3260113@horizon>
 <496b1fd7-4540-66c6-be89-51f20a6666ab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <496b1fd7-4540-66c6-be89-51f20a6666ab@suse.com>

On Thu, Feb 23, 2023 at 01:42:08PM +0100, Jan Beulich wrote:
> On 23.02.2023 13:16, Matias Ezequiel Vara Larsen wrote:
> > On Fri, Feb 17, 2023 at 03:10:53PM +0100, Jan Beulich wrote:
> >> On 17.02.2023 10:29, Matias Ezequiel Vara Larsen wrote:
> >>> On Fri, Feb 17, 2023 at 09:57:43AM +0100, Jan Beulich wrote:
> >>>> On 17.02.2023 09:50, Matias Ezequiel Vara Larsen wrote:
> >>>>> On Wed, Dec 14, 2022 at 08:56:57AM +0100, Jan Beulich wrote:
> >>>>>> On 14.12.2022 08:29, Jan Beulich wrote:
> >>>>>>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> >>>>>>>> +static int stats_vcpu_alloc_mfn(struct domain *d)
> >>>>>>>> +{
> >>>>>>>> +    struct page_info *pg;
> >>>>>>>> +
> >>>>>>>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> >>>>>>>
> >>>>>>> The ioreq and vmtrace resources are also allocated this way, but they're
> >>>>>>> HVM-specific. The one here being supposed to be VM-type independent, I'm
> >>>>>>> afraid such pages will be accessible by an "owning" PV domain (it'll
> >>>>>>> need to guess the MFN, but that's no excuse).
> >>>>>>
> >>>>>> Which might be tolerable if it then can't write to the page. That would
> >>>>>> require "locking" the page r/o (from guest pov), which ought to be
> >>>>>> possible by leveraging a variant of what share_xen_page_with_guest()
> >>>>>> does: It marks pages PGT_none with a single type ref. This would mean
> >>>>>> ...
> >>>>>>
> >>>>>>>> +    if ( !pg )
> >>>>>>>> +        return -ENOMEM;
> >>>>>>>> +
> >>>>>>>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
> >>>>>>
> >>>>>> ... using PGT_none here. Afaict this _should_ work, but we have no
> >>>>>> precedent of doing so in the tree, and I may be overlooking something
> >>>>>> which prevents that from working.
> >>>>>>
> >>>>>
> >>>>> I do not fully understand this. I checked share_xen_page_with_guest() and I
> >>>>> think you're talking about doing something like this for each allocated page to
> >>>>> set them ro from a pv guest pov:
> >>>>>
> >>>>> pg->u.inuse.type_info = PGT_none;
> >>>>> pg->u.inuse.type_info |= PGT_validated | 1;
> >>>>> page_set_owner(page, d); // not sure if this is needed
> >>>>>
> >>>>> Then, I should use PGT_none instead of PGT_writable_page in
> >>>>> get_page_and_type(). Am I right?
> >>>>
> >>>> No, if at all possible you should avoid open-coding anything. As said,
> >>>> simply passing PGT_none to get_page_and_type() ought to work (again, as
> >>>> said, unless I'm overlooking something). share_xen_page_with_guest()
> >>>> can do what it does because the page isn't owned yet. For a page with
> >>>> owner you may not fiddle with type_info in such an open-coded manner.
> >>>>
> >>>
> >>> Thanks. I got the following bug when passing PGT_none:
> >>>
> >>> (XEN) Bad type in validate_page 0 t=0000000000000001 c=8040000000000002
> >>> (XEN) Xen BUG at mm.c:2643
> >>
> >> The caller of the function needs to avoid the call not only for writable
> >> and shared pages, but also for this new case of PGT_none.
> > 
> > Thanks. If I understand correctly, _get_page_type() needs to avoid to call
> > validate_page() when type = PGT_none.
> 
> Yes.
> 
> > For the writable and shared pages, this
> > is avoided by setting nx |= PGT_validated. Am I right?
> 
> Well, no, I wouldn't describe it like that. The two (soon three) types not
> requiring validation simply set the flag without calling validate_page().
> 

I see, thanks. I added the corresponding check at _get_page_type() to set the
flag without calling validate_page() for the PGT_none type. I think I am
missing something when I am releasing the pages. I am triggering the following
BUG() when issuing put_page_and_type():
 
(XEN) Xen BUG at mm.c:2698

This is at devalidate_page(). I guess the call to devalidate_page() shall be
also avoided. I was wondering if put_page_and_type() is required in this case.

Matias


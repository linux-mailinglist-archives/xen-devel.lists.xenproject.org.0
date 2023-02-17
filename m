Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246169A821
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 10:30:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496961.767884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSx3y-0003EY-WD; Fri, 17 Feb 2023 09:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496961.767884; Fri, 17 Feb 2023 09:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSx3y-0003Bb-SR; Fri, 17 Feb 2023 09:29:54 +0000
Received: by outflank-mailman (input) for mailman id 496961;
 Fri, 17 Feb 2023 09:29:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+A+B=6N=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pSx3x-0003BV-Ce
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 09:29:53 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a108df7f-aea5-11ed-933c-83870f6b2ba8;
 Fri, 17 Feb 2023 10:29:51 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id bv17so202392wrb.9
 for <xen-devel@lists.xenproject.org>; Fri, 17 Feb 2023 01:29:51 -0800 (PST)
Received: from horizon ([2a01:e0a:257:8c60:48e5:bfa:d652:b8ef])
 by smtp.gmail.com with ESMTPSA id
 p18-20020adff212000000b002c556f36116sm3568249wro.66.2023.02.17.01.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 01:29:50 -0800 (PST)
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
X-Inumbo-ID: a108df7f-aea5-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+CnKws38SoFG+Iotr9LZzcs87sjR8KjZPOY+NQBrX5Q=;
        b=c2brh7P3GaxVTfzbvAHnLy5qVmEgEAahhvPnkhR1I1KqZsWrKgSAETHxunhLeM86j+
         fTUmLwp9fgMNHckRunUtNeMIV0CAF/AHvzYZ/SrkO3RqApW8MlAvSWGprb8iqlGSg67B
         lfU59rTnlBuY8j68dAPDnnPPYmgp7yxaW7NazfGF9WZlWtHzeq89F5YsCt18bkLrkimN
         S5uIb5zyJQVrM217rcoO9VLDPZdusvAG7OPqJaSOZxWFvAuXAz4gHPTPd5wuu2t4FJPI
         s+R/hKGtx6ylypCIxPeEgaxh3CbnbRMicPVcjpjC4YGV6JihXvu+5jvaJhJVlqD70TCZ
         dJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CnKws38SoFG+Iotr9LZzcs87sjR8KjZPOY+NQBrX5Q=;
        b=a9Cv66eK0+bmU3dQInqhGx5dCBFYzdALRiwEg45domptnBUmEhKwAhZsIQG3d5I2cV
         PpY0UUQxW5tSLRfFkFaIqPwPUM6zta4szBXRHwMcsiBNULSc8/BvzGbTBsxpX/BDQL8g
         QbRbY/V2AkPCATNGKlBoTq4s6QEFCM705xGYEUcV7IYbCqZpkIn7jQ9IzPdMLBajdvIp
         P86BXIqj33E7bzaF9SEOSKjo49JYs39YFbFoJ7Z4YwWlMb69dipIja7rFQoRU+wkWNrm
         2f/OOHqbelGVUs+AssR7KzMpd8N1u8OhF0tsufuaCMVq7voeW3UA+A7C7lVUhNmK1R6u
         Pwgg==
X-Gm-Message-State: AO0yUKU98JEUUYRmIG8kKlOAy2tRQmKnf3Bv/lXMokn+lA9rWelQj6gv
	KzmC2RhlFL/73foqxC/QIZI=
X-Google-Smtp-Source: AK7set+um+cetIzM97JyQniiJF2RYPDbslxv7L0ofhOwyfSNYSPjsP1EU8fgGcSfPpYIq7OFbrH0YA==
X-Received: by 2002:a5d:50c2:0:b0:2c5:55a1:4b2 with SMTP id f2-20020a5d50c2000000b002c555a104b2mr6363433wrt.49.1676626190960;
        Fri, 17 Feb 2023 01:29:50 -0800 (PST)
Date: Fri, 17 Feb 2023 10:29:48 +0100
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
Message-ID: <20230217092948.GA2282871@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>
 <20230217085006.GA2281468@horizon>
 <7e79d20d-0922-565a-e46d-e3366c0bcfb4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e79d20d-0922-565a-e46d-e3366c0bcfb4@suse.com>

On Fri, Feb 17, 2023 at 09:57:43AM +0100, Jan Beulich wrote:
> On 17.02.2023 09:50, Matias Ezequiel Vara Larsen wrote:
> > On Wed, Dec 14, 2022 at 08:56:57AM +0100, Jan Beulich wrote:
> >> On 14.12.2022 08:29, Jan Beulich wrote:
> >>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> >>>> +static int stats_vcpu_alloc_mfn(struct domain *d)
> >>>> +{
> >>>> +    struct page_info *pg;
> >>>> +
> >>>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> >>>
> >>> The ioreq and vmtrace resources are also allocated this way, but they're
> >>> HVM-specific. The one here being supposed to be VM-type independent, I'm
> >>> afraid such pages will be accessible by an "owning" PV domain (it'll
> >>> need to guess the MFN, but that's no excuse).
> >>
> >> Which might be tolerable if it then can't write to the page. That would
> >> require "locking" the page r/o (from guest pov), which ought to be
> >> possible by leveraging a variant of what share_xen_page_with_guest()
> >> does: It marks pages PGT_none with a single type ref. This would mean
> >> ...
> >>
> >>>> +    if ( !pg )
> >>>> +        return -ENOMEM;
> >>>> +
> >>>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
> >>
> >> ... using PGT_none here. Afaict this _should_ work, but we have no
> >> precedent of doing so in the tree, and I may be overlooking something
> >> which prevents that from working.
> >>
> > 
> > I do not fully understand this. I checked share_xen_page_with_guest() and I
> > think you're talking about doing something like this for each allocated page to
> > set them ro from a pv guest pov:
> > 
> > pg->u.inuse.type_info = PGT_none;
> > pg->u.inuse.type_info |= PGT_validated | 1;
> > page_set_owner(page, d); // not sure if this is needed
> > 
> > Then, I should use PGT_none instead of PGT_writable_page in
> > get_page_and_type(). Am I right?
> 
> No, if at all possible you should avoid open-coding anything. As said,
> simply passing PGT_none to get_page_and_type() ought to work (again, as
> said, unless I'm overlooking something). share_xen_page_with_guest()
> can do what it does because the page isn't owned yet. For a page with
> owner you may not fiddle with type_info in such an open-coded manner.
> 

Thanks. I got the following bug when passing PGT_none:

(XEN) Bad type in validate_page 0 t=0000000000000001 c=8040000000000002
(XEN) Xen BUG at mm.c:2643

I did not investigate yet why this has happened.

Matias


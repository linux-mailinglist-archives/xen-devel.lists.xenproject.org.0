Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440DB445749
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 17:34:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221742.383600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifgA-0005nt-4r; Thu, 04 Nov 2021 16:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221742.383600; Thu, 04 Nov 2021 16:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifgA-0005l6-10; Thu, 04 Nov 2021 16:33:30 +0000
Received: by outflank-mailman (input) for mailman id 221742;
 Thu, 04 Nov 2021 16:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCzN=PX=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1mifg8-0005l0-P7
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:33:28 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f042b5aa-3d8c-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 17:33:27 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id r10so9301379ljj.11
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 09:33:27 -0700 (PDT)
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
X-Inumbo-ID: f042b5aa-3d8c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yz2Y7QOiHVchOO59o14q/Dic0tEfeCO9FutwyuxprH8=;
        b=k/YnnsYr+eGTSuiZtOeOVaKVhiUAtX5L4LeXT1MzGn+e2Wo1f2Y6VlHvPotZdv/DBv
         ZoSVtFKuhhJ6zyrIgTJYyWh7jga8Ci43q7kGvCGFvGJL5tzAiVLg8ZT1bgX3eLLHJMW7
         eE+TkJPYeDGHAkyHN+8wgO0OA9BnlE8Li8cT3Z6+SEl4cGCQ69CVHC3UzwP5IM0hG13T
         wF6SLIE+9Q8u2WsGKWsl+wzHHRe/CuMlWMfPbOTc3hRC366m0FzzdFOrFDz4zidsjxBs
         gYgn7oGBaWV52NmRjEPW7IhCDjWwf76UmBg4u0eCBVONpll4XNfPoAyuZHcL+KR0dcen
         PKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yz2Y7QOiHVchOO59o14q/Dic0tEfeCO9FutwyuxprH8=;
        b=haUjcTYg3tosBkcEnIpXXqxA1GxUh42i2SYX+Knbb3rAUbGpyjLsMvkJ7zsdGeXLmM
         BtCOI26t2/dc3sELuxkd9hhNBOGlVFbvgWkUWwavrqA7uJxdSgzGkXNVQk9loXA5IwvG
         2eOUE1/CWsuWyBF8G1T6ZRJFanoOXfsx1n39q7cjFYHpfXhg5YJFy5/G1CkpbsFxjEgf
         g6YzCtsOYoYSX642H13n9zMUvwB74cn82PzliDC2rnQoFye9NWAe4/QY3fnziEKzZfm1
         4t7GycIUhpRXYwh4Lg0cjSfBeMhLmO/b7HnpsYa83T0dyqyWiQpeuIpqm9ZXBNCarsMf
         lqiA==
X-Gm-Message-State: AOAM533URR/I8KwxHtSXlL5L6M60UyLg+PRJUgrlp+6U6As3lZ/4eQv/
	xgJVmkvhc2ycW0NdJikxpAkncybllvM7/9qsezYqcVd7
X-Google-Smtp-Source: ABdhPJzIk3yIcqmUuR19+Bn2lCLxvu8VlLpF6JPbvdi+3ChJbxEz7XA3BSjQVXkyxGhaint9GBVDwnzwoNa0vPudR1w=
X-Received: by 2002:a2e:9dd5:: with SMTP id x21mr8582702ljj.459.1636043607331;
 Thu, 04 Nov 2021 09:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211104144242.14351-1-jgross@suse.com> <54900dfb-c6fa-a2ad-471c-227a4888c687@citrix.com>
In-Reply-To: <54900dfb-c6fa-a2ad-471c-227a4888c687@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 4 Nov 2021 12:33:15 -0400
Message-ID: <CAKf6xptNXd=eB0KNb=40CjqvzOT9xR8vMM-tV6e7DWez6AWKMg@mail.gmail.com>
Subject: Re: [PATCH-for-4.16] tools/helpers: fix broken xenstore stubdom init
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021 at 11:00 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 04/11/2021 14:42, Juergen Gross wrote:
> > Commit 1787cc167906f3f ("libs/guest: Move the guest ABI check earlier
> > into xc_dom_parse_image()") broke starting the xenstore stubdom. This
> > is due to a rather special way the xenstore stubdom domain config is
> > being initialized: in order to support both, PV and PVH stubdom,
> > init-xenstore-domain is using xc_dom_parse_image() to find the correct
> > domain type. Unfortunately above commit requires xc_dom_boot_xen_init()
> > to have been called before using xc_dom_parse_image(). This requires
> > the domid, which is known only after xc_domain_create(), which requires
> > the domain type.
> >
> > In order to break this circular dependency, call xc_dom_boot_xen_init()
> > with an arbitrary domid first, and then set dom->guest_domid later.
> >
> > Fixes: 1787cc167906f3f ("libs/guest: Move the guest ABI check earlier into xc_dom_parse_image()")
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Release-acked-by: Ian Jackson <iwj@xenproject.org>
>
> This is all rather nasty, and really highlights problems with the
> libxenguest abi, because you really ought to be able to ask "what ELF
> properties do I have on my hand" without an implicit "and try to start
> building a VM using it" on the side.
>
> I agree this is probably the best thing to do right now.

Yes, this is probably the best change before release.

If xc_dom_allocate() filled in dom->xen_version & dom->xen_caps - i.e.
move that from xc_dom_boot_xen_init() - then I think this patch
wouldn't be necessary.  But there could be side effects of such a
change.

Regards,
Jason


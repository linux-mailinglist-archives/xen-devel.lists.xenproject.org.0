Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0E654524
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 17:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468570.727686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8OOy-0003dC-Qf; Thu, 22 Dec 2022 16:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468570.727686; Thu, 22 Dec 2022 16:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8OOy-0003Zu-NI; Thu, 22 Dec 2022 16:26:36 +0000
Received: by outflank-mailman (input) for mailman id 468570;
 Thu, 22 Dec 2022 16:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XT/F=4U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1p8OOw-0003Zo-S2
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 16:26:34 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eed4545-8215-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 17:26:21 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id m19so3613230edj.8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Dec 2022 08:26:33 -0800 (PST)
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
X-Inumbo-ID: 5eed4545-8215-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iq67OOd4GB12XumvXMWdfq1c8+nhWDTdLvSG9nmb+Wg=;
        b=hef6koV9ac5g9cO0USpCc5qAdmqD3dzgxtXQ40ZlVPwiNux6+vYeqXHrPOWTOXF+NI
         0n8jLBHUpJJ9/i6jR1JhKLuhFB1iVAbQ1ckGXWaQQpN1ZSRuTQOoJxWsro5Mwl7oOs+H
         yOLIZxwdTui8B57vypjK2pO/s+lBVjdnQEHHrvJZrOaFHs4s01sGR/y6UGiUKiy+RZFt
         Ln4GIKBvbgiQwPpwcA0XShkaxDlwDN65AnJcQXLvrNLbfL7DbP+3ZAALnAm2NVrNJmea
         LA8TQr0RzBQyEX6aP03IOaMC17Tp/Ee8LKyrt0cnXHl0kB3LkuHm3AskrPycbO2rhDhb
         7pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iq67OOd4GB12XumvXMWdfq1c8+nhWDTdLvSG9nmb+Wg=;
        b=KWBsplHhEs6x3MLmT1S84jK+No+qeZspDsREAH70XZPJG0nw5lIWs9RkaL00MH1SU1
         xxXgt3Kpxu0x8ZQpYtumXB5ZhlDlR6PBmSc11CJJdEuLsl8mCGYR/PeDJS5GudSxiMam
         NbV/UxgrQOJQoh+n38N0WRdfAMKKGcFWbnmO3s7X61pDfO3HZria9EY6QOkgNOnLhWXA
         31fWgvtI3ApbjTVuzAgsGdryoqwqaW9VBTUeDXf4G8+uesf3jj4qxkOwqfSdlALRo3Gk
         fN4b3lYHukMCHBqnK1e0E4Bnek4wQlmPLjs3kNA7tJk0ndJws9Q83MBrIcOa8dJJ2mnr
         UL4g==
X-Gm-Message-State: AFqh2kqUKzwe7uy6DZmj9GN4pDsyMWiO9fTtONlwvr9/Zuz2+26BMyw3
	R/HvmnqWD7dmePnQzWv0fge+fPWQ4hvFJGmeKTpKxQ==
X-Google-Smtp-Source: AMrXdXsQ/BJzbLk0JpDNmIAyA0rKn99xok4DWenRVqAoG+gE/RszXghzp2ftz4J7ylG8xOMq/mR5M6zCMTw41S1toko=
X-Received: by 2002:a05:6402:d72:b0:475:de4a:3740 with SMTP id
 ec50-20020a0564020d7200b00475de4a3740mr574925edb.117.1671726392638; Thu, 22
 Dec 2022 08:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20221022160837.8497-1-carlo.nonato@minervasys.tech> <13a149a3-9b7c-bb8b-afed-2805000e9c48@suse.com>
In-Reply-To: <13a149a3-9b7c-bb8b-afed-2805000e9c48@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 22 Dec 2022 17:26:21 +0100
Message-ID: <CAG+AhRXPwBFkAjxe6HHWqzEcaM7QRsKLvQqJAA4GfDqnrj8gqA@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/common: cache colored buddy allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: marco.solieri@unimore.it, andrea.bastoni@minervasys.tech, 
	lucmiccio@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan

On Wed, Dec 7, 2022 at 12:52 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 22.10.2022 18:08, Carlo Nonato wrote:
> > This commit replaces the colored allocator for domains with a simple buddy
> > allocator indexed also by colors, so that it can allocate pages based on
> > some coloring configuration.
> >
> > It applies on top of Arm cache coloring (v3) as sent to the mailing list.
> >
> > This has two benefits:
> >  - order can now be greater than 0 if the color config contains a
> >    sufficient number of adjacent colors starting from an order aligned
> >    one;
>
> But still not large enough to reach the order needed for large page
> mappings, aiui?

Yeah, but that's because it's difficult, AFAIK, to have a platform with that
number of colors (e.g. level-2 mappings requires 512 adjacent colors, so a
32 MiB cache).

Using large pages should be possible only when all colors are selected for a
domain, but this implementation isn't that smart. The maximum order is
determined only by the number of colors of the platform
(e.g. 32 colors := order 5).
Anyway the colored allocator is useless if a domain can use all colors, so
in that situation I would switch to the normal buddy.

> >  - same benefits of the normal buddy: constant time alloc and free
> >    (constant with respect to the number of pages, not for the number of
> >    colors);
> >
> > But also one "big" cons:
> >  - given the way Xen queries the allocator, it can only serve larger pages
> >    first and only when a domain runs out of those, it can go with the smaller
> >    ones. Let's say that domain 0 has 31 colors out of 32 total (0-30 out of
> >    0-31). The order-4 pages (0-15) are allocated first and then the order-3
> >    (16-23, since 0-7 and 8-15 are all already allocated), and then order-2
> >    and so on. The result is... the domain practically uses only one half of
> >    the colors that it should.
>
> What's unclear to me is how big of a con this is, i.e. how reasonable it is
> for someone to configure a domain to use all except one of the colors (and
> not, say, half of them).

Well that was just an extreme example, but many configurations are affected.
Basically the best configuration is one that is "aligned" to a power of 2
(e.g. 0-3, 4-7, 16-31). Everything else that "mixes" powers of 2 (e.g. 0-5,
4-9, 16-18) will see this behavior where bigger chunks are preferred and it
practically makes the domain use less of its cache partitions.

The user could be warned about this in the docs, but it would also require
extensive testing to see if there are any other drawbacks.

> Jan

Thanks.

- Carlo Nonato


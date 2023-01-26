Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D8B67C9A3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 12:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484961.751880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL0I8-0001U1-Bb; Thu, 26 Jan 2023 11:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484961.751880; Thu, 26 Jan 2023 11:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL0I8-0001SI-7j; Thu, 26 Jan 2023 11:19:40 +0000
Received: by outflank-mailman (input) for mailman id 484961;
 Thu, 26 Jan 2023 11:19:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9FD=5X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pL0I6-0001S5-UU
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 11:19:38 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51d9962c-9d6b-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 12:19:38 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id m2so3687763ejb.8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 03:19:37 -0800 (PST)
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
X-Inumbo-ID: 51d9962c-9d6b-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fzQGTWbaPl1YN/xW9eCb7OJQZkAto1uIKcuM5Qbgrr4=;
        b=GQflZ1jhsRdZiuXW1FlGyi4SBuecrs3kxu/buHb10WvVv5xh9vzlL5wYDj3KIuzJh9
         7cBEwFyXiQBu6QEvtzScVk/744a7UPHPtSvkyoV0DoAo8yag4zp0DfxciI4A0BH9sl3I
         8rkQripbWk+DrCXxwTEqeib1BR0eHi/RM8HIzBVR1Lsd8Eb5FiW1Inmt0iPjaLRPxI3w
         JN8W/gjFhulkgFJxM2wK3Ndr+xYhxmIopU5F/eYMxQH+0DPQj6W+psy1f/m6ZPBK0ab4
         VVpLGCLrxZvVOoRJlKP2W6bpgQ3Si37Z+oiSrCRxiFhJivD0WWaNPdr16Q1oT9YQXTZI
         BiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzQGTWbaPl1YN/xW9eCb7OJQZkAto1uIKcuM5Qbgrr4=;
        b=HthcU0Nta5B4os6vwzoja61T627ag19b3H9pRHwyfiOAwRZtgjldQ05PVIPVuCmf3f
         f5K2B6D+oSGpw0bnngeyEH3Pb8yRZtSs9GtqMmxhDhrglOsg/15sVPzL7r6VZz6YmV1v
         mNmyWyAWPJqwMkoL+1WhpAVGsfOFz9TLVxV7JY/xUYFldGExux/NuO/RF6hr9p2irUMM
         FAVeGIpzUzBWd1Pn0oI4Ff1uKyXLQShOcDXpqImrg37Dm9Ok5J1l/lppEiiyRguq5Kpl
         U0KBtQLblTLpCwj+46kKTRgmL/5A6lTvi61SZcFVaxpejHulTCNfbpvp11DdjKfL/EgP
         AjSQ==
X-Gm-Message-State: AFqh2kqIKp0/z6WvRgfl3B1WxcTHvQ69v8Y46URtZ/cZD/29tN6ZVsnt
	mYH9hnbtpDMBlQEISvnI6fxY6mFdvtqg3i69kDUsQg==
X-Google-Smtp-Source: AMrXdXtSdARUMR/fTagNMtjfnY8gpMcble7Fdibe1YB8/nvg2agNvodYiUdS72YXnZaQxc7KS5eBsJbFSrXp0BLNZTA=
X-Received: by 2002:a17:907:10d0:b0:84d:49c2:8701 with SMTP id
 rv16-20020a17090710d000b0084d49c28701mr4049092ejb.236.1674731977601; Thu, 26
 Jan 2023 03:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-5-carlo.nonato@minervasys.tech> <9bfee6d9-9cb2-262e-5a46-91b0bf35d60b@suse.com>
 <CAG+AhRW+45gt7ZyOYSjaQZbfLORNsJVeADk_Tb7j9CEyTcY6QQ@mail.gmail.com> <0ec4c364-1e18-4176-ac24-ece84eb72859@xen.org>
In-Reply-To: <0ec4c364-1e18-4176-ac24-ece84eb72859@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 26 Jan 2023 12:19:26 +0100
Message-ID: <CAG+AhRVF+XEbbkARh5VuZuh2JiE6J3Z3yXvXQCwD_vrLDhCB6Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] xen: extend domctl interface for cache coloring
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Julien and Jan,

On Thu, Jan 26, 2023 at 11:21 AM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 25/01/2023 16:27, Carlo Nonato wrote:
> > On Tue, Jan 24, 2023 at 5:29 PM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 23.01.2023 16:47, Carlo Nonato wrote:
> >>> @@ -275,6 +276,19 @@ unsigned int *dom0_llc_colors(unsigned int *num_colors)
> >>>       return colors;
> >>>   }
> >>>
> >>> +unsigned int *llc_colors_from_guest(struct xen_domctl_createdomain *config)
> >>
> >> const struct ...?
> >>
> >>> +{
> >>> +    unsigned int *colors;
> >>> +
> >>> +    if ( !config->num_llc_colors )
> >>> +        return NULL;
> >>> +
> >>> +    colors = alloc_colors(config->num_llc_colors);
> >>
> >> Error handling needs to occur here; the panic() in alloc_colors() needs
> >> to go away.
> >>
> >>> @@ -434,7 +436,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >>>               rover = dom;
> >>>           }
> >>>
> >>> -        d = domain_create(dom, &op->u.createdomain, false);
> >>> +        if ( llc_coloring_enabled )
> >>> +        {
> >>> +            llc_colors = llc_colors_from_guest(&op->u.createdomain);
> >>> +            num_llc_colors = op->u.createdomain.num_llc_colors;
> >>
> >> I think you would better avoid setting num_llc_colors to non-zero if
> >> you got back NULL from the function. It's at best confusing.
> >>
> >>> @@ -92,6 +92,10 @@ struct xen_domctl_createdomain {
> >>>       /* CPU pool to use; specify 0 or a specific existing pool */
> >>>       uint32_t cpupool_id;
> >>>
> >>> +    /* IN LLC coloring parameters */
> >>> +    uint32_t num_llc_colors;
> >>> +    XEN_GUEST_HANDLE(uint32) llc_colors;
> >>
> >> Despite your earlier replies I continue to be unconvinced that this
> >> is information which needs to be available right at domain_create.
> >> Without that you'd also get away without the sufficiently odd
> >> domain_create_llc_colored(). (Odd because: Think of two or three
> >> more extended features appearing, all of which want a special cased
> >> domain_create().)
> >
> > Yes, I definitely see your point. Still there is the p2m table allocation
> > problem that you and Julien have discussed previously. I'm not sure I
> > understood what the approach is.
>
> Henry has sent a series [1] to remove the requirement to allocate the
> P2M in domain_create().
>
> With that series applied, there requirements to pass the colors at
> domain creation should be lifted.
>
> Cheers,
>
> [1]
> https://lore.kernel.org/xen-devel/20230116015820.1269387-1-Henry.Wang@arm.com/

Really nice. Thanks to both.

> >
> >> Jan
>
> --
> Julien Grall


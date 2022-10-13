Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE55FD743
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 11:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421813.667456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuo9-0008Sg-4s; Thu, 13 Oct 2022 09:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421813.667456; Thu, 13 Oct 2022 09:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuo9-0008Pu-19; Thu, 13 Oct 2022 09:47:17 +0000
Received: by outflank-mailman (input) for mailman id 421813;
 Thu, 13 Oct 2022 09:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gb4P=2O=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oiuo6-0008Po-Uw
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 09:47:15 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03bff0e3-4adc-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 11:47:13 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id g27so1797560edf.11
 for <xen-devel@lists.xenproject.org>; Thu, 13 Oct 2022 02:47:13 -0700 (PDT)
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
X-Inumbo-ID: 03bff0e3-4adc-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WMxGgyKSPXgX14QdWonh6vKEYtzJ2E+2hpZMkL1+vAg=;
        b=aOaHX85oqrpq03UkXi4U2jFQnaNHB1n7I9+BIqgtfsk+Lqi2OQZDlVNklGeOG6t7lJ
         sP1jN7xOFfHAXh6/jBBcgxPw1YZNax1bpDclPOBy1h56xgz3gakHFAInqdh2xEo+c4Mv
         3JTfeeCm/dIibBWfs3SGSWqvXT5f8lCfeJF2QWvgy+Qb/TaNTh2Ss8e5wA1CjyFcmzM1
         0Yyf264xXufSLrZ6aT48JCE0RykeWLA5YhcodxMeUn3MWLSQ3JbuqftehSBwXtTs8qvc
         NwlYFZFgObEQ9/nUFwRT2vF+AJFXcPuKzwu24qx2r0tNSg4UtdHR2RtDWubeIPWFNlug
         e1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMxGgyKSPXgX14QdWonh6vKEYtzJ2E+2hpZMkL1+vAg=;
        b=E6x7E+KxtZhCD2rVe6kHtzUEaKoST0NbImCWQYf1JvfDJIUu6+Gn51fuASQkFGZci8
         s1ozgnSC3K04YApxweXV6ZZMXJGb/grbZwAnXvjhML7B85fkK0DzMh1I/V9yMp1bjPZA
         VPET+X31NvXJeWx/PdcXpC5A35zMHNXEGbpVvPlwMOy9AkjkH/WZqP3J1WGVX1jy4nE1
         csvCW9jEgR+vtzwcyg3rI8lHAyjCUxQ4gKgNfOepufMjOtwVTUxYnvohUr2u63HiMV1V
         HGX/qAriP5mYJxlkEVj9RbOzrlx+LXYwYrRlD3sWhWreVoXjjNiefCVdcdWzxIl7u9em
         ouow==
X-Gm-Message-State: ACrzQf2wAFLwy6Od8P0yHt4qVIYpYgp7UU5ZBxxdj2Z7gtcNzoyuZRMb
	hb9lGdWmIKkkt1iWgtPQXfG9OXck7KI0/+DEcC2CZQ==
X-Google-Smtp-Source: AMsMyM6Zyi/ntFev8wMj+LBsEC0fcx3X1rtfq5+XvO7k40Ugy1i63uuPHp8RQoPEjlwlpEob0+4lOPICJBjRVemMurI=
X-Received: by 2002:a05:6402:190f:b0:45b:d959:e2ae with SMTP id
 e15-20020a056402190f00b0045bd959e2aemr23423681edz.187.1665654433167; Thu, 13
 Oct 2022 02:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-7-carlo.nonato@minervasys.tech> <32e2a752-975f-baa6-8d6c-ba27cf516c64@suse.com>
 <CAG+AhRUJ0+CszWjSzO7=v4SmKtjG7VMpZ8P050s-rLz0rgXJBw@mail.gmail.com> <5e5ee6f1-a5fc-fcd4-5d61-7f1e4be6b630@suse.com>
In-Reply-To: <5e5ee6f1-a5fc-fcd4-5d61-7f1e4be6b630@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 13 Oct 2022 11:47:02 +0200
Message-ID: <CAG+AhRWXi8V142aSx_P1cjyaXTb+CnS-EOB_o8c4Y7ZkBt7Gkg@mail.gmail.com>
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Jan


On Mon, Sep 19, 2022 at 8:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.09.2022 18:05, Carlo Nonato wrote:
> > On Thu, Sep 15, 2022 at 3:13 PM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 26.08.2022 14:51, Carlo Nonato wrote:
> >>> --- a/xen/arch/arm/coloring.c
> >>> +++ b/xen/arch/arm/coloring.c
> >>> @@ -300,6 +300,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
> >>>      config->num_colors = (uint16_t)num;
> >>>  }
> >>>
> >>> +unsigned int page_to_color(struct page_info *pg)
> >>
> >> The parameter will want to be pointer-to-const and I wonder whether ...
> >>
> >>> +{
> >>> +    return addr_to_color(page_to_maddr(pg));
> >>> +}
> >>
> >> ... the function as a whole wouldn't be a good candidate for being an
> >> inline one (requiring addr_to_color() to be available in outside of
> >> this file, of course).
> >
> > You mean defining it as static inline in the coloring.h header?
>
> That would seem preferable for a simple function like this one.
>

I didn't want to expose that function since I would also have to expose
the addr_col_mask global variable.
Same goes for get_max_colors(): it exist only for the purpose to restrict
the max_colors variable visibility.

> >>> +    page_list_for_each( pos, head )
> >>> +    {
> >>> +        if ( page_to_maddr(pos) < page_to_maddr(pg) )
> >>> +        {
> >>> +            head = &pos->list;
> >>> +            break;
> >>> +        }
> >>> +    }
> >>
> >> Wait - a linear search for every single page insertion? How well
> >> is that going to perform on a multi-terabyte system?
> >
> > For our test cases (embedded systems) the linear search is good enough.
> > I agree with you that in the general case this is bad (even though the main
> > targets are indeed embedded systems).
> > Are there any already available data structures that we can exploit to get
> > better performances?
>
> I'm afraid there aren't any that I would see as a good fit here.
>

Regarding this I can see three options:
1) We leave it as it is and we warn the user in the docs that cache coloring
   is embedded system specific for the moment since it has, probably, bad
   performances with bigger systems.
2) We use some priority queue implementation to replace the actual lists.
   Red/black trees are available in Xen codebase, but I think I would have
   to change the page_info struct to use them.
   Maybe just a binary heap implemented as an array could be viable, but that
   would require me to implement somewhere the logic for insertion,
   extract-min and other operations.
3) I have a working prototype of a buddy allocator that also makes use of
   coloring information. It isn't an extension of the main one, but rather a
   simpler version. This means that nodes, zones, scrubbing, aren't
   supported, but this is true also for the already submitted colored
   allocator. With this, order > 0 pages can be served (up until
   log2(max_colors)) and insertion is no more linear, but constant instead.

>
> Jan

Thanks

- Carlo Nonato


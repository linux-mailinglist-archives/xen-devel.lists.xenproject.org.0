Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9A067B6EE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 17:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484463.751051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKicg-0003HO-As; Wed, 25 Jan 2023 16:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484463.751051; Wed, 25 Jan 2023 16:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKicg-0003Fg-7q; Wed, 25 Jan 2023 16:27:42 +0000
Received: by outflank-mailman (input) for mailman id 484463;
 Wed, 25 Jan 2023 16:27:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDzi=5W=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pKicf-0003Fa-9a
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 16:27:41 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fc39f21-9ccd-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 17:27:40 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id x36so22315909ede.13
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 08:27:40 -0800 (PST)
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
X-Inumbo-ID: 2fc39f21-9ccd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WS75iCaS6galYLsMegPWqZEfP46Cp6WNhxt3bRqb4rU=;
        b=UO8LOEsqvtm0j+3zYsk71B/p7/eQxfb/IlPM7s6iyvuHzW3hSCtjXlE5RTMZdoOwfc
         kjFTzSFVPJfNgLA+NjTsIy8CX3w+rptEp/x/oi1r3oc6Q9VdHgzabcfv6a/vZGv0u8uD
         KBp0+24TBWsj6kNBrooPMEIfCNBJx/3iNH4ItoSmG34rlq0jneLfK6WIOSLJTftbEKE2
         fjmlDmtF91Bctjb5h7i+iTEZRBx0MwnbLg6gHqkUc+HEntOsH06YKUL2QlvnnhZiUdFR
         n2NcLTno14X/Qtp7j6suFf9Ozp2UiobrZ40hI2QhM7b9taseyudSJQg/ofh4VSvEddd6
         UlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS75iCaS6galYLsMegPWqZEfP46Cp6WNhxt3bRqb4rU=;
        b=OrJ2/6iM7lJZnpbkTqBtWqXXpzFd4ne4HQ2czyHWBkopHsuDR9wRDuDpQQzhu/PBjF
         Oq0HuTlS9djhZA2h8QX6Of5qUiifiLxKcrtt2YT9BH0LQGORQioSXv6RxKyRvpcYCdid
         9AHzTGIHwB/HWx+C8ofR+AIpPcS6MNTU/h0U8fye69pumw5wU4Y5bVuSwUolinn13FkD
         /AgrB1OcYx9QMC1nUWxAn/Cc/Ro7xdDEbaC+uOxtHawC22+HLOZ75gaEgBpo3p/b4Tqi
         ip64WLysHRUcm9SKD7v6ZobYYL+AgbzFKt1nISBbevKo1myBAgUiLwTpfOd4FmWmFWiI
         i0vw==
X-Gm-Message-State: AFqh2koRQ5bzQuTsoULFL3+WTKCQvrb5PRqGddKN0KXAQHB4PKPt5zct
	UJo/o+cMtigcWXA9WqUBW9Mgmziryvz4R+1HohxO2g==
X-Google-Smtp-Source: AMrXdXsdo4fehNIz56UMinSeYMqrq2QMT2zXwlDBfPsrTeaZfkH2znNcH6ajROt0vVcuD9k8ul57xlzl0np9CIhrhvU=
X-Received: by 2002:aa7:c681:0:b0:461:e3f2:38bc with SMTP id
 n1-20020aa7c681000000b00461e3f238bcmr4528316edq.149.1674664059977; Wed, 25
 Jan 2023 08:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-5-carlo.nonato@minervasys.tech> <9bfee6d9-9cb2-262e-5a46-91b0bf35d60b@suse.com>
In-Reply-To: <9bfee6d9-9cb2-262e-5a46-91b0bf35d60b@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 25 Jan 2023 17:27:29 +0100
Message-ID: <CAG+AhRW+45gt7ZyOYSjaQZbfLORNsJVeADk_Tb7j9CEyTcY6QQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] xen: extend domctl interface for cache coloring
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Tue, Jan 24, 2023 at 5:29 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.01.2023 16:47, Carlo Nonato wrote:
> > @@ -275,6 +276,19 @@ unsigned int *dom0_llc_colors(unsigned int *num_colors)
> >      return colors;
> >  }
> >
> > +unsigned int *llc_colors_from_guest(struct xen_domctl_createdomain *config)
>
> const struct ...?
>
> > +{
> > +    unsigned int *colors;
> > +
> > +    if ( !config->num_llc_colors )
> > +        return NULL;
> > +
> > +    colors = alloc_colors(config->num_llc_colors);
>
> Error handling needs to occur here; the panic() in alloc_colors() needs
> to go away.
>
> > @@ -434,7 +436,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >              rover = dom;
> >          }
> >
> > -        d = domain_create(dom, &op->u.createdomain, false);
> > +        if ( llc_coloring_enabled )
> > +        {
> > +            llc_colors = llc_colors_from_guest(&op->u.createdomain);
> > +            num_llc_colors = op->u.createdomain.num_llc_colors;
>
> I think you would better avoid setting num_llc_colors to non-zero if
> you got back NULL from the function. It's at best confusing.
>
> > @@ -92,6 +92,10 @@ struct xen_domctl_createdomain {
> >      /* CPU pool to use; specify 0 or a specific existing pool */
> >      uint32_t cpupool_id;
> >
> > +    /* IN LLC coloring parameters */
> > +    uint32_t num_llc_colors;
> > +    XEN_GUEST_HANDLE(uint32) llc_colors;
>
> Despite your earlier replies I continue to be unconvinced that this
> is information which needs to be available right at domain_create.
> Without that you'd also get away without the sufficiently odd
> domain_create_llc_colored(). (Odd because: Think of two or three
> more extended features appearing, all of which want a special cased
> domain_create().)

Yes, I definitely see your point. Still there is the p2m table allocation
problem that you and Julien have discussed previously. I'm not sure I
understood what the approach is.

> Jan


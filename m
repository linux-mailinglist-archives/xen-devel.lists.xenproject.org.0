Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F439AD71
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 00:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136568.253145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lovUp-0004Ck-5t; Thu, 03 Jun 2021 22:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136568.253145; Thu, 03 Jun 2021 22:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lovUp-0004AI-2j; Thu, 03 Jun 2021 22:07:23 +0000
Received: by outflank-mailman (input) for mailman id 136568;
 Thu, 03 Jun 2021 22:07:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bdf=K5=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1lovUn-0004AC-HU
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 22:07:21 +0000
Received: from mail-ej1-x629.google.com (unknown [2a00:1450:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f75b3ef9-fe9b-41c5-b618-96d8faa1fb97;
 Thu, 03 Jun 2021 22:07:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id k7so11417441ejv.12
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 15:07:20 -0700 (PDT)
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
X-Inumbo-ID: f75b3ef9-fe9b-41c5-b618-96d8faa1fb97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fTwcjmwhNEADbX/Ob8xBzd2SXmTk5gXlTEv1cMtlxa0=;
        b=pAjZ0ZoXVUivt/xg82DQQU2Xo+JPZqnyDiCwTeA2vIs87m+etMYvbgKdBfJSmWIWLT
         TtCr2oOpEflb6YL/P0NwNcwubka2GkHlTuPLIMxZ4RZQDmHKsk9BG+Sok//rifxrp0gF
         eksmHx0X5wIyK7KcAWBtYncR0/EnM7HiGb6HtUDcN7pUEV1IzmdtnfppHCvUhm3Ib95W
         1x1PIm28tfZHxV3jNS5aFmujnXuwvUcvD5l+oySrgxJk4WSiMDO7tcD73bGE1sXBFCi3
         S5EdPOJSXctbsoiKCyBGCaxldabFHcaN7PqYfPfYjpGtwKrDW3iGaEsyaKxV/B/BzThr
         7veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fTwcjmwhNEADbX/Ob8xBzd2SXmTk5gXlTEv1cMtlxa0=;
        b=Th+vkHRKu1ljJD5PIG6/YaJF4M5R65GvgeCQ0gQQ8ys48zjaApYNQjIzmg/u97s+4c
         GRod8IN0FvYW4DVEOFEcFtc8KZghZISl4lGvaPAjofaz03kUpv+CePvmvturp9jIkzsZ
         bSxFK1lGAI+6NTdZoeH+vK+MkicIWJouHwuq7L0xANdqrSvbiuRfil51YbBkLIDoi68K
         AP12eZwbFu+zGk4jTBnXWAmAG8uiyTVV1/LlTBv0W6Ycc23SYEgwJP5b+Z9+ZRPnbhNL
         tqV0oJRB61r8BnGNYgWp/e0XuxAZwO0IqUnw/fwcgHaR/4IsE0G25yVOsTGiS2BKOQAQ
         mW8w==
X-Gm-Message-State: AOAM5317fvZkGmVjSWNM8eWezQRtnPC971hRvwv0/mNl2frxEA1NiEHe
	r8A5kafTotC/9jx1b1Qfk0nkpdQZm1qVrbLE4gY=
X-Google-Smtp-Source: ABdhPJz8dlimJ5xx0btkf+kXPsCHFyqiefzOTAPlzlinf2CIqkvR5O2iysZrIMOV1oLUYyXJBfPfJtu9HdCVuazcllk=
X-Received: by 2002:a17:906:b10e:: with SMTP id u14mr1228007ejy.546.1622758039673;
 Thu, 03 Jun 2021 15:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210518052113.725808-1-penny.zheng@arm.com> <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org> <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org> <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org> <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org> <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 3 Jun 2021 23:07:08 +0100
Message-ID: <CAJ=z9a234ANQDR7BmtSm4AT0k3jrCn67s4b3zZ+jdkUgBMahbw@mail.gmail.com>
Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <Penny.Zheng@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 3 Jun 2021 at 22:33, Stefano Stabellini <sstabellini@kernel.org> wrote:
> On Thu, 3 Jun 2021, Julien Grall wrote:
> > On 02/06/2021 11:09, Penny Zheng wrote:
> > > I could not think a way to fix it properly in codes, do you have any
> > > suggestion? Or we just put a warning in doc/commits.
> >
> > The correct approach is to find the parent of staticmemdomU1 (i.e.
> > reserved-memory) and use the #address-cells and #size-cells from there.
>
> Julien is right about how to parse the static-memory.
>
> But I have a suggestion on the new binding. The /reserved-memory node is
> a weird node: it is one of the very few node (the only node aside from
> /chosen) which is about software configurations rather than hardware
> description.
>
> For this reason, in a device tree with multiple domains /reserved-memory
> doesn't make a lot of sense: for which domain is the memory reserved?

IHMO, /reserved-memory refers to the memory that the hypervisor should
not touch. It is just a coincidence that most of the domains are then
passed through to dom0.

This also matches the fact that the GIC, /memory is consumed by the
hypervisor directly and not the domain..

>
> This was one of the first points raised by Rob Herring in reviewing
> system device tree.
>
> So the solution we went for is the following: if there is a default
> domain /reserved-memory applies to the default domain. Otherwise, each
> domain is going to have its own reserved-memory. Example:
>
>         domU1 {
>             compatible = "xen,domain";
>             #address-cells = <0x1>;
>             #size-cells = <0x1>;
>             cpus = <2>;
>
>             reserved-memory {
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>
>                 static-memory@0x30000000 {
>                     compatible = "xen,static-memory-domain";
>                     reg = <0x0 0x30000000 0x0 0x20000000>;
>                 };
>             };
>         };

This sounds wrong to me because the memory is reserved from the
hypervisor PoV not from the domain. IOW, when I read this, I think the
memory will be reserved in the domain.

>
> So I don't think we want to use reserved-memory for this, either
> /reserved-memory or /chosen/domU1/reserved-memory. Instead it would be
> good to align it with system device tree and define it as a new property
> under domU1.

Do you have any formal documentation of the system device-tree?

>
> In system device tree we would use a property called "memory" to specify
> one or more ranges, e.g.:
>
>     domU1 {
>         memory = <0x0 0x500000 0x0 0x7fb00000>;
>
> Unfortunately for xen,domains we have already defined "memory" to
> specify an amount, rather than a range. That's too bad because the most
> natural way to do this would be:
>
>     domU1 {
>         size = <amount>;
>         memory = <ranges>;
>
> When we'll introduce native system device tree support in Xen we'll be
> able to do that. For now, we need to come up with a different property.
> For instance: "static-memory" (other names are welcome if you have a
> better suggestion).
>
> We use a new property called "static-memory" together with
> #static-memory-address-cells and #static-memory-size-cells to define how
> many cells to use for address and size.
>
> Example:
>
>     domU1 {
>         #static-memory-address-cells = <2>;
>         #static-memory-size-cells = <2>;
>         static-memory = <0x0 0x500000 0x0 0x7fb00000>;

This is pretty similar to what Penny suggested. But I dislike it
because of the amount of code that needs to be duplicated with the
reserved memory.

Cheers,


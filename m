Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456E1ED63E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 20:38:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgYGe-0006I4-1v; Wed, 03 Jun 2020 18:37:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXpq=7Q=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jgYGd-0006Hz-4I
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 18:37:35 +0000
X-Inumbo-ID: 4a3a4f4e-a5c9-11ea-81bc-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a3a4f4e-a5c9-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 18:37:34 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id k11so3241619ejr.9
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5IM+1eJnx61x/IN6roxRxnyQCN8z8HzRz5YxqAqCivE=;
 b=dNtC8d4TNtsPGJFcW/rU+bO/AFRwsmECL4f5H+D9+fQsJ/E5uqcZpmJum5yq53WcTs
 HSah0iCDkZMcooRTO4C8iS/CojCaKrSxWhXleBg+hudfkxZoo/wl/nRo8wWRSyRMBFTQ
 yDHrZec+pQHYl8YH5XFDQU036A2xcRu7I76dZTgOerL5IXtXhRI7KBhhKQ34vgbbu0mx
 /0S7ONmn+fdk459sC3hA27dc4gWrmFRUlKMGCaXfZqUBeiN4lT9uyTyjVknWE1kVFCfL
 th6XFXCV0ydS6ZTKfqOtt4AS80xi1EdYelnldIPDj5J/jnzAmKZiXqV7rKh52BDMPGGC
 DWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5IM+1eJnx61x/IN6roxRxnyQCN8z8HzRz5YxqAqCivE=;
 b=UdInyb5MAYBLjEwo4wyvuXX5BKCwNF6uWBlOFmsOY3pyTsDwPyrJwZu8lYvzQZJMw+
 3l2gHelwZJUb5YsctXfp4/HOjnGrIk4dCuZNLVjHIJONMurH+hoiUTJZw2xl/FLWp0Dz
 PqlVi5v3eyVP5fE23kkRtLQS/ffkpZhImkptag5XncjGkTJxXEAyJA9H1/5RlwL7RAUc
 pmGJILtQLORelCqi+kR0VBuxSH5HkCoB4SoPqmHYd/DqfYCjHOa7TYtw8j9KOLJuAUyg
 f8P+OBsFmUUxlHXaMCC3jg2NVoFvNFbF5O5eNDZipqw3vro1srxxI9H7swnKSKzrcXOO
 r/rg==
X-Gm-Message-State: AOAM533Bgqd1Gb6W0Vk/fbkvKVkD7Dn46I0cTmevu/OrxrFqltwG5J76
 6gw85orx4Ms+GvqLyyMzlsBAlmEtwDd0ZvRpMno=
X-Google-Smtp-Source: ABdhPJxSCpf5wuL8r445BYXlysTjmcWZXMt+acSaWWj/bBmmF/qLZknOk1xKIGuBtJUMLG/AlMSGAZzWEcmnfgN3jQc=
X-Received: by 2002:a17:906:14cb:: with SMTP id
 y11mr533992ejc.131.1591209453680; 
 Wed, 03 Jun 2020 11:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
In-Reply-To: <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Wed, 3 Jun 2020 14:37:20 -0400
Message-ID: <CALYbLDiwdBoAt9LB0U1urWtCdPVQB_558=uXHAMEOsUABT3KvQ@mail.gmail.com>
Subject: Re: Keystone Issue
To: Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 3, 2020 at 2:09 PM Julien Grall <julien@xen.org> wrote:
>
>
>
> On 03/06/2020 18:13, CodeWiz2280 wrote:
> > Hi Julien,
>
> Hello,
>
> In general, we avoid top post on xen-devel, instead we reply inline. I
> believe gmail should allow you to do it :).
>
I'm sorry about that.  Hopefully this looks right now.
> >
> > The offset is already applied to the memory nodes in the device tree,
> > meaning a direct Linux boot from uboot would have only the 36-bit
> > addresses in the device tree (0x8_0000_0000 and 0x8_8000_0000).  Linux
> > would start executing from a 32-bit address space however and then
> > switch over to the aliased 36-bit addresses in the device tree as
> > discussed below by early_paging_init().
> >
> > I had to add the 32-bit memory node 0x8000_0000 in uboot in place of the
> > 0x8_0000_0000 node otherwise Xen would detect the 32-bit processor and
> > panic on "Unable to detect the first memory bank" in domain_build.c.
>
> So for 32-bit Xen requires to have the first bank below 4GB. This is
> because you can't boot from a physical address above 32-bit.
>
> Obviously, this check wouldn't work on your platform because all your
> memory will be above 4GB.
>
> > If
> > I leave only the 36-bit addresses in the device tree and skip past the
> > panic check in domain_build.c, then I could not get the dom0 kernel to
> > boot at all.  I believe I would only see "Serial input to DOM0" and
> > nothing else at that point.
>
> Which would make sense per above.
>
> >
> > Yes, leaving LPAE support on for the kernel is preferred.
>
> Ok, so the solution I suggested below should work. Unfortunately, I
> don't have time to work on it. Although, I would be more than happy to
> answers questions and reviewing the patches.
>
> Would you be willing to have a try to implement it?
>
Unfortunately, I am not familiar enough with the Xen codebase to
attempt to make the changes.  Thank you for your support and insight.

> Cheers,
>
> --
> Julien Grall


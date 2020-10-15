Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC5E28F785
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 19:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7659.20209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6pG-00027w-TH; Thu, 15 Oct 2020 17:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7659.20209; Thu, 15 Oct 2020 17:14:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6pG-00027X-Pq; Thu, 15 Oct 2020 17:14:02 +0000
Received: by outflank-mailman (input) for mailman id 7659;
 Thu, 15 Oct 2020 17:14:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kT6pF-00027S-HM
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 17:14:01 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8da83e91-9543-46f5-bd76-1909379d005c;
 Thu, 15 Oct 2020 17:14:00 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id p15so3923258ljj.8
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 10:14:00 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kT6pF-00027S-HM
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 17:14:01 +0000
X-Inumbo-ID: 8da83e91-9543-46f5-bd76-1909379d005c
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8da83e91-9543-46f5-bd76-1909379d005c;
	Thu, 15 Oct 2020 17:14:00 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id p15so3923258ljj.8
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1yUvifcv3fU+qGZfXkc7byEgAOcZMg51wV8y/5oEaQ4=;
        b=Q+YOi/nVndoAd1WZ6kH25jasK5kgj2ioDwaXt6ixjeRMRg6/iOEC+Es/O8aLIyakXp
         egaeIVzzY25B60hZbYP5YOwQn6AWlyU9FHYcg4MXdubT1PrPwoaCgmERPH+HsTcJNhtz
         00ywxOC/IRmvRgNhsgIacHbKdjLeNCKg/T8c5XxOK1Raq5mdg76LL/twvP6d42JITF5Z
         uy8KpLYGrqMqk2Q9zLOlYxLDPCh0pUhI2LitWA60v0cGIKg6S8eT59MpY/u8TTSUX+bc
         kXwmHkPRwqds3Oj3HkMiICBAK80pLlQGS9KSWrFpbTusWzC4BEKCNRqg8Pd0NxM7Pi/i
         k/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1yUvifcv3fU+qGZfXkc7byEgAOcZMg51wV8y/5oEaQ4=;
        b=KrQq1CX2qJ3UKYfxs2nDAGPILmILHGubC0k+hda0TzYkGkQ+rWeR6iR33hqO8L+wwt
         AdHDijxFNVuMHoVXdndl5pRw5MlnkKN+VHIYBD09+ESvpM6niSujRKKQ+Nlv0Bp2EKEj
         iaqNgs+GH/3XfXfxDihiGf0SCjdMphraUltjM0bRS2DHf00rEnsqyt+RLGzhBoUlf5vV
         Vkfd9Z2PZjBXZDrY5a6NlyahBYdt12j2/+o3S1zLrI8GQiGwcz42sZJRZMjJ7xHY2vCb
         Y4pRoLCU7JQ7vhhNqjkjiyGYT5ovaONTMCXtFwTK6nTJJX+VvHKntoo47AWEFm5zgsZ2
         8i+g==
X-Gm-Message-State: AOAM533ZzpHbXf6py1ECUy3C2gL7RBNOR2ExC+mYIdXc2dQxSbBkcOQs
	9BIX2ldQVKryoa51GA7SmU3dP965nP+QHoShbmQ=
X-Google-Smtp-Source: ABdhPJw/inF4ypZZTJUUCINi7YWblL+rCo3QbMKOIKbpJ1ze8axOmb3yYlqUQoverWhcCGGhoJFQixhYXnKi+NwhKY0=
X-Received: by 2002:a2e:c49:: with SMTP id o9mr1731526ljd.296.1602782039521;
 Thu, 15 Oct 2020 10:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com> <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com> <CABfawhnwdkB01LKYbcNhyyhFXF2LbLFFmeN5kqh7VaYPevjzuw@mail.gmail.com>
In-Reply-To: <CABfawhnwdkB01LKYbcNhyyhFXF2LbLFFmeN5kqh7VaYPevjzuw@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Oct 2020 13:13:47 -0400
Message-ID: <CAKf6xpuACuY63f+m6U55EVoSBL+RR04OStGPytb-Aeacou32gg@mail.gmail.com>
Subject: Re: i915 dma faults on Xen
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 12:39 PM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> > > Can you paste the memory map as printed by Xen when booting, and what
> > > command line are you using to boot Xen.
> >
> > So this is OpenXT, and it's booting EFI -> xen -> tboot -> xen
>
> Unrelated comment: since tboot now has a PE build
> (http://hg.code.sf.net/p/tboot/code/rev/5c68f0963a78) I think it would
> be time for OpenXT to drop the weird efi->xen->tboot->xen flow and
> just do efi->tboot->xen. Only reason we did efi->xen->tboot was
> because tboot didn't have a PE build at the time. It's a very hackish
> solution that's no longer needed.

Thanks for the pointer, Tamas.  If I recall correctly, there was also
an issue with ExitBootServices.  Do you know if that has been
addressed?

Depending on timing, OpenXT may just move to TrenchBoot for a DRTM solution.

Regards,
Jason


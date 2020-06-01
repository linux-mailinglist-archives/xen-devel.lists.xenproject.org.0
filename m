Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D52BA1E9C6A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 06:12:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfbnc-0000Lp-0s; Mon, 01 Jun 2020 04:11:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WMUc=7O=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jfbna-0000Lk-Sg
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 04:11:42 +0000
X-Inumbo-ID: ff97dc2a-a3bd-11ea-9947-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff97dc2a-a3bd-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 04:11:42 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i68so6751800qtb.5
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 21:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3NwYwJLV2MbQSYU70QW25++6lGpRPnoUWdanU2rZBDo=;
 b=O7ZqEoNT28KJnf9C95fOAB8EdGl9FcZ4tTKnZPyk7SGY+NxGWwV4628CC6nTokzyKo
 9+OuBHH4Ll5oNWHrkIuS8G6Q9RneMn0VOK28L38otr0hNYVmmrAfEsL84mRyym758n/h
 zJ5+/dPaIihGFHri+KG3Y7NsAOZW2myqVb3UY1IQNeqfajYEwFWOFMyf2fDNdqdmHhTQ
 O7xfYeSUt1e/oRY55R1Xbz4QgfQvyM3dP0M9FDcakedivtxMF/+W1hLjBHG1yxEkqvEw
 hoB0fJibvDqWRHdlde9QTTTTbfaogPGqD2fRzUYaRuCu+Bn8oAz+ok/WtB9XufLegKFz
 I3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3NwYwJLV2MbQSYU70QW25++6lGpRPnoUWdanU2rZBDo=;
 b=OpL54FShoAdq9Q1MUpFPaQifsFlSLHHQwq/2v7kt1qXxNPSsGb6rCl0PkdVb9JJNfv
 QbQqIWonorUswCjGiHTI1G57EJGSdyg6H5rG1GWgA3DNxUnp2y49YnPVVOHfuAokbLEu
 WR92Se8k03Ee738n5ng9EMsoYIhHVrmzabJE6TM8hyZznc6OdQDpZp/mhmkjrwyxA9U4
 L/LQ8R/QiIbR268rvR9YRd89dDFTpefYi2V9omPYGEo/h6ieNJm+cMWssfRK6PzrNSh5
 kIeuoEe8c3EZd0QEzoSKcMzNzrmQlkl3vCuVSkWE38+tnIKRkQwbbo8vWMKrRyIr5MsK
 HB6g==
X-Gm-Message-State: AOAM530axb5r6XG9QN3sUEViy6U2YtujAoKPHG6yqXLxJpMvSz1YAlwb
 k4Fp7S8WpbFBvAj8qjnRgUMuR4zi5dSsru8pED5gzA==
X-Google-Smtp-Source: ABdhPJwiGh7pEagbUquDpKGrWMXh9pZto7E9lYO9/hE7z01B5uO5u5QNUsy1hvzUbL6vud4Yi2geytKa9hQsnJjHgDk=
X-Received: by 2002:ac8:4d0e:: with SMTP id w14mr17550046qtv.266.1590984701735; 
 Sun, 31 May 2020 21:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <CAJ=z9a2B1+A8jPXiE9adNSTWHENtULnmAxq2M5v6MxB5thZLfw@mail.gmail.com>
In-Reply-To: <CAJ=z9a2B1+A8jPXiE9adNSTWHENtULnmAxq2M5v6MxB5thZLfw@mail.gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Sun, 31 May 2020 21:11:30 -0700
Message-ID: <CAMmSBy_djgfQ1NT2TGo+1=7c20PyX-mzf6JiPx5ibnRkFT_5BQ@mail.gmail.com>
Subject: Re: UEFI support in ARM DomUs
To: Julien Grall <julien.grall.oss@gmail.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nataliya Korovkina <malus.brandywine@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Julien!

On Sun, May 31, 2020 at 3:24 PM Julien Grall <julien.grall.oss@gmail.com> wrote:
>
> On Sun, 31 May 2020 at 23:05, Roman Shaposhnik <roman@zededa.com> wrote:
> > Hi!
> >
> > with a lot of help from Stefano, we're getting RPi4 support in
> > Project EVE pretty much on par between KVM and Xen.
> >
> > One big area that still remains is supporting UEFI boot sequence
> > for DomUs. With KVM, given the qemu virt device model this is
> > as simple as using either stock UEFI build for arm or even U-Boot
> > EFI emulation environment and passing it via -bios option.
> >
> > Obviously with Xen on ARM we don't have the device model so
> > my understanding is that the easiest way we can support it would
> > be to port UEFI's OvmfPkg/OvmfXen target to ARM (it seems to
> > be currently exclusively X64).
>
> EDK2 has been supporting Xen on Arm for the past 5 years. We don't use
> OvmfPkg/OvmfXen but ArmVirtPkg/ArmVirtXen (see [1]).
> I haven't tried to build it recently, but I should be able to help if
> there is any issue with it.
>
> Cheers,
>
> [1] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/ArmVirtXen.fdf

This is really, really awesome -- I guess it would be really helpful to document
this someplace on the ARM/Xen wiki (I can volunteer if someone can grant
me the karma).

I've built XEN_EFI.fd and the rest worked out like a charm.

All on Raspberry Pi 4!

Thanks,
Roman.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14501E9AB0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 00:25:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfWNT-0003PG-9T; Sun, 31 May 2020 22:24:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xoz2=7N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jfWNR-0003PB-Ku
 for xen-devel@lists.xenproject.org; Sun, 31 May 2020 22:24:21 +0000
X-Inumbo-ID: 7904c00e-a38d-11ea-9dbe-bc764e2007e4
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7904c00e-a38d-11ea-9dbe-bc764e2007e4;
 Sun, 31 May 2020 22:24:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x13so9618800wrv.4
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2020 15:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UJb8KEJypffVbd/B3RxwITb6qIOpcwhFRkS6x75qDc=;
 b=RMI7yFABiYBqJNvIjEDL+GZ1uZZ0qZ7+vr7atbniLeIUQL8PevwhmnAZSCe/okqH49
 FZNUJLhziTu3RsxvL4cypriXIMpxZQ3A88UvP1seRQB/jJJp+eliW5VawaEwJ7QiMGib
 N/Iq41BXHcBCy28socon87RWacIt8VhPoSfRoCP9MT8oRff5JPCLeibTALuAzJFYXCUz
 FDovG6WzQJLF0iu/Deenr1n0nbtEN/td/fRrJcKI3k+KJSNEr/ao+DbtPeBD70eoIGdO
 XERF0zcluYSk7NfCoix9bOrBzUh773dg96PZCUOHn3b1ZIEEmGZd3DS8KfV3sNrEsGmh
 Tdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UJb8KEJypffVbd/B3RxwITb6qIOpcwhFRkS6x75qDc=;
 b=ukhQ9oBo185b3MjZmW+ZkfOIycd2azSzwSHSDl6JOpoUAE33FSFmNs7TUmoue8KKJt
 ZlZsC9jz9E7hOz+FasKdNolar4qwjtdr8h8FX/IQDQsYA85cfZztKy9zS24LVcGx0tzA
 tkdGDmPZHP2dgUnjPqky0KrH8kIgRVf2LxW+7vcCoG/8mSa438frS2PAIvJY78Zpehcl
 jIaywkTmKRVay5ZevJ8nwAx0pvjDy7UbIi86kaMVqfrfezDTJxsCRAehDzj/NQe/s4gE
 mZnn0F3tfKWRzPQQ7dS3XkUDJDX/Haz24CI9ktdVZM+myRXW7Esyj6yNC3w81hT3U0ZB
 c07Q==
X-Gm-Message-State: AOAM533Ay1GKaAzwU13kkbQBBrygKvUijI98FHjnvQYNPWalugxUkX1I
 WG5jJDD6X7RpI+naKSqh2Pqigb7nGoAr4hVbq+4=
X-Google-Smtp-Source: ABdhPJzwdfO+DaZUHIByCEdAx/jIwtd60SV800vRmYLuZKrSwYySUyndI56WOtxCDPZ0rOqeJnJ6FeKR/muVYiz2OeE=
X-Received: by 2002:adf:f790:: with SMTP id q16mr19297813wrp.399.1590963860024; 
 Sun, 31 May 2020 15:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
In-Reply-To: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sun, 31 May 2020 23:24:09 +0100
Message-ID: <CAJ=z9a2B1+A8jPXiE9adNSTWHENtULnmAxq2M5v6MxB5thZLfw@mail.gmail.com>
Subject: Re: UEFI support in ARM DomUs
To: Roman Shaposhnik <roman@zededa.com>
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

On Sun, 31 May 2020 at 23:05, Roman Shaposhnik <roman@zededa.com> wrote:
> Hi!
>
> with a lot of help from Stefano, we're getting RPi4 support in
> Project EVE pretty much on par between KVM and Xen.
>
> One big area that still remains is supporting UEFI boot sequence
> for DomUs. With KVM, given the qemu virt device model this is
> as simple as using either stock UEFI build for arm or even U-Boot
> EFI emulation environment and passing it via -bios option.
>
> Obviously with Xen on ARM we don't have the device model so
> my understanding is that the easiest way we can support it would
> be to port UEFI's OvmfPkg/OvmfXen target to ARM (it seems to
> be currently exclusively X64).

EDK2 has been supporting Xen on Arm for the past 5 years. We don't use
OvmfPkg/OvmfXen but ArmVirtPkg/ArmVirtXen (see [1]).
I haven't tried to build it recently, but I should be able to help if
there is any issue with it.

Cheers,

[1] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/ArmVirtXen.fdf


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14622CE9D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 21:25:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz3J8-0002V4-Gu; Fri, 24 Jul 2020 19:24:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H90z=BD=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jz3J6-0002Ux-Ty
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 19:24:37 +0000
X-Inumbo-ID: 4f1e9dd4-cde3-11ea-888b-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f1e9dd4-cde3-11ea-888b-bc764e2007e4;
 Fri, 24 Jul 2020 19:24:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so2238652wmi.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2020 12:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8OOi++DoSkGx/GlhLWZoPuYbHeA8uUVPopYyzRdXWb4=;
 b=Lopdyohte65cwZw/pGyg0Bu9ZSrwgUXG6a8+wG50415hwfjbZn+dgz7qiAwuT8o9yl
 spqInx4ja98TsY4QkKjxOemBB/px0F9stmNSm7XQLCe4TY9/5gPlKH9fRL3qaArAIKWX
 8cjYCwuqtB69riqr3n2JHdXQdnc4DhAlcFuKRM0X4+4Be52mC192ntKTr+HYmYYW3pJ1
 3Qw0Cby+zwwqIrALDiyE3Cawd4/wl6i7EMbYdLUN/pEklj+FAGwczBzhgk3UXddSYJG6
 gX2p8K3/ud7+Lr7tsrxoe9h6ECqBFba6Y99alp69Pk8Qz+WjVfpX78GULpcGtruElLoj
 2BFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8OOi++DoSkGx/GlhLWZoPuYbHeA8uUVPopYyzRdXWb4=;
 b=nQVJD/o7NJcu/YtlrVVHid0BMWtZOSLcvlq3SpLkhkq7F+2LuHcLxGxKxA7WC+H9Zw
 rjb44xB56IwlP62yyIvlLbztLaCwfvbn/Z/SPWqMgAX9h+AnjEnbstxsH/KyrjFpJspr
 ewkSz3ul3D4D2ynKJ2Wn3wSOfVY7Yzqh6Ja5RQR4O2x7JVmNBGMRCBzxGj3D4RCXakVO
 o9lflaNyCfcPC85MM9lBLZEV2kllYbpjX+LJGkO6gq5Tjdbd/Dn8/zSLDYza5VkZNvVy
 DLJ9Oe1tuOzL7aGi0Zoz2t+oEZTR6+nq6iXatwPu/5dqPSTCMOGtqHNT2Gc2GvPmPH5C
 o0Cw==
X-Gm-Message-State: AOAM531vn+1P4nase7i1URANWsWxqZsiJ0LApK6HahSMsNfprIIjMLx4
 9iwnLdt9CGjFoh4bI04UZMGvcDvxp4zf2BYsTfc=
X-Google-Smtp-Source: ABdhPJzWNe1/yPz2ocHzOfVMETlV4DTbvzdrbjK0myon1e3iTF/rOBhGQ8Imv2PkVwGHRlSTXTHmq6Ykq8fRYPlRi80=
X-Received: by 2002:a1c:19c4:: with SMTP id 187mr10466529wmz.100.1595618675314; 
 Fri, 24 Jul 2020 12:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <9f09ff42-a930-e4e3-d1c8-612ad03698ae@xen.org>
 <alpine.DEB.2.21.2007241036460.17562@sstabellini-ThinkPad-T480s>
 <40582d63-49c7-4a51-b35b-8248dfa34b66@xen.org>
 <alpine.DEB.2.21.2007241127480.17562@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007241127480.17562@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 24 Jul 2020 20:24:23 +0100
Message-ID: <CAJ=z9a3dXSnEBvhkHkZzV9URAGqSfdtJ1Lc838h_ViAWG3ZO4g@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: Rahul Singh <rahul.singh@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 24 Jul 2020 at 19:32, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > If they are not equal, then I fail to see why it would be useful to have this
> > value in Xen.
>
> I think that's because the domain is actually more convenient to use
> because a segment can span multiple PCI host bridges. So my
> understanding is that a segment alone is not sufficient to identify a
> host bridge. From a software implementation point of view it would be
> better to use domains.

AFAICT, this would be a matter of one check vs two checks in Xen :).
But... looking at Linux, they will also use domain == segment for ACPI
(see [1]). So, I think, they still have to use (domain, bus) to do the lookup.

>
> > In which case, we need to use PHYSDEVOP_pci_mmcfg_reserved so
> > Dom0 and Xen can synchronize on the segment number.
>
> I was hoping we could write down the assumption somewhere that for the
> cases we care about domain == segment, and error out if it is not the
> case.

Given that we have only the domain in hand, how would you enforce that?

From this discussion, it also looks like there is a mismatch between the
implementation and the understanding on QEMU devel. So I am a bit
concerned that this is not stable and may change in future Linux version.

IOW, we are know tying Xen to Linux. So could we implement
PHYSDEVOP_pci_mmcfg_reserved *or* introduce a new property that
really represent the segment?

Cheers,

[1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/kernel/pci.c#L74

Cheers,


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF751C2217
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 03:12:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUghm-0004D2-Dy; Sat, 02 May 2020 01:12:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kx6T=6Q=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jUghk-0004Cw-Uv
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 01:12:32 +0000
X-Inumbo-ID: ffcd4072-8c11-11ea-9887-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffcd4072-8c11-11ea-9887-bc764e2007e4;
 Sat, 02 May 2020 01:12:32 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id k81so8315195qke.5
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 18:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KyGVP5MPtns44PEQtRdyQS5fO/IUpYK0AZTnal2Ixs=;
 b=UfAR5kJvYkdKGQY58vrBFTC47A7JYH+C+tTQYfH3Pyr3x5SSopF70Fd/QvjoldkWfY
 l8kqaSJsfGuykrZjgQkkr+PdliASA6bbMga8WE6UxJBuAM7euzS33EtfJ+JazwqztoQ9
 OmtPhjWY4qwi3rKrrcZ0AlhEqXobpR4Da8/enAWPHzsCD0LWsiGy06kWnIQNINi/f1CW
 iKVkn8rSPTmdCW80ock6yia4Suwg072DTYkQCqgIYaWcAf5mxy9EFBErFLqW8dNildJy
 cpQRroLhvc+VjfVDxOv2otjzysQkloMDzYlp2l7Hg4uC5MIFSrOrwqLwYQRynjNmVrl2
 ZWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KyGVP5MPtns44PEQtRdyQS5fO/IUpYK0AZTnal2Ixs=;
 b=PYeAqwg6A+/3LrYtau4yEzJ+55rg0Zahn39WOpBbEjmTU5NUUuCzIAFCgqrdKlLGA0
 iO/PYWC/6XdkMeWdn2fUBGccuiGkf5dKHP/M1OiHWCiYRx4qTosmXxoHj90urAduIyYO
 zleBZeuxsA4IJ3/d7HaxstJ9nog/DUDmw2IfNLQ6ij3wzDRTMzZbdE1PVW0B6PivsQo+
 n2bCRc7wkccZV4Jhj5nEMsckiBD6zR9fT16AxUBjQXKmfpgAJbCllgimIXRCHcsNanUo
 MwV8a8lcsOE9BejF8LzyOtxvIIAafcMAvQS75wLD51Wp22TS64Egzt2V5wOLyeMtAzr7
 ZJhA==
X-Gm-Message-State: AGi0PuZXtz5VSoimZ1utFamdw4MrAgrteBMOD12UFeOaFSGddzpLsrHz
 Y5Zbw7DLq0XxGUjMDs8w9wegZk25yChSxD1JLxiD9w==
X-Google-Smtp-Source: APiQypLzAYwBi99dXA+Dbxc8cASeNvgv3hAMuGVLy0hybrMAoovgaTd43utBNqxpF/KpiALhpMFFE8yL05Q10aELkFk=
X-Received: by 2002:a05:620a:22a6:: with SMTP id
 p6mr6350913qkh.267.1588381951824; 
 Fri, 01 May 2020 18:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <alpine.DEB.2.21.2005011637380.28941@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2005011637380.28941@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 1 May 2020 18:12:20 -0700
Message-ID: <CAMmSBy-+ebBN-QernLnDbW9t51igZBFVAX-RQLRJ72_Ut_j5Ww@mail.gmail.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
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
Cc: Julien Grall <julien@xen.org>, minyard@acm.org,
 jeff.kubascik@dornerworks.com, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano!

On Fri, May 1, 2020 at 5:05 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Hi Roman,
>
>
> In regards to the attached stack trace, nothing rings a bell
> unfortunately. I don't know why quirk_usb_early_handoff causes a crash.
> It would be useful to add a few printk in quirk_usb_early_handoff to
> know where the crash is happening exactly.

That definitely seems to be a cascading error from our DMA issues.
Basically when I completely disable DMA (as I showed before) this
issue completely goes away.

> In regards to Dornerworks's third patch, it doesn't look like it is
> related to the quirk_usb_early_handoff crash. The third patch is
> probably not useful anymore because dev->archdata.dev_dma_ops is gone
> completely.

Yup. That seems to be correct. Applying your WARN_ON(dev->dma_ops != NULL);
patch didn't show anything on the console -- so at least that is not
an issue anymore.

I think the focus really should be on:
    https://github.com/dornerworks/xen-rpi4-builder/blob/master/patches/linux/0002-Disable-DMA-in-sdhci-driver.patch

But even this patch, I think, is a cascading error from something that is still
somehow broken about DMA handling in Xen. IOW, it may very well be the
case that the reason Dornerworks folks had to add:
    SDHCI_QUIRK_BROKEN_DMA | SDHCI_QUIRK_BROKEN_ADMA
is exactly the same reason we're now seeing DMA issues much earlier.

Do you think this is something that we could tackle? Like I mentioned,
having an upstream, 5.x kernel capable of being a Dom0 on RPi 4
would be really a huge deal to the Xen on ARM development community.

It seems that we're within reach of that -- I just wish I knew in
which direction
to take it.

Thanks,
Roman.

> However, just in case, something like the following would
> help recognize if the original bug still persists in newer kernels
> somehow:
>
>
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index 6c45350e33aa..61af12d79add 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -53,7 +53,9 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>                 iommu_setup_dma_ops(dev, dma_base, size);
>
>  #ifdef CONFIG_XEN
> -       if (xen_initial_domain())
> +       if (xen_initial_domain()) {
> +               WARN_ON(dev->dma_ops != NULL);
>                 dev->dma_ops = &xen_swiotlb_dma_ops;
> +       }
>  #endif
>  }
>
>
> On Thu, 30 Apr 2020, Roman Shaposhnik wrote:
> > Hi!
> >
> > I'm trying to run Xen on Raspberry Pi 4 with 5.6.1 stock,
> > upstream kernel. The kernel itself works perfectly well
> > on the board. When I try booting it as Dom0 under Xen,
> > it goes into a stacktrace (attached).
> >
> > Looking at what nice folks over at Dornerworks have previously
> > done to make RPi kernels boot as Dom0 I've come across these
> > 3 patches:
> >     https://github.com/dornerworks/xen-rpi4-builder/tree/master/patches/linux
> >
> > The first patch seems irrelevant (unless I'm missing something
> > really basic here). The 2nd patch applied with no issue (but
> > I don't think it is related) but the 3d patch failed to apply on
> > account of 5.6.1 kernel no longer having:
> >     dev->archdata.dev_dma_ops
> > E.g.
> >     https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/mm/dma-mapping.c?h=v5.6.1#n55
> >
> > I've tried to emulate the effect of the patch by simply introducing
> > a static variable that would signal that we already initialized
> > dev->dma_ops -- but that didn't help at all.
> >
> > I'm CCing Jeff Kubascik to see if the original authors of that Corey Minyard
> > to see if may be they have any suggestions on how this may be dealt
> > with.
> >
> > Any advice would be greatly appreciated!
> >
> > Thanks,
> > Roman.
> >


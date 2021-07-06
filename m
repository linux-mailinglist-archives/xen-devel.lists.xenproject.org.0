Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A51DA3BCA2B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 12:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151041.279195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0iQo-0002K0-AA; Tue, 06 Jul 2021 10:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151041.279195; Tue, 06 Jul 2021 10:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0iQo-0002Hp-6x; Tue, 06 Jul 2021 10:35:58 +0000
Received: by outflank-mailman (input) for mailman id 151041;
 Tue, 06 Jul 2021 10:35:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tQg=L6=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1m0iQm-0002Hj-Rr
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 10:35:56 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bab43cfa-2516-47a9-a25d-69d342bc7913;
 Tue, 06 Jul 2021 10:35:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a13so25448380wrf.10
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 03:35:55 -0700 (PDT)
Received: from dell ([109.180.115.218])
 by smtp.gmail.com with ESMTPSA id l9sm16428319wrp.14.2021.07.06.03.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:35:54 -0700 (PDT)
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
X-Inumbo-ID: bab43cfa-2516-47a9-a25d-69d342bc7913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6xuYHcNFKOKQBrKUFUDH+4OX/ZzxgolWWFVCDDtB2Y0=;
        b=Yt+wwRbDrooYfJ07+RIOcvlbNAmDArbrvJ7r1S0Vf2cjg/rLU7fAYgPxXpkS/Es1c/
         LcGWWFOVsEF/0XQJw8Ic4i6Dtc59Y/PIazeWXS81o/I5/ykvg7NDoqtNhU6ZQY0qgpts
         hX13gyhgO6x+I73AAGb4ZN/+qaseZR6quq5U1fL8NFgVa2YoJXURs1gKcClPP7oowGFt
         CUO7YRn27lhbGlEADkw/xBbGzLYaM6sE1cZhR+vatbGDVqfyXQOHsgSlmcoOTDifCPOm
         ISHjTYrtj1Tj6vkK+FyowiPdLCC1ljyYKvKt5eTXHZu+z0mb6AF50iygoibOaTtpwXde
         Om/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6xuYHcNFKOKQBrKUFUDH+4OX/ZzxgolWWFVCDDtB2Y0=;
        b=gstwFqjOOUATvgYVhn0c0FG0HQSlcD8bMV8tAzAluQTMjq3ZOyqCT+/oxnjo332OHT
         gxxvpvwePrFvUVC8HZEa/4maXbIpTLelR3k1fzenvYM2el+MudFRUACYRIJdAs63Z6kk
         CYgKRp0DNhsJryy9pzYlLwTu2t7s/Ercq2ijVs6OxdhxEVCFIvGLI/6ekhm09IoEPViG
         0i/fRIRXqApa2/WhpU8f3S5lLkkdSgaDCVzUHLIMYN1EPlzZ5mz/vMd81W1WC6IwSbBf
         EDYtBkGuis3TJdjvjbAJAyFGueaRwg0tqAhNB7WHtik3jvV/yhIkkYrVRj37Ea4/8T1n
         +jZw==
X-Gm-Message-State: AOAM533z3fVnjMNKl5ps05WVEcyEpQFKloPbiaoV0/nSZ0ZKUjSub7qp
	7XeOJ0Il2wMxVF5LsW62me/13A==
X-Google-Smtp-Source: ABdhPJxx+Xr4AcuLpRSkCC4EtytSRujE0SZ0zcPphvKN4FEK+8OpQKjY5aHg/Lctw2KdmVZr98nK+A==
X-Received: by 2002:a05:6000:12d0:: with SMTP id l16mr21397024wrx.189.1625567755049;
        Tue, 06 Jul 2021 03:35:55 -0700 (PDT)
Date: Tue, 6 Jul 2021 11:35:52 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Geoff Levand <geoff@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev, dmaengine@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org,
	linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
	industrypack-devel@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-ntb@googlegroups.com,
	linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] bus: Make remove callback return void
Message-ID: <YOQxRS8HLTYthWNn@dell>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>

On Tue, 06 Jul 2021, Uwe Kleine-König wrote:

> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> 
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> 
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> this patch depends on "PCI: endpoint: Make struct pci_epf_driver::remove
> return void" that is not yet applied, see
> https://lore.kernel.org/r/20210223090757.57604-1-u.kleine-koenig@pengutronix.de.
> 
> I tested it using allmodconfig on amd64 and arm, but I wouldn't be
> surprised if I still missed to convert a driver. So it would be great to
> get this into next early after the merge window closes.
> 
> I send this mail to all people that get_maintainer.pl emits for this
> patch. I wonder how many recipents will refuse this mail because of the
> long Cc: list :-)
> 
> Best regards
> Uwe
> 
>  arch/arm/common/locomo.c                  | 3 +--
>  arch/arm/common/sa1111.c                  | 4 +---
>  arch/arm/mach-rpc/ecard.c                 | 4 +---
>  arch/mips/sgi-ip22/ip22-gio.c             | 3 +--
>  arch/parisc/kernel/drivers.c              | 5 ++---
>  arch/powerpc/platforms/ps3/system-bus.c   | 3 +--
>  arch/powerpc/platforms/pseries/ibmebus.c  | 3 +--
>  arch/powerpc/platforms/pseries/vio.c      | 3 +--
>  drivers/acpi/bus.c                        | 3 +--
>  drivers/amba/bus.c                        | 4 +---
>  drivers/base/auxiliary.c                  | 4 +---
>  drivers/base/isa.c                        | 4 +---
>  drivers/base/platform.c                   | 4 +---
>  drivers/bcma/main.c                       | 6 ++----
>  drivers/bus/sunxi-rsb.c                   | 4 +---
>  drivers/cxl/core.c                        | 3 +--
>  drivers/dax/bus.c                         | 4 +---
>  drivers/dma/idxd/sysfs.c                  | 4 +---
>  drivers/firewire/core-device.c            | 4 +---
>  drivers/firmware/arm_scmi/bus.c           | 4 +---
>  drivers/firmware/google/coreboot_table.c  | 4 +---
>  drivers/fpga/dfl.c                        | 4 +---
>  drivers/hid/hid-core.c                    | 4 +---
>  drivers/hid/intel-ish-hid/ishtp/bus.c     | 4 +---
>  drivers/hv/vmbus_drv.c                    | 5 +----
>  drivers/hwtracing/intel_th/core.c         | 4 +---
>  drivers/i2c/i2c-core-base.c               | 5 +----
>  drivers/i3c/master.c                      | 4 +---
>  drivers/input/gameport/gameport.c         | 3 +--
>  drivers/input/serio/serio.c               | 3 +--
>  drivers/ipack/ipack.c                     | 4 +---
>  drivers/macintosh/macio_asic.c            | 4 +---
>  drivers/mcb/mcb-core.c                    | 4 +---
>  drivers/media/pci/bt8xx/bttv-gpio.c       | 3 +--
>  drivers/memstick/core/memstick.c          | 3 +--

>  drivers/mfd/mcp-core.c                    | 3 +--

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B32D7359
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50295.88895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfI3-0004Q3-6L; Fri, 11 Dec 2020 10:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50295.88895; Fri, 11 Dec 2020 10:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfI3-0004Pe-2i; Fri, 11 Dec 2020 10:04:43 +0000
Received: by outflank-mailman (input) for mailman id 50295;
 Fri, 11 Dec 2020 10:04:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RkSQ=FP=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1knfI2-0004PZ-B6
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:04:42 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5967531-dcf0-4cf9-96dc-5d72e79b4b80;
 Fri, 11 Dec 2020 10:04:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c5so4770098wrp.6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Dec 2020 02:04:41 -0800 (PST)
Received: from dell ([91.110.221.240])
 by smtp.gmail.com with ESMTPSA id 125sm14307876wmc.27.2020.12.11.02.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 02:04:39 -0800 (PST)
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
X-Inumbo-ID: f5967531-dcf0-4cf9-96dc-5d72e79b4b80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1m1097L8Z65yNEwPVsqCFAhMTO7JcIQztqm0XMNCEPQ=;
        b=QxFc8GC7E8T+U1gL6XJZvjeXxiWbuXfRqv6+3/ZJOEoQYn8YiRuOLDZAWueGTraddr
         xPqz2bb/8UoAjcvd5vsoN8LW5Iq1Lp0AqSabcEPsXCi+l/VkgtRG+OzcSz2lDjE/Pdix
         jshzcxstN+qosX02zQCGS+/I2FYEYzEAEBcOtJSJ1mr8h1MxoB17ALXOASyS2RwWORLD
         sYyHzWywWpvht4yy3yfrgCqZgrWTC9ga2KkmmQ+oI2PP2v+Qn9n0ORXRDwcKBkqiCMKf
         N0XznwYuSkPJfUeKcTzGZ2pjw4N1X+j5jdnHapfeS7fwZVeyxQTBUj+e7/XfSTgXR3Ap
         ykzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1m1097L8Z65yNEwPVsqCFAhMTO7JcIQztqm0XMNCEPQ=;
        b=uGIfWrH1tv6o94axE00EL+tx6RWBN1ZhPM1+3qERSqYiFY1kPXL3QBQFEGETiYbPen
         vfH7bgvgMQQqs+DqbgvSh6H0VkIy/9T6fzLZQ7IZ9xUsxsVak5VK7QzsakalPijGfN4j
         +4kUnY6MMGHeZsqTUYEptK9wjdZDL5W9NzaZEFTwSXR4ko812anN4gtT/NVZE3p2X66B
         kc+pmWyZzWaOKxScmeQAsk4vL1lsVibuGf8szAGP1fA2st0vLfvW+gdZ/X57rTnoYQQQ
         /whJo1/cIuiz96MltxCdKxaEfeeJa0sSvM3a0T91Y2p8W11ATqeCAkyqFLSZaZiVf1lx
         8UbA==
X-Gm-Message-State: AOAM531ZSA+kP+e4a0T9kbFObPFT91AB/lkeSrU+v8L1VbW48u48D7aF
	l7Yc5T838qIywHmzou5xaDU58g==
X-Google-Smtp-Source: ABdhPJwPXfTZPDeiEu60EOOVLfjPDebdQDfkcu30zCcF3k07tbHpbRDSiAPsDeGxO9u3bWjkQ8cNJw==
X-Received: by 2002:a5d:6ccc:: with SMTP id c12mr13142414wrc.4.1607681080467;
        Fri, 11 Dec 2020 02:04:40 -0800 (PST)
Date: Fri, 11 Dec 2020 10:04:36 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	afzal mohammed <afzal.mohd.ma@gmail.com>,
	linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Wambui Karuga <wambui.karugax@gmail.com>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	linux-gpio@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	linux-ntb@googlegroups.com,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@xilinx.com>, linux-pci@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [patch 16/30] mfd: ab8500-debugfs: Remove the racy fiddling with
 irq_desc
Message-ID: <20201211100436.GC5029@dell>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.157283633@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201210194044.157283633@linutronix.de>

On Thu, 10 Dec 2020, Thomas Gleixner wrote:

> First of all drivers have absolutely no business to dig into the internals
> of an irq descriptor. That's core code and subject to change. All of this
> information is readily available to /proc/interrupts in a safe and race
> free way.
> 
> Remove the inspection code which is a blatant violation of subsystem
> boundaries and racy against concurrent modifications of the interrupt
> descriptor.
> 
> Print the irq line instead so the information can be looked up in a sane
> way in /proc/interrupts.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/mfd/ab8500-debugfs.c |   16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D51C21CA
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 02:06:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUfea-0007OC-PA; Sat, 02 May 2020 00:05:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jUfeZ-0007O6-11
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 00:05:11 +0000
X-Inumbo-ID: 969578ee-8c08-11ea-9b76-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 969578ee-8c08-11ea-9b76-12813bfff9fa;
 Sat, 02 May 2020 00:05:10 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 839702072E;
 Sat,  2 May 2020 00:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588377909;
 bh=NaydumJziN7Xj8P2fkWebvMTk1qUbAlKPLPT5xLIzg0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jXjsHuHHpYKb9DuPKVJNyE7QQQ3txagLDJsVQgq2TVSq89lI02OOxAW/rOVpIhPph
 kjtDJe+UM+mZLNcQuULWAvtRCZ14CCD6SN7kDKOm0gQ+r6Uoa4P7DpaJkZLbsx69oK
 qcg5UkCm2ja/dPgaQy9DcY+Uxp+v8YrMH4Wwe5/U=
Date: Fri, 1 May 2020 17:05:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
In-Reply-To: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2005011637380.28941@sstabellini-ThinkPad-T480s>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 minyard@acm.org, jeff.kubascik@dornerworks.com,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roman,


In regards to the attached stack trace, nothing rings a bell
unfortunately. I don't know why quirk_usb_early_handoff causes a crash.
It would be useful to add a few printk in quirk_usb_early_handoff to
know where the crash is happening exactly.


In regards to Dornerworks's third patch, it doesn't look like it is
related to the quirk_usb_early_handoff crash. The third patch is
probably not useful anymore because dev->archdata.dev_dma_ops is gone
completely. However, just in case, something like the following would
help recognize if the original bug still persists in newer kernels
somehow:


diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 6c45350e33aa..61af12d79add 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -53,7 +53,9 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		iommu_setup_dma_ops(dev, dma_base, size);
 
 #ifdef CONFIG_XEN
-	if (xen_initial_domain())
+	if (xen_initial_domain()) {
+		WARN_ON(dev->dma_ops != NULL);
 		dev->dma_ops = &xen_swiotlb_dma_ops;
+	}
 #endif
 }


On Thu, 30 Apr 2020, Roman Shaposhnik wrote:
> Hi!
> 
> I'm trying to run Xen on Raspberry Pi 4 with 5.6.1 stock,
> upstream kernel. The kernel itself works perfectly well
> on the board. When I try booting it as Dom0 under Xen,
> it goes into a stacktrace (attached).
> 
> Looking at what nice folks over at Dornerworks have previously
> done to make RPi kernels boot as Dom0 I've come across these
> 3 patches:
>     https://github.com/dornerworks/xen-rpi4-builder/tree/master/patches/linux
> 
> The first patch seems irrelevant (unless I'm missing something
> really basic here). The 2nd patch applied with no issue (but
> I don't think it is related) but the 3d patch failed to apply on
> account of 5.6.1 kernel no longer having:
>     dev->archdata.dev_dma_ops
> E.g.
>     https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/mm/dma-mapping.c?h=v5.6.1#n55
> 
> I've tried to emulate the effect of the patch by simply introducing
> a static variable that would signal that we already initialized
> dev->dma_ops -- but that didn't help at all.
> 
> I'm CCing Jeff Kubascik to see if the original authors of that Corey Minyard
> to see if may be they have any suggestions on how this may be dealt
> with.
> 
> Any advice would be greatly appreciated!
> 
> Thanks,
> Roman.
> 


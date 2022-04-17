Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD9D50498B
	for <lists+xen-devel@lfdr.de>; Sun, 17 Apr 2022 23:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306751.521919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngC54-0000SK-Ve; Sun, 17 Apr 2022 21:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306751.521919; Sun, 17 Apr 2022 21:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngC54-0000PS-Sb; Sun, 17 Apr 2022 21:05:14 +0000
Received: by outflank-mailman (input) for mailman id 306751;
 Sun, 17 Apr 2022 21:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3EG=U3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ngC52-0000PM-OF
 for xen-devel@lists.xenproject.org; Sun, 17 Apr 2022 21:05:12 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 114f3fbf-be92-11ec-8fbe-03012f2f19d4;
 Sun, 17 Apr 2022 23:05:10 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id v13so8852498ljg.10
 for <xen-devel@lists.xenproject.org>; Sun, 17 Apr 2022 14:05:10 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a2e93c9000000b0024b3c2ecc18sm979821ljh.115.2022.04.17.14.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 14:05:09 -0700 (PDT)
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
X-Inumbo-ID: 114f3fbf-be92-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3+nbTY+84mWqEaxVh9si/y236NGTkkPaVHQEn9FFNrQ=;
        b=SqsQaN3fYS853QyFaqhKfWVcI1U/A4Juzvi+EN0SFJi1ZQ2FiQxlnlVvOkN8wT92pg
         gYeEGqE2PFZCSAUQjDQ8XlgcTPj/J2mPfqkKTxv9+bvDqHwu4L+OrW2E048B79hejG7J
         YGS5pVsV5N+uPco8nKvkzcIXjk8rBoBeWtXYgbHek3YWtvLnCgvIMLLeFD1jBuQmmrJf
         ZQgFJnXSrmh9mMXyBlk6yc2g6dV6Eq6VoeNeRcFrMFJVpIdAoMg92fyYoEGZ/Al0blfo
         epqj6ufkNBRCTbF7UfmPszNHZrkig+Ad6MAtecdlZJnWfmFOMAluLmNo7zX3yOPkSVAx
         9dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3+nbTY+84mWqEaxVh9si/y236NGTkkPaVHQEn9FFNrQ=;
        b=KcEvsQR3QYLmH/jf68jum5vPYTiHUq0A1a2Hi3dVcsZQ1p2pJqFAf5HSHGw8xnJaFD
         E5RDE+HcNkiYOnjrORrJ2Ak2fiXcEjtMMpw8teeLK/7PTAvAPd3m8dp/2md0DZmgE8yj
         6xJRFEIm0bO0wzZhxwCmjrcivYPW6TiJRLpuAJzlzVuZXHkQLxxLdtiNvp2DbWSs+wMY
         bm+vuaEcL7Wgcq/gCRsnogUkiXHDzIfKwgxXM4cyNyQoNm1Bkp9jThKn72SARvEv9/lS
         jSvMOtCt3s79aehhu5ySUwkJwcrKvQkjYEO2Ws7ooLgB0CJeKBeJO6blUhbp8GvXpysA
         Ys9Q==
X-Gm-Message-State: AOAM532SxC+Jcsr4Je4wAm7+Xh55nkKk/XqpU04bqPAnKbq8r5l8t+L/
	zRo2d2SEyGmgs2E9f6MRHF0=
X-Google-Smtp-Source: ABdhPJwA45/8xaDYUsCh46Vd5PLnnCYBZYvMyLLmDl7WHF9eI0ftD1WkdGwRVKQNKCGBZhzlQf9Pyg==
X-Received: by 2002:a2e:b8c7:0:b0:24d:a697:cbf3 with SMTP id s7-20020a2eb8c7000000b0024da697cbf3mr5387864ljp.448.1650229510204;
        Sun, 17 Apr 2022 14:05:10 -0700 (PDT)
Subject: Re: [RFC PATCH 6/6] arm/xen: Assign xen-virtio DMA ops for virtio
 devices in Xen guests
To: Christoph Hellwig <hch@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <1649963973-22879-7-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop>
 <YlpdBHKT1bYzZe2e@infradead.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f879622e-5656-deb1-1930-f0cd180a4ab1@gmail.com>
Date: Mon, 18 Apr 2022 00:05:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YlpdBHKT1bYzZe2e@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 16.04.22 09:07, Christoph Hellwig wrote:

Hello Christoph

> On Fri, Apr 15, 2022 at 03:02:45PM -0700, Stefano Stabellini wrote:
>> This makes sense overall. Considering that the swiotlb-xen case and the
>> virtio case are mutually exclusive, I would write it like this:
> Curious question:  Why can't the same grant scheme also be used for
> non-virtio devices?  I really hate having virtio hooks in the arch
> dma code.  Why can't Xen just say in DT/ACPI that grants can be used
> for a given device?


In Xen system:
- the grants are not used for "non-virtualized" devices at all (platform 
devices for the passthrough).
- the grants are widely used for "virtualized, but non-virtio" devices 
(traditional Xen PV devices), but grants for these Xen PV devices
are used in a different way and *not* at the DMA ops level like in 
current approach

Or I misunderstood your question?

This patch series tries to make things work with "virtio" devices in Xen 
system without introducing any modifications to code under drivers/virtio.
We could avoid having virtio hooks in the arch DMA code, but we need to 
trigger setting xen-virtio DMA ops for the virtio device from some other 
place.
For example, the following code would also work, but requires altering 
virtio_mmio_probe():

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 56128b9..8f48491 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -615,6 +615,9 @@ static int virtio_mmio_probe(struct platform_device 
*pdev)
                                               DMA_BIT_MASK(32 + 
PAGE_SHIFT));
         } else {
                 rc = dma_set_mask_and_coherent(&pdev->dev, 
DMA_BIT_MASK(64));
+
+               if (arch_has_restricted_virtio_memory_access())
+ xen_virtio_setup_dma_ops(&pdev->dev);
         }
         if (rc)
                 rc = dma_set_mask_and_coherent(&pdev->dev, 
DMA_BIT_MASK(32));


Another possible option could be to introduce local init function in 
drivers/xen/xen-virtio.c to scan the device tree and set xen-virtio DMA 
ops for all devices with the
"xen,dev-domid" property.


What do you think?

-- 
Regards,

Oleksandr Tyshchenko



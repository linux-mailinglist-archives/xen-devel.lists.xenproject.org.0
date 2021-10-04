Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416FF4208CF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 11:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201255.355688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXKfq-0003n0-A5; Mon, 04 Oct 2021 09:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201255.355688; Mon, 04 Oct 2021 09:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXKfq-0003ky-76; Mon, 04 Oct 2021 09:54:18 +0000
Received: by outflank-mailman (input) for mailman id 201255;
 Mon, 04 Oct 2021 09:54:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sY6e=OY=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1mXKfo-0003kC-EE
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 09:54:16 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 887292d1-525d-42b3-8227-f4ab322db6e8;
 Mon, 04 Oct 2021 09:54:15 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b20so69477628lfv.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 02:54:15 -0700 (PDT)
Received: from localhost ([178.151.124.169])
 by smtp.gmail.com with ESMTPSA id be14sm1567669ljb.7.2021.10.04.02.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 02:54:13 -0700 (PDT)
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
X-Inumbo-ID: 887292d1-525d-42b3-8227-f4ab322db6e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0umGd92a5dhGAHF7Qb3MENIFYI1Ca0QKQfItQDzaBxM=;
        b=IJXsSg7f7CuqFLZDozayVwOcdOWRbDcPFeXiQtPrVxoH4DVpZ/R4MqsC1jpL69JCVJ
         OJYW4CWbZsLty43lxWD0WUBPW9IhH6ZgfmA8baGlwA3FRkdIcXLQ7AwoSOFrGb53L2P9
         i2CglZWLyZwUk4tk7oOqQLYAPT9tT5BELPtnWH+Qnafczo9dmOJoDoSXySrtZFUCR882
         9NsPHDWdVZZeLQWbBK6efcsF6o7oykMINmGjWybpA0IEaJWiF0F2cQdAatBeK6dEQvc+
         3ORqbK913Q9Il9yLCTq3ESI7+O4XonfW2WBTthAKIcD0ckyTIudJnLJAsl9UXG/Jtvm1
         pN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0umGd92a5dhGAHF7Qb3MENIFYI1Ca0QKQfItQDzaBxM=;
        b=pVa6QY5OLnnBXsh9sA3Pkm6dZkQO4Y1GsQWSOr6iTATRQT8vWJ7eB0ct/tzZCjji6L
         FzWcmv5T7QwXIxQlnVq92/LSc8DwyYofS2qMhqlvf52xDw6eCxQkVTUccarGttL3FqOj
         1xGkEgvX4yP4tkS5tft0TlfLlSjkpGNywBfkfFC1gKLUPpvxLGzArLYlatF36GAxIbNl
         xKnG6aCdJpcx2O9vLG/3cGa2kgt9HGaU+wSkFtFQxNJF1k4w4c5Ww3sbdttjJVZhnT9S
         k9W7Tt67EOwLIJlq+53rp1enxMj8MS233qk4vJQZuUj6pZo/rsM4er6tE8qKGGXRCtyL
         Wbeg==
X-Gm-Message-State: AOAM533uVX9MlSi4u+Td81RM+qAelQMxGVNrmpegODUgnqICCYFM0eln
	pxdl6adwflzDSTq8uuvIi5E=
X-Google-Smtp-Source: ABdhPJwp405WaBYmXsqHCSb7cDL4QAlEtFiejN/aKi+OD7BtyLRtbMLig4/eOqFY/iW31AZt1z2S/Q==
X-Received: by 2002:a05:6512:39ca:: with SMTP id k10mr14186305lfu.54.1633341254121;
        Mon, 04 Oct 2021 02:54:14 -0700 (PDT)
From: Roman Skakun <rm.skakun@gmail.com>
X-Google-Original-From: Roman Skakun <Roman_Skakun@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	xen-devel@lists.xenproject.org
Cc: Roman Skakun <roman_skakun@epam.com>,
	Roman Skakun <rm.skakun@gmail.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>
Subject: [RFC 0/1] tag IOMMU-protected devices in Dom0 fdt
Date: Mon,  4 Oct 2021 12:54:01 +0300
Message-Id: <cover.1633106362.git.roman_skakun@epam.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roman Skakun <roman_skakun@epam.com>

At the moment, Dom0 can't distinguish which devices are protected by
IOMMU and which are not. In some cases, this can cause swiotlb bounce
buffer use for DMA addresses above 32 bits, which in turn can lead
to poor performance. I started a conversation at [1], where we discussed
addition of a new device tree property to mark IOMMU-protected devices for Dom0.

As a result of negotiation at [1], I would like to present two
patches:

1. The first patch for the hypervisor. It adds a new device property
'xen,behind-iommu' to a relevant device node when the device is
IOMMU-protected.

2. The second patch is a Linux kernel counterpart. It detects the said
property and disables swiotlb for a device.

There is a possible issue: some devices may not be able to use DMA
addresses above 32 bit boundaries, so we can have problems in the
direct DMA mechanism when swiotlb-xen is disabled for a such
device. More generally, this can affect any device which DMA address
range is narrower than CPU one.
 
In this case,
the device DMA address should be no bigger than 32 bit boundaries for
each device that is not using swiotlb-xen.

Several ideas on how to overcome it:
1. Do not use high memory for Dom0.
2. Set DMA 32bit mask for each device if swiotlb is not used for this device.
3. Force balloon driver to allocate buffers only below 4GB.

I will be glad to get any comments or suggestions.

[1] https://lore.kernel.org/xen-devel/AM7PR03MB65936E5D0B25567D1B2FAECA85CC9@AM7PR03MB6593.eurprd03.prod.outlook.com/

Roman Skakun (1):
  xen/arm: set iommu property for IOMMU-protected devices

 xen/arch/arm/domain_build.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.27.0



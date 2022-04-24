Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932F50D322
	for <lists+xen-devel@lfdr.de>; Sun, 24 Apr 2022 18:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312165.529356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nielk-0006ib-Qy; Sun, 24 Apr 2022 16:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312165.529356; Sun, 24 Apr 2022 16:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nielk-0006gj-Nq; Sun, 24 Apr 2022 16:07:28 +0000
Received: by outflank-mailman (input) for mailman id 312165;
 Sun, 24 Apr 2022 16:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ret3=VC=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nielj-0006gd-DU
 for xen-devel@lists.xenproject.org; Sun, 24 Apr 2022 16:07:27 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a231fb56-c3e8-11ec-8fc2-03012f2f19d4;
 Sun, 24 Apr 2022 18:07:26 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id x33so22324714lfu.1
 for <xen-devel@lists.xenproject.org>; Sun, 24 Apr 2022 09:07:26 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a2e9dc5000000b0024dbe5356bcsm925671ljj.91.2022.04.24.09.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 09:07:25 -0700 (PDT)
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
X-Inumbo-ID: a231fb56-c3e8-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=P0QTcW9KC8jtIUCRBrIIRQHtbmv2CJL2pbvGJ+qNveo=;
        b=RiDL8hh90QWpKHeZOtsPDicsUv8uA01P9JI5zDhJzv9S+hSKAbApcqzHs0T8Ldp9TH
         fAKRmSgdTSQEE98j8anHPESWwfAC2Wr6fwaU0UzzpCRUSoyOzbyPMzyk4xG8MnEvB3iV
         vXzmNcMzP3+/OStgwtLtURtgOrLqR3sG0n+QrmZd6F+knSa4ckhblkdvzPf132oMlyW7
         8t9564ctxOVGtPTZPcgIhaetMmVgXzuHspqXhW5Z1CHzDb7rM2I+v0s8lEPpdwVc60cp
         RKkWFcAQAI+3ep3nitOiLgSd5r38470CHVIt8zrx9Sfl0OWd+5F9Bp8RCTq2DFJy08Ox
         nIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=P0QTcW9KC8jtIUCRBrIIRQHtbmv2CJL2pbvGJ+qNveo=;
        b=dPH9GzbLNiH8mrd3qsCKDPIuTIEipLSZNiqNJFIvRP1YkhOxz449EbJ6HDKX9Opbnx
         eIbBFoDWMP5x15YfGJyS1W/zOkHNxEa7OEd0jujBwCs7YM/o/kLL3siXsKlXmYLpGUyK
         xjKsbWq7fmbIRSus55yrwTwjZ0KP1hIOM0TKCAMT//nXH7bVeYKEZh/ZCDGp4E4D5z/T
         SCQbcO5kAwjIww39jBNyHg/zYP19l2gMZmyrHCxsOJa0+1upMYuojmlYgm9tLEAhrjZU
         +xE6dwICY3Hys0KCqCmXOqvLtW1eeiXh+66JJYThjR+jBzuDBAh0wPqyQZLWI9NlWVN6
         MgRw==
X-Gm-Message-State: AOAM532J8v3PTBjmlsXMAqm/+eJGxgQYKRfbJAaGN4DW6fLCw2e+Z3EV
	TC+mg/1455RFNJw50Ah3kTU=
X-Google-Smtp-Source: ABdhPJwXDQKL0ddwC14m+1rm/W4CunYi8dET47R83s7iLr9ZMexO+AO6MY6p46hpbAM/pGFodjYHLQ==
X-Received: by 2002:a05:6512:685:b0:471:d466:9750 with SMTP id t5-20020a056512068500b00471d4669750mr9842846lfe.623.1650816445822;
        Sun, 24 Apr 2022 09:07:25 -0700 (PDT)
Subject: Re: [PATCH V1 6/6] arm/xen: Assign xen-grant DMA ops for xen-grant
 DMA devices
To: Christoph Hellwig <hch@infradead.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-7-git-send-email-olekstysh@gmail.com>
 <YmQsagqMn56jidFZ@infradead.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d102516a-af42-7637-2b5c-f7da33d5036e@gmail.com>
Date: Sun, 24 Apr 2022 19:07:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YmQsagqMn56jidFZ@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 23.04.22 19:42, Christoph Hellwig wrote:

Hello Christoph

> On Fri, Apr 22, 2022 at 07:51:03PM +0300, Oleksandr Tyshchenko wrote:
>>   static inline void xen_setup_dma_ops(struct device *dev)
>>   {
>>   #ifdef CONFIG_XEN
>> -	if (xen_swiotlb_detect())
>> +	if (arch_has_restricted_virtio_memory_access() &&
>> +			xen_is_grant_dma_device(dev))
>> +		xen_grant_setup_dma_ops(dev);
>> +	else if (xen_swiotlb_detect())
> I don't think that arch_has_restricted_virtio_memory_access
> check should be there as it still is a bit of a layering violation.

Well, I will remove it then (and update commit description).

For virtualized but non-virtio devices, it is not needed at all. For the 
virtio devices, this check is already present at 
virtio.c:virtio_features_ok()



>
-- 
Regards,

Oleksandr Tyshchenko



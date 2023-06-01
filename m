Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E255719620
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542341.846080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4e6a-0001IC-68; Thu, 01 Jun 2023 08:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542341.846080; Thu, 01 Jun 2023 08:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4e6a-0001Er-3G; Thu, 01 Jun 2023 08:56:24 +0000
Received: by outflank-mailman (input) for mailman id 542341;
 Thu, 01 Jun 2023 08:56:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ln7V=BV=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1q4e6Y-0001Ej-Nt
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:56:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e17836a-005a-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 10:56:21 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6ffc2b314so14439075e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 01:56:21 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c224700b003f421979398sm1537847wmm.26.2023.06.01.01.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 01:56:20 -0700 (PDT)
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
X-Inumbo-ID: 2e17836a-005a-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685609781; x=1688201781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPcIYzogUvkAuZPoOm75OhqrBG7H/WeIx3UuNAUp5fo=;
        b=FX6eJkI6/zkoli5SwaO19QQzfQhZzeBHLijCM7/sPrm4NI9OhHW9t+FcxPIBhJiY/m
         O/P6jVqhnrLbZmmZxN/as/m1wSc/IxtdqvZkPC9QgPdztN3nYYMffqOyqUn/BEG0VDfM
         P2EToh2ekvhHYUfHsXHkjCJuE6gonTAL/QwKumqXUkd+4QDYsaFqwrKOTbIHYkYlCYpl
         1/WlWRKYzg71AqKvRRmIefjMRNJdnXaSrF/Mp+ysQfvqA+ZGD7clQLws9JQlFq463kwH
         Mokl5Sllh2jLO3Hddpx2Ug+3B0+b45xGMPOvdMV0benz0hP7oSebjDPf4FDb1FsegM2u
         IWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685609781; x=1688201781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPcIYzogUvkAuZPoOm75OhqrBG7H/WeIx3UuNAUp5fo=;
        b=KMDaxVeYzlztPOEXoqnsGzxU3UjvR0Xx8Ob+oQch3hmj3p20wF4jAksc870YVtvWN/
         yn5vOvR+UhX5vJU/k1ueFSmNW3VGP7F8SUd125eYtRox0BELPlCrBovAqpCecEiiX4eG
         Ttkpseeu+NIWa+n63kGbGhRHOm6WqTUot4+j66G3hURupwMMKKHwz34ll7kiu5HDgodK
         pda5eeAXZf1j6GvXjA5Gij9CokBzTCxumKtN1utP42gKo+D0VgKNFGpOc5HXzczTMMZv
         3kBOoeZNCYeoBkx5XHF8zrJWtE0kAdxNuCpMnMtED0l5Ki/LGwX8/gZapKZutkH/ruCV
         0OUg==
X-Gm-Message-State: AC+VfDz4Qndlo6zubuacc+bEYapiuUWovrBmRSoK0IhNM1SGD6xdG+P4
	eM9mZgCLG5ya6WeKS8Fe7hy9GA==
X-Google-Smtp-Source: ACHHUZ5qrcatzjgrO8GKXy9lGrNgCmQz1mWlw+kzyIt9WRRCbvhU9sqM/XTVz/7lLNRR51FSMvcHTg==
X-Received: by 2002:a05:600c:218d:b0:3f6:3486:1391 with SMTP id e13-20020a05600c218d00b003f634861391mr915286wme.13.1685609781082;
        Thu, 01 Jun 2023 01:56:21 -0700 (PDT)
Message-ID: <f3dc3d82-3928-c75c-18cf-dc42b9060c65@linaro.org>
Date: Thu, 1 Jun 2023 10:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] net: Update MemReentrancyGuard for NIC
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, P J P
 <pj.pandit@yahoo.co.in>, Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <72ccd4c2-7c60-e015-2322-721d09a8334b@linaro.org>
 <233b42b2-6fbb-3882-6158-d2a82bf88be1@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <233b42b2-6fbb-3882-6158-d2a82bf88be1@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/6/23 09:41, Akihiko Odaki wrote:
> On 2023/06/01 16:16, Philippe Mathieu-Daudé wrote:
>> On 1/6/23 05:18, Akihiko Odaki wrote:
>>> Recently MemReentrancyGuard was added to DeviceState to record that the
>>> device is engaging in I/O. The network device backend needs to update it
>>> when delivering a packet to a device.
>>>
>>> This implementation follows what bottom half does, but it does not add
>>> a tracepoint for the case that the network device backend started
>>> delivering a packet to a device which is already engaging in I/O. This
>>> is because such reentrancy frequently happens for
>>> qemu_flush_queued_packets() and is insignificant.
>>>
>>> This series consists of two patches. The first patch makes a bulk 
>>> change to
>>> add a new parameter to qemu_new_nic() and does not contain behavioral 
>>> changes.
>>> The second patch actually implements MemReentrancyGuard update.
>>
>> /me look at the 'net' API.
>>
>> So the NetReceive* handlers from NetClientInfo process the HW NIC
>> data flow, independently from the CPUs.
>>
>> IIUC MemReentrancyGuard is supposed to protect reentrancy abuse from
>> CPUs.
>>
>> NetReceive* handlers aren't restricted to any particular API, they
>> just consume blob of data. Looking at e1000_receive_iov(), this data
>> is filled into memory using the pci_dma_rw() API. pci_dma_rw() gets
>> the AddressSpace to use calling pci_get_address_space(), which returns
>> PCIDevice::bus_master_as. Then we use the dma_memory_rw(), followed
>> by address_space_rw(). Beh, I fail to see why there is reentrancy
>> checks from this NIC DMA HW path.
>>
>> Maybe the MemoryRegion API isn't the correct place to check for
>> reentrancy abuse and we should do that at the AddressSpace level,
>> keeping DMA ASes clear and only protecting CPU ASes?
> 
> The involvement of CPU is not essential in my understanding. A typical 
> scenario of DMA reentrancy is like the following:
> 1) The guest configures the DMA destination address register the device 
> has to the address of another device register.
> 2) The DMA gets triggered.
> 3) The device performs the DMA, writing its own register.
> 4) The write causes reentrancy.
> 5) The re-entered device code corrupts the device state.
> 
> I guess 2) is done by CPU in most cases, but sometimes it happen with 
> another cause. In fact, the current reentrancy protection code covers 
> the case that bottom half handlers triggers DMA. The intention of this 
> series is to extend the coverage and handles the case that incoming 
> network traffic triggers DMA.
> 
> The essence of DMA reentrancy is in 3). This happens when the DMA 
> address space contains the MMIO region of the device and there is no 
> involvement of CPU here.

OK, thanks for the explanation.


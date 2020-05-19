Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78951D9D7B
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 19:07:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb5hC-0002DJ-76; Tue, 19 May 2020 17:06:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B//R=7B=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jb5hA-0002DE-IB
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 17:06:24 +0000
X-Inumbo-ID: 110f5548-99f3-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 110f5548-99f3-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 17:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=89uvTAHM8r7Gcoc2v6jeqC5cUXOEfk1Yfte8B/+lU7I=; b=3vC/AbDTTQzmfh//YYGH+C7nI3
 mR+KSnKUqHskuhKWNsIKVvujSU+XONKTXjxDHUA8GyJCWbe0YSeodIadN5tmpEAIfPdtWGW6+x62l
 /I97rmGH9g7s82BuL+ga245BZTD1mtiS4ooPZcMdlKD+iws8B+LMOt/Nufa4F4OvG+DU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jb5h6-0006OU-6M; Tue, 19 May 2020 17:06:20 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jb5h5-0002vS-V1; Tue, 19 May 2020 17:06:20 +0000
Subject: Re: [PATCH for-4.14 3/3] xen/arm: plat: Allocate as much as possible
 memory below 1GB for dom0 for RPI
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200518113008.15422-1-julien@xen.org>
 <20200518113008.15422-4-julien@xen.org>
 <bc9a1121a7484ef484c30869793698f912987d23.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3570aa57-d5b0-7db2-536f-5cef3c8b2e01@xen.org>
Date: Tue, 19 May 2020 18:06:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bc9a1121a7484ef484c30869793698f912987d23.camel@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "jgrall@amazon.com" <jgrall@amazon.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "roman@zededa.com" <roman@zededa.com>, "minyard@acm.org" <minyard@acm.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/05/2020 21:36, Volodymyr Babchuk wrote:
> Hi Julien,

Hi,


> On Mon, 2020-05-18 at 12:30 +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The raspberry PI 4 has devices that can only DMA into the first GB of
>> the RAM. Therefore we want allocate as much as possible memory below 1GB
>> for dom0.
>>
>> Use the recently introduced dma_bitsize field to specify the DMA width
>> supported.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reported-by: Corey Minyard <minyard@acm.org>
>> ---
>>   xen/arch/arm/platforms/brcm-raspberry-pi.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
>> index b697fa2c6c0e..ad5483437b31 100644
>> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
>> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
>> @@ -43,6 +43,7 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
>>   PLATFORM_START(rpi4, "Raspberry Pi 4")
>>       .compatible     = rpi4_dt_compat,
>>       .blacklist_dev  = rpi4_blacklist_dev,
>> +    .dma_bitsize    = 10,
> 
> I'm confused. Should it be 30?

Argh, yes. I computed the number of bits for 1024 and forgot to add 20 :(.

I will fix it in the next revision.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F81D9D80
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 19:07:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb5iJ-0002Hn-J9; Tue, 19 May 2020 17:07:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B//R=7B=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jb5iI-0002Hf-2w
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 17:07:34 +0000
X-Inumbo-ID: 3ab6facd-99f3-11ea-a955-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ab6facd-99f3-11ea-a955-12813bfff9fa;
 Tue, 19 May 2020 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zBPupmTA7a2M6q+7ZyaoHEWiEA41qdpUVWh+L9qVbtQ=; b=zkYjjoc7eDBzN1/TzLxwSokr0V
 f4NbHPkQlInE3iuM49kKGFxnJFHoAqtEBVvF5YQb9RXfADDHWng11TD37EyH+sAW/zqq7Og6GaUJQ
 7BgvSo1BB7FcySKzocW4c+qgWvpQb+z61LPWxpCLntTyEGHagureR0pi/C0snrv4+I/E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jb5iF-0006RF-3p; Tue, 19 May 2020 17:07:31 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jb5iE-00030w-3J; Tue, 19 May 2020 17:07:30 +0000
Subject: Re: [PATCH for-4.14 3/3] xen/arm: plat: Allocate as much as possible
 memory below 1GB for dom0 for RPI
To: minyard@acm.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200518113008.15422-1-julien@xen.org>
 <20200518113008.15422-4-julien@xen.org>
 <bc9a1121a7484ef484c30869793698f912987d23.camel@epam.com>
 <20200519000242.GA3948@minyard.net>
From: Julien Grall <julien@xen.org>
Message-ID: <d48d6fa3-8c09-0a89-e399-09e25909b590@xen.org>
Date: Tue, 19 May 2020 18:07:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519000242.GA3948@minyard.net>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jgrall@amazon.com" <jgrall@amazon.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "roman@zededa.com" <roman@zededa.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Corey,

On 19/05/2020 01:02, Corey Minyard wrote:
> On Mon, May 18, 2020 at 08:36:08PM +0000, Volodymyr Babchuk wrote:
>> Hi Julien,
>>
>> On Mon, 2020-05-18 at 12:30 +0100, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> The raspberry PI 4 has devices that can only DMA into the first GB of
>>> the RAM. Therefore we want allocate as much as possible memory below 1GB
>>> for dom0.
>>>
>>> Use the recently introduced dma_bitsize field to specify the DMA width
>>> supported.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> Reported-by: Corey Minyard <minyard@acm.org>
>>> ---
>>>   xen/arch/arm/platforms/brcm-raspberry-pi.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
>>> index b697fa2c6c0e..ad5483437b31 100644
>>> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
>>> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
>>> @@ -43,6 +43,7 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
>>>   PLATFORM_START(rpi4, "Raspberry Pi 4")
>>>       .compatible     = rpi4_dt_compat,
>>>       .blacklist_dev  = rpi4_blacklist_dev,
>>> +    .dma_bitsize    = 10,
>>
>> I'm confused. Should it be 30?
> 
> Indeed it should.  I just tested this series, and Linux fails to boot
> with this set to 10.  With it set to 30 it works.
> 
> With this set to 30, you can have a:
> 
> Tested-by: Corey Minyard <cminyard@mvista.com>
> 
> for all three patches.

Thank you for the testing! I will fix the bug and resend the series.

Cheers,

-- 
Julien Grall


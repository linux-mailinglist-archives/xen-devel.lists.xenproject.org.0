Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16FA1D9D4B
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 18:56:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb5WN-0001Gl-02; Tue, 19 May 2020 16:55:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B//R=7B=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jb5WL-0001Gg-LM
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 16:55:13 +0000
X-Inumbo-ID: 818b6d5e-99f1-11ea-a952-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 818b6d5e-99f1-11ea-a952-12813bfff9fa;
 Tue, 19 May 2020 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gto+boTdw2omfbvehY12Pb4RamepkHtOCM4G5Kfb5+k=; b=dD57fle5yNNRL4AmhWyQZvSUaS
 /GTI8o8LC1/9MPfaTPWqFcFAyI54oIoxYpmErIQ//5jdfGPG5Pst3The0nhHSLIYOF1GG8RgfmwMN
 TPcfz5QgduPz51XlvyKwgePJL0/NVkv7elv+3Xo5pzSuMrzq6EWn3UY6zw+wBPxGy5LU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jb5WH-00068L-HT; Tue, 19 May 2020 16:55:09 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jb5WH-00026d-AD; Tue, 19 May 2020 16:55:09 +0000
Subject: Re: [PATCH for-4.14 2/3] xen/arm: Take into account the DMA width
 when allocating Dom0 memory banks
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200518113008.15422-1-julien@xen.org>
 <20200518113008.15422-3-julien@xen.org>
 <aa95369bf22df89404243dd4e7374f8015ccc9ad.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a88cb65b-469f-464e-cbfa-20d56ff5c839@xen.org>
Date: Tue, 19 May 2020 17:55:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <aa95369bf22df89404243dd4e7374f8015ccc9ad.camel@epam.com>
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



On 18/05/2020 21:34, Volodymyr Babchuk wrote:
> Hi Julien,

Hi Volodymyr,

Thank you for the review.

> 
> On Mon, 2020-05-18 at 12:30 +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, Xen is assuming that all the devices are at least 32-bit
>> DMA capable. However, some SoCs have devices that may be able to access
>> a much restricted range. For instance, the Raspberry PI 4 has devices
>> that can only access the first GB of RAM.
>>
>> The function arch_get_dma_bit_size() will return the lowest DMA width on
>> the platform. Use it to decide what is the limit for the low memory.
>>
>> Signed-off-by: Julien GralL <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/domain_build.c | 32 +++++++++++++++++++-------------
>>   1 file changed, 19 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 430708753642..abc4e463d27c 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -211,10 +211,13 @@ fail:
>>    *    the ramdisk and DTB must be placed within a certain proximity of
>>    *    the kernel within RAM.
>>    * 3. For dom0 we want to place as much of the RAM as we reasonably can
>> - *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-bit)
>> + *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-bit).
> Is full stop really needed there?

I was meant to remove the line below as it is now part of 4). I will 
remove it in the next version.

Best regards,

-- 
Julien Grall


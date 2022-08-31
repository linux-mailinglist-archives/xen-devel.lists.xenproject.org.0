Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B2E5A8614
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 20:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395994.635915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTSoU-0000ck-D7; Wed, 31 Aug 2022 18:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395994.635915; Wed, 31 Aug 2022 18:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTSoU-0000aP-AW; Wed, 31 Aug 2022 18:51:46 +0000
Received: by outflank-mailman (input) for mailman id 395994;
 Wed, 31 Aug 2022 18:51:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTSoT-0000aJ-Fj
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 18:51:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTSoT-0004wc-62; Wed, 31 Aug 2022 18:51:45 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTSoS-0002jR-UP; Wed, 31 Aug 2022 18:51:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Uz5oTr7RInbkHDnOQ66TK97U5AKLqHr+GGcb7MrFNXQ=; b=mJw2FBPPsV7uKxKomBoRGssa/q
	iBwL8BEMURKZmB+NIJkUo4WtWRjg34dYvuZFDlh6DawGWrO6tWlMVx3nDbzjL8dgHJ5uQOMe5XH6i
	JuMeuvM9zWJjgGa835g6eecohB/HRoWt0olK6SXwSZKjSAUo4732lETqNXZHVb5bmW7U=;
Message-ID: <471d27b4-f067-4874-c1e2-893def8520db@xen.org>
Date: Wed, 31 Aug 2022 19:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Arm
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220816185954.31945-1-julien@xen.org>
 <DU2PR08MB7325F0A3D69B1CECC9896704F76A9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB7325F0A3D69B1CECC9896704F76A9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/08/2022 07:33, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Julien Grall
>> Sent: Wednesday, August 17, 2022 3:00 AM
>> To: xen-devel@lists.xenproject.org
>> Cc: julien@xen.org; Julien Grall <jgrall@amazon.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Arm
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> __ro_after_init was introduced recently to prevent modifying some variables
>> after init.
>>
>> At the moment, on Arm, the variables will still be accessible because the
>> region permission is not updated.
>>
>> Address that, but moving the sections .data.ro_after_init out of .data and
>> then mark the region read-only once we finish to boot.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
> 
> Reviewed-by: Penny Zheng <penny.zheng@arm.com>

Thanks!

> 
>> ---
>>
>> This patch is targeting Xen 4.17. There are quite a few arm specific variables
>> that could be switch to use __ro_after_init.
>>
>> This is not addressed by the commit. We could consider to switch some of
>> them for Xen 4.17. So the benefits for now is any common variables using
>> __ro_after_init.
>> ---
>>   xen/arch/arm/include/asm/setup.h |  2 ++
>>   xen/arch/arm/setup.c             | 14 ++++++++++++++
>>   xen/arch/arm/xen.lds.S           |  7 +++++++
>>   3 files changed, 23 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/setup.h
>> b/xen/arch/arm/include/asm/setup.h
>> index 2bb01ecfa88f..5815ccf8c5cc 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -137,6 +137,8 @@ u32 device_tree_get_u32(const void *fdt, int node,
>> int map_range_to_domain(const struct dt_device_node *dev,
>>                           u64 addr, u64 len, void *data);
>>
>> +extern const char __ro_after_init_start[], __ro_after_init_end[];
>> +
>>   #endif
>>   /*
>>    * Local variables:
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c index
>> 500307edc08d..5bde321b9d07 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -75,10 +75,24 @@ domid_t __read_mostly max_init_domid;
>>
>>   static __used void init_done(void)
>>   {
>> +    int rc;
>> +
>>       /* Must be done past setting system_state. */
>>       unregister_init_virtual_region();
>>
>>       free_init_memory();
>> +
>> +    /*
>> +     * We have finished to boot. Mark the section .data.ro_after_init
>> +     * read-only.
>> +     */
> 
> Nit: Maybe it is finish + doing, could be wrong, feel free to change or not~~

I will update.

Cheers,

-- 
Julien Grall


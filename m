Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1A6306051
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76209.137415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nBI-0004m0-5J; Wed, 27 Jan 2021 15:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76209.137415; Wed, 27 Jan 2021 15:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nBI-0004la-1z; Wed, 27 Jan 2021 15:56:32 +0000
Received: by outflank-mailman (input) for mailman id 76209;
 Wed, 27 Jan 2021 15:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4nBH-0004lU-9S
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:56:31 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69433b44-277f-4525-8e0c-eb570110dd9e;
 Wed, 27 Jan 2021 15:56:30 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u4so1136587ljh.6
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 07:56:30 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b18sm571446lfj.140.2021.01.27.07.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 07:56:28 -0800 (PST)
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
X-Inumbo-ID: 69433b44-277f-4525-8e0c-eb570110dd9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CRyW8rkPsLT7YF/rk2+4Vx9IxhFYfHnNbcfdwTMsY8E=;
        b=Oe4lUDChrTx6x89vxQhjtgbuaTSeFG9AxuDoMRxl+a/tCbJD1ywj3YMZEfZV4eFGBK
         658jgeYdZEO7sIf1DOoQHJTVUDQnVe9TKmnYl1BE1F5sa2rUFa9pSeogSjwT6CBg+mMm
         jODZnjs3Bzu2hO6j1HPC4sGG1K7PW/rI4ZtgwpJjUYWYRgNucoXVGexISMFA1I2pBig5
         wj4VKfaBowlL2ntu2vZyX+yXrrEtuOTBgzD0UNHTbKhJmyO7eptfsBFFtC88SZh87fKx
         fFopkiEXw3gp0s18YsmxedL60+VCsD3vrBVoPsmumMinahlk7c0q3l1PyOy9YA1h9Izg
         CqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CRyW8rkPsLT7YF/rk2+4Vx9IxhFYfHnNbcfdwTMsY8E=;
        b=bSiTfXWN5zB4RZhnCxnFSpY/3OcWB/z+wsTBCl6HE+/I3dZ55b1NJpLwz63bDtoaFK
         hGy0xIM8U/t2n0sy6JGrQg+UFd114lB4Pz7ESBsBfMOlLi4Lzm9GG9E05rGu5y+wnnh4
         nUFo1phE7h/46OaDmvqH74rIuU+2/0BWE7zigZv3ccHotbqdWMy6GcyVm/+E0Ob9jtFI
         FUXrip9K/1eE8B9z9wMltFJSq1BxvI2pa0P2r+biogglZNR7t6NuV/Ky7Y13yQh5htrh
         BhvB4ramX+JcceegMtyMbLUAgKFrrvPh7LDCojHtns4i/cByVXFbZe39KulOyerD5NjS
         4oWQ==
X-Gm-Message-State: AOAM531CGPqWIiS1gBen2E51iLxX5yXEa0JK0SiZ/YrQ5bB6FpWYZKfx
	Nd6Ab0t4ic+eObo3dtahRlU=
X-Google-Smtp-Source: ABdhPJz8717lfWAXeCFBGByX8rLkvC00hefsvn/cNtmUW4FyKUHBSRTwr7YbkE8GC6rqGY76iMQYRA==
X-Received: by 2002:a2e:9d5:: with SMTP id 204mr5919073ljj.84.1611762988981;
        Wed, 27 Jan 2021 07:56:28 -0800 (PST)
Subject: Re: [PATCH V5 15/22] xen/arm: Call vcpu_ioreq_handle_completion() in
 check_for_vcpu_work()
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-16-git-send-email-olekstysh@gmail.com>
 <75703470-5a5a-98e5-bdfa-ca91a5cf439b@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0d1a9eed-f898-079f-6176-ca05d2374059@gmail.com>
Date: Wed, 27 Jan 2021 17:56:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <75703470-5a5a-98e5-bdfa-ca91a5cf439b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.21 16:49, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien, Stefano


>
> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds remaining bits needed for the IOREQ support on Arm.
>> Besides just calling vcpu_ioreq_handle_completion() we need to handle
>> it's return value to make sure that all the vCPU works are done before
>> we return to the guest (the vcpu_ioreq_handle_completion() may return
>> false if there is vCPU work to do or IOREQ state is invalid).
>> For that reason we use an unbounded loop in leave_hypervisor_to_guest().
>>
>> The worse that can happen here if the vCPU will never run again
>> (the I/O will never complete). But, in Xen case, if the I/O never
>> completes then it most likely means that something went horribly
>> wrong with the Device Emulator. And it is most likely not safe
>> to continue. So letting the vCPU to spin forever if the I/O never
>> completes is a safer action than letting it continue and leaving
>> the guest in unclear state and is the best what we can do for now.
>>
>> Please note, using this loop we will not spin forever on a pCPU,
>> preventing any other vCPUs from being scheduled. At every loop
>> we will call check_for_pcpu_work() that will process pending
>> softirqs. In case of failure, the guest will crash and the vCPU
>> will be unscheduled. In normal case, if the rescheduling is necessary
>> the vCPU will be rescheduled to give place to someone else.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes V1 -> V2:
>>     - new patch, changes were derived from (+ new explanation):
>>       arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>
>> Changes V2 -> V3:
>>     - update patch description
>>
>> Changes V3 -> V4:
>>     - update patch description and comment in code
>>
>> Changes V4 -> V5:
>>     - add Stefano's R-b
>
> Reviewed-by means the person reviewed the code and confirmed it is 
> correct. Given the changes you made below, I don't think this tag can 
> hold.
>
> Please confirm with Stefano he is happy with the tag to be carried.

I think you are right, sorry for that. I should have either clarified 
this question with Stefano in advance or dropped this tag.

@Stefano, are you happy with the changes for V4 -> V5 (would you mind if 
your R-b still stands)?


>
> Other than that, the change looks good to me:
>
> Acked-by: Julien Grall <jgrall@amazon.com>


Thanks.


>
> Cheers,
>
>>     - update patch subject/description and comment in code,
>>       was "xen/arm: Stick around in leave_hypervisor_to_guest until 
>> I/O has completed"
>>     - change loop logic a bit
>>     - squash with changes to check_for_vcpu_work() from patch #14
>>
>> ---
>> ---
>>   xen/arch/arm/traps.c | 26 +++++++++++++++++++++++---
>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index b0cd8f9..2039ff5 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -21,6 +21,7 @@
>>   #include <xen/hypercall.h>
>>   #include <xen/init.h>
>>   #include <xen/iocap.h>
>> +#include <xen/ioreq.h>
>>   #include <xen/irq.h>
>>   #include <xen/lib.h>
>>   #include <xen/mem_access.h>
>> @@ -2261,12 +2262,23 @@ static void check_for_pcpu_work(void)
>>    * Process pending work for the vCPU. Any call should be fast or
>>    * implement preemption.
>>    */
>> -static void check_for_vcpu_work(void)
>> +static bool check_for_vcpu_work(void)
>>   {
>>       struct vcpu *v = current;
>>   +#ifdef CONFIG_IOREQ_SERVER
>> +    bool handled;
>> +
>> +    local_irq_enable();
>> +    handled = vcpu_ioreq_handle_completion(v);
>> +    local_irq_disable();
>> +
>> +    if ( !handled )
>> +        return true;
>> +#endif
>> +
>>       if ( likely(!v->arch.need_flush_to_ram) )
>> -        return;
>> +        return false;
>>         /*
>>        * Give a chance for the pCPU to process work before handling 
>> the vCPU
>> @@ -2277,6 +2289,8 @@ static void check_for_vcpu_work(void)
>>       local_irq_enable();
>>       p2m_flush_vm(v);
>>       local_irq_disable();
>> +
>> +    return false;
>>   }
>>     /*
>> @@ -2289,7 +2303,13 @@ void leave_hypervisor_to_guest(void)
>>   {
>>       local_irq_disable();
>>   -    check_for_vcpu_work();
>> +    /*
>> +     * check_for_vcpu_work() may return true if there are more work 
>> to before
>> +     * the vCPU can safely resume. This gives us an opportunity to 
>> deschedule
>> +     * the vCPU if needed.
>> +     */
>> +    while ( check_for_vcpu_work() )
>> +        check_for_pcpu_work();
>>       check_for_pcpu_work();
>>         vgic_sync_to_lrs();
>>
>
-- 
Regards,

Oleksandr Tyshchenko



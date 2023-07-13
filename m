Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C85752096
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 13:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563118.880121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJuxC-0002Ch-Vz; Thu, 13 Jul 2023 11:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563118.880121; Thu, 13 Jul 2023 11:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJuxC-0002A8-SR; Thu, 13 Jul 2023 11:57:50 +0000
Received: by outflank-mailman (input) for mailman id 563118;
 Thu, 13 Jul 2023 11:57:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qJuxB-0002A0-PN
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 11:57:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJux9-0007i4-8C; Thu, 13 Jul 2023 11:57:47 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.30.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJux9-0008Je-2X; Thu, 13 Jul 2023 11:57:47 +0000
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
	bh=Uh6TFhOJ/u/QHYVOBICtcvOXTt06PmVU+nYj7Ur9eQk=; b=1oVOcxUVnJRvZsqyPsXKe1Dunp
	gZORyDkiZtNr5Xv4Z2II5pDBVntRV7FpCXcHl+JQ289n91r1FhjPdU+YyudVMugNyxm3irXb4iJTs
	9cwGfo/n3YVSLXYSC4oaHWzgO5eObyd7lOZzcaYqMNXxWC6MzvwbGybvK4J8OOhavPjk=;
Message-ID: <52c836d7-3e63-d577-754a-6bec029033d6@xen.org>
Date: Thu, 13 Jul 2023 12:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
 <d05c5fb0-63ab-4368-ed3b-bb06b242808a@xen.org>
 <27c323353ffd231f778b48b1cf6bca8560c7734a.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <27c323353ffd231f778b48b1cf6bca8560c7734a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 13/07/2023 12:55, Oleksii wrote:
> On Thu, 2023-07-13 at 11:13 +0100, Julien Grall wrote:
>> Hi Jan,
>>
>> On 13/07/2023 11:08, Jan Beulich wrote:
>>> On 13.07.2023 11:30, Oleksii Kurochko wrote:
>>>> --- a/xen/drivers/char/ns16550.c
>>>> +++ b/xen/drivers/char/ns16550.c
>>>> @@ -1791,8 +1791,16 @@ static int __init
>>>> ns16550_uart_dt_init(struct dt_device_node *dev,
>>>>        }
>>>>    
>>>>        res = platform_get_irq(dev, 0);
>>>> -    if ( ! res )
>>>> -        return -EINVAL;
>>>> +    if ( res == -1 )
>>>> +    {
>>>> +        printk("ns1650: polling will be used\n");
>>>
>>> Nit: Please don't omit one of the two 5-s here.
>>>
>>>> +        /*
>>>> +         * There is the check 'if ( uart->irq > 0 )' in
>>>> ns16550_init_postirq().
>>>> +         * If the check is true then interrupt mode will be used
>>>> otherwise
>>>> +         * ( when irq = 0 )polling.
>>>> +         */
>>>
>>> I wonder in how far that's actually correct outside of x86. On x86
>>> IRQ0 is
>>> always the timer interrupt, but I'm not convinced something similar
>>> can be
>>> used as kind of a heuristic on Arm, RISC-V, or basically any other
>>> architecture.
>>
>> I wondered the same. On Arm we are fine because the UART will be an
>> SPI
>> which starts at 32.
>>
>> That's part why I was suggesting to use a define. Because we don't
>> have
>> to hardcode the poll value everywhere.
> Probably then it would be better to introduce 'bool is_polling_mode'
> inside struct ns16550?

I would be OK with that.

Cheers,

-- 
Julien Grall


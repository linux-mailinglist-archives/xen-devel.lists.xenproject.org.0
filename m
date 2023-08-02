Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA876D9C4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575765.901302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJbO-0001vD-II; Wed, 02 Aug 2023 21:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575765.901302; Wed, 02 Aug 2023 21:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJbO-0001tY-Eo; Wed, 02 Aug 2023 21:41:54 +0000
Received: by outflank-mailman (input) for mailman id 575765;
 Wed, 02 Aug 2023 21:41:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRJbM-0001tQ-OR
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:41:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRJbJ-0006Pk-63; Wed, 02 Aug 2023 21:41:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRJbJ-00008O-0a; Wed, 02 Aug 2023 21:41:49 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=5OX86ePTqckG8JhNv/p3p6t5dZGA691nyQRGEt/NfsA=; b=hr/WJbdyWhsdJYWBE1kkalzft9
	QqY2Zu1HkYzlzQw0GH9Wun9VRxIgYGzV6VekX3o7SwDrTWKZe7W82pSZWNWaLreJLXlCR+T8K3QWs
	L/zkAavB6jnLtkTpV9CoIOGDySLk115EITVY0cVsY6Gnka0dd6NKr1i5FT9N63eXXhNE=;
Message-ID: <d82d4c97-eb5c-0446-408d-7fd2f7af45fd@xen.org>
Date: Wed, 2 Aug 2023 22:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1690475512.git.oleksii.kurochko@gmail.com>
 <6e8f243284b53a9c56e7faf5e0e5ee5e20de9958.1690475512.git.oleksii.kurochko@gmail.com>
 <98596d8e-6c11-715a-7842-910806abda77@suse.com>
 <75cd58c00ac6b9f49f1656d6793888ef470c9eff.camel@gmail.com>
 <9c74b2a2-450c-6932-868f-6109374de6bc@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v4 1/1] ns16550: add support for polling mode when device
 tree is used
In-Reply-To: <9c74b2a2-450c-6932-868f-6109374de6bc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/08/2023 10:59, Jan Beulich wrote:
> On 01.08.2023 11:46, Oleksii wrote:
>> On Mon, 2023-07-31 at 15:24 +0200, Jan Beulich wrote:
>>> On 27.07.2023 18:45, Oleksii Kurochko wrote:
>>>> @@ -654,6 +674,9 @@ static void ns16550_init_common(struct ns16550
>>>> *uart)
>>>>   
>>>>       /* Default lsr_mask = UART_LSR_THRE */
>>>>       uart->lsr_mask  = UART_LSR_THRE;
>>>> +
>>>> +    if ( strstr(opt_com1, "poll") || strstr(opt_com2, "poll") )
>>>> +        uart->intr_works = polling;
>>>>   }
>>>
>>> A non-__init function may not reference __initdata objects. But
>>> strstr()
>>> is too lax anyway, and you also shouldn't check the wrong port's
>>> options.
>>> You want to recognize "poll" _only_ where all other command line
>>> options
>>> are processed.
>> Just to confirm, do you mean that I should use parse_positional() ( or
>> something similar ) for the device-tree method of initializing ns16550?
>>
>> I checked the polling behavior as described above because
>> parse_positional() is utilized solely for X86.
>>
>> It appears that command line options are parsed only in the case of
>> x86.
> 
> Hmm, looks like you're right. Arm folks will want to clarify how they
> got away without any command line overrides so far,

So far, everything we needed was described in the firmware table (e.g. 
ACPI/Device-Tree).

> and how they think
> now necessary ones should be suitably added.

I think "poll" is the only parameter that we should parse on Arm.

> I recall I had reservations
> when the file was massaged to compile out supposedly x86-only code.

I had a look at the code protected by CONFIG_X86. Most of it still want 
to be configured behind CONFIG_X86 at least until we have PCI support. 
But even with it, some work would be necessary to be able to support PCI 
UART.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6675357B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 10:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563545.880784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKEU0-0007f3-LN; Fri, 14 Jul 2023 08:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563545.880784; Fri, 14 Jul 2023 08:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKEU0-0007ct-IB; Fri, 14 Jul 2023 08:49:00 +0000
Received: by outflank-mailman (input) for mailman id 563545;
 Fri, 14 Jul 2023 08:49:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qKEU0-0007cn-03
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 08:49:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKETw-000463-HJ; Fri, 14 Jul 2023 08:48:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKETw-0007oX-Bl; Fri, 14 Jul 2023 08:48:56 +0000
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
	bh=1ZuDIzolVXjcGfSwtYfZGIy2VfnapVBjsWS6xe58X0I=; b=LMczv2XecMCYenzptHJYRh5lJx
	lU4+EAvMFTCEGAOeLgAdX98gKee0OGchcAQxidKDYpxDVPJnv6O87jUfAYnseCFdGzeS/7vXXDDWr
	XrmsSAMR7AeXkNvLyDYuxAUe+6Oe/ndhgwDYyvuJhFD0TLCG57u2A+fa7Ps4DCZ+XHcs=;
Message-ID: <610ce9f8-58d1-a5d8-d46a-888e119762b6@xen.org>
Date: Fri, 14 Jul 2023 09:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
 <86702f86787ee7b963b131c4b2d6db463eddc1f3.camel@gmail.com>
 <3e4c673d-1b8b-15ab-629f-27a9f687b37a@suse.com>
 <83f67337cb69fb8cf2aa5d56b8a711384cdaa5f0.camel@gmail.com>
 <200693a2-267d-16c8-61f3-3047dc8967da@suse.com>
 <9415dc2fe8c8ca0325ba6dfe41fdf72cb0f2ea0a.camel@gmail.com>
 <ed458992-b1c3-527c-4372-67355a5616e0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ed458992-b1c3-527c-4372-67355a5616e0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/07/2023 07:56, Jan Beulich wrote:
> On 13.07.2023 19:49, Oleksii wrote:
>> On Thu, 2023-07-13 at 16:26 +0200, Jan Beulich wrote:
>>> On 13.07.2023 15:36, Oleksii wrote:
>>>> On Thu, 2023-07-13 at 15:27 +0200, Jan Beulich wrote:
>>>>> I don't understand. My earlier comment was affecting all checks
>>>>> of
>>>>> uart->irq alike, as I'm unconvinced IRQ0 may not possibly be
>>>>> usable
>>>>> on some architecture / platform. IOW I don't see why the check in
>>>>> ns16550_init_postirq() would allow us any leeway.
>>>> It looks like I misunderstood you.
>>>>
>>>> Do you mean that on some architecture IRQ0 may be used for ns16550?
>>>
>>> Yes, I don't see why this shouldn't be possible in principle. As
>>> Julien
>>> said it can't happen on Arm, so if it also can't happen on RISC-V and
>>> PPC, we could elect to continue to ignore that aspect.
>>>
>> Then for RISC-V ( at least, for PLIC interrupt controller ) it is
>> reserved:
>> https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#interrupt-identifiers-ids
>>
>> What about to have 'define NO_IRQ_POLL 0' ( mentioned by Julien )+
>> assert(irq_from_device_tree != NO_IRQ_POLL) ?
> 
> Such a #define may be okay as long as indeed used consistently in all
> places where it belongs (which may mean making some code less simple,
> which is a downside), but I can't judge at all the validity of the
> assertion you propose.

Is the assert() indented to check the return of platform_get_irq()? If 
so, the return value is considered as user input because it is coming 
from the device-tree. assert()s must not be used for checking external 
input. Instead, you need to add proper check (i.e. if (...)).

Cheers,

-- 
Julien Grall


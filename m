Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D939E76F07B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 19:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576531.902769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbwR-0002fB-9e; Thu, 03 Aug 2023 17:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576531.902769; Thu, 03 Aug 2023 17:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRbwR-0002cJ-6H; Thu, 03 Aug 2023 17:16:51 +0000
Received: by outflank-mailman (input) for mailman id 576531;
 Thu, 03 Aug 2023 17:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D5Ec=DU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qRbwP-0002bQ-Hi
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 17:16:49 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86a68162-3221-11ee-b269-6b7b168915f2;
 Thu, 03 Aug 2023 19:16:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5D49C82852F1;
 Thu,  3 Aug 2023 12:16:46 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IrDwIyeYSX4W; Thu,  3 Aug 2023 12:16:45 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 737FA8285416;
 Thu,  3 Aug 2023 12:16:45 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EPQiwLxHX71q; Thu,  3 Aug 2023 12:16:45 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 1F12C82852F1;
 Thu,  3 Aug 2023 12:16:45 -0500 (CDT)
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
X-Inumbo-ID: 86a68162-3221-11ee-b269-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 737FA8285416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691083005; bh=kOK47EPTNtM3IAKsvYQKRr4Q8E0gVq5NmMdRgtphQa4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=rA5belChoe4thu0NT5lVVisIB89PwzTAkCj4Eb5B2jjfIeoOxwUae7lv1hpwsl6dw
	 EeLWA1YYcY1jS8IdNBMSGlTm7JvrXUcC+VEoHndqj6hk//Td6JTzBNhVtG0Vi4bBKo
	 Pp+is4bVlhVnkwxfkoqVHbS+bCj3DuVnO0QOUTwc=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <31a31730-583e-6a22-48f2-44539202ef2d@raptorengineering.com>
Date: Thu, 3 Aug 2023 12:16:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] xen/ppc: Relocate kernel to physical address 0 on
 boot
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690582001.git.sanastasio@raptorengineering.com>
 <0802fad2743526da4fe49f0225e14161464f192e.1690582001.git.sanastasio@raptorengineering.com>
 <3b6b0984-89fb-268e-970a-0c7eb19a4863@suse.com>
 <428aa0e8-70bb-efb5-2b5a-54229b77c5a3@raptorengineering.com>
 <f62e5ac7-500a-6909-90f2-4580c14e2a18@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <f62e5ac7-500a-6909-90f2-4580c14e2a18@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/23 1:08 AM, Jan Beulich wrote:
> On 01.08.2023 01:37, Shawn Anastasio wrote:
>> On 7/31/23 10:46 AM, Jan Beulich wrote:
>>> On 29.07.2023 00:21, Shawn Anastasio wrote:
>>>> +    /* If we're at the correct address, skip copy */
>>>> +    cmpld   %r1, %r12
>>>> +    beq     .L_correct_address
>>>
>>> Can this ever be the case, especially with the MMU-off behavior you
>>> describe in the comment above? Wouldn't you need to ignore the top
>>> four bits in the comparison?
>>
>> It will always be the case after the code jumps to XEN_VIRT_START after
>> the copy takes place.
> 
> Well, of course.
> 
>> I could have it jump past the copy loop entirely,
>> but then I'd need to duplicate the TOC setup.
> 
> I don't think I understand this part of your reply: .L_correct_address
> _is_ past the copy loop.

Sorry, let me elaborate. I meant that I could have the end of the copy
loop (the mtctr + btctr preceeding .L_correct_address) jump to
(XEN_VIRT_START + .L_correct_address) as opposed to XEN_VIRT_START so
that the address comparison you originally commented on wouldn't be hit
again.

This would mean adding another TOC setup block at .L_correct_address,
though, since we'd be skipping over the one at the beginning of the
routine and the TOC needs to be reconfigured after the relocation.

>>>> +    /* Copy bytes until _end */
>>>> +    LOAD_REG_ADDR(%r11, _end)
>>>> +    addi    %r1, %r1, -8
>>>> +    li      %r13, -8
>>>> +.L_copy_xen:
>>>> +    ldu     %r10, 8(%r1)
>>>> +    stdu    %r10, 8(%r13)
>>>> +    cmpld   %r1, %r11
>>>> +    blt     .L_copy_xen
>>>> +
>>>> +    /* Jump to XEN_VIRT_START */
>>>> +    mtctr   %r12
>>>> +    bctr
>>>> +.L_correct_address:
>>>
>>> Can the two regions potentially overlap? Looking at the ELF header
>>> it's not clear to me what guarantees there are that this can't
>>> happen.
>>
>> As I understand it, any bootloader that placed the kernel at a low
>> enough address for this to be an issue wouldn't be able to boot Linux or
>> FreeBSD, so in practice it's a safe bet that this won't be the case.
> 
> Fair enough then.
> 
> Jan

Thanks,
Shawn


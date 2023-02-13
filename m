Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AD6694A5B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 16:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494684.764854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaQG-0000ec-Bp; Mon, 13 Feb 2023 15:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494684.764854; Mon, 13 Feb 2023 15:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaQG-0000br-8r; Mon, 13 Feb 2023 15:07:16 +0000
Received: by outflank-mailman (input) for mailman id 494684;
 Mon, 13 Feb 2023 15:07:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pRaQE-0000bl-Gb
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 15:07:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pRaQA-0000Wn-SN; Mon, 13 Feb 2023 15:07:10 +0000
Received: from [54.239.6.185] (helo=[192.168.15.251])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pRaQA-0008Ox-LZ; Mon, 13 Feb 2023 15:07:10 +0000
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
	bh=62FwoNnNBqh0Nw0JIG6R3abksgyPBoHkVO3C7jnYJ44=; b=0BmNrT1zRQ2f4jlJlBXveM1sM8
	/05ycoAP7OmUc2nwmIpFXnLO9Lekinvqu0gXBi9YHXTziMU1jTUfgFpI/ZPpXAGk+CtdT1IhA34DM
	PoC0NQtntnFzas3HumK4OkEjZal++dTzpVIsvuHcF37zRCOR9T68wTLxRVq2gQ2oFyos=;
Message-ID: <8f062433-659d-fe4a-4ac0-7a6b426e85ed@xen.org>
Date: Mon, 13 Feb 2023 15:07:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
 <e0ab939d-30f0-f9d9-1913-6e63e7023d0a@suse.com>
 <1b079086-ffb7-2716-8092-b69ede4aec8c@xen.org>
 <72b13300-57b5-022c-75a1-7fa588752f27@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <72b13300-57b5-022c-75a1-7fa588752f27@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/02/2023 15:02, Jan Beulich wrote:
> On 13.02.2023 14:56, Julien Grall wrote:
>> On 13/02/2023 13:30, Jan Beulich wrote:
>>> On 13.02.2023 14:19, Julien Grall wrote:
>>>> On 13/02/2023 12:24, Jan Beulich wrote:
>>>>> On 03.02.2023 18:05, Oleksii Kurochko wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/xen/include/xen/bug.h
>>>>>> @@ -0,0 +1,127 @@
>>>>>> +#ifndef __XEN_BUG_H__
>>>>>> +#define __XEN_BUG_H__
>>>>>> +
>>>>>> +#define BUG_DISP_WIDTH    24
>>>>>> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>>>>> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>>>>> +
>>>>>> +#define BUGFRAME_run_fn 0
>>>>>> +#define BUGFRAME_warn   1
>>>>>> +#define BUGFRAME_bug    2
>>>>>> +#define BUGFRAME_assert 3
>>>>>> +
>>>>>> +#define BUGFRAME_NR     4
>>>>>> +
>>>>>> +#ifndef __ASSEMBLY__
>>>>>> +
>>>>>> +#include <xen/errno.h>
>>>>>> +#include <xen/stringify.h>
>>>>>> +#include <xen/types.h>
>>>>>> +#include <xen/lib.h>
>>>>>
>>>>> Again - please sort headers.
>>>>>
>>>>>> +#include <asm/bug.h>
>>>>>> +
>>>>>> +#ifndef BUG_FRAME_STUFF
>>>>>> +struct bug_frame {
>>>>>
>>>>> Please can we have a blank line between the above two ones and then similarly
>>>>> ahead of the #endif?
>>>>>
>>>>>> +    signed int loc_disp;    /* Relative address to the bug address */
>>>>>> +    signed int file_disp;   /* Relative address to the filename */
>>>>>> +    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>>>>>> +    uint16_t line;          /* Line number */
>>>>>> +    uint32_t pad0:16;       /* Padding for 8-bytes align */
>>>>>
>>>>> Already the original comment in Arm code is wrong: The padding doesn't
>>>>> guarantee 8-byte alignment; it merely guarantees a multiple of 8 bytes
>>>>> size.
>>>>> Aiui there's also no need for 8-byte alignment anywhere here (in
>>>>> fact there's ".p2align 2" in the generator macros).
>>>>
>>>> I would rather keep the pad0 here.
>>>
>>> May I ask why that is?
>>
>> It makes clear of the padding (which would have been hidden) when using
>> .p2align 2.
> 
> But you realize that I didn't ask to drop the member?

I misunderstood your first reply. But the second reply...

  Besides (later in
> the reply to Oleksii) suggesting to make "line" uint32_t, you zapped the
> relevant further part of my reply here:

> 
> "I also wonder why this needs to be a named bitfield: Either make it
>   plain uint16_t, or if you use a bitfield, then omit the name."
> 
> I thought that's clear enough as a request to change representation,

... "May I ask why that is?" added to the confusion because it implied 
that you disagree on keep the pad0.

> but not asking for plain removal. The part of my reply that you commented
> on is merely asking to not move a bogus comment (whether it gets corrected
> up front or while being moved is secondary to me).

I am fine with both suggestions.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18AE2D972A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 12:15:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52145.91252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kolob-0008OT-26; Mon, 14 Dec 2020 11:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52145.91252; Mon, 14 Dec 2020 11:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koloa-0008O2-U2; Mon, 14 Dec 2020 11:14:52 +0000
Received: by outflank-mailman (input) for mailman id 52145;
 Mon, 14 Dec 2020 11:14:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1koloZ-0008Nx-0o
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 11:14:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1koloW-0003q3-9B; Mon, 14 Dec 2020 11:14:48 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1koloV-0001Ar-TR; Mon, 14 Dec 2020 11:14:48 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=zGBYvUDhrp4vJoOWJ+Hmfmk6AM3uCACamJcia3BpCSo=; b=I1bJFLQIgLkmewfbGnhIxnw2hQ
	WyitygjzISJGrr8L3xbEKSDWKFNGjkka7YnEs0ihFSlKithJdFeBqHP8SKCjC4a94C9Iz+9HuFoI7
	87fegHPOnIjaaIAvCCinoPO5BxJOML74H6qRWB4cBEiCPaovhuZW4mIvo1O3h575a03s=;
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
 <9d3f8583-cfba-0174-3275-b418648f3f31@xen.org>
 <3042ff2f-5d55-a132-a5fc-b214ec53e7a1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4a632e73-87ea-c037-09e1-dfc88d19d9b2@xen.org>
Date: Mon, 14 Dec 2020 11:14:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <3042ff2f-5d55-a132-a5fc-b214ec53e7a1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 14/12/2020 10:51, Jürgen Groß wrote:
> On 14.12.20 11:17, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 14/12/2020 07:56, Juergen Gross wrote:
>>> Add support to run a function in an exception handler for Arm. Do it
>>> the same way as on x86 via a bug_frame.
>>>
>>> Unfortunately inline assembly on Arm seems to be less capable than on
>>> x86, leading to functions called via run_in_exception_handler() having
>>> to be globally visible.
>>
>> Jan already commented on this, so I am not going to comment again.
> 
> Maybe I can ask some Arm specific question related to this:
> 
> In my experiments the only working solution was using the "i" constraint
> for the function pointer. Do you know whether this is supported for all
> gcc versions we care about?

I don't know for sure. However, Linux has been using "i" since 2012. So 
I would assume it ought to be fine for all the version we care.

> 
> Or is there another way to achieve the desired functionality? I'm using
> now the following macros:
> 
> #define BUG_FRAME_run_fn(fn) do {                                      \
>      asm ("1:"BUG_INSTR"\n"                                             \
>           ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn)      \
>                         ", \"a\", %%progbits\n"                         \
>           "2:\n"                                                        \
>           ".p2align 2\n"                                                \
>           ".long (1b - 2b)\n"                                           \
>           ".long (%0 - 2b)\n"                                           \
>           ".long 0\n"                                                   \
>           ".hword 0, 0\n"                                               \
>           ".popsection" :: "i" (fn));                                   \
> } while (0)

May I ask why we need a new macro?

> 
> #define run_in_exception_handler(fn) BUG_FRAME_run_fn(fn)
> 
>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V4:
>>> - new patch
>>>
>>> I have verified the created bugframe is correct by inspecting the
>>> created binary.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   xen/arch/arm/traps.c       | 10 +++++++++-
>>>   xen/drivers/char/ns16550.c |  3 ++-
>>>   xen/include/asm-arm/bug.h  | 32 +++++++++++++++++++++-----------
>>>   3 files changed, 32 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>> index 22bd1bd4c6..6e677affe2 100644
>>> --- a/xen/arch/arm/traps.c
>>> +++ b/xen/arch/arm/traps.c
>>> @@ -1236,8 +1236,16 @@ int do_bug_frame(const struct cpu_user_regs 
>>> *regs, vaddr_t pc)
>>>       if ( !bug )
>>>           return -ENOENT;
>>> +    if ( id == BUGFRAME_run_fn )
>>> +    {
>>> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
>>> +
>>> +        fn(regs);
>>> +        return 0;
>>> +    }
>>> +
>>>       /* WARN, BUG or ASSERT: decode the filename pointer and line 
>>> number. */
>>> -    filename = bug_file(bug);
>>> +    filename = bug_ptr(bug);
>>>       if ( !is_kernel(filename) )
>>>           return -EINVAL;
>>>       fixup = strlen(filename);
>>> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
>>> index 9235d854fe..dd6500acc8 100644
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -192,7 +192,8 @@ static void ns16550_interrupt(
>>>   /* Safe: ns16550_poll() runs as softirq so not reentrant on a given 
>>> CPU. */
>>>   static DEFINE_PER_CPU(struct serial_port *, poll_port);
>>> -static void __ns16550_poll(struct cpu_user_regs *regs)
>>> +/* run_in_exception_handler() on Arm requires globally visible 
>>> symbol. */
>>> +void __ns16550_poll(struct cpu_user_regs *regs)
>>>   {
>>>       struct serial_port *port = this_cpu(poll_port);
>>>       struct ns16550 *uart = port->uart;
>>> diff --git a/xen/include/asm-arm/bug.h b/xen/include/asm-arm/bug.h
>>> index 36c803357c..a7da2c306f 100644
>>> --- a/xen/include/asm-arm/bug.h
>>> +++ b/xen/include/asm-arm/bug.h
>>> @@ -15,34 +15,38 @@
>>>   struct bug_frame {
>>>       signed int loc_disp;    /* Relative address to the bug address */
>>> -    signed int file_disp;   /* Relative address to the filename */
>>> +    signed int ptr_disp;    /* Relative address to the filename or 
>>> function */
>>>       signed int msg_disp;    /* Relative address to the predicate 
>>> (for ASSERT) */
>>>       uint16_t line;          /* Line number */
>>>       uint32_t pad0:16;       /* Padding for 8-bytes align */
>>>   };
>>>   #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
>>> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>>> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp);
>>>   #define bug_line(b) ((b)->line)
>>>   #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>>> -#define BUGFRAME_warn   0
>>> -#define BUGFRAME_bug    1
>>> -#define BUGFRAME_assert 2
>>> +#define BUGFRAME_run_fn 0
>>> +#define BUGFRAME_warn   1
>>> +#define BUGFRAME_bug    2
>>> +#define BUGFRAME_assert 3
>>
>> Why did you renumber it? IOW, why can't BUGFRAME_run_fn be defined as 3?
> 
> This matches x86 definition. IMO there is no reason to have a different
> definition and this will make it more obvious that it might be a good
> idea to have a common include/xen/bug.h header.

I agree that common header would be nice. Although, I am not sure if 
this is achievable. However, my point here is this change would have 
deserved half-sentence in the commit message because to me this look 
like unwanted churn.

Cheers,

-- 
Julien Grall


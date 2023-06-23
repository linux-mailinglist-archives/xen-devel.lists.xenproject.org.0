Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6BB73BA70
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 16:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554365.865519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qChzC-0007Jv-J6; Fri, 23 Jun 2023 14:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554365.865519; Fri, 23 Jun 2023 14:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qChzC-0007Hb-GR; Fri, 23 Jun 2023 14:42:06 +0000
Received: by outflank-mailman (input) for mailman id 554365;
 Fri, 23 Jun 2023 14:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNVC=CL=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qChzB-0007HV-CV
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 14:42:05 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d8ce476-11d4-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 16:42:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BFB978285255;
 Fri, 23 Jun 2023 09:42:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id EwVgOd5TrmY6; Fri, 23 Jun 2023 09:42:01 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E933A8285317;
 Fri, 23 Jun 2023 09:42:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KSRGtS6KFr_X; Fri, 23 Jun 2023 09:42:00 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 74E578285255;
 Fri, 23 Jun 2023 09:42:00 -0500 (CDT)
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
X-Inumbo-ID: 1d8ce476-11d4-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E933A8285317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687531321; bh=Q9HcTpx8iRHUQamtZVm6nZ+ZHNEAxcrWLkpuHvwgTis=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=KmBlhpRg5wfiCJhaV4gCVhoCC5MiZKEz9PdelsxSfORtJf4hHt2B7PM2CjzCiveVF
	 5izeN2zs/ayq/FVcpfa7Q1PLTT5ZHUNvceD1wOgNpUdLFIOUChepFgJzwet8LN02DT
	 RznfCHb9wNaOjd0TYdOmzrgMAo1a9Tf5MXhdMh70=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <097fee60-67d1-b97b-c28d-52ab8b295518@raptorengineering.com>
Date: Fri, 23 Jun 2023 09:41:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] xen/ppc: Set up a basic C environment
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
 <1afe27097c5e1b55dcffa9464dc0cd0c1038a23e.1687466822.git.sanastasio@raptorengineering.com>
 <bfaba0e5-36e9-b201-30fd-b96add91cb1c@citrix.com>
 <5011cde3-b553-6a17-85aa-a30edf3102fd@raptorengineering.com>
 <d963f7f9-5170-10b3-138b-489cced1b3db@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <d963f7f9-5170-10b3-138b-489cced1b3db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/23/23 1:34 AM, Jan Beulich wrote:
> On 23.06.2023 03:26, Shawn Anastasio wrote:
>> On 6/22/23 5:49 PM, Andrew Cooper wrote:
>>> On 22/06/2023 9:57 pm, Shawn Anastasio wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/ppc/setup.c
>>>> @@ -0,0 +1,13 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +#include <xen/init.h>
>>>> +
>>>> +void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>>>> +                               unsigned long r5, unsigned long r6,
>>>> +                               unsigned long r7)
>>>> +{
>>>> +    for ( ;; )
>>>> +        /* Set current hardware thread to very low priority */
>>>> +        asm volatile("or %r31, %r31, %r31");
>>>
>>> Is there something magic about the OR instruction, or something magic
>>> about %r31?
>>
>> Using the OR instruction with all three operands equal is of course a
>> no-op, but when using certain registers it can have a separate magic
>> side effect.
>>
>> `or r31,31,31` is one such form that sets the Program Priority Register
>> to "very low" priority. Of course here where we don't have SMP going
>> there's not much point in using this over the standard side effect-less
>> no-op (`or r0,r0,r0` or just `nop`).
>>
>> For a table of these magic OR forms, you can see page 836 of the Power
>> ISA 3.0B:
>> https://wiki.raptorcs.com/w/images/c/cb/PowerISA_public.v3.0B.pdf
> 
> I have 3.1 to hand, and it looks like they were dropped from there?
> Otherwise I was meaning to say that it's a shame gas doesn't support
> these.

No, they're still present in ISA 3.1B. See page 1084, Book II Chapter
3 Section 2.

> Anyway - I think you want to put this behind a macro named after the
> pseudo.

Sure, that makes sense to me.

> Finally, as a nit: Style above is lacking several blanks. One
> between the two semicolons, and a total of three in the asm().

Just to be sure, would the following be correct?

    for ( ; ; )
        /* Set current hardware thread to very low priority */
        asm volatile ( "or %r31, %r31, %r31" );

Not including the refactor of that instruction to a macro, of course.

> Jan

Thanks,
Shawn


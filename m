Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3112C238D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 12:04:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35758.67394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khW7N-0002U1-Vh; Tue, 24 Nov 2020 11:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35758.67394; Tue, 24 Nov 2020 11:04:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khW7N-0002Tc-SE; Tue, 24 Nov 2020 11:04:17 +0000
Received: by outflank-mailman (input) for mailman id 35758;
 Tue, 24 Nov 2020 11:04:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khW7N-0002TX-1l
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 11:04:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07242373-3a06-4af2-8e84-0467ab8ed6d2;
 Tue, 24 Nov 2020 11:04:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF3E5AC2D;
 Tue, 24 Nov 2020 11:04:14 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khW7N-0002TX-1l
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 11:04:17 +0000
X-Inumbo-ID: 07242373-3a06-4af2-8e84-0467ab8ed6d2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 07242373-3a06-4af2-8e84-0467ab8ed6d2;
	Tue, 24 Nov 2020 11:04:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606215855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8eVZ4DqvpfafX30qWTsandQgKds3bRQUYvkav5QoEg=;
	b=Mas6AuYrSUojHSCJwHmwdXkwwxpLtqt9oN0G1C+pouxW+e9QWmHlWSEiiKmluNV8DH/htY
	W5ALAvYaItBKEAAW9Qsh/rU2ay8U93rt/rRFxvvlhyGPi6KWz/R5SLUAPfNL/9Lpmw5TTr
	asA7cKr79CgdI1b+6qHyVftUeEGGLGc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EF3E5AC2D;
	Tue, 24 Nov 2020 11:04:14 +0000 (UTC)
Subject: Re: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
 <20201123152454.yjr3jgvsyucftrff@Air-de-Roger>
 <79776889-c566-5f07-abfe-2cb79cfa78fa@suse.com>
 <20201123160752.uzczcxnz5ytvtd46@Air-de-Roger>
 <fe2ec163-c6c7-12d6-0c89-57a238514e25@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <094e9e27-e01f-6020-c091-f9c546e92028@suse.com>
Date: Tue, 24 Nov 2020 12:04:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <fe2ec163-c6c7-12d6-0c89-57a238514e25@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.11.2020 17:14, Andrew Cooper wrote:
> On 23/11/2020 16:07, Roger Pau Monné wrote:
>> On Mon, Nov 23, 2020 at 04:30:05PM +0100, Jan Beulich wrote:
>>> On 23.11.2020 16:24, Roger Pau Monné wrote:
>>>> On Mon, Nov 23, 2020 at 01:40:12PM +0100, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/acpi/power.c
>>>>> +++ b/xen/arch/x86/acpi/power.c
>>>>> @@ -174,17 +174,20 @@ static void acpi_sleep_prepare(u32 state
>>>>>      if ( state != ACPI_STATE_S3 )
>>>>>          return;
>>>>>  
>>>>> -    wakeup_vector_va = __acpi_map_table(
>>>>> -        acpi_sinfo.wakeup_vector, sizeof(uint64_t));
>>>>> -
>>>>>      /* TBoot will set resume vector itself (when it is safe to do so). */
>>>>>      if ( tboot_in_measured_env() )
>>>>>          return;
>>>>>  
>>>>> +    set_fixmap(FIX_ACPI_END, acpi_sinfo.wakeup_vector);
>>>>> +    wakeup_vector_va = fix_to_virt(FIX_ACPI_END) +
>>>>> +                       PAGE_OFFSET(acpi_sinfo.wakeup_vector);
>>>>> +
>>>>>      if ( acpi_sinfo.vector_width == 32 )
>>>>>          *(uint32_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
>>>>>      else
>>>>>          *(uint64_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
>>>>> +
>>>>> +    clear_fixmap(FIX_ACPI_END);
>>>> Why not use vmap here instead of the fixmap?
>>> Considering the S3 path is relatively fragile (as in: we end up
>>> breaking it more often than about anything else) I wanted to
>>> make as little of a change as possible. Hence I decided to stick
>>> to the fixmap use that was (indirectly) used before as well.
>> Unless there's a restriction to use the ACPI fixmap entry I would just
>> switch to use vmap, as it's used extensively in the code and less
>> likely to trigger issues in the future, or else a bunch of other stuff
>> would also be broken.
>>
>> IMO doing the mapping differently here when it's not required will end
>> up turning this code more fragile in the long run.
> 
> We can't enter S3 at all until dom0 has booted, as one detail has to
> come from AML.
> 
> Therefore, we're fully up and running by this point, and vmap() will be
> fine.

That's not the point of my reservation. The code here runs when the
system already isn't "fully up and running" anymore. Secondary CPUs
have already been offlined, and we're around the point where we
disable interrupts. Granted when we disable them, we also turn off
spin debugging, but I'd still prefer a path that's not susceptible
to IRQ state. What I admit I didn't pay attention to is that
set_fixmap(), by virtue of being a thin wrapper around
map_pages_to_xen(), similarly uses locks. IOW - okay, I'll switch
to vmap(). You're both aware that it, unlike set_fixmap(), can
fail, aren't you?

> However, why are we re-writing the wakeup vector every time?  Its fixed
> by the position of the trampoline, so we'd actually simplify the S3 path
> by only setting it up once.

I think the spec allows for (as in: doesn't preclude) firmware to
write this structure from scratch again each time the system comes
back up. Therefore what we've written there once may not survive
the first suspend/resume cycle.

> (The fix for fragility is to actually test it, not shy away from making
> any change)

Fair point. I'll see if I can convince my old laptop to cooperate.
I know Windows doesn't resume correctly on it ...

Jan


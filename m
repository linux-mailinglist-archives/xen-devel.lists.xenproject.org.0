Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7090630A3A1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 09:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79620.144959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Uzi-0002Fz-Gg; Mon, 01 Feb 2021 08:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79620.144959; Mon, 01 Feb 2021 08:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Uzi-0002Fa-D3; Mon, 01 Feb 2021 08:55:38 +0000
Received: by outflank-mailman (input) for mailman id 79620;
 Mon, 01 Feb 2021 08:55:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6Uzg-0002FV-Ka
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 08:55:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b59ed5d1-3165-432d-b042-b29a35a061da;
 Mon, 01 Feb 2021 08:55:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D430CAC3A;
 Mon,  1 Feb 2021 08:55:29 +0000 (UTC)
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
X-Inumbo-ID: b59ed5d1-3165-432d-b042-b29a35a061da
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612169730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgNiOk+4kVI/YVXK5HOe7VyQot2fW1PGf6UQgzqHRQQ=;
	b=pFNrLi3eSyS5BYdHmmrESUjG4tQOyE0C3WpaGvG3hcz0izVibbFFrAO0RHLTUA3OEi/ao5
	KGaGV9HozXkPt3PTVnsGhuAKu4aOvo2A3DQn2nDWIa7x1VFyIA7Mk6DAcYX/gL9qaQtWP4
	DwjdVORKxFUGKlT/6oSOh146+QAjJGI=
Subject: Re: [PATCH v7 10/10] x86/vm_event: Carry Processor Trace buffer
 offset in vm_event
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-11-andrew.cooper3@citrix.com>
 <c00b60c5-ba4a-7473-cf26-60b46681279a@suse.com>
 <0a34175c-9bc1-9449-413b-01d743d201fc@citrix.com>
 <CABfawhk4eYA85pgSc6xKbHexBQpJKzAv-KvS_X6X9-eAAqXe4A@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95f07ddb-7fe8-c6fb-dbc4-9743f82a1d89@suse.com>
Date: Mon, 1 Feb 2021 09:55:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CABfawhk4eYA85pgSc6xKbHexBQpJKzAv-KvS_X6X9-eAAqXe4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.01.2021 00:40, Tamas K Lengyel wrote:
> On Fri, Jan 29, 2021 at 6:22 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 26/01/2021 14:27, Jan Beulich wrote:
>>> On 21.01.2021 22:27, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/vm_event.c
>>>> +++ b/xen/arch/x86/vm_event.c
>>>> @@ -251,6 +251,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
>>>>
>>>>      req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
>>>>      req->data.regs.x86.dr6 = ctxt.dr6;
>>>> +
>>>> +    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.pt_offset) != 1 )
>>>> +        req->data.regs.x86.pt_offset = ~0;
>>> Ah. (Regarding my earlier question about this returning -errno or
>>> boolean).
>>>
>>>> --- a/xen/include/public/vm_event.h
>>>> +++ b/xen/include/public/vm_event.h
>>>> @@ -223,6 +223,12 @@ struct vm_event_regs_x86 {
>>>>       */
>>>>      uint64_t npt_base;
>>>>
>>>> +    /*
>>>> +     * Current offset in the Processor Trace buffer. For Intel Processor Trace
>>>> +     * this is MSR_RTIT_OUTPUT_MASK. Set to ~0 if no Processor Trace is active.
>>>> +     */
>>>> +    uint64_t pt_offset;
>>> According to vmtrace_output_position() the value is only one half
>>> of what the named MSR contains. Perhaps "... this is from MSR_..."?
>>> Not sure whether, despite this, there still is a reason to have
>>> this 64-bit wide.
>>
>> This is a vestigial remnant which escaped the "use vmtrace uniformly" work.
>>
>> It should match the domctl_vmtrace_output_position() format, so each
>> interface gives the same content for the attempted-platform-neutral version.
> 
> From the vm_event ABI perspective it's simpler to have a 64-bit value
> here even if the max value it may possibly carry is never going to use
> the whole 64-bit width. I rather not play with shortening it just to
> add padding somewhere else.
> 
> As for what it's called is not that important from my perspective,
> vmtrace_pos or something like that for example is fine by me.

The important thing to me is that the comment not be misleading.
Whether that's arranged for by adjusting the comment of the
commented declaration is up to what you deem better, i.e. I
understand the comment it is.

Jan


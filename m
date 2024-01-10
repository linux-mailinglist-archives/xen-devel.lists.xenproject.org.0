Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58319829F7A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 18:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665703.1035974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNcaG-0005S7-Sm; Wed, 10 Jan 2024 17:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665703.1035974; Wed, 10 Jan 2024 17:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNcaG-0005QH-Pr; Wed, 10 Jan 2024 17:41:44 +0000
Received: by outflank-mailman (input) for mailman id 665703;
 Wed, 10 Jan 2024 17:41:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ginX=IU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rNcaG-0005QB-5T
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 17:41:44 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8452896b-afdf-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 18:41:42 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d87df95ddso45603805e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 09:41:42 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c358e00b0040e42391a12sm2910087wmq.13.2024.01.10.09.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 09:41:42 -0800 (PST)
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
X-Inumbo-ID: 8452896b-afdf-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704908502; x=1705513302; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dSY+WGBXo9B1Ex2FCpNmU0ts6vjn/KUhABoiBBS3rE=;
        b=P93Q47pOC2TdGQbVXBo8kcY0lvAVkp7jiCsIZ/5xuWs1MKHXf6bfKnIGt2ZJ+Fq88g
         +eSHyHk1QdCcISeWZmDllOOH1NeikewAvkRY5xReZMmIm1kQmFS45AnVe2SPOjvnXmcz
         cbFGERjK3MwqjDNLDRmcDI1lH2hrxmwTxF4+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704908502; x=1705513302;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dSY+WGBXo9B1Ex2FCpNmU0ts6vjn/KUhABoiBBS3rE=;
        b=NQ21K6ubnYLnd9wfQ1hDy4KSRf/UqTOBgqQb9PakvGQgUzuSg+nVm/2gvwWyeuMePO
         g/1yeYMQdWJHSmtm24m09GU5hKMElxQwsSSV4Y/BgJa4stvZ1XLQnoBw8F19A8ONF+Kb
         8JxTZipDEqHYEtvnwuyA9K4pFSmoDNCaKxJ+7KwSvP0Dj3+zOLoX3TmFfg7aIrgSNta5
         dNuXjGRrjjunVQh5kmBokVzH8D3v2rJVr8woVuIiQgARTnnZ25WI9qAnJNI9z8n0OepU
         ZmI4+miClWxDTKyEaqNzakx6Nxy1YHQMdJBSA9d2ERCNOzsgE8rgVmLNM5KZmTP6S2eO
         YT/Q==
X-Gm-Message-State: AOJu0YwRrFDm9g9EwpXEUHoK6KOj5NMOs8JG8Ji1g+3vRS38rZWSDVnp
	iC3b9pgGTIOitvrFU+hOG59ryAl5TgBQEA==
X-Google-Smtp-Source: AGHT+IGLrqoHM4VRIUEF1+s+335MASjVJPcrF4goAp/AD4q6JohmZMutUZc4CWRI7+PtIn48mAxqdg==
X-Received: by 2002:a05:600c:a688:b0:40e:43f4:e392 with SMTP id ip8-20020a05600ca68800b0040e43f4e392mr416483wmb.366.1704908502362;
        Wed, 10 Jan 2024 09:41:42 -0800 (PST)
Message-ID: <ffebc1a9-0ed6-492c-8f3a-605a36403883@citrix.com>
Date: Wed, 10 Jan 2024 17:41:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nmi: ensure Global Performance Counter Control is
 setup correctly
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20240110153400.64017-1-roger.pau@citrix.com>
 <4bd7324f-69fc-42e5-9155-02a7e1a8a6e8@citrix.com> <ZZ7Mz0HymYQGpTna@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZZ7Mz0HymYQGpTna@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/01/2024 4:58 pm, Roger Pau Monné wrote:
> On Wed, Jan 10, 2024 at 03:52:49PM +0000, Andrew Cooper wrote:
>> On 10/01/2024 3:34 pm, Roger Pau Monne wrote:
>>> When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
>>> MSR contains per-counter enable bits that is ANDed with the enable bit in the
>>> counter EVNTSEL MSR in order for a PMC counter to be enabled.
>>>
>>> So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
>>> bits being set by default, but at least on some Intel Sapphire and Emerald
>>> Rapids this is no longer the case, and Xen reports:
>>>
>>> Testing NMI watchdog on all CPUs: 0 40 stuck
>>>
>>> The first CPU on each socket is started with PERF_GLOBAL_CTRL zeroed, so PMC0
>>> doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
>>> relevant enable bit in PERF_GLOBAL_CTRL not being set.
>>>
>>> Fix by detecting when Architectural Performance Monitoring is available and
>>> making sure the enable bit for PMC0 is set in PERF_GLOBAL_CTRL.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> The fact that it's only the first CPU on each socket that's started with
>>> PERF_GLOBAL_CTRL clear looks like a firmware bug to me, but in any case making
>>> sure PERF_GLOBAL_CTRL is properly setup should be done regardless.
>> It's each package-BSP, and yes, this is clearly a firmware bug.  It's
>> probably worth saying that we're raising it with Intel, but this bug is
>> out in production firmware for SPR and EMR.
>>
>>> ---
>>>  xen/arch/x86/nmi.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
>>> index dc79c25e3ffd..7a6601c4fd31 100644
>>> --- a/xen/arch/x86/nmi.c
>>> +++ b/xen/arch/x86/nmi.c
>>> @@ -335,6 +335,19 @@ static void setup_p6_watchdog(unsigned counter)
>>>           nmi_p6_event_width > BITS_PER_LONG )
>>>          return;
>>>  
>>> +    if ( cpu_has_arch_perfmon )
>>> +    {
>>> +        uint64_t global_ctrl;
>>> +
>>> +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
>>> +        /*
>>> +         * Make sure PMC0 is enabled in global control, as the enable bit in
>>> +         * PERF_GLOBAL_CTRL is AND'ed with the enable bit in EVNTSEL0.
>>> +         */
>>> +        if ( !(global_ctrl & 1) )
>>> +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl | 1);
>> My gut feeling is that we ought to reinstate all bits, not just bit 1. 
>> If nothing else because that will make debugging using other counters
>> more reliable too.
> Hm, yes, I was borderline on enabling all possible counters in
> PERF_GLOBAL_CTRL, as reported by CPUID.0AH: EAX[15:8].
>
> But then wondered if it was going too far, as for the purposes here we
> just care about PMC1.
>
> My reasoning for not doing it would be that such wide setup of
> PERF_GLOBAL_CTRL would then be gated on the watchdog being enabled,
> usages of other counters apart from PMC0 will be gated on the watchdog
> being enabled.  It seems more reliable to me to either do the setting
> of PERF_GLOBAL_CTRL as part of CPU initialization, or defer to each
> user of a PMC to take care of enabling it in PERF_GLOBAL_CTRL.

It is buggy that each socket-BSP is handed over with ctl=0 rather than 0xff.

But we're exasperating the bug by not returning each socket-BSP to the
default behaviour.


It makes a practical difference if a developer wants to hand-code up
PCR2.  It also makes a practical difference to what a guest sees when it
executes RDPMC in guests, because right now the perf counter values leak
in (there's another oustanding patch series of mine trying to stem this
leak).

The fixup we're performing here isn't "because we're using one
counter".  It's to get state back to default.

~Andrew


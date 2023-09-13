Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD779E54C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 12:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601194.937137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNSM-0007jX-O0; Wed, 13 Sep 2023 10:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601194.937137; Wed, 13 Sep 2023 10:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgNSM-0007hA-Kb; Wed, 13 Sep 2023 10:50:50 +0000
Received: by outflank-mailman (input) for mailman id 601194;
 Wed, 13 Sep 2023 10:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJSs=E5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgNSK-0007h4-Lf
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 10:50:48 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a28926-5223-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 12:50:44 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4018af1038cso72334035e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 03:50:44 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003fed8e12d62sm1752227wmq.27.2023.09.13.03.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 03:50:43 -0700 (PDT)
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
X-Inumbo-ID: 63a28926-5223-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694602244; x=1695207044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Fp6B4FU3tZPD3HBfRkwMjH5MFqJ2hG2FkfumC+klfk=;
        b=OkrMZJVCPEWMGIUc9NowA7sSdaTO/rXBoZyQ+e98/M/0uMNBmrhuq4XxFKe0Vu13zZ
         m2fcziKwfc6xmC46oh/8SjTRFkldpmp64jvDHzBQq5uXHxrWVRofhBCqNBBIg1u/+6IO
         E2EpwjkvlpIPw0puSYyiX2lh11RuyS4u3Ej/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694602244; x=1695207044;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Fp6B4FU3tZPD3HBfRkwMjH5MFqJ2hG2FkfumC+klfk=;
        b=r5MU/7NuvH+txVKGwpLlenw9c8Yr1YxveC9ZgAXbvrZxPGpXffRZSSUnkbrt4ZqibC
         OmL5ZWK/RaTPx1LkcJriMCrZWNDw6PnBWyv1CBZ3T0vmO2v92DPkqWB/1/MxcwOGWUsS
         4nXS39WdQoqhTouqdkRfnGUm3tv9ELRwCwKanXe1wDvud+1Fp3f7zsAfGXqW6NW8FPzL
         tU9NM3drP3O/9ervQf86ymaN2cY1b9i48BpiGxC3z27RXC9THjkESb9dxe6LWGjB7jfE
         GTDytePmdjTpOPmFFIUY070Yn+5GTMKE1aWHOPabS+OrW3wQpdaj2RySj8aEhcXPVUI7
         ja3g==
X-Gm-Message-State: AOJu0YxFV67/3ad0ZKoLOPvS5vIe2LIaJogeMmsiwre5DB3ZsAmY+lMy
	ON31CDS6tsmlBwdtrcBD35ct9A==
X-Google-Smtp-Source: AGHT+IFa1NhGV8kfuwY3+tvrCqKJgh/d7TsVHLyo/tO/iMGMsi2Xv3JvfcmH/EwTTG9oWDGk3UkHgw==
X-Received: by 2002:a1c:4c1a:0:b0:400:57d1:4915 with SMTP id z26-20020a1c4c1a000000b0040057d14915mr1838566wmf.37.1694602243922;
        Wed, 13 Sep 2023 03:50:43 -0700 (PDT)
Message-ID: <4b3138ce-8605-6c9b-0cd2-d7dfc8b04b07@citrix.com>
Date: Wed, 13 Sep 2023 11:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, solene@openbsd.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
 <ZQFpr5nIZtRLPNhp@MacBook-MacBook-Pro-de-Roger.local>
In-Reply-To: <ZQFpr5nIZtRLPNhp@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2023 8:50 am, Roger Pau Monné wrote:
> On Tue, Sep 12, 2023 at 05:35:15PM +0100, Andrew Cooper wrote:
>> On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
>>> ---
>>>  xen/arch/x86/msr.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>>> index 3f0450259cdf..964d500ff8a1 100644
>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>      case MSR_K8_HWCR:
>>>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>>              goto gp_fault;
>>> -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
>>> -               ? K8_HWCR_TSC_FREQ_SEL : 0;
>>> +        /*
>>> +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
>>> +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
>>> +         * also poke at PSTATE0.
>>> +         */
>> While this is true, the justification for removing this is because
>> TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.
>>
>> Also because it's addition without writing into the migration stream was
>> bogus irrespective of the specifics of the bit.
>>
>> I'm still of the opinion that it's buggy for OpenBSD to be looking at
>> model specific bits when virtualised,
> Well, I think we can argue that an OS is free to ignore the CPUID HV
> bit and still boot on Xen (even if that leads to non-ideal decisions).

An OS which keeps itself to architectural details that we do our very
best to be correct with, ought to function even if it ignores the HV bit.

But we're (deliberately) not doing model-specific-accurate emulations of
a specific platform.  An OS which ignores details about the environment
it is operating in gets to keep the faults/malfunctions when it does
something illegal.

>> but given my latest reading of the
>> AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
>> can see TSC_FREQ_SEL.
> Hm, there's no written down note that TSC_FREQ_SEL implies PSTATE0 to
> be available (and PSTATE0 is not an architectural MSR), but I can see
> how a guest can expect to fetch the P0 frequency if it sees
> TSC_FREQ_SEL.

The PPR is a reference of mostly autogenerated details and misc notes,
put together in a non- hand-write way, unlike the older BKWGs.

Lots of the information elided from public and partner-NDA versions is
"see TICKET/LINK for rational" type comments.

It is not a spec - it is a reference (the clue is even in the name)
aimed at people already familiar with the area.  Do not fall into the
trap of thinking it it can be read as a spec.

~Andrew


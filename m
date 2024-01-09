Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A390682888F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 15:55:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664679.1034759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNDVA-0004GL-1y; Tue, 09 Jan 2024 14:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664679.1034759; Tue, 09 Jan 2024 14:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNDV9-0004E9-VL; Tue, 09 Jan 2024 14:54:47 +0000
Received: by outflank-mailman (input) for mailman id 664679;
 Tue, 09 Jan 2024 14:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xjK=IT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rNDV9-000451-3r
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 14:54:47 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 074e9375-aeff-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 15:54:46 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3374c693f92so2476174f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 06:54:45 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b0040e38b7cfdasm15202326wmb.4.2024.01.09.06.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 06:54:45 -0800 (PST)
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
X-Inumbo-ID: 074e9375-aeff-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704812085; x=1705416885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4zUxdBr5grWnHlsYsRvUHBI0zDSbY7yuz2MFDS6W2BY=;
        b=lC4F1L/yZGHQsMu1zz48bzMl35TVE/rVY6pB2cicGnWkzzhCFCsS6Xxu8iV00Svfml
         XiTfMYIYj49fPco58eoH2whH6VCiaDpNV6TvZiEuaJ4z3bpBmcLcOGGs1huif5FFn2EE
         S1aA+NIkjbeIbfr7LQxc39khROrM/oMWrBpf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704812085; x=1705416885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zUxdBr5grWnHlsYsRvUHBI0zDSbY7yuz2MFDS6W2BY=;
        b=mIF7IVx7Xz1cZ4x0frLHei+3kRGwP1Am4HONfua0/F6F3uLie6rX0x9MhFCtBfydVv
         hJsWNrMDc/dFIUfa4Y4p8YQbUhlnV5u/Opd1Gt85F5MLJRcqPnaRbAymoCyuW9C3K0id
         kjmKyEI0nLGr5yAoFLGimHvOahQkrXWD4mpZRlo2Rpd3xKjcfmlU/EpnSGsgZ94gYh4S
         JKP1E9yB1a7sgvJxzAtGeiGuWHAtqNzA+dM6JnInFNNqoxMLQBosdWKKGwvkvqO7Fibu
         NOGB51nYVfcPBX4nV8bJHMhxZu7yqr0O49SnUMbMIDnkB6ctKCpTGGTsaXXtCQ5JwFnR
         hK3w==
X-Gm-Message-State: AOJu0YyF7Uo5kyhfRi3ZcCPQLnXGiNhtOVCxKUAbJWYMrAm0z4If+2/9
	RBUIj1AOXJeKHMuZ22HjQAqqCNmWf8E81A==
X-Google-Smtp-Source: AGHT+IFHZ/73ex6nB6+OAk9zHcLTjdi/YlM7jsGX0RUqWHABHJvyywFpuRVD3JklyxBxzflof79YVw==
X-Received: by 2002:a5d:4f83:0:b0:336:67c9:1d9e with SMTP id d3-20020a5d4f83000000b0033667c91d9emr761653wru.79.1704812085313;
        Tue, 09 Jan 2024 06:54:45 -0800 (PST)
Message-ID: <3af7e3a7-c76d-4784-a215-06510171c66c@citrix.com>
Date: Tue, 9 Jan 2024 14:54:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] VMX: convert vmx_basic_msr
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
 <d07fb86f-ef9c-4c2b-ba9a-f1e5c813d45d@suse.com>
 <e17d6e45-b03c-4906-9fb3-af4770aa3cf0@citrix.com>
 <beac1f7c-51cb-47a9-8e96-d09cb3ea6ab7@suse.com>
 <04992603-cb10-43ff-9eb3-b8f8f1dc765c@citrix.com>
 <83f266f1-c46b-4ace-9c29-b0b486f817a6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <83f266f1-c46b-4ace-9c29-b0b486f817a6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2024 2:39 pm, Jan Beulich wrote:
> On 18.12.2023 18:29, Andrew Cooper wrote:
>> On 27/11/2023 12:44 pm, Jan Beulich wrote:
>>> On 24.11.2023 23:41, Andrew Cooper wrote:
>>>> On 24/11/2023 8:41 am, Jan Beulich wrote:
>>>>> ... to a struct field, which is then going to be accompanied by other
>>>>> capability/control data presently living in individual variables. As
>>>>> this structure isn't supposed to be altered post-boot, put it in
>>>>> .data.ro_after_init right away.
>>>>>
>>>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> For (usable) nested virt, we're going to need the VMX MSRs, in their
>>>> architectural form, in struct cpu_policy.  And just like CPUID features,
>>>> I want it to end up with nice bitfields to use.
>>>>
>>>> Looking through the rest of this series, vmx_caps ends up almost in
>>>> architectural form.
>>>>
>>>> Could I talk you into having a "struct vmx_msrs" (or similar - 'caps'
>>>> doesn't feel quite right here) in the policy object, and also
>>>> instantiating one instance of it for this purpose here?
>>> I was actually wondering while doing the conversion. The main reason I
>>> didn't go that route right away was that I wasn't really certain whether
>>> what I'd put there would the really be the (largely) final shape it
>>> wants to take there. (One thing you've likely noticed I didn't convert
>>> is _vmx_misc_cap, which right now only exists as a local variable in
>>> vmx_init_vmcs_config().)
>>>
>>>> AFAICT, it would only be a minor deviation to the latter half of this
>>>> series, but it would be an excellent start to fixing nested virt - and
>>>> getting this data in the policy really is the first task in getting the
>>>> ball rolling on nested virt.
>>> How much of a further change it would end up being (or where that change
>>> would occur) depends on another aspect: When put in cpu-policy.h (and I
>>> take it you mean the lib/ instance, not the asm/ one), it would seem
>>> natural and perhaps even necessary to properly introduce bitfields for
>>> each of the MSRs right away. That'll lead to a "raw" field as well. In
>>> VMX code (mostly its cpu_has_* #define-s), I'd then either need to use
>>> .raw (perhaps a little ugly here and there) or go with using the
>>> individual bitfields right away (likely eliminating the need for many of
>>> the constant #define-s), which increases the risk of inadvertent mistakes
>>> (and their overlooking during review).
>>>
>>>> I don't mind about serialising/de-serialsing it - that still has a bit
>>>> of userspace complexity to work out, and depends on some of the cleanup
>>>> still needing a repost.
>>>>
>>>> If you don't want to take the added space in cpu_policy yet, how about
>>>> having the declaration there and just forgo instantiating the subobject
>>>> in the short term?
>>> There's quite a bit of effectively dead space in the struct already; I
>>> think I wouldn't mind instantiating the struct there right away. So long
>>> as you're convinced it's going to be used there in not too distant a
>>> future.
>>>
>>> But: If I go as far, why would I introduce a global instance of the new
>>> struct? Wouldn't it then make more sense to use host_cpu_policy right
>>> away? I probably would keep populating it in vmx_init_vmcs_config() to
>>> limit churn for now, but consumers of the flags could then right away
>>> use the host policy.
>> George has stated an intent to pick nested virt up imminently.  I'll
>> have to defer to him on when this will actually start.
>>
>> But, sorting out this data in the policies is the next step, whenever
>> that occurs.
>>
>>
>> If you fancy going all the way to use the raw/host policy then great,
>> but I expect that would be a large amount of extra work, hence the
>> suggestion to just use the "inner" struct in the short term.
> Even the inner struct plan falls apart pretty quickly (or grows what
> needs doing by too much for my taste, in the context right here):
> While for basic_msr this works, and it would apparently also work
> for vmfunc and tertiary exec control (the latter is itself only part
> of a yet to be reviewed / approved patch), it doesn't for all the
> others with split 0-setting and 1-setting halves. This is because
> what VMX code wants are the calculated values to put in the VMCS,
> whereas imo in the policy we'd want to store both halves (and what
> exactly wants to be in the host policy there isn't really clear to
> me). As a result I can't create a single uniform structure properly
> serving both purposes. Nor could I have VMX code use the host
> policy for most of its capability checks.
>
> Thought / ideas?

If it's not actually trivial, then don't worry.

The policy does need to hold the architectural representation.  The
in-use settings need storing per-vCPU because they do (or need to me
made to) vary based on the configuration of the VM, and because they're
needed on every virtual vmentry when re-calculating VMCS02.

~Andrew


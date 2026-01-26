Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J/CE/J4d2n7ggEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 15:23:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9890589699
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 15:23:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213741.1524207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkNUG-0001bd-HN; Mon, 26 Jan 2026 14:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213741.1524207; Mon, 26 Jan 2026 14:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkNUG-0001ZQ-EY; Mon, 26 Jan 2026 14:22:40 +0000
Received: by outflank-mailman (input) for mailman id 1213741;
 Mon, 26 Jan 2026 14:22:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zrcg=77=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vkNUE-0001ZI-Pm
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 14:22:38 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75fdbb42-fac2-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 15:22:36 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so52139955e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 06:22:36 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48047028928sm494765095e9.2.2026.01.26.06.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 06:22:34 -0800 (PST)
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
X-Inumbo-ID: 75fdbb42-fac2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769437355; x=1770042155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xyLIdOBp6AU4BlIShM9uNytZkKTMXaNAPLGwGfwBgZ4=;
        b=hIaMND1LMflkQP1N2iKUEbsNzwrN5g/iWT++RE6Q0R5YXPv0mcbG1MCodDEypouNFp
         PoLMV17mH6n9+Sv4uGYh2mu/FaS3ylLydk0/ledryt6T5CLZCsyHrNVDAec/9lTsi9vd
         3ONL0I5En1HgnKLGY1cKJJKHhyqaa9y7zFIVkqzUDioe6qn2jb/Xvx3WSW5T8Y+F5mXi
         anJWIF5emeezJu3jDyRzefLN6mXRBmcC6ycVIqXiHVekdPvt1b1O4IKkEL5VnnFURqS1
         z+qnMl8RI2O+uV3uRMeM7vRNF8EhmvFVgeyCQolv3NWxSqLzgT6DvUE0wfziUBFn4rMU
         cR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769437355; x=1770042155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyLIdOBp6AU4BlIShM9uNytZkKTMXaNAPLGwGfwBgZ4=;
        b=WKsiqmJnBca5NEqRUxKij95R5ULMH/HVhjfm7/zb5Ieoe0ej3CGRx8Uu6ukS5/phIL
         TaA37KDtSQRu5Z9r6CfNgcxbNi2xfxSRWlAFN0eieo0pMCHXIO5eeKbDXfNSGj3Z1IeW
         r6jH3/grhC8sYJExkNKGUhUaKiWAyIVw3H1oGMRqil0okiclhoP88ujBUlNEzyVs6cdh
         XBOo9adhTSsxky25At4DNZas+M4eMaNldk8pM904/rKa9X5/w7gXVTBFT71ZuFAsEVV1
         GHkYVLGMus8l/fcNXR9uH8QH1VHCJDbYECbodIPQvPDtU9vhwZaNCD8z+Jb2fu9KhFN1
         OEQg==
X-Forwarded-Encrypted: i=1; AJvYcCXn9hVAd1wvjaLbu08XBEvwbVFBRzELXejYer5g61uE8OR8CrxpKyaktGNQr+HzeA7LKJyjYZAuiYo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwA0FuEKw5ZDb0y3QnrzGuHS+dwN4K7UqWB3xHS6qwaRc8ThPjb
	iIEQ7gd3PvmP199UTZWkT1s10Isw80SyNyRvrpan+3XFDIBkvssE7tGm
X-Gm-Gg: AZuq6aJB0sfaDCuQcEpsORTHJUwTW+z0uuYA4FP8LziPRMGQZcGqpcP1oPL2GUM6OAN
	t89LfIiYOEf20weeGpSd2SfXlc6HLlq6IpsZb1F/9s6R3MEhaLi3Kw/bBbJHJv/p2gSK3N5SrIH
	q36ddMVJvfuJR8hQ4Hru8/rk/o1QSOTrsidnb57Zijm7Q8Ua9Q52UQIpnY+FFQjrpCNEC8+mNNZ
	u3sOP5NKrTU8KvtdLXPUA1X+TaPi2gTSS0n0imHAjrupiGZWyNYyjW6ld7Ebl3w2hcP5L7a5Tfp
	d1uZruBpUp3qKkSmspcvqbPmwHpZmJRLfSrlFjDxXbAh5bRc8VfDVB4soyn2x4bMV/ByMWL91Sz
	KO9HHw0d9DKjBnVFatyLdZqvmQ+nYU5pzPuoELadDgKKA0sq2mwLhC7olKGlNAQhL2T4xbetz2M
	ibGQ3MG8NEHpNVckqm3g1PIi219k3TYIKyo2i5u9Ugm/ieW2UFlSkgcw/we6rDxXoFpwc=
X-Received: by 2002:a05:600c:4f8e:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-4805cf669d1mr66585265e9.20.1769437355209;
        Mon, 26 Jan 2026 06:22:35 -0800 (PST)
Message-ID: <1a447de4-2083-40e0-9b6a-07df707100eb@gmail.com>
Date: Mon, 26 Jan 2026 15:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] xen/riscv: introduce struct arch_vcpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <ef706b474a23cb24a7bc119f8206e9df527b7287.1769099885.git.oleksii.kurochko@gmail.com>
 <e4801098-4525-40a7-91e2-7ffeb7a6d859@suse.com>
 <20f2bf2c-9b28-4a60-ad35-9640f5d3dfad@gmail.com>
 <784293fc-f8f2-45da-b9dc-169fec5b9ddb@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <784293fc-f8f2-45da-b9dc-169fec5b9ddb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9890589699
X-Rspamd-Action: no action


On 1/26/26 1:53 PM, Jan Beulich wrote:
> On 26.01.2026 13:30, Oleksii Kurochko wrote:
>> On 1/26/26 12:41 PM, Jan Beulich wrote:
>>> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/domain.h
>>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>>> @@ -22,9 +22,62 @@ struct hvm_domain
>>>>    struct arch_vcpu_io {
>>>>    };
>>>>    
>>>> -struct arch_vcpu {
>>>> +struct arch_vcpu
>>>> +{
>>>>        struct vcpu_vmid vmid;
>>>> -};
>>>> +
>>>> +    /*
>>>> +     * Callee saved registers for Xen's state deep in the callframe used to
>>>> +     * switch from prev's stack to the next's stack during context switch.
>>>> +     */
>>> What is "deep in the callframe" intended to convey? I'm in particular wondering
>>> about ...
>>>
>>>> +    struct
>>>> +    {
>>>> +        register_t s0;
>>>> +        register_t s1;
>>>> +        register_t s2;
>>>> +        register_t s3;
>>>> +        register_t s4;
>>>> +        register_t s5;
>>>> +        register_t s6;
>>>> +        register_t s7;
>>>> +        register_t s8;
>>>> +        register_t s9;
>>>> +        register_t s10;
>>>> +        register_t s11;
>>>> +        register_t sp;
>>>> +        register_t gp;
>>>> +        register_t ra;
>>> ... sp and ra, which presumably don't live anywhere "deep"?
>> context_switch() is invoked relatively deep in the call stack, so the stack
>> pointer in use when context_switch() executes can also be considered to be
>> deep in the call frame. The same applies to RA: after the first
>> __context_switch() call, RA will point to the next instruction within
>> context_switch().
> While writing, did you maybe notice that "deep" can have two entirely distinct
> meanings here? It could be "far from where the stack starts when we enter the
> hypervisor" or "far from present top of stack".

Yeah, but at time when I was writing the commit I thought only about one meaning
"far from where the stack starts when we enter the hypervisor".


>
>> I can update the comment and drop the wording about being “deep in the call
>> frame” to avoid confusion. In that case it would simply read:
>>
>> +    /*
>> +     * Callee saved registers for Xen's state used to
>> +     * switch from prev's stack to the next's stack during context switch.
>> +     */
> Yes please.
>
>>> Also, what about tp? The 't' in there isn't the same as that in "t0", "t1", etc.
>> tp stores pcpu_info[] and it isn't expected to be changed during (or between) function
>> calls.
> Oh, right, I forgot about that aspect. However, the more that you reference ...
>
>> In this structure we are dealing only with registers which should be saved according
>> to RISC-V ABI convention:
>>    [1] https://riscv-non-isa.github.io/riscv-elf-psabi-doc/#_integer_register_convention
>> The exception is for RA (as it is also used to jump to continue_to_new_vcpu() when vcpu is scheduled
>> first time). During a review of the [1], I think that GP could be dropped as it shouldn't
>> be preserved across calls.
> ... this - why would gp then need saving? That ought to be stable across Xen as
> well (or not be used at all)?

Totally agree, that why I mentioned in reply that it could (it would be better if
"must/should" were used) be dropped as it shouldn't be preserved across calls and
as you also notice that it ought to be stable across Xen as well (or not be used
at all).

~ Oleksii



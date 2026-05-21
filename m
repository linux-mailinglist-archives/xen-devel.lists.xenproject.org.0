Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJesIYjxDmqmDQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 13:50:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC135A43E1
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 13:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315085.1584955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ1u2-0005ZD-3J; Thu, 21 May 2026 11:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315085.1584955; Thu, 21 May 2026 11:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ1u1-0005XS-WA; Thu, 21 May 2026 11:49:25 +0000
Received: by outflank-mailman (input) for mailman id 1315085;
 Thu, 21 May 2026 11:49:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ1u0-0005XM-I5
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 11:49:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ1tz-00B3Zm-Lk
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 13:49:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ef141-5cb7-0a2a0a5109dd-0a2a450b939c-4
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 13:49:23 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ef143-212f-0a2a450b0019-d155dd2ad89c-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 13:49:23 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-44e1ebb3122so3671206f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 04:49:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035eba897sm19080675e9.5.2026.05.21.04.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 04:49:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779364162; x=1779968962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HKw2vmwtXVuOXU326RgUdQtgCUot1rc35OPFmGveVmg=;
        b=RuyIc06O00O1Hj/mswXL24Dq8+Nm1poWac9bZM/nM+U6yCObZpm7pEr5qw0b21xJ0A
         Jz/JCMnpLQzT9wFOujlAkVsTugKXbimdX+kADcY19JDpD2dhyZVsfEVV8dzr+1+mpeM3
         uWTg0NC+RUQZtgYQo9K8SWYf3J14J/4f2LBo5iUU6uNaGdE01pc+lIxnDRnOf+T8rX5G
         Iju/oswytlC2wl7qAl41SIk70i1meOOOFVDlIxFw5pbqrfehr8XqJxow8+dQ7P2m3XUr
         FEtcKSIVctFrpaWLiePLC5pLdb9Bi0DQI269tVxgXKlHEl1G3VUHKlYff9ghkG7uivyS
         oFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364162; x=1779968962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKw2vmwtXVuOXU326RgUdQtgCUot1rc35OPFmGveVmg=;
        b=ft8sXoq+k9I6G/9FORYEf4PQVoliTPShLJjqRtq3mWyMRnxRbeHBtw4yHD7o8KViOV
         reeGM0Rp24vw1ZMtu1R5giNvjaoXbgCSICqP082bPeNCAgJckRfqPUVziYva6+GOY4x3
         dnSJ620qGAS2Edlt6BVMum8NrKvIs0mI+C7VaW+Q06nOIaqHoCrf1vISB/Uc34kphNCr
         nxaP8+LHDNVx7Bvp97lk5h9K7Lna+ry0gUz7X3EhlllScEiGRlWDXnvkmvYKoru43+Ma
         kC0Cy2X99ah7gMFSdgv7umsPyOyo0RqXdCPMuRDaGl51kQvpfVprWKYCVMukx+fE+ok0
         ozlg==
X-Forwarded-Encrypted: i=1; AFNElJ+3s1lDJ3yLGATYh7qy+q7upSHhKyPXEB05GnZV2XNHXlRxOFUqkj+Deqwl+VpBwFU3Kwgtk8UaGc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGjjND6451oe75gxswYD7Ny95kc/5OSmlK/BL9PlFJu6xzIOKV
	DtBA0Dmlr5Ho8J2Fe25xzeNMkKH3TDQZNuVlnJfcJzgA0WsN2zEN/YVIOLuNHp3pFA==
X-Gm-Gg: Acq92OHqVlk9GYYTeklDNAbXvjf26IRnRBxlWqIfM7tlj6ZhmP21Qdg1UgKNk9iQiI7
	c8dHSzU9nkJy85CnuhyVAydrgxOIONZksvywzBj/FSWFOX6e2ZegHuWjjucu+4+BQVWtiYsPZGN
	Ap1Ob36Aow1XtBKfonjGJzM/4lPMA1bEm8Y1F/ovR6mvRjm4sZiFHPDGFp20bgqI6R6gZ8VQE1s
	ZV3kKOLtY+JTcdfQxwOBlsr/Dh45lRP/w3N8S00tidJH4VxOpGadHlts/XjFDOkJ7KoLattaEq8
	VvSLahjqzdNIE7xybX06yLLuw9cDPQDZ/AzKRpfIAJ9MU3q3GEACU2xcW2JYUAbCy/sTkAGeZAi
	rtxiCh1WO463sCpL9vqCmU2RBz3QEfi/2dE08oYhin48IjbujTkIpuirl/d5ll9eIyNnTC4r3AX
	tp/XbdNpx7PKZmKqS4Zib8Oz3ZaawW7KVAIk9hICR0Pwt1h4tpRSNVsupM7ts8r+xxpJU0I0tF+
	C2IA+apAncnpr0=
X-Received: by 2002:a05:600d:1:b0:48e:8741:fd3d with SMTP id 5b1f17b1804b1-49036071aedmr30836405e9.14.1779364162277;
        Thu, 21 May 2026 04:49:22 -0700 (PDT)
Message-ID: <4ddcca19-3c19-415b-bbe3-707f839d5210@suse.com>
Date: Thu, 21 May 2026 13:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
 <1779295699.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@vates.tech>
 <9a6f4d03-651b-449a-80d0-35077170c8c8@citrix.com>
 <09a27cbf-065a-44ad-8956-18f050202822@suse.com>
 <340a3b2b-23ce-4039-8d00-5245ab252164@suse.com>
 <bfd37118-d955-4faf-b2d2-94a301f5018c@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <bfd37118-d955-4faf-b2d2-94a301f5018c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1779364163-18762F3B-F75B2F0F/0/0
X-purgate-type: clean
X-purgate-size: 4639
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DBC135A43E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.05.2026 12:56, Andrew Cooper wrote:
> On 21/05/2026 8:00 am, Jan Beulich wrote:
>> On 21.05.2026 08:33, Jan Beulich wrote:
>>> On 20.05.2026 19:21, Andrew Cooper wrote:
>>>> On 20/05/2026 5:48 pm, Teddy Astie wrote:
>>>>> Le 20/05/2026 à 18:34, Andrew Cooper a écrit :
>>>>>> On 20/05/2026 4:51 pm, Teddy Astie wrote:
>>>>>>> __{put,get}_guest returns -EFAULT on access faults which causes
>>>>>>> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
>>>>>>> incorrect.
>>>>>>>
>>>>>>> Fix the computation by relying on copy_{from,to}_guest_pv which
>>>>>>> reports the number of remaining bytes instead of a negative errno,
>>>>>>> such that we can compute the offset properly.
>>>>>>>
>>>>>>> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
>>>>>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>>>>>> ---
>>>>>>>   xen/arch/x86/pv/emul-gate-op.c | 5 +++--
>>>>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/x86/pv/emul-gate-op.c
>>>>>>> b/xen/arch/x86/pv/emul-gate-op.c
>>>>>>> index c2c699fbff..cacc171115 100644
>>>>>>> --- a/xen/arch/x86/pv/emul-gate-op.c
>>>>>>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>>>>>>> @@ -289,9 +289,10 @@ void pv_emulate_gate_op(struct cpu_user_regs
>>>>>>> *regs)
>>>>>>>           int rc;
>>>>>>>   #define push(item) do \
>>>>>>>           { \
>>>>>>> +            unsigned int __value = item; \
>>>>>>>               --stkp; \
>>>>>>>               esp -= 4; \
>>>>>>> -            rc = __put_guest(item, stkp); \
>>>>>>> +            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
>>>>>> Oh, this probably violates MISRA, but you don't need to use a separate
>>>>>> variable because sizeof() has no side effects.
>>>>>>
>>>>>> Given that the expression is now &item, I think it needs to be &(item).
>>>>>>
>>>>> I tried something like that, but it looked a bit weird and clang
>>>>> wasn't happy (at least in language server) because of the &(x + y).
>>>>>
>>>>> We also need to ensure that we're actually copying 32-bits scalars
>>>>> (and not 16-bits or 64-bits ones) like the previous behavior.
>>>>>
>>>>> That diff seems to work though
>>>>>
>>>>> diff --git a/xen/arch/x86/pv/emul-gate-op.c
>>>>> b/xen/arch/x86/pv/emul-gate-op.c
>>>>> index cacc171115..b72a3058dd 100644
>>>>> --- a/xen/arch/x86/pv/emul-gate-op.c
>>>>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>>>>> @@ -289,10 +289,9 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>>>>>          int rc;
>>>>>  #define push(item) do \
>>>>>          { \
>>>>> -            unsigned int __value = item; \
>>>>>              --stkp; \
>>>>>              esp -= 4; \
>>>>> -            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
>>>>> +            rc = copy_to_guest_pv(stkp, &(uint32_t)(item),
>>>>> sizeof(uint32_t)); \
>>>>>              if ( rc ) \
>>>>>              { \
>>>>>                  pv_inject_page_fault(PFEC_write_access, \ 
>>>> Oh, that's a second bug you're fixing then.
>>>>
>>>> Pushes of ss/cs need to be done with 4-byte writes and zero extended.
>>> And they are: Access size is derived from the pointer passed, not from the
>>> item.
>> Oh, while access size has always been correct, ....
>>
>>>> I've added:
>>>>
>>>> The use of a local variable in push() also fixes a second bug.  On all
>>>> but the earliest 32bit CPUs, segment selectors pushes are
>>>> zero-extended 32bit stores.  Xen was not doing this for %ss and %cs.
>> ... zero-extension was lost with the FRED work, so a 2nd Fixes: tag is
>> going to be necessary: cb29eed2dae7 ("x86/traps: Extend struct
>> cpu_user_regs/cpu_info with FRED fields").
> 
> I don't understand this comment.
> 
> The FRED work added extra fields into %cs/%ss with unions, but the
> fields named cs and ss are still uint16_t.  That aspect didn't change.

__{get,put}_guest() determine the amount of data to copy from the pointer
they're passed. That being unsigned int *, 32 bits will be copied
regardless of field type. Actually: __put_guest() casts the incoming
value to the type the pointer argument points to. So FRED work didn't
break anything, and I was wrong to ask for a 2nd Fixes: tag. Zero-
extension was and is there.

For __get_guest() et al there looks to be potential of data corruption, if
variable type is less wide than pointed-to type.

Jan


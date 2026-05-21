Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAUkBjCuDmrSBAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 09:03:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6493859FD9A
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 09:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314831.1584800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPxQX-0003a1-Fs; Thu, 21 May 2026 07:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314831.1584800; Thu, 21 May 2026 07:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPxQX-0003XM-Cc; Thu, 21 May 2026 07:02:41 +0000
Received: by outflank-mailman (input) for mailman id 1314831;
 Thu, 21 May 2026 07:02:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPxQV-0003XG-CE
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 07:02:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPxQU-00FLgb-Ku
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 09:02:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0eae0d-2eae-0a2a0a5409dd-0a2a450598ba-10
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 09:02:38 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ead96-aaa8-0a2a45050019-d1558029d814-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 09:00:38 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso42448475e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 00:00:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c2297esm8955035e9.7.2026.05.21.00.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 00:00:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779346838; x=1779951638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ouCcGRD1KuktTpn2DlaaXdwRIRgy+qFuCrU3nmUrPlg=;
        b=AA9mQiiuK4YmfatBmwxBkzm8F6j/TjUNSeCKrmJX5GPYSVbLibx/FPuO118CT2QvJw
         eRIOHa5M86PPO1E6K+Pf/roJU4YhbIz6CSeBx+FNd3+GekF7Em0G0CdZWw31zesKfISU
         Fc1m+EdDQzNKZrpFon2s+aRfdK9WQRRaQoaHr3HlqkIXv9R8269RmHGGpwmELw8aIXys
         3nehFfcp3wT5+2xnIn0A2foNgV1AWVllE12XYOhLp5pwIJWSNjIdkiTAfNybbW0OiJ+y
         7szIeWmQxoP1Od50s1GwXJ04jPonJCDtduOODp/51W9bTCUIy9qPYmZFxPjK8nNVEGWR
         Qmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779346838; x=1779951638;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouCcGRD1KuktTpn2DlaaXdwRIRgy+qFuCrU3nmUrPlg=;
        b=HJoaG/8qd/EipgE9VQnG+wvHkIAuVDILUQqv20B3BPKHroCM3EIRlkN5jpuyA8zPF/
         rX1/4fbVR0GfDtqODqNjsiv9NO9DGl+CltKYjcNCcNpL4KhcvGA2vicSDPl2IEGplcmG
         5Ahg1QlMxTYHPsvtgdfgyZ4ty5h/laYk+tq2nYjaYei4w7PbwEegSzW0fSvGkYM2GGPp
         vP6/uOV5CkR9/a6GY3ISjSCBxplK54o+AnrPWNGzFBZlDot+sULUdJFBzgGroiIZ889P
         EQY5NPhoBvr9Ub69J8ZbEDL8cn70c/TFibP83yNxRuQ/YYfRdY2hX8ue0GVBoDXLW34O
         B6CA==
X-Forwarded-Encrypted: i=1; AFNElJ8La4QPRlk/0gkwnEj0MM1Ko0r8n85SEJKhO+Ibf7D2+F0ohNZyO3kUGjxS9TxYYszs4mjkx3td+L8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyDFNwOXuKGjF2m/+mBcN1VY3aazA33FLMXKcjOmpslWOaiGZ2
	8mSRNx7tSJr5b8E+JmcoZR5eVf/rtk25qxQWsbV39ugMyDMCiT/EKPjWDp+CzKgyYA==
X-Gm-Gg: Acq92OFshA7foRhKGSp81gHTDSMPcJugWDtSElIHeDKuDdRQ/Vvepitp+IJcasXRzra
	uSIVR5xzsO2GPYUzHeSFVDJAv94LtkDbyYlE6ez+D2SstYIhgDEdXpx7d7uajaWiJUv2iInicBh
	ODXMjL4f8WUEvqrw9+ee1/wLnblB33X2dFjjIGNSM3+D7CUBgxU6yGhme/lC3jTd6eRF0PDTFLg
	ESqmYIeFHcK/49JeXrpAuG72rhK4M4ruuVJQlckFcqJfDRGyDe8XORpFQY8vVNhoYZfXu5lKLD7
	AzVrixDRxSGcNS5FygEkdbVDLxReA4doxJXsklKBEhFAYOzJxz2Vn6CmuIrIIpsv/cB6VlN/WAa
	fFUcRG6hwZhJiA/A+k+ruVSjMYjgvS5Wfv15w2XCTCS5yOfjJs2iphAPOF6Y7IOJSc31tUHdlvp
	GsFy2IGrfzrCWygkOD5yZw/wbdTXNv2eVXc2A9su7yQHHxpfr8XsevRAMGgTRzJgBS1scOLHAyh
	CS4U+hbd1hytL8=
X-Received: by 2002:a05:600c:4c27:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-4903605f44amr10738505e9.10.1779346837757;
        Thu, 21 May 2026 00:00:37 -0700 (PDT)
Message-ID: <340a3b2b-23ce-4039-8d00-5245ab252164@suse.com>
Date: Thu, 21 May 2026 09:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
 <1779295699.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@vates.tech>
 <9a6f4d03-651b-449a-80d0-35077170c8c8@citrix.com>
 <09a27cbf-065a-44ad-8956-18f050202822@suse.com>
Content-Language: en-US
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
In-Reply-To: <09a27cbf-065a-44ad-8956-18f050202822@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1779346838-D9F76443-0E1F4CC8/13/0
X-purgate-type: clean
X-purgate-size: 3761
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:email];
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
X-Rspamd-Queue-Id: 6493859FD9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.05.2026 08:33, Jan Beulich wrote:
> On 20.05.2026 19:21, Andrew Cooper wrote:
>> On 20/05/2026 5:48 pm, Teddy Astie wrote:
>>> Le 20/05/2026 à 18:34, Andrew Cooper a écrit :
>>>> On 20/05/2026 4:51 pm, Teddy Astie wrote:
>>>>> __{put,get}_guest returns -EFAULT on access faults which causes
>>>>> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
>>>>> incorrect.
>>>>>
>>>>> Fix the computation by relying on copy_{from,to}_guest_pv which
>>>>> reports the number of remaining bytes instead of a negative errno,
>>>>> such that we can compute the offset properly.
>>>>>
>>>>> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
>>>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>>>> ---
>>>>>   xen/arch/x86/pv/emul-gate-op.c | 5 +++--
>>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/pv/emul-gate-op.c
>>>>> b/xen/arch/x86/pv/emul-gate-op.c
>>>>> index c2c699fbff..cacc171115 100644
>>>>> --- a/xen/arch/x86/pv/emul-gate-op.c
>>>>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>>>>> @@ -289,9 +289,10 @@ void pv_emulate_gate_op(struct cpu_user_regs
>>>>> *regs)
>>>>>           int rc;
>>>>>   #define push(item) do \
>>>>>           { \
>>>>> +            unsigned int __value = item; \
>>>>>               --stkp; \
>>>>>               esp -= 4; \
>>>>> -            rc = __put_guest(item, stkp); \
>>>>> +            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
>>>>
>>>> Oh, this probably violates MISRA, but you don't need to use a separate
>>>> variable because sizeof() has no side effects.
>>>>
>>>> Given that the expression is now &item, I think it needs to be &(item).
>>>>
>>>
>>> I tried something like that, but it looked a bit weird and clang
>>> wasn't happy (at least in language server) because of the &(x + y).
>>>
>>> We also need to ensure that we're actually copying 32-bits scalars
>>> (and not 16-bits or 64-bits ones) like the previous behavior.
>>>
>>> That diff seems to work though
>>>
>>> diff --git a/xen/arch/x86/pv/emul-gate-op.c
>>> b/xen/arch/x86/pv/emul-gate-op.c
>>> index cacc171115..b72a3058dd 100644
>>> --- a/xen/arch/x86/pv/emul-gate-op.c
>>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>>> @@ -289,10 +289,9 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>>>          int rc;
>>>  #define push(item) do \
>>>          { \
>>> -            unsigned int __value = item; \
>>>              --stkp; \
>>>              esp -= 4; \
>>> -            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
>>> +            rc = copy_to_guest_pv(stkp, &(uint32_t)(item),
>>> sizeof(uint32_t)); \
>>>              if ( rc ) \
>>>              { \
>>>                  pv_inject_page_fault(PFEC_write_access, \ 
>>
>> Oh, that's a second bug you're fixing then.
>>
>> Pushes of ss/cs need to be done with 4-byte writes and zero extended.
> 
> And they are: Access size is derived from the pointer passed, not from the
> item.

Oh, while access size has always been correct, ....

>> I've added:
>>
>> The use of a local variable in push() also fixes a second bug.  On all
>> but the earliest 32bit CPUs, segment selectors pushes are
>> zero-extended 32bit stores.  Xen was not doing this for %ss and %cs.

... zero-extension was lost with the FRED work, so a 2nd Fixes: tag is
going to be necessary: cb29eed2dae7 ("x86/traps: Extend struct
cpu_user_regs/cpu_info with FRED fields").

Jan

>> to the commit message.
>>
>> ~Andrew
> 



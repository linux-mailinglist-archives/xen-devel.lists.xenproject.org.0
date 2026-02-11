Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBRuDa06jGnbjgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:15:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A0122229
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227039.1533361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5NT-0001ex-7s; Wed, 11 Feb 2026 08:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227039.1533361; Wed, 11 Feb 2026 08:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5NT-0001dV-4o; Wed, 11 Feb 2026 08:15:15 +0000
Received: by outflank-mailman (input) for mailman id 1227039;
 Wed, 11 Feb 2026 08:15:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vq5NQ-0001dP-QI
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 08:15:12 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c849ac4a-0721-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 09:15:10 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso5956545e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 00:15:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd0deeasm23714275e9.12.2026.02.11.00.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 00:15:09 -0800 (PST)
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
X-Inumbo-ID: c849ac4a-0721-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770797709; x=1771402509; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BGJkZBnjHSznE6/u2MV2J/YHyTp7Lw1oq9mek2iejl4=;
        b=gmlTRkXU9z2AqHTzl7flGg6pYUK16Ib5BsvcRYmRZZHgTzBRp2LTg01ny6BNEW9vMI
         /oUqWAFMxAlbJX48gimkx39RoUeB8mILMYT/QPsq0cua7VoBAHtBMVvvdoh4f4EVi8no
         TWcME8lfLuldYDaX/kn6lq+NQg86uW+uzt5a9UCeT0ofAe5diFsaQmpr3TQxk7w0/miL
         luITb9JCjuMQeMVfigyGgHclwapXVQYSRS6Ht58niasd+0b25pAZk/QyBQsePZayMTh6
         MRG7oYn6+ORTWJ8MZdwGydXpbXJ606vWj/eLItTHyJEwiicPYsDlDQpAEBtlRX3PblQo
         URIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770797710; x=1771402510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGJkZBnjHSznE6/u2MV2J/YHyTp7Lw1oq9mek2iejl4=;
        b=KHxt8o0FXO+Ki7RW0kFAjYeWqewS95uF6M+HbLw6KwOKdIkRrEWbPOMr9+437GZmS5
         7gU0/DzV/ZHBu+HWEkajW7hljP8lGXeCPI9cnBLoFhQBpq7I4Mncq9dtWaNzsum20fKx
         OvhIh4KUtaDmXeZgEmGEBkMiAOyIkYkztOZ9VoM2rMKJ7ALifOt+Yjzh9KSwBLCg9M7K
         an5zo7R0j+Gc82ghD8ck1I23W1zPLQauIcueQxQ75r3qJvOVhzZ2LenmCr3+Gc2mQVBy
         SqzlQHuixkqbJ8l8CtvAio7Bn/A9zxuOa1TqxLM7Xs2h3bqXvdLCuC4XeeBzwWWLkFNs
         UdGw==
X-Forwarded-Encrypted: i=1; AJvYcCXAATv82eOcLugd79jS0zlkW+y5PiM9Nk4ZaUvgbcDLFNiGx2a77nP9rtwDsr4GhIGg2oQnPdr97wc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQZFAWg+d+40dhlO4MgBAP/UGgfdgJ9nMEA+XtqYlYa01VcMd4
	tQIs+TM5wJElRGnB0bBg2ULBHGaa+eJQjsuxFxzIVwuHFa70Y/L3oUnifplt6iOj8A==
X-Gm-Gg: AZuq6aL/U1+xSn15LbC5xKvRFZ3RcPTwVIFdyFXs+7K8hdC7H4KcAa89r1T/3gZacX8
	amgef9QcjtX0/gcvBGMpj5cDMA1taOM6+L+zxttCGH8+5sIgTveUAeRxuVfyELJa0RdGzL8vUbM
	lVspZ5HRrrMYpmOOTcxqksC5MpIfNKrllfFMoOyakZmUaGu7qELL0RlYMJiyYJWE7mXXQRq8vmu
	sOMUvGodSWXBQCJLfP16SyeF+HQEybZUUTw6wcV6YhQLQwBKD47ZGn+qOs829WlTW79wtZm5Fkb
	k5jd8/VsqjPZLrYxlEIrnc1V92VKYzaIdS3K0dfkvS23OMNFzcFKJeftaV5kjzBrGPvZOrHTPTQ
	QTFKoQd2I0oz7f4F12ospOYe5YWN6wdhO+i8M+tX8ReDCSb5/GhRK0JGh7r1nFLcfK2O4G+AEhm
	EcClGvynkw6UJ67NuzgYrlYn2xTPzTbZ9BkLwfELBzs3BRgzzeIL8hTB9N5YSFkWIXX2YTfo00i
	ZAq3E6OV+TEAfQ=
X-Received: by 2002:a05:600c:8b42:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4835053c2a7mr71203175e9.11.1770797709569;
        Wed, 11 Feb 2026 00:15:09 -0800 (PST)
Message-ID: <e3329e87-76a5-474c-9415-7ab78c3a7ba6@suse.com>
Date: Wed, 11 Feb 2026 09:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] x86/traps: Alter switch_stack_and_jump() for
 FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-8-andrew.cooper3@citrix.com>
 <e314d193-79f2-4d77-a2ed-1590375b4b96@suse.com>
 <6786174e-e00e-46fd-8b82-7eb823ad96a8@citrix.com>
 <82adaa8a-b7d9-40fa-b59b-0851776fb59b@suse.com>
 <6a675aa8-ad41-4b09-b38e-562c5866149f@citrix.com>
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
In-Reply-To: <6a675aa8-ad41-4b09-b38e-562c5866149f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8A5A0122229
X-Rspamd-Action: no action

On 10.02.2026 17:21, Andrew Cooper wrote:
> On 10/02/2026 11:55 am, Jan Beulich wrote:
>> On 10.02.2026 12:15, Andrew Cooper wrote:
>>> On 07/10/2025 4:58 pm, Jan Beulich wrote:
>>>> On 04.10.2025 00:53, Andrew Cooper wrote:
>>>>> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
>>>>> means that switch_stack_and_jump() needs to discard one extra word when FRED
>>>>> is active.
>>>>>
>>>>> Fix a typo in the parameter name, which should be shstk_base.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>>
>>>>> Leave as $%c.  Otherwise it doesn't assemble correctly presented with $$24568
>>>>> to parse as an instruction immediate.
>>>> I don't follow. Where would the 2nd $ come from if you write ...
>>>>
>>>>> --- a/xen/arch/x86/include/asm/current.h
>>>>> +++ b/xen/arch/x86/include/asm/current.h
>>>>> @@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>>>      "rdsspd %[ssp];"                                            \
>>>>>      "cmp $1, %[ssp];"                                           \
>>>>>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
>>>>> -    "mov $%c[skstk_base], %[val];"                              \
>>>>> +    ALTERNATIVE("mov $%c[shstk_base], %[val];",                 \
>>>>> +                "mov $%c[shstk_base] + 8, %[val];",             \
>>>>> +                X86_FEATURE_XEN_FRED)                           \
>>>>     ALTERNATIVE("mov %[shstk_base], %[val];",                   \
>>>>                 "mov %[shstk_base] + 8, %[val];",               \
>>>>                 X86_FEATURE_XEN_FRED)                           \
>>> I find this feedback completely uncharacteristic.  You always goes out
>>> of your way to hide % inside macros to prohibit non-register operands.
>>>
>>> This is exactly the same, except to force an immediate operand, so the
>>> length of the two instructions is the same.
>> Thinking about it more, are you perhaps referring to assembler macros?
>> There indeed I prefer to have the % inside the macros; the same may go
>> for $ there, but I don't think we had the need so far. For inline
>> assembly the situation is different: The compiler emits the % (and also
>> the $), unless special modifiers are used. It wouldn't even occur to me
>> to ask that we use %%%V[val] for a register operand. That really is the
>> register equivalent of the $%c[val] that you use above.
> 
> We can't use %V anyway because it's not available in our toolchain baseline.

Sure, I used this to get my point across. Technically we could macro-ize
this to use plain % on older gcc and %%%V on ones recognizing the
modifier.

> But, bottom line.  How insistent are you going to be here, because this
> is the only thing holding up committing 6 patches.

The construct you use is technically correct, so it feels odd for me to
block this (hence the R-b I gave). Otoh I have to return the question: How
insistent are you on using a more complicated construct when a simpler one
will do (and will be correct as long as we get the constraint right)?

Jan

PS: As to the constraint, I wonder if it wouldn't better be "e". The
value used is small enough right now, but if whatever change led to it
becoming huge (e.g. an address instead of a size, as "shstk_base" may be
taken to imply), this would still assemble (to what - oddly - AT&T syntax
calls MOVABS). Yet we may want to be aware of such an encoding change.
Having said this, while things ought to assemble okay in that case, I'm
not as certain as to this also compiling successfully, due to our request
for PIC code. Yet that then ought to be the case regardless of "i" or "e",
and might then only work correctly with the new %cc modifier (which
obviously we can't use unconditionally anyway).


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2099C50BD3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 07:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159462.1487784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4VU-0007HT-D3; Wed, 12 Nov 2025 06:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159462.1487784; Wed, 12 Nov 2025 06:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4VU-0007EO-9f; Wed, 12 Nov 2025 06:39:04 +0000
Received: by outflank-mailman (input) for mailman id 1159462;
 Wed, 12 Nov 2025 06:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJ4VS-0007EI-2F
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 06:39:02 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4345e44b-bf92-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 07:38:56 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477442b1de0so2980395e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Nov 2025 22:38:56 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a60:8d0a:6473:d951:bd22?
 (p200300cab70c6a608d0a6473d951bd22.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a60:8d0a:6473:d951:bd22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2e052f32sm25464536f8f.17.2025.11.11.22.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 22:38:55 -0800 (PST)
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
X-Inumbo-ID: 4345e44b-bf92-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762929536; x=1763534336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1hs6yILGDXwX38IaKxeSn+uiT17ZYoCtwioJI1+qqjM=;
        b=R7MGmTEqwrDot1t+sGDZNV5bQ7Mbox/Ebcffua+kP54HA9hDh9kp7juvACasX47/kY
         I52IHfrhicAhM/GOlOUgpTrQM9ltkGZxwW9VAvnVurJIGQOWWQsPGYIivKrckDJBfk6t
         yM/Hrt9LYyxsJY56oWzFcRWwuFb+CrkbXyyLWKX81VZWRaJui2cmgZy4Co6kjWiMPxT8
         2cKmPS2AqABs7qZB8Xp6JtzowA6tqVna3TJNKPgZMHCIF9G8REXzKtXz7/GaEKO0doEd
         NKW9/CFtrNODSnFX4393F2RSKtgMTn/EFXtz4ta5v0LpTFuaWuUK/eu63M+jZAiFMJtO
         m/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762929536; x=1763534336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hs6yILGDXwX38IaKxeSn+uiT17ZYoCtwioJI1+qqjM=;
        b=IVNNvKSTv7xVpGbArfhbCAgzMFdkimtrJtI5znGInbRfPL5YnWY1f/P7a4dQPXojRP
         pTNkibexXPtXboYpVGc1BjdHKNPQUUTCI27LDvU6YZRNyqGwUFR4tyyy1HOi1qUt0pS+
         uL14S9tJmAc6x5msv4c3h8lFw5iXourK4SJp6iLS2rIWj6RvVtGYGtLLgn9xNbEAHdHa
         ai6DWChueBwze8YOfBHHh6qs7IVeKbcesZmSmg3KM2TwkDf5dt0pOcJUeDbXX1pnDTXw
         dAghLAM6eWTVpMwl47KTs2eyAcfVOq18TFYmxVf4OgeNh5W3wUTJYZba7SfXMCwF58Qd
         cIgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE4cSCbC2XuMaHnSlE8vn7SQM6OKuXrN0evZwoK2JOXBXAaxe/4EhmrEB0US7zwtvRNYQ5bC4BF0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdSulhML0rbWNm78I2/2jv1wh1cShPcC4pY+0XO5BlQpEjElEu
	NpiFpz1H9+vNpdR6X2PNdHznIWxMIzhU059Gxgu4mBIzgSzpQGR+EcT0Shq9M/+Aiw==
X-Gm-Gg: ASbGncvH359gyfW+NU8OKJbGtLFNEqC4J6NFC+1fx7uENhVUdR4qik8/MCiqjRWUT20
	+MHNVg/hn55+cxCwTv79t0npMOmF6aTv4322IjkWGn5dfFAEpQiDpk2q8oLJ4hSBetv6Xnxv6Rj
	oAt6ApzQYHeLYZZDzVzxW1SBwpEmEZsbfPuhx8Rx1/mhc0RrwKAesdDf1PPba2+fatpkpEBOR0N
	sTilm9apr5r0bBgaEgYpmfFswgWREINfjHVK1W4T/fDECgrvFnnmz6hxFIIAjFrP+Up+d6R4JcL
	yitSjicFEpmbg8H3oZOtkAYVW7FlO0AjMTjSxQxuJF8rzOpNqmFjbRotNn52iTUoQ81MEpw7+Eu
	kfmzll5A2NUAY6/63vF3YToDc0Yh16NWYY4UJp/UDKhKJd8QU2A5bNfO+sVf0EmcvOvgUF7WK6l
	eGXfC0nNShc05yYhFIMlkTRT1bQDTuq20RMrWzHVnQ6p2OahHW58VzAmvz4Rm7vSGYzboKwO0hL
	a5khE/bPJAGiaWCLvgwxlWsEESPrrFxeJAubW4rvcbZAA78
X-Google-Smtp-Source: AGHT+IGe7CKZLN3BVyEiPzsTMqoj06VUfp3wOHo9z2yVPi0u+ZODzE1BGqLhP1E9DHcIf/V1rp6eag==
X-Received: by 2002:a05:600c:c4a3:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-4778704a657mr12852635e9.11.1762929535762;
        Tue, 11 Nov 2025 22:38:55 -0800 (PST)
Message-ID: <faab050f-677f-469c-8bca-93c55a53165c@suse.com>
Date: Wed, 12 Nov 2025 07:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Lira, Victor M" <victlira@amd.com>
References: <20251107181739.3034098-1-grygorii_strashko@epam.com>
 <47f86a44-007f-4b90-9656-b2440238b2ba@suse.com>
 <f0a5a939-7d66-417d-8a88-34cc172623e6@epam.com>
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
In-Reply-To: <f0a5a939-7d66-417d-8a88-34cc172623e6@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.11.2025 18:52, Grygorii Strashko wrote:
> On 10.11.25 09:11, Jan Beulich wrote:
>> On 07.11.2025 19:17, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/include/asm/guest_access.h
>>> +++ b/xen/arch/x86/include/asm/guest_access.h
>>> @@ -13,26 +13,64 @@
>>>   #include <asm/hvm/guest_access.h>
>>>     /* Raw access functions: no type checking. */
>>> -#define raw_copy_to_guest(dst, src, len)        \
>>> -    (is_hvm_vcpu(current) ?                     \
>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>> -     copy_to_guest_pv(dst, src, len))
>>> -#define raw_copy_from_guest(dst, src, len)      \
>>> -    (is_hvm_vcpu(current) ?                     \
>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>> -     copy_from_guest_pv(dst, src, len))
>>> -#define raw_clear_guest(dst,  len)              \
>>> -    (is_hvm_vcpu(current) ?                     \
>>> -     clear_user_hvm((dst), (len)) :             \
>>> -     clear_guest_pv(dst, len))
>>> -#define __raw_copy_to_guest(dst, src, len)      \
>>> -    (is_hvm_vcpu(current) ?                     \
>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>> -     __copy_to_guest_pv(dst, src, len))
>>> -#define __raw_copy_from_guest(dst, src, len)    \
>>> -    (is_hvm_vcpu(current) ?                     \
>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>> -     __copy_from_guest_pv(dst, src, len))
>>> +static inline bool raw_use_hvm_access(const struct vcpu *v)
>>> +{
>>> +    return IS_ENABLED(CONFIG_HVM) && (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(v));
>>> +}
>>
>> Without a full audit (likely tedious and error prone) this still is a
>> behavioral change for some (likely unintended) use against a system domain
>> (likely the idle one): With HVM=y PV=n we'd suddenly use the HVM accessor
>> there. IOW imo the "system domains are implicitly PV" aspect wants
>> retaining, even if only "just in case". It's okay not to invoke the PV
>> accessor (but return "len" instead), but it's not okay to invoke the HVM
>> one.
> 
> This patch is subset of "constify is_hvm_domain() for PV=n case" attempts.
> 
> It was made under assumption that:
> "System domains do not have Guests running, so can't initiate hypecalls and
>  can not be users of copy_to/from_user() routines. There are no Guest and no user memory".
> [IDLE, COW, IO, XEN]
> 
> If above assumption is correct - this patch was assumed safe.
> 
> if not - it all make no sense, probably.

I wouldn't go as far as saying that. It can be arranged to avid the corner
case I mentioned, I think.

Jan


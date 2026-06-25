Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B7gNG5gOPWrlwQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:18:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15826C50CD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 13:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VUBcCOuV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345490.1604339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wci6P-0000J8-4x; Thu, 25 Jun 2026 11:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345490.1604339; Thu, 25 Jun 2026 11:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wci6P-0000GZ-2C; Thu, 25 Jun 2026 11:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1345490;
 Thu, 25 Jun 2026 11:18:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wci6N-0000GS-Fz
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:18:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wci6M-00DH9s-E6
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:18:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d0e85-bab6-0a2a0a5309dd-0a2a4507c814-6
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:18:34 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d0e8a-9c8e-0a2a45070019-d1558030b8e5-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 13:18:34 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490b7866869so18949915e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 04:18:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1eef84d7sm16398986f8f.16.2026.06.25.04.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 04:18:33 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782386314; x=1782991114; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=98YVTtEhz+tUi9c4dDYbrEtZmJOiLy7Vw1N60n47vyk=;
        b=VUBcCOuVlhDc6j5d8Ey+H1eMehqYAufK9U1G9GMMdMp95aGNkZOQ0UJw4UXzGOklGo
         ArrQ2sQl57bACgwCR+yp2H9uGpCxumsmPG3H/QDLpfFty278l1WXeN/0GDXN71D0iugj
         g9u319kUa6g1fyuPAOj3dIv377sf2HBqO57+aBXu1r7gSjc3SqhiceP/7Xx9HNdOeXu9
         l53KpUDS19NmS+Ewt3v5uM6MU1uHoxuX5krgc+kq+GG8LtjJq3HKhW8EZYmK4ppBVGqo
         SkwNEn2ZLJW1ZPzWjlREfvYcmjP8EtI4q48BROqMwK5X5bcCSNtgri7hNmXX/vAL13j4
         ldKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386314; x=1782991114;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98YVTtEhz+tUi9c4dDYbrEtZmJOiLy7Vw1N60n47vyk=;
        b=qvRNRh7XSX3e8jFimPvdwvn2zyB82PDHk6L4V7FMBnQYSDaBfvRqXiGO6vLfVkhVP5
         AP6fLnILn/i8hpKMLDzgGsHrDBdVNZ0gbCbAIDYJA8J8+bqIZNEkgHWQcZTzJ123nWbi
         dKB/wbOnE5Crd8zTpYHolRGkTMz7f9B9VPdBxdYcKpGDa44x6zrOEYQdtNzqqFVuzH67
         9BptXdhIVCqJhlmBWjZa/5LE4g70JGqLyY+WplbzpozrmhcRMoJcA0y8KjZA8c15Ygqz
         RS4ezO54RBH7OwQJMqfYQDJelpzjBkD4PgAjFO6OMbK7G44loJ1pXIBm4pVe20VC0nhH
         5t7w==
X-Forwarded-Encrypted: i=1; AFNElJ+xz1STBgG+ggUNnz+pU2HeIpsDny/SDg/co8+W7UbEHcsjKb4/OI/mO9r0mMIIzkjEN12YnSEeJcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTGMV8yu9Mv6zT2iZt5unOUOI0k1fwcr0RFhq49G6zhcgDboG8
	6x94MoL/3geVp3idxuVZDFY4pprbF1zh4eKLJfqn5aVdgkyEEDwxhHTn6n0KlbMHbw==
X-Gm-Gg: AfdE7cmgTzFLHOQ5IRg7gQu0gKO1TEZ18qD4qdeVqrPDbSt5OHg+CTobmu0FO5J8SQs
	16DWIxvCZPbbvNTVdXNdfAhb6vu782F/OAqld8/xTTexJlLIuD0Rwg3nEsI1NpKqmjARs4BNQsp
	8+4dzjFngs8baVlFMaOTrspQCvbNCbPPdt+fZuCxkF7CJqCFD5OcZI5VTRsJ0WaLcbkXihudMtv
	laZ6PbyBiDA7wggJfglHAGSH8H1WnsPT4lewYRoPqCDCkfwPvGDwuCTqUMPE7409SbuaLFcdrXD
	Bi8k8Zv92sIXZ2Yi3P7JbXPwyCXFdjKPqF60BCVlrOKAIbi/yBz8KL5xY9MozEPqw4iLnsvfNDJ
	iCgA0SmxeXTnYxOtr/Vf2cxZcbvfaNjYS923r2SnIv+Io9A0O3CFPm98gFsY4Fhmo9e+AJ0wmPy
	XTIbJ6BuwInZFTbkPGm9zVzUuPZdiN5a4ypiQ7ox2r6oIAkaWWx5FFEdC2yQ3b8FxhiIhyRVF6d
	UkD
X-Received: by 2002:a05:600c:c04b:10b0:492:418b:b5e1 with SMTP id 5b1f17b1804b1-492668b02damr21491755e9.37.1782386313757;
        Thu, 25 Jun 2026 04:18:33 -0700 (PDT)
Message-ID: <4f971b7e-b9ff-44cb-bf29-3939c8659b07@suse.com>
Date: Thu, 25 Jun 2026 13:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/efi: discard multiboot support for PE binary
To: Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
 <20260616172830.111393-3-frediano.ziglio@citrix.com>
 <070ff282-5ee4-4c24-b0bc-92d187c40dd9@suse.com>
 <CAHt6W4de1ddW_xMWhbJ15vA171tuHVGJu0TO0bAH845EDQN4gg@mail.gmail.com>
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
In-Reply-To: <CAHt6W4de1ddW_xMWhbJ15vA171tuHVGJu0TO0bAH845EDQN4gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1782386314-7C92A25E-95A82451/0/0
X-purgate-type: clean
X-purgate-size: 2964
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C15826C50CD

On 25.06.2026 12:15, Frediano Ziglio wrote:
> On Wed, 24 Jun 2026 at 15:18, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.06.2026 19:28, Frediano Ziglio wrote:
>>> From: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Multiboot and PVH booting are not supported for PE, hence discards them
>>> in the linker script when doing a PE build.
>>>
>>> That removes some relocations that otherwise appear due to the usage of the
>>> start and __efi64_mb2_start symbols in the multiboot2 header.
>>>
>>> Section discarding is not done updating DISCARD_SECTIONS definition as the
>>> change is specific for x86.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>>> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> While on the surface this looks okay, there are still concerns:
>>
>> For one, this also discards the PVH entry point. That's technically fine aiui,
>> yet shouldn't go without mentioning.
>>
> 
> Considering that the code/data is not exported in EFI as
> 
> #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
>   /*
>    * In principle this should be fine to live in .note (below), but let's keep
>    * it separate in case anyone decided to find these notes by section name.
>    */
>   DECL_SECTION(.note.Xen) {
>       *(.note.Xen)
>   } PHDR(note) PHDR(text)
> #endif
> 
> yes, technically it's surely fine.
> 
> There's a mention in the commit log:
> 
>     Multiboot and PVH booting are not supported for PE, hence discards them
>     in the linker script when doing a PE build.
> 
> But not in the subject:
> 
>     x86/efi: discard multiboot support for PE binary
> 
> What about simply changing the subject to:
> 
>     x86/efi: discard multiboot and PVH support for PE binary

Perhaps.

>> Otoh you discard call sites of functions without discarding the functions
>> themselves, violating Misra's "no unreachable code" rule. Eclair may not be
>> able to spot this, but imo we should still adhere to the rule. Proper
>> coverage analysis, for example, would likely turn this up.
>>
> 
> That makes sense. Given that most code in head.S is now discarded most
> data sections are now not used and the only thing left will be the
> trampoline.
> It'll take a bit of time to search for removed symbols.
> 
> About the "no unreachable code" I think we are violating that anyway.

Perhaps, but we should get the number of such violations down, not up.

> We package "built-in.o" files and then use them to craft the final
> executable. I don't think the linker will be able to discard unused
> functions for that reason. That does not mean that more things can be
> discarded.
At least not until we engage it garbage collection, which as per Jason
proves problematic when linking xen.efi (due to linker issues as it looks).

Jan


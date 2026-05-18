Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AWiESHDCmrR7gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:43:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76C567FEC
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 09:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311602.1581716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOscz-000373-Js; Mon, 18 May 2026 07:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311602.1581716; Mon, 18 May 2026 07:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOscz-000348-HD; Mon, 18 May 2026 07:43:05 +0000
Received: by outflank-mailman (input) for mailman id 1311602;
 Mon, 18 May 2026 07:43:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOscx-00033w-61
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 07:43:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOscw-008pwP-Ef
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:43:02 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ac302-bab6-0a2a0a5309dd-0a2a450aec3e-8
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:43:02 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ac306-56b3-0a2a450a0019-d155802fe474-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:43:02 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488ad135063so12742675e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 00:43:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe537c516sm255987785e9.13.2026.05.18.00.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 00:43:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1779090182; x=1779694982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RaQjgne6AC6erMinKaTrrRsL+kpXXYaHx2YuS5v9D5s=;
        b=akiQzxxKc1NDy4zbYFFf7WsRp4ii8tklvZ6CBKPOyBEBdQH4Q27AQuUsT45Hpre9Q0
         XYiZZvhTmC1wBJJOdHZAAsTB/3ABuX/A2rKms9VC8zBUuMExPC7HkcXexA4i/lh1k2JR
         /qs5Q7WWP+c4NEowilNywICGRUKh1BN3bBRluSvdbzOLKwhD88VMwzTJ3AlWpf4KW7ps
         HpwyLtEjPft1mS+v/wuHkUHtRNUcYNK43LRynB4P2JVFhEohiQkaNCFsXKX6/p+YNDRs
         nxHu+CTkm4aeZKJOPC7oBCQ95qB2SAgozQc1GiUozdWf/alajX3HnOlBXJiXzRBFzarb
         Wn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090182; x=1779694982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaQjgne6AC6erMinKaTrrRsL+kpXXYaHx2YuS5v9D5s=;
        b=qE1xI5BJcVYyLzi4+BrRsw815LROTSmt3sBx0LA82VQA+HjJVopNUfmmTlgdNZ5NOL
         1D5sRaLmJFwWsu68gG1OtS6+R8DochsVMvy+LU8kFOrq4cQsrLuSGqVT6/bWd52nF6bH
         fnYFZ2WRWdfHpz0MB6vYZmUV1QYZldYepA07mB0rTJOwyTGEJTVJLakSbzHKm5QNGEsG
         fs687znQV2V/P/nuDDL0eEQ1xPzSS0FSFhHwsgaD6d2ACuUiSH+zJLDqJsu3VJbSTj8g
         8Jn3jS9asjRPceYj3qlR5HUuck4ynaLp3EmBtoSxHYK0K6+eWE23jUlbtd940JJwgXmM
         y2IA==
X-Forwarded-Encrypted: i=1; AFNElJ/PuFk2giewrXG8xqCFCwBpniMxQcWEJtMOA7kTpM9FHaT0fu4wPu6IialNKqbvMCfPo/KoCvAF2Ow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaAFJMmwx4RNgv1DujL2peX1ptUxrljOmRg5D4eTHxHAX0SsP7
	gd7afm21s1GMBfY2OpYigU+/A/65GmvD8yzV8sCOn53siNEKjP4gLUbFTmniEBrHhg==
X-Gm-Gg: Acq92OEU9q674qD3hH06CQDcZCdLaeEUZyF6Z59GnjrBkRYKJ0gvhiys+bb+gzBgAG+
	nRWh9gb/7kBJCk/Zajkb9BmA1Hs4qS0RnS1PPWmk2NwB8hCuANmcB/ykwKrfdQStzMUK5sH0GBe
	oV0B49N5v7VSht48GR2OXmE+MndjZYjVG9KkX9e+QM5ubjJD2n3qVPyRiLVV5rsjpA8Ro5PCVdK
	rGZzAvxDyhJp7iCmhAEbZh+U0L4A/7SjdfcSaOw7L1LeiBW/4PthYNoxJs8cuTDi1LMAxeaLFhG
	B3oXXkQvfQacTqSkBeHaGYbdOoe0dAeRcty33/0NhPfM0bETTWetCudE5HVZUDKaMhF/bn7D/QH
	+LSJOBqYUG4R7OtN5ShOhZr3ZQ+v8FKEiSvK657KTT7Fa7qlHqi/3kVImvu8C35aSs4aSKdkzjs
	4lDsGx/pZTDpJnPXzczoOGzIX7VA64NVLR5zYxqSoDbWy4lcTQzNXaZIUwuwqaUVGBJfql+Uemj
	1urY6oW4vz2gGt8pl6qPDS1qQ==
X-Received: by 2002:a05:600c:609a:b0:490:b07:5fd1 with SMTP id 5b1f17b1804b1-4900b076103mr52495775e9.11.1779090181702;
        Mon, 18 May 2026 00:43:01 -0700 (PDT)
Message-ID: <8156a887-9069-4f9b-8107-b4dbd2cbdb69@suse.com>
Date: Mon, 18 May 2026 09:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/common: llc-coloring parser fixes
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <cover.1778925998.git.mykola_kvach@epam.com>
 <d9db51c5-97a1-4131-8575-dca1ae2cf52c@suse.com>
 <CAGeoDV9DitsH629pWGe+X=0VM+oi1BfSgWMxE+t32CCR5gMgtw@mail.gmail.com>
 <a5d1dc32-c505-4f42-8d48-ba2710d7b831@suse.com>
 <CAGeoDV_8BNRPy9tbe1ArgR4Lj8YHZPwo_7D59oJJSiSqNQFNFQ@mail.gmail.com>
 <22edbeb3-4b0b-48d4-9873-76bfa31b970d@suse.com>
 <CAGeoDV8ucuZ-FrYe6j_ke4cK33z27=rNZ-9oZzb0R9PxqDJBqQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8ucuZ-FrYe6j_ke4cK33z27=rNZ-9oZzb0R9PxqDJBqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779090182-7D3858B7-A2147A74/0/0
X-purgate-type: clean
X-purgate-size: 4312
X-Rspamd-Queue-Id: 9A76C567FEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 18.05.2026 09:19, Mykola Kvach wrote:
> On Mon, May 18, 2026 at 10:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 18.05.2026 09:01, Mykola Kvach wrote:
>>> On Mon, May 18, 2026 at 9:52 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 18.05.2026 08:42, Mykola Kvach wrote:
>>>>> On Mon, May 18, 2026 at 9:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 16.05.2026 17:03, Mykola Kvach wrote:
>>>>>>> This small series fixes two issues in parse_color_config().
>>>>>>>
>>>>>>> The first patch makes parse failures leave the caller-visible color count
>>>>>>> at zero.  This prevents a rejected command-line value from leaving a
>>>>>>> partially parsed configuration behind for later init paths to consume.
>>>>>>>
>>>>>>> The second patch rejects empty color tokens.  Previously, delimiters in
>>>>>>> places where a color value was expected could be interpreted as color 0,
>>>>>>> because simple_strtoul() returns zero without advancing the input pointer.
>>>>>>> The patch checks that each parsed color value consumed input.  It also
>>>>>>> adds the missing newline to the DT color parsing error message.
>>>>>>>
>>>>>>> Mykola Kvach (2):
>>>>>>>   xen/common: llc-coloring: clear color count on parse failure
>>>>>>>   xen/common: llc-coloring: reject empty color tokens
>>>>>>
>>>>>> For both of these, a question which isn't even considered in the reasoning
>>>>>> is whether the present behavior may be intentional. Especially for the 2nd
>>>>>> ISTR Stefano(?) not so long ago indicating that the behavior is indeed
>>>>>> intended to be this way. That may have been somewhere on Matrix rather than
>>>>>> on the list, though.
>>>>>
>>>>> Thank you for pointing this out.
>>>>>
>>>>> For the first patch, my reasoning was that returning an error while
>>>>> leaving a partially parsed caller-visible color count behind looks
>>>>> surprising. If the value is rejected, I think later init paths should
>>>>> not be able to consume the partially parsed state.
>>>>>
>>>>> For the second patch, my reasoning was that the current behavior looks
>>>>> accidental rather than an intentional extension of the syntax.
>>>>
>>>> That was my impression as well, hence why I had raised the question back
>>>> then.
>>>>
>>>>> The parser comment says:
>>>>>
>>>>> COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
>>>>> RANGE ::= COLOR-COLOR
>>>>>
>>>>> The user guide also describes this as a comma-separated list of colors
>>>>> or ranges, with ranges written as hyphen-separated inclusive intervals.
>>>>> I don't see an empty-token production there.
>>>>
>>>> What you quote is insufficient to determine: COLOR may be allowed to be
>>>> <nothing>. Iirc the reasoning went in particular towards a range with
>>>> merely the upper end specified being something (halfway) meaningful.
>>>
>>> Right, I see your point.
>>>
>>> The grammar does not define COLOR explicitly, so it does not by itself
>>> prove that an empty token is invalid. I was implicitly reading COLOR as
>>> a numeric color value, partly because all examples seem to use numeric
>>> values, but I agree that this is not stated there.
>>>
>>> If this behavior is intentional, then I agree the second patch should
>>> not go in as-is.
>>
>> Just to mention: Something like "-5" won't be interpreted as "0-5" even
>> right now. Instead it's taken as a single color with value -5U, afaict.
> 
> I don't think that is what happens with the current parser.
> 
> I tested this without the patches from this series:
> 
> (XEN) Command line: dom0_mem=2048M console=dtuart dtuart=serial0
> (XEN) loglvl=all console_timestamps=boot llc-coloring=on
> (XEN) xen-llc-colors=-5
> ...
> (XEN) LLC coloring info:
> (XEN) Number of LLC colors supported: 32
> (XEN) Xen LLC colors (6): { 0-5 }
> 
> So "-5" is currently interpreted as "0-5", not as a single color with
> value -5U.
> 
> That seems to happen because simple_strtoul() does not consume the
> leading '-', so start remains 0 and the parser then takes the range
> path.

Oh, I didn't recall this incompatibility with strtoul(). We also don't
permit a leading + there. IOW the behavior of the color parsing would
change if we made the functions (more) compatible with the standard.

Jan


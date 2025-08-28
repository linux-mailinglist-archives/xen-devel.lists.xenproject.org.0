Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD981B39528
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 09:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097679.1451919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urX43-0008Ci-SQ; Thu, 28 Aug 2025 07:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097679.1451919; Thu, 28 Aug 2025 07:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urX43-0008Af-Pf; Thu, 28 Aug 2025 07:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1097679;
 Thu, 28 Aug 2025 07:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urX42-0008AZ-Rs
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 07:28:54 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a65e58af-83e0-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 09:28:53 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61c4f73cf20so1115404a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 00:28:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ceaf6ec7bsm90774a12.17.2025.08.28.00.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 00:28:52 -0700 (PDT)
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
X-Inumbo-ID: a65e58af-83e0-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756366133; x=1756970933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YzcA84XKtwet83OL92pxWRFd0zZdBBIDsiQhHJpx8iw=;
        b=fohVFhYgJPznWUC9EyrlCLqjFlsd1dzY2ObryjyORw2hcgteSIGDaeZOSN1wumm+Wq
         /ErQozSajzMsfdW5NWnSUzNF9DJZj0ctss8E3V004wftS8XwET76gx6hTNft09vs+hhz
         1BMpkmWaQ/pr597aZuBBKDjrW3fs27dRrmPq+uLwO4Wh9x2iuoxz0zgKHmap3op0qhEE
         eKNrUwpnvWanc7hcqz1ee475vz+42mNO34mvUolqqvgi12GJy4QRv1Yc8qjIjKReTpi0
         0Od21nyU5ffwvbzN7Y3XWhHUvPWYcadUJEa0/Sj5T9nEz5LIJy9B9rSzhB5gkiravStK
         g+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756366133; x=1756970933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzcA84XKtwet83OL92pxWRFd0zZdBBIDsiQhHJpx8iw=;
        b=Zvume2XOrC85sP8zlfImzglWsl6tFczJghMLb1vBIIqqEbBAS78Kel8XhAfUkvwsJo
         HNYfoiDzwo6anMFAHeyqVcmoyDON1wVmSCYLyfZzthZREJOnsjTJvbIhnz0xgkyAA9ZV
         JP2vXOem7jVXdKpu3hVpukfsx+pnwFXp5tYNFgM07Lm1NOFp6RpZBDGZxTRMMIvBaIL4
         e3raRIf8UeYiRfgYrADICyyoJ4h3dBlHUpmvymRhROkxP6D2GyT4welRyQy33a4z8Sap
         nyQGto9yz+dzATjc/SpG6HpekhTU1a0iYc3UB8jhGrCnJ4jmQzmh/fM/qPhJwbnLKFUg
         wzXA==
X-Forwarded-Encrypted: i=1; AJvYcCVdy9QvYx/jQSL2IqeD4PSuQUcKVVFHsCRSvq6bWssONSlP6SyXArJURQXN29tVipLEzhrIbnAuP5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+Vo5vGXRLNfYh7t6yGyU7STv1Dk2pD+vSA2tjKogSEsFIKWfz
	2Ch1SHN4v5D62Eeu7MYU0VlOUnpSL21RahKzQxlk1q3rFLdAYRJKbWnWlt+3mCz62g==
X-Gm-Gg: ASbGnctXZqz8wJpc1Y3bNKWGD6uTBaVf/MIaL/0vxqzmIxGMbcfH5D3Nj207siNlPBl
	oEhZmLq+eKaN46bl3LCny7xUu6Q7la9SnmocKEnc5M96cTvyJVlxYYoHQcTsNg2Tzd4Z7oQgzL8
	NwsS6VDo3Q1Wx5u7gV7PGGtLLAFM1AhiRI7cWtoWGcrir/dL8IL/F36GkzoYUSw9wjEN2lSKwsn
	yeBPFC3qkvK7/bDQArnfvvgu6P3rCXOFVPQUuSlkanVTmY4N/WqoS7MCOVAo7ES1RTEc4fRl/SZ
	dCjgZQPPVmgE5Cg5sNhjD+0ah/vsSTOxkPhwJKgTZb9FwLkGU8PSXZBtMaOuN+3niV7eQ0VevjZ
	PAPLn4AA0ySHC+Gh4OXbuqFykU2ygInuyfl58BvAtsbjykzMyE9i2kkE523XXadUgeulsPJQ63g
	+BG7/mzAmlVEShZtN/gA==
X-Google-Smtp-Source: AGHT+IH+EZoAXuezwAHh9ufDa4xEsMpn2SA1rDjSdjLbdXaT708kPsGwDJ3ocatL65Ic0FwphF3Ehw==
X-Received: by 2002:a05:6402:44d2:b0:618:19d2:7251 with SMTP id 4fb4d7f45d1cf-61c1b3d8dfdmr16021472a12.10.1756366132978;
        Thu, 28 Aug 2025 00:28:52 -0700 (PDT)
Message-ID: <d934d8a8-93c0-4cb6-baa4-f2aedb719f25@suse.com>
Date: Thu, 28 Aug 2025 09:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] symbols: arrange to know where functions end
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <10e116c5-5a62-4abc-a52a-e2ca12118cfe@suse.com>
 <24fd00b5-3053-43ae-8342-887eee94869a@amd.com>
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
In-Reply-To: <24fd00b5-3053-43ae-8342-887eee94869a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 03:03, Jason Andryuk wrote:
> On 2025-04-02 09:58, Jan Beulich wrote:
>> When determining the symbol for a given address (e.g. for the %pS
>> logging format specifier), so far the size of a symbol (function) was
>> assumed to be everything until the next symbol. There may be gaps
>> though, which would better be recognizable in output (often suggesting
>> something odd is going on).
>>
>> Insert "fake" end symbols in the address table, accompanied by zero-
>> length type/name entries (to keep lookup reasonably close to how it
>> was).
>>
>> Note however that this, with present GNU binutils, won't work for

Btw, I've updated this to say "with GNU binutils prior to 2.45".

>> --- a/xen/tools/symbols.c
>> +++ b/xen/tools/symbols.c
> 
>> @@ -318,24 +334,42 @@ static void write_src(void)
>>   	printf("#else\n");
>>   	output_label("symbols_offsets");
>>   	printf("#endif\n");
>> -	for (i = 0; i < table_cnt; i++) {
>> +	for (i = 0, ends = 0; i < table_cnt; i++) {
>>   		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n", table[i].addr);
>> +
>> +		table[i].addr_idx = i + ends;
>> +
>> +		if (!want_symbol_end(i)) {
>> +			/* If there's another symbol at the same address,
>> +			 * propagate this symbol's size if the next one has
>> +			 * no size, or if the next one's size is larger. */
> 
> Why do we want to shrink the next symbol's size?

First (see related post-commit-message remarks): In principle section symbols
could come with a size, too. That would break everything as long as we don't
strip those.

The main reason though is that imo smallest granularity is what we want here,
together with predictability. One symbol with a huge size could cover
multiple other symbols with smaller sizes. We could omit that part of the
change here, but then the processing in the hypervisor would need to change,
to fish out the "best suitable" symbol when dealing with multiple ones at the
same address. Other changes may then also be needed to the tool, to have such
symbols come in a well-defined order (to keep the then-new code in the
hypervisor as simple as possible). Look for "aliased symbol" in
common/symbols.c to see how simplistic respective code is right now.

Jan


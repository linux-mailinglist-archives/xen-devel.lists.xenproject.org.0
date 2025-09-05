Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C44B44DEB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 08:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111288.1460041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuPqz-0005LA-HR; Fri, 05 Sep 2025 06:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111288.1460041; Fri, 05 Sep 2025 06:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuPqz-0005IV-Eg; Fri, 05 Sep 2025 06:23:21 +0000
Received: by outflank-mailman (input) for mailman id 1111288;
 Fri, 05 Sep 2025 06:23:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uuPqx-0005IP-OY
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 06:23:19 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdcc5e01-8a20-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 08:23:14 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b00a9989633so326477866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 23:23:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62069b79e1asm2360526a12.26.2025.09.04.23.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 23:23:13 -0700 (PDT)
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
X-Inumbo-ID: cdcc5e01-8a20-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757053394; x=1757658194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0XL1zHInmGojjeRUhBMCy2TvZcZvWB0YbUBSwAeXgzI=;
        b=Zk3x0YKeTLvO9O1CpT0eEZXvu09Rch5+hDPkk2DIoDmVFierFzC3zSiqju2ZOQQH95
         mjsIdrntY7tFYfz9Yu00bMgHRAi/7XWYpqdHPYojKq2VJjAXQmHogyoo8KKqfwQB0ag+
         qXEWvnUlSOJDStpngQPYZRJlQYinICbwwURsHqqpMgOL5Y8FfepTfowgCUjNxCMDSibs
         Tb0atjc2ZFJXXh8c/iHjs/5rRwXWDnssoqqvA8vdDVBVN5E1QLsSmxA0Ch6rAfxxp5y8
         p4V4M+LbgLiS8mqaDlzUoWRWW+O+cq+oW74xpPiZS77+PPE3IsK4lsEN9ne92KhWjvK9
         CtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757053394; x=1757658194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XL1zHInmGojjeRUhBMCy2TvZcZvWB0YbUBSwAeXgzI=;
        b=lgH09YIgiG/ZLVrNssxVJWgK6BEwZUuf/UmU6KyhPTOtdMpuefAmCheliRoN0v8dmj
         bgpZ35FyHuNeox/6OGUVCGA/Jy2OSjL9u7EFQq8YLCmbHlMxBjyFa7oTX8vbBwvpRGE8
         CcIlpHKI0YU6WVGdsHSqcEUX3s5/hOF1ptXcclPPWqgnyFuEid+YXd6kILhNqmRJjoc3
         Z03r3kRrHAzv9u5tXutjcMR18ClOuW2oQlHXzIAJXDVtyB2G+rJbouu4zAgDOc7PtrWa
         9BI4nalj+ySaFKBLQ64PMmqP42Cd5n5jNb5fdYX1gSS86QhWp8O9cwUp3UcftQ3paf85
         iZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHcZ7zYWk3IFBwRomGeOU6808bhl+XXQM+mvaBmqMNq8MAQfQ8vr9Q/NkN/CasAHmhtar5qznzaqc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNy4xFYU6E/b64uoy9Oewdbgg/eTmLs2nEzgI2dREQI/1OSiOG
	fejJKtCEdGy7OgB9BmU4i22Yyfi/dm8xPhC46zy/tOvJOwxsXntSU3eeoMjZz77lMw==
X-Gm-Gg: ASbGncvWIwzVB0jCiuyGhOb96Gymx4T1Kd8WLwh+Bw9H4BhyMKgQ3gDr4DQAoxqabWk
	g4SgZ4cCIoRniEy2Tjh0GPiuvZ7CFzgPT6x+VXjlgDsLXV6nA4jo1WsQqctz+eMQcFMeG8EadyQ
	920ZrnsOjoTdWLka6RQrssBNVqw3F9jMagYUzNMZW7bgNJ+jAKH8PYRjMjwysytSU/+mBw1oiTw
	pxDwujJhD+Xx04iFIhy+ip9F20hXC78vbXfSXarVouKFBuWkz+ztoRjEOU23loHbr7iq9men5iD
	uiAQmqtEogu+AuDLDkqs6iWolKty2WpuldAtI6GhYN4D1aI3n0fHPHhpa6I2S3S0cSAyWzmd/Rr
	nVo0S2i0fPYZwyz5m8Jf2THFHX05f9BAh6p9kabAQEfLK9U1ZfaWuns0nP8me31Fc6I/TJGO+7X
	q61b3DKWgJXYqM7w+sqQ==
X-Google-Smtp-Source: AGHT+IHVsKSNhsh56RQRb/AxWk/aKmJ0b5TbP3rgYupuCmH0SR3PGaADG0Fi8roKJnazg/0oOFazXQ==
X-Received: by 2002:a17:907:6ea3:b0:afe:ac57:f0be with SMTP id a640c23a62f3a-b04932a677cmr262986566b.31.1757053394017;
        Thu, 04 Sep 2025 23:23:14 -0700 (PDT)
Message-ID: <4534a58a-b7c9-4571-a459-c3ec3d28ca49@suse.com>
Date: Fri, 5 Sep 2025 08:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] symbols: discard stray file symbols
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2412a7a0-bdcd-4647-8ea2-8d2a927dcde3@suse.com>
 <d8af4ded-1473-42b9-9f52-187936e4dd1e@amd.com>
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
In-Reply-To: <d8af4ded-1473-42b9-9f52-187936e4dd1e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 23:53, Jason Andryuk wrote:
> On 2025-04-16 05:00, Jan Beulich wrote:
>> By observation GNU ld 2.25 may emit file symbols for .data.read_mostly
>> when linking xen.efi. Due to the nature of file symbols in COFF symbol
>> tables (see the code comment) the symbols_offsets[] entries for such
>> symbols would cause assembler warnings regarding value truncation. Of
>> course the resulting entries would also be both meaningless and useless.
>> Add a heuristic to get rid of them, really taking effect only when
>> --all-symbols is specified (otherwise these symbols are discarded
>> anyway).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Factor 2 may in principle still be too small: We zap what looks like
>> real file symbols already in read_symbol(), so table_cnt doesn't really
>> reflect the number of symbol table entries encountered. It has proven to
>> work for me in practice though, with still some leeway left.
>>
>> --- a/xen/tools/symbols.c
>> +++ b/xen/tools/symbols.c
>> @@ -213,6 +213,16 @@ static int symbol_valid(struct sym_entry
>>   	if (strstr((char *)s->sym + offset, "_compiled."))
>>   		return 0;
>>   
>> +	/* At least GNU ld 2.25 may emit bogus file symbols referencing a
>> +	 * section name while linking xen.efi. In COFF symbol tables the
>> +	 * "value" of file symbols is a link (symbol table index) to the next
>> +	 * file symbol. Since file (and other) symbols (can) come with one
>> +	 * (or in principle more) auxiliary symbol table entries, the value in
>> +	 * this heuristic is bounded to twice the number of symbols we have
>> +	 * found. See also read_symbol() as to the '?' checked for here. */
>> +	if (s->sym[0] == '?' && s->sym[1] == '.' && s->addr < table_cnt * 2)
>> +		return 0;
>> +
>>   	return 1;
>>   }
> 
> I looked at this.  It'll drop symbols, but I don't know enough to give 
> an R-b.  I can't give an actionable A-b either.   Maybe someone else can 
> chime in.
> 
> Maybe this is just showing my lack of knowledge, but could any symbol 
> starting "?." be considered invalid?  I don't think I've ever seen any 
> like that.

With quotation, almost any symbol name can appear in principle. I wouldn't
want to judge symbol validity by its name. What's more important here,
though, is that sym[0] isn't part of the name; it's the symbol's type as
taken from nm's output. We're therefore heuristically looking at symbols
of unknown type with a dot as the first character (as section names would
conventionally have it).

Jan


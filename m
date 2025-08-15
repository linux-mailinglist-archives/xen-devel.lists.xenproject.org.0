Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A64AB27C08
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 11:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083082.1442740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqLJ-0006Kr-Jb; Fri, 15 Aug 2025 09:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083082.1442740; Fri, 15 Aug 2025 09:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqLJ-0006Ir-GM; Fri, 15 Aug 2025 09:03:21 +0000
Received: by outflank-mailman (input) for mailman id 1083082;
 Fri, 15 Aug 2025 09:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umqLH-0006Il-C6
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 09:03:19 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af5268c0-79b6-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 11:03:18 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso262408766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 02:03:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd018b27sm92186966b.105.2025.08.15.02.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 02:03:17 -0700 (PDT)
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
X-Inumbo-ID: af5268c0-79b6-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755248598; x=1755853398; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RGubftaYcdFb8zsB0VfOymiv0pkY/lHQxH5McHtxYuw=;
        b=bX4UDREGdeO+zjzqmeWKnvTNRK6ABLQMP99Ff9F3nRovhj8GiBdxmpfVZbNLmXqvMb
         tRoxrwO1/6dv+OSQ2uhclfgEEC+d3HB7NGW/dScW5YMJLf2mofACGUX2yym4kjCsqevu
         oA11eWbXigeld4a3lAuTh4/r5s1Be55gvxLB+fxj4a0wJUFoPbO5jTdd4I1XB+gvawoP
         vB0q+d295EgSnnubJpW0mF3cHDMM4F+UhT1WD4LOOp9lEs6/sdljB22faWYIZJvOtUew
         YoW2X36mYpwhXzZSKYM3tao9z2uUl1IHsZqEPrRZpHZqKJL7OPIlMtwmlpD5aR6Adx3I
         2Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248598; x=1755853398;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGubftaYcdFb8zsB0VfOymiv0pkY/lHQxH5McHtxYuw=;
        b=m/R35mDpEcUgvk8qRVB1FVV6f2ZX+Hs6L6ol1fyegMr0kdFmRU58oeV8N/+NYrXP9J
         MmtbJOKHj2Ymt9LuHo+/X5gv8Q/2a928eVpkFbfJTGurT9QBPpxyOjWBjMidZo/DRmXQ
         DIii/9yhOOZnj9D6mj831WlRabOECAmpn0Nd5qUrVq6r7af+KDQpssEK7KQF+TzhB22G
         unJSEJG8fsJj6Yu/kUTSahX2GiHvzbyU6jRTEYTjwYJqAoFgAgNNb+av12twc19nyYJ/
         VtUFOp5Tpe2wtffCasKN8ghikHVGYJYd0LIhcikn5H2q0TKplp0ab1hyrJJIuw4+ZXpW
         Vi0g==
X-Forwarded-Encrypted: i=1; AJvYcCVGyPqltJpnV6IB+Km7YsqfS8yAcrMMbedQ4BWo3hnD50iFn/uko8HoV1d+DEB5LXF/L3mG1lJjzUk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1o6T15qeGKBmJEOWlP713O0kYatwu4Cg4vbTe1185mYgb42WD
	QB/4bsqNf90ygMYhPtaJtD2DFDdJAUpDwWsB1BWt6IiQnn6slyR9d/IH5r3ek0Z02A==
X-Gm-Gg: ASbGncto2SZH80aUNAUBAeYL7dUmZlnBOMhZRc+Lw0U12olfpThoFWKifEqEVAo0dm+
	3jtf4FiftYl4/feWRb5yRYnLGctf5UxkYO3HcgIe4FY4zGrQI4H0x79HSw3ymXy2Af5rIxeU6mO
	VI47759rlLpJZOobUVw8QyL0b4cLcKnuwhycIwGdMZMURMI6aVsJqR0TeRTEGHa5eVLZSb9q2Vp
	SoNtCmt8PI1MHwaTxRQNOvDhhoSe5aNpLiqv65XmKIAFv4FZQEpkUfTS5lwuKOjXVp6ozzQ1DqQ
	c1fO7lip5i0sKIk9IgkP28PEADXEmoWAcg8tS/2xQYZ0WIWwthmT8FwHaaHZsM8KQToZEnNYKXf
	IBpOHbV0ly4bBfQDPUAxRi+z3XpOryj2bvMO3qgKV0eAFRszL++tZ76fv69tcz+DX9qCsu1MC17
	W5pVIxkICbS5tgv6EAlQ==
X-Google-Smtp-Source: AGHT+IEVKP9GJkMwmUxehUfoNQdcuqadJVENNAGegzdi6vZCQSXeNPQAXgKXfmNbxOj+hi/L3/lGFw==
X-Received: by 2002:a17:907:728d:b0:af9:b456:f9c8 with SMTP id a640c23a62f3a-afcdbada8e6mr109197466b.0.1755248597474;
        Fri, 15 Aug 2025 02:03:17 -0700 (PDT)
Message-ID: <1576d28d-bdd9-488e-a374-29695fca4ca5@suse.com>
Date: Fri, 15 Aug 2025 11:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/22] x86/boot: Use RSTORSSP to establish SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-20-andrew.cooper3@citrix.com>
 <5ad64534-514c-412a-b2a2-23adaf835f60@suse.com>
 <757e3b87-bb4f-410a-84b7-cf3607bf3eb3@citrix.com>
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
In-Reply-To: <757e3b87-bb4f-410a-84b7-cf3607bf3eb3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 22:09, Andrew Cooper wrote:
> On 14/08/2025 4:11 pm, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> Under FRED, SETSSBSY is unavailable, and we want to be setting up FRED prior
>>> to setting up shadow stacks.  As we still need Supervisor Tokens in IDT mode,
>>> we need mode-specific logic to establish SSP.
>>>
>>> In FRED mode, write a Restore Token, RSTORSSP it, and discard the resulting
>>> Previous-SSP token.
>>>
>>> No change outside of FRED mode.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Why is it that in patch 17 you could use identical code, but here you can't?
> 
> This caught me out at first too.
> 
> For S3, we're going from "no shadow stack" to "back to where we were on
> an active shadow stack".  All we need to do is get saved_ssp back into
> the SSP register.
> 
> Here, we're going from "no shadow stack" to "on a good, empty, shadow
> stack".  For FRED we only need to load a value into SSP, but in IDT mode
> we must also arrange to create a busy Supervisor Token on the base of
> the stack.
> 
> We could in principle conditionally write a busy supervisor token, then
> unconditionally RSTORSSP, but that's even more complicated to follow IMO.

Why would the write need to be conditional? Can't we write what effectively
is already there? Or is it more a safety measure to avoid the write when
it's supposed to be unnecessary, to avoid papering over bugs?

>>> @@ -912,10 +913,30 @@ static void __init noreturn reinit_bsp_stack(void)
>>>  
>>>      if ( cpu_has_xen_shstk )
>>>      {
>>> -        wrmsrl(MSR_PL0_SSP,
>>> -               (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);
>> Does this removal perhaps belong elsewhere, especially with "No change
>> outside of FRED mode" in the description?
> 
> This is the "Updating reinit_bsp_stack() is deferred until later." note
> in the previous patch.
> 
> This hunk was illegible without the split, although I have to admit that
> I can't quite remember why now.

Hmm, if it is to stay like this, would you mind adding a respective remark
also in the description here?

Jan


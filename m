Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27A3959A72
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 13:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781046.1190607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgjkv-0005Wa-DY; Wed, 21 Aug 2024 11:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781046.1190607; Wed, 21 Aug 2024 11:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgjkv-0005Tc-Ad; Wed, 21 Aug 2024 11:44:01 +0000
Received: by outflank-mailman (input) for mailman id 781046;
 Wed, 21 Aug 2024 11:44:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YIGS=PU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgjku-0005TW-0J
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 11:44:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a75650e7-5fb2-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 13:43:59 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso114338766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 04:43:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838393566fsm887057866b.104.2024.08.21.04.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 04:43:57 -0700 (PDT)
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
X-Inumbo-ID: a75650e7-5fb2-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724240638; x=1724845438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QgUWQjFGUNrqI7VSgtR4zhXDB9+XFVK1hS1OdIdfsO0=;
        b=OJWI/cb6jCGpvMUodFJ6iaM56ViVkOb+q+9AH/FmOtowv2BLqXX7KwSqFZ/4p8FdeF
         iFz5wjJKe7x5Ihvwlj/DIZYizldncjqqHy3NoDJ1rqqC6sTKddoJXHliPnQBbkoOx3Ar
         rYrZHiFNeuu2iA0mdr8+UHvfdiPO4EcDCyh6pQeBAKeQPY0xmFaLImRB4Qoy4+GaSDtq
         Qgd2zHaaT7C7oAIWjpOvDZ6K+pgUx9rOBvOlXKAzjxrlg84UmEq+OxKdPIfOgIrBDfg0
         Cx1vfwti/OT71bycxlAZXccoBEz31icEIvXaei7OoQOzVXSK8j2uvzgaY0RlVkFTEgYW
         0XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724240638; x=1724845438;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgUWQjFGUNrqI7VSgtR4zhXDB9+XFVK1hS1OdIdfsO0=;
        b=r1JGTU666hVvoJc07g09GrSA7fM3yzyT6khfKr2UuzzmY5QzYptKT0OO4Rvo0/Ru+9
         t+lPcr7AhE1nz/cZa4S++DBpS3OJdBkVPsnBlXYaMTU4xNaTjXcbTwGcUTOmStNRdt4j
         zfpTDeDESQ2yVjMKi34LYPd3J2JJ7H2XUle2+WKoTqVP2YsgvGS60YhnKjpIr6ndXS5L
         3Bu7vIdshcUxBwAxyuVUMInpgcPVfsDigPz1dOa9rVXkbNJE/tD5fLJqDg+C0hk9eGqz
         qy2M7ZVpK+cfcCuPjBiVk752wjBgEbk2u74C2sgJ2hLkr5jJIQ8ug2HqDRCXQ3K77PNI
         Z0mg==
X-Forwarded-Encrypted: i=1; AJvYcCVsFM6FBcHakA53oV8DNqHm4XX14IcxJykfTZNjEmXQ7dvY5Nzv7pZv9kqfgdRo+/k87PodU5BIAOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW7Upz4uVWUqB7dgQAVHtWIX25AKK1H2jn/Hif7nMzAgWmhmH0
	BZxIAgw+dinyV+wYwCSqQu3DJMKyMSR0Y9lGry+BoiR+ImidrNlKmi7hgHxAzjRP+cUppgr+FD4
	=
X-Google-Smtp-Source: AGHT+IFUhbpiYfehz0CLjzlZNSoS4GiyX3lm9mB+a0DOrX0q6RN0W6/sPKjMlQxoDcI9Fbj2/68+YQ==
X-Received: by 2002:a17:906:d550:b0:a80:f646:c9c4 with SMTP id a640c23a62f3a-a866fed0a37mr170325966b.1.1724240638117;
        Wed, 21 Aug 2024 04:43:58 -0700 (PDT)
Message-ID: <51d748b6-4de4-4760-bc1f-75396b33c98a@suse.com>
Date: Wed, 21 Aug 2024 13:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: set (fake) operand size for AVX512CD broadcast
 insns
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fb917afb-62d1-42f0-83e6-276cae67569d@suse.com>
 <487bf692-ebd8-41ce-96b0-d4034bdfcef9@citrix.com>
 <f6e6c550-7f8a-4c00-b6a9-c6362df1f1a2@suse.com>
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
In-Reply-To: <f6e6c550-7f8a-4c00-b6a9-c6362df1f1a2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2024 12:49, Jan Beulich wrote:
> On 21.08.2024 12:35, Andrew Cooper wrote:
>> On 21/08/2024 10:28 am, Jan Beulich wrote:
>>> Back at the time I failed to pay attention to op_bytes still being zero
>>> when reaching the respective case block: With the ext0f38_table[]
>>> entries having simd_packed_int, the defaulting at the bottom of
>>> x86emul_decode() won't set the field to non-zero for F3-prefixed insns.
>>>
>>> Fixes: 37ccca740c26 ("x86emul: support AVX512CD insns")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> This is the second such patch.
> 
> Indeed. The first one was a result of me doing some AVX10.2 work,
> covering new similar insn forms. That finding then prompted me to do
> an audit, resulting in this 2nd finding.
> 
>>   Does that mean there should be an assertion somewhere?
> 
> Not an assertion, as there actually is a check already:
> 
>     else if ( state->simd_size != simd_none )
>     {
>         generate_exception_if(!op_bytes, X86_EXC_UD);
> 
> That check is what is causing emulation to fail when op_bytes isn't set
> ahead of trying to invoke a SIMD insn via the shared logic near the end
> of the function. I don't think it needs to be any stronger than that.
> The reason this wasn't noticed so far is merely because no testing we
> have in place ever exercises these insns. Which is a shortcoming, yes,
> but one that's not very easy to overcome (as in: if we wanted to, that
> would likely mean writing quite a bit of new testing code, to cover
> everything that isn't covered right now).

Thinking about it - we have EXPECT(), which is perhaps better to use
here. That way, even if not covered by our testing, fuzzers will be in
the position to trigger it (on capable hardware only of course).

> For insns not accessing memory the value actually isn't needed / used.
> An alternative might therefore be to move that check into the OP_MEM
> conditional, and drop the fake setting of op_bytes (there are a few
> more similar to the one being added here).

Question then is whether to also move it, as indicated. From a
debugging perspective it's likely better to keep where it is, while
from a user perspective allowing reg-only insns to go through
(despite the internal error) might be preferable.

Jan


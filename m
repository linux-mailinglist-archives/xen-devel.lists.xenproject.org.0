Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4CB87FE42
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 14:12:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695365.1085041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZG0-0004XN-C8; Tue, 19 Mar 2024 13:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695365.1085041; Tue, 19 Mar 2024 13:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZG0-0004V8-82; Tue, 19 Mar 2024 13:11:56 +0000
Received: by outflank-mailman (input) for mailman id 695365;
 Tue, 19 Mar 2024 13:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmZFz-0004V2-20
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 13:11:55 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 415d328a-e5f2-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 14:11:53 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5687e7662a5so7237954a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 06:11:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 be7-20020a1709070a4700b00a46a9c38b16sm3784738ejc.138.2024.03.19.06.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 06:11:52 -0700 (PDT)
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
X-Inumbo-ID: 415d328a-e5f2-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710853913; x=1711458713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tnslb6UNJK9HMW3KOfGHoHtrc1Sd+dFeIjsLCImWtTE=;
        b=LHTkec1Suu9s3p27sM94D/1ULTBmIMA1EVLLt3Tm403/6qzUGm2czPOWbgDLK+ulC/
         riy8pN8BrTWXxsRqfOam/AwZrACoc96mUIDFyA1VAdNBQWLi1B5lwhaB4KQzn1+jSoQC
         PdCazpmXY2XaE+zBQFupg7iPO71zfRPe58lz3Mq97D9KHKzLMmCmsTVLZ/6fsB5Xts9R
         tXiB0veSnCoCS/xYSfPS838oGbpkrpDn4i7e9SMwxbw9hxzQYfh/AXblgTMNWKPvnmiy
         C8zMMhr6P5M7EAqsn+9TdrmgymxkiSHL60kZhLVZ/LtaAS+qaX0X6iYLIWsCpXn71nLP
         nJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710853913; x=1711458713;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnslb6UNJK9HMW3KOfGHoHtrc1Sd+dFeIjsLCImWtTE=;
        b=g5/ghR/S14aCBLvOzDdValxDLrx5qVbp4Dc4VOXYUhBQM5O2E6SFuoubpdVsVwMe+C
         TsIbUkS6InMRKjpiDBQ3gSCHahoDqzUytEG8ECbtJMjXVMxkJoEeWy7LaoKHjA0gJgpz
         diw2mgM/+ueyHVnzNA1FE0FeVvOoZ+XojU9YrlH0xVhpIZnjnkXxNk2aF6FY0GdIgG0c
         ftEkz7Ae0/p04LLXJXEOqFMtMHpVrsrutmendKG23n1Eziq2SuGiRuIJX9CML/7NCvwH
         v9cUXWJxAQXzoxL/2hegkPNjWZovzibtNMe8LC348rkIWAp1vT+ni8E8OHy08oOTBRSf
         2O6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2zRsbOaTxswg1lCrWPAyoo43U6QkiNzCxr5gXHFnv3i4aC4seim+rP+K9IBAOm+CdAZrQfHYJSIjFf30YVvlQ6Vp4u/y5mP0CNWep+l0=
X-Gm-Message-State: AOJu0YzOLDbIl59RRpe7TLH/igOemt1M9o5hX+zfx0ImX6AT+55hg8FP
	jpzcaOeOx/3lmLpSefy4TP1XV5M6fOIDJSHm/X+5A+M+3KEtZzDJkSEWLs03wg==
X-Google-Smtp-Source: AGHT+IFe4iGzVkoikinF0l8xiXHtnNhxcru1a62MGmd38asrA416nyqNhxr8REb/1Af7Q1H+4YduHQ==
X-Received: by 2002:a17:906:74e:b0:a46:d049:6de2 with SMTP id z14-20020a170906074e00b00a46d0496de2mr1485444ejb.70.1710853913220;
        Tue, 19 Mar 2024 06:11:53 -0700 (PDT)
Message-ID: <4aa2aced-d4dc-40d6-818b-8163657cd670@suse.com>
Date: Tue, 19 Mar 2024 14:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/features: More AMD features
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318181332.3817631-1-andrew.cooper3@citrix.com>
 <e45432b2-9ab5-4fa7-994c-37265edbc8f5@suse.com>
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
In-Reply-To: <e45432b2-9ab5-4fa7-994c-37265edbc8f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2024 08:33, Jan Beulich wrote:
> On 18.03.2024 19:13, Andrew Cooper wrote:
>> I'm not sure about FSRSC as a name, but it definitely beats AMD's longhand
>> name of FAST_REP_SCASB.
> 
> With FSRS already used, I guess that's the closest we can get to keep
> names for similar features similar.
> 
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -91,6 +91,7 @@ static const char *const str_e1c[32] =
>>      [24] = "perfctr-nb", /* [25] */
>>      [26] = "dbx",        [27] = "perftsc",
>>      [28] = "pcx-l2i",    [29] = "monitorx",
>> +    [30] = "dbext2",
>>  };
> 
> AMD calls this AddrMaskExt (PM) or AdMskExtn (PPR). I can see where your
> different name choice is coming from, yet I still wonder whether we should
> try to stay closer where possible.

Having located the corresponding doc,
Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a slight preference to adjusted names for this one feature.

Jan


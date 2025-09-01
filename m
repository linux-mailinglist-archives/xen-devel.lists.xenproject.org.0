Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562CDB3E0D7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104424.1455482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2JK-0001uk-M4; Mon, 01 Sep 2025 11:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104424.1455482; Mon, 01 Sep 2025 11:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut2JK-0001sk-J6; Mon, 01 Sep 2025 11:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1104424;
 Mon, 01 Sep 2025 11:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut2JJ-0001se-ML
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:02:53 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 348d978f-8723-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 13:02:52 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61e4254271dso1788096a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:02:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc20f344sm6955606a12.12.2025.09.01.04.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:02:51 -0700 (PDT)
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
X-Inumbo-ID: 348d978f-8723-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756724572; x=1757329372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Je2hAMcn+Cc++2y5wyFumW2JLMrw3iDNSbgaGoeT9aU=;
        b=L1Y+RTi18umcqf8QCejI5sTV71cxXa6ToWd8NGFlbr/3lg3Dr8h6Qp9VmKWRALvE45
         NTNBIo3EN/l65ZS+2cpHP1brLbfADXNeXZvPgjVlys5rM9v0WmICzr6zhFExjlSG59Rt
         C+MHnqJVF9Shv8M0oQqrkpCxTeUWlyV/ufbGLOPr1d9WeoSt4NYfB9pbqlS/I33GBMOw
         QYLujMuBEhmPfUaejfyIslruPpSjp1OxROBQHbZz64geZ3IFLsKYNkb1nAkCZL/A5SK6
         zEacA4zt0vCLLLWlJ41HnXq3bUVNBSMIGkWs4hXx4gNOEPMWuCQfEcTNpcY+OYlJCT1C
         G64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724572; x=1757329372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Je2hAMcn+Cc++2y5wyFumW2JLMrw3iDNSbgaGoeT9aU=;
        b=NiBmP+t/3VUD04znLDdKADXI4KiUlE+ma41RvEoxlM3JCA3y0ZMlxKklvINgj9b5xH
         pAny1niiMZ7V/3E0jBZN9yZMBfUdWuc1MDXvbdCyEFWT29nHp6ss8La3jfwWyY+XrXqX
         hj0uSVxe8gFvFNXRWTOmSeC7tEtUKADvJXidbc+cMtQlwaWBIX7JoS/djKCMlglgpKLv
         09lnBo5yyMqLOfmMLBmEnH4i1epz0f/ZYiF7GCfJ2qUiy8Ci68mqwuk4NSd2ud6v4vlt
         b3enrCa2dGQnnII0sh0H5C7N+4lNdRcZ+bRU+nJZLp5b/cQzMUN2X7MEjPfXaLgH6W9J
         UNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqCp7cz1/tyn/TjW1YdsvgBVKJygm6xL7hRBmj4wRbKX4C8cNC3hrXrQZ2lZiEKglJuqGAA4QM3Lk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIIzEt74Q1A8QKsh0FwaHNUigBvnirwMMcCLnbCjgODsdvV46Q
	0JN6FdDwNU6W1TAKK9MPJR8K1yWpZUrzQO9o9VyC8jWNazPICV+UrfXEJbqiV02UFw==
X-Gm-Gg: ASbGnct8zza/S6ctsV5klXnJoNnDTja3I/I2ZwK2hj9xcgnqR9qqrNug7rEaSQ9CREJ
	+9ztl7EydYK/FXtcNk6WLsmes6Z/os4z4693F6/pbLxZJs3H5gd6QYEcWmfKyMCbfWnfwOrrvEB
	/mvxeaJ8T8tZynRM9SoK0E3ddXj3ELi8lRP0e127sTnCVzQqbWWreZ/l2Kr9SX2J+sGH6m5POTP
	zW1FGKrRFPIHLWVirAAKPsAUn3cPAdzRn8XgDh4PN4sQ79N0NqV008ejgooo1DGkCWbEFM6Ar7U
	+G8BrxVLiWyJQzRmgBECDxuoYyMQIRJwSeuzz3UIjPPSeH/a7J98tjsCge79GHGYo16kgjTxSgA
	zw8MkEj4SRK8twdzSDnLJ8IhJjHlnNNP8hTlMeIhLoPMK08Tzi+TyzFRlOm2QJb4lOP4tnKke5/
	dSY50o0qE=
X-Google-Smtp-Source: AGHT+IH18A1HsiI9y2GFdapEXC0+onUGXNkvdRvfeVgCDM1oAtHBuHO0L1cRcMy39CsbuR7QiOfKiA==
X-Received: by 2002:a05:6402:42ce:b0:615:c5a9:4cab with SMTP id 4fb4d7f45d1cf-61d26891bb7mr7850374a12.13.1756724571713;
        Mon, 01 Sep 2025 04:02:51 -0700 (PDT)
Message-ID: <a0f6d7fb-2442-47b6-a0bc-c8b9b3b34079@suse.com>
Date: Mon, 1 Sep 2025 13:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/gen-cpuid: correct cycle detection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41ba214a-6137-4d8f-9f4f-3a362940d8a8@suse.com>
 <327eb40c-8fcb-42dc-a0b2-3b756a566b23@citrix.com>
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
In-Reply-To: <327eb40c-8fcb-42dc-a0b2-3b756a566b23@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2025 12:31, Andrew Cooper wrote:
> On 01/09/2025 9:56 am, Jan Beulich wrote:
>> With the processing done linearly (rather than recursively), checking
>> whether any of the features was previously seen is wrong: That would
>> e.g. trigger for this simple set of dependencies
>>
>>     X: [A, B]
>>     A: [C]
>>     B: [C]
>>
>> (observed in reality when making AMX-AVX512 dependent upon both
>> AMX-TILE and AVX512F, causing XSAVE to see AMX-AVX512 twice in its list
>> of dependents). But checking the whole accumulated set also isn't
>> necessary - just checking the feature we're processing dependents of is
>> sufficient. We may detect a cycle later that way, but we still will
>> detect it. What we need to avoid is adding a feature again when we've
>> already seen it.
>>
>> As a result, seeding "seen[]" with "feat" isn't necessary anymore.
>>
>> Fixes: fe4408d180f4 ("xen/x86: Generate deep dependencies of features")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, with one further
> minor adjustment.

Thanks.

>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -379,14 +379,17 @@ def crunch_numbers(state):
>>  
>>              f = to_process.pop(0)
>>  
>> +            if f == feat:
>> +                raise Fail("ERROR: Cycle found when processing %s" % \
> 
> No need for the \ here.

Okay, but then why is there one in the commented out code you touch in the
other patch?

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE799602B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 08:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813745.1226756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQa9-0002pT-Ok; Wed, 09 Oct 2024 06:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813745.1226756; Wed, 09 Oct 2024 06:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQa9-0002ml-LJ; Wed, 09 Oct 2024 06:54:01 +0000
Received: by outflank-mailman (input) for mailman id 813745;
 Wed, 09 Oct 2024 06:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syQa9-0002mf-6A
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 06:54:01 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 423f94b2-860b-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 08:53:58 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a99388e3009so519460166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 23:53:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994b0fd6bfsm454751766b.200.2024.10.08.23.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 23:53:57 -0700 (PDT)
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
X-Inumbo-ID: 423f94b2-860b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728456838; x=1729061638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kcjUZC2p/QK4F5ncRXsFtQJLBaKo6/H+CcOoAK1t5eI=;
        b=SSbyiVetGv4RUSCq7UmryUm1CgYELPsO3P+8nkqAwlc1HKb/8Zze2Qy+ZI6bwOLUJ6
         vUTDSyYn7x/yz3A+wxA5lh3dmfCQPNEm5Q2eZNj0QT/LcmB8NyRVeNLn0TrT92pNnw69
         3GElypxlphrHaAtlBhpfPtczpVHbhGyI7Vr9G44adjqtiHsGAgpfplv6j7p4jV9TUBUj
         MfpCh/7xjLQ0TxIgyAN6CK+YIvhiXU94g2ysgG5/RvOM37WJpLWsoPS4j0RhQpE/P5Es
         wFCKcLNIp+Vr/20N7qISiiSuPbeXVIFazVh5er+Tm3xnNbNxr3qJSrbStKk+Dk5uM5Wq
         NMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728456838; x=1729061638;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcjUZC2p/QK4F5ncRXsFtQJLBaKo6/H+CcOoAK1t5eI=;
        b=C5QPR+0RaL5vFSD721EUJWFfUnV4sBTHymfVEtEHibVFDNWdbsQqquGZ9YcfnzHk0K
         BDgPok1G+JCW8imHzMbaL++heHETYc+2eVq3g50KCFQiC7KUFaR8WCrYklWJbLPyEsDo
         vJeTu2rdPQJI0rAPRY/kNZHmQvfNaOeO016H3/1LYh82dRkL8XtNngu46eA5JskFpLJE
         JpJ2yLJuwp4ryixF1PurL8+TcLPWnXD1jzojcbk6rniskTWAvpF8Dnxf0q8j35ilFzJN
         o43wXmDGeoLVe2t4YsfVxGlCblEMc1Hehn8TrfsVwyJ5USGpkufM6LvmLPRL4r7FnFZR
         g6dg==
X-Forwarded-Encrypted: i=1; AJvYcCUvYxKfeuYzUs21fKGLCVhhboduKpKmndka2SeDry2esJb6mQA+/EM0SfXvSmdT/Ap5aDgWAipO72Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW6JelQboSDRgICqzQ+Xd394gBiPITZr1xrSqPNBcerqON195N
	wI//03GeX/i8H0Km+6nY1tMUeptullja0u79A/BZ0IllrQt7QPL8LBtyyiQYsA==
X-Google-Smtp-Source: AGHT+IESNChKn16iLPTAAupPUWH5JvtAw25OWnwFEcZrDl1WbAIWLmKTh6u1eKN9fIZDBM1Fjis9jQ==
X-Received: by 2002:a17:907:f1ca:b0:a99:5a3d:3a4 with SMTP id a640c23a62f3a-a998d20863bmr107881966b.33.1728456838178;
        Tue, 08 Oct 2024 23:53:58 -0700 (PDT)
Message-ID: <c2914ba3-0f6a-49fc-aae3-d7e5f465860c@suse.com>
Date: Wed, 9 Oct 2024 08:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 36/44] x86/boot: remove remaining early_mod references
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-37-dpsmith@apertussolutions.com>
 <52ccddc1-762a-440d-bd27-8d9e9c507c7b@amd.com>
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
In-Reply-To: <52ccddc1-762a-440d-bd27-8d9e9c507c7b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2024 21:15, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Any direct usages of struct mod have been transitioned, remove the remaining
>> references to early_mod fields.
> 
> This is unclear, please try to re-word.  "struct mod" and "early_mod" 
> don't exist.
> 
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c | 31 +++++++++++--------------------
>>   1 file changed, 11 insertions(+), 20 deletions(-)
>>
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index e9e3da3204f1..0ffe8d3ff8dd 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
> 
>> @@ -1404,16 +1401,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>            */
>>           bi->mods[xen].start = virt_to_mfn(_stext);
>>           bi->mods[xen].size = __2M_rwdata_end - _stext;
>> -
>> -        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
>> -        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
>>       }
>>   
>> -    bi->mods[0].headroom =
>> -        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
>> -                         bi->mods[0].mod->mod_end);
>> -
>> -    bootstrap_map(NULL);
>> +    bi->mods[0].headroom = bzimage_headroom(
>> +                        bootstrap_map_bm(&bi->mods[0]),
>> +                        bi->mods[0].size);
> 
> Thunderbird might corrupt this, bit the above can fit on two lines:
>      bi->mods[0].headroom = bzimage_headroom(bootstrap_map_bm(&bi->mods[0]),
>                                              bi->mods[0].size);

Or else at least indentation wants to change, to one of the two possible
forms:

    bi->mods[0].headroom = bzimage_headroom(
        bootstrap_map_bm(&bi->mods[0]),
        bi->mods[0].size);

(indentation increased by a level from the start of the statement) or

    bi->mods[0].headroom = bzimage_headroom(
                               bootstrap_map_bm(&bi->mods[0]),
                               bi->mods[0].size);

(indentation by one level biased from the start of the function call).
Personally, if already wrapping like this, I'd prefer the former.

Jan


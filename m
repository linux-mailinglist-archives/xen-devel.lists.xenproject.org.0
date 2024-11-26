Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC39D93C2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 10:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843421.1259037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFrST-0001kG-8o; Tue, 26 Nov 2024 09:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843421.1259037; Tue, 26 Nov 2024 09:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFrST-0001hv-5z; Tue, 26 Nov 2024 09:02:09 +0000
Received: by outflank-mailman (input) for mailman id 843421;
 Tue, 26 Nov 2024 09:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFrSR-0001hp-Kz
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 09:02:07 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1acafa4b-abd5-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 10:02:03 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3823eb7ba72so3586163f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 01:02:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad6436sm12713252f8f.13.2024.11.26.01.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 01:02:03 -0800 (PST)
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
X-Inumbo-ID: 1acafa4b-abd5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzYiLCJoZWxvIjoibWFpbC13cjEteDQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFhY2FmYTRiLWFiZDUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjExNzIzLjk4NjY2OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732611723; x=1733216523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2flidDSh3nnl1DOPZnqGH9FC3ZPp+UJeemOJLy0XxfI=;
        b=XieTzgeZ3UD8gx9uch8cJ97mbAKvJqBtKrUvv7HklYEb0Z/Qp5nls9R9MUWMFE/MOI
         tk9ASTRbE2AKRIdrO/6CQqoOby7PdVuM6KgCrR/gbJxJ/5wUD9YYf0T9+5Ym1pINBodf
         ki8wdYkoHKc+1Z3p286yFr2tv/v7Op9cEBuzopmBcecZnHHHE30RyRvcuOTPkxWwVLBh
         tTs/6Sner2HrczURRASLob2eA9gHcF84EH1YpfWTwKh9Ef6+fFXDW/OInD1jNcOuZTnX
         QKgz6Vpzc/L+3ZODoufXEPDyY76I0dJQ3iUsJsCybGIuamsAM3vzGU9f7QQwD/zJESP6
         vQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732611723; x=1733216523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2flidDSh3nnl1DOPZnqGH9FC3ZPp+UJeemOJLy0XxfI=;
        b=f59IlRAIFbCZVu8gNLBxLODjjWxmbsLze3tru2eNViHCoq4gNnCsVDhIkRDxBsgicz
         1ZAql1Rn9jqQYkutdke7RKnsdtykEAjW3dIW89Qt6na6Ia7S7MC2IvlDa2gm2h870uUF
         zx/jQhOujugiYoHDikF/SXxcSpFqqFusXj7FiiUgBIxZCEObuL83AAUm4GM9Ry76n97A
         yXBw/8Pu5/3x4vcMcJqyjGh7iCY6VRMJogSwsJqs6C/vxQ8m/KHoJaK4JnFRv8/9X+R9
         FuN37sstXP9MgTjIcGZ/qWgtU7xcl+sqv40mP2Q5RzVifLYH/JEK9UAgT44+1UpRi0Tz
         YXKA==
X-Forwarded-Encrypted: i=1; AJvYcCV5xrwyVj4tE6/6WUgebRgH/dJRVdyexVQcNwz3m2QDp/nndYX/ImafFxmN/JMIINbQHNXit52THeI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAgg5AEwcPEpWTzQ32lBkQ9k3DJczXj78oZbNk6k5+DgMnxgXC
	bvAhbjrhoua+14W9sFUVEBaCxyibQROByscDeqVbwSDytvYkxylFheXzuzZV4Q==
X-Gm-Gg: ASbGncvTdsUd8znhB1jpfechcy+BZd69RHg9t93zxXhSP31xbrUThLvnG8PvBxfpigO
	oMaO0sl1sccwQZWyXNp8xnWRAF5tiFPR4NraBJrT23SQsX0IV9p9M1xvtytV8ierldzMHg/0UAp
	3ig/eNAK8pl/1pO+6PSySg/5CiBk9zxRlhQWW7aWlpPisxGH+A6p48wys/sgVGpmmV8cTIvAGZr
	0MsuWxlAz5Sb6pnxIhq9rwx8VreqzOGc4gtMa6WlhCINoSxX8z7t3JjmhlKkDYiMOgHqZe7IM0P
	GAqvjhX2i2qpO7OUPnrdhSCnb6ET04S3wnE=
X-Google-Smtp-Source: AGHT+IGHWyYWkiNGlYcncCmNZlYFAgkT4GpXjt1GyDeIOtb9voX6cN2K7bLS8q6apojh8gpAHaIvmg==
X-Received: by 2002:a05:6000:1566:b0:385:bf55:2e24 with SMTP id ffacd0b85a97d-385bf552e63mr2399153f8f.17.1732611723306;
        Tue, 26 Nov 2024 01:02:03 -0800 (PST)
Message-ID: <f997839d-9ee7-4573-ad34-d8366843500c@suse.com>
Date: Tue, 26 Nov 2024 10:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] Arm32: use new-style entry annotations in head.S
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <01eb936e-71f4-43b3-b753-5b8a6ecf5d66@suse.com>
 <9acc6647-17a2-4a0d-97c7-85e8e9543e5d@xen.org>
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
In-Reply-To: <9acc6647-17a2-4a0d-97c7-85e8e9543e5d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 21:28, Julien Grall wrote:
> On 01/10/2024 16:17, Jan Beulich wrote:
>> Locally override SYM_PUSH_SECTION() to retain the intended section
>> association.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v7: New.
>>
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -48,13 +48,20 @@
>>   
>>           .section .text.header, "ax", %progbits
>>           .arm
>> +/*
>> + * Code below wants to all live in the section established above.  Annotations
>> + * from xen/linkage.h therefore may not switch sections (honoring
>> + * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
>> + */
>> +#undef SYM_PUSH_SECTION
>> +#define SYM_PUSH_SECTION(name, attr)
> 
> Are you suggesting the code in arch/*/head.S has a latent bug?

I don't think I'd call this a "bug". Code which is sensitive to what precise
section it lives in better is left unaffected by the per-function sections
that CC_SPLIT_SECTIONS=y asks for. Which precise way this is arranged for is
a separate question. You'll find a few more instances of this approach
throughout the series.

Jan


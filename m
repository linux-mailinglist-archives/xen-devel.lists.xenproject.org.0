Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D6C47161
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 15:04:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158388.1486721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vISUl-0004yy-4L; Mon, 10 Nov 2025 14:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158388.1486721; Mon, 10 Nov 2025 14:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vISUl-0004we-19; Mon, 10 Nov 2025 14:03:47 +0000
Received: by outflank-mailman (input) for mailman id 1158388;
 Mon, 10 Nov 2025 14:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vISUj-0004wY-4q
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 14:03:45 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 111c9629-be3e-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 15:03:43 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b710601e659so483046566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 06:03:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf723172sm1083303066b.32.2025.11.10.06.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 06:03:42 -0800 (PST)
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
X-Inumbo-ID: 111c9629-be3e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762783423; x=1763388223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wSutJynqUHnomCF4KsE5mzQKxNJhi8zqiMrkd4Jy/BA=;
        b=dsZsTTbhf9Wvbi0zwjCav2I4aGh5vXUauBNplIlduRYlOSRv2Hian1Vo/vqKt6//xg
         JI0DY3NbV1+EZ594ZRvZhsEVTm67MSwxSoy2EKlLqw/4CrwBpJGA5JIkFof5H0wL+lhn
         oHYdvy5QNcO0v/2kcEc8zTUR/Yd4WxYQQDMKyOJ5e6adA0hpWvNw4KzIvhGJdH0yfFmH
         XAOWpVhY3g8F++DIJwqSsQa5SNd5IpmKIX0o8l7fB6/f1R3XRDS3dz9CayXYqxG9M7Rz
         FcH36ZxVwHgf2p8mjuENkaUfjT5b78W/qtl6/rR4p0cPMR98ZF0Fxlb3VgrnLNpxgYTf
         ngbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762783423; x=1763388223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSutJynqUHnomCF4KsE5mzQKxNJhi8zqiMrkd4Jy/BA=;
        b=OUoKYgieQ8MVK8dy0K4trOppA+FEN/PWTY+wMorhQ/GMTYx8KEEWY9Ztfyb+0sYJ4x
         er+k93B6P3YSuqlqJBTytvS5g2C5z0O1ca8qK6o4jQY6+LOG2NPzvp+3Mhehr+N9KfDT
         lrr5fzATstSd2M4dZDkbyj9X5ir0qt/sTdgEkZLkMDmLqLmiZSslPxMGcDVpKA+Jd/xp
         gqrbVIQ9zxzY1XQhHQwGRSWTFBa9NI7ymJAvIT1rPxTVW/oGdPYbq6PYk0V9XIMtw5Tc
         LEf31RXphY9XJ+KzVIegHMD9NE6A8LRxQ8y2703jGKc/D9W3/5PtdHS58ZhJ1TVOV7I/
         2xvw==
X-Forwarded-Encrypted: i=1; AJvYcCWlpLmIbH4g2k/6lq9gWLPtHvZcjjnX5kdF+6HeXj5slVSILouZxs/Lw1xjEezD6b0lbGBFS4Csliw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnksDFuBg4F4BFFFZHwVdT26ViXXWd7Y9JLQIwoGPcAi6rwGw2
	8U3nehzxNwUqFR2kPRcADWkFbYYTrSAwV5au4591/Pqc02orpP5ZF233xOg1RMu7+g==
X-Gm-Gg: ASbGnctrVRlJdhev9uoWOPpVfqiYdAVwS0W1QNrDFu3CL62OL3pQhAuXNd6rfAWSWEZ
	m6wDDi5gI6ga9w/ZBJBg271wX8GES6UJcfFRJ576TvvG8rcnxtQ/jtjwcVhb4Ip1OrnEmLl8C9n
	k2FaI9IBXQ0x8Ed2sGbqfdzQz8ej9D/8fDLmSQ/Wv9LQDPzlaecORsMRysW53OWmE0vw3F2hxgF
	BaJwoh4+jhYccbS5zuaGds3Z8mwFg0uKUO2DFCrMpPgEAzMHZm0MrnVThal9OZzVCdOwSDQPGQr
	8JYQwb1UaBAI4OnxmhMsAb/ppLT4Y9JU7jRmp344mkUQKRUbLTDoJzJm2s2w4kugHqctRX6N25a
	KkNu9eZEQxQJQKEZ8WI3lM2wP9WSfz9uIuDDL5TgKomJ9B9SXjeVv9MAnRfoKC6W9kbt1HDlf+f
	q1KpOFLCJkwfIsJwRk8nr8irj3CWSQCq16+PMaaUE7+HhSHyPIXWOY+dhcKSFzAcz2m+zhMJAOE
	sNzATtlaorkfQ==
X-Google-Smtp-Source: AGHT+IEGegTxAnWAtafIOBlYWGPfe9YDVdnCnwKSn2NmEzMr2ootnN0chCme2Y2fi1+oPGI5nY+wWQ==
X-Received: by 2002:a17:907:7246:b0:b72:5e29:5084 with SMTP id a640c23a62f3a-b72e02729dfmr910394366b.4.1762783422687;
        Mon, 10 Nov 2025 06:03:42 -0800 (PST)
Message-ID: <ed198b16-f15f-40f2-ae38-85292e52dad1@suse.com>
Date: Mon, 10 Nov 2025 15:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: Support LLVM raw profile versions 5, 6, 7, 8, 9,
 and 10
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wentao Zhang <wentaoz5@illinois.edu>,
 Matthew L Weber <matthew.l.weber3@boeing.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
 <6f708273afb6de9c5f26f2c71c34c98e957904a0.1761599320.git.samaan.dehghan@gmail.com>
 <b701374d-61b4-4657-bd01-4c6975741fbd@citrix.com>
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
In-Reply-To: <b701374d-61b4-4657-bd01-4c6975741fbd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.10.2025 23:36, Andrew Cooper wrote:
> On 27/10/2025 9:30 pm, Saman Dehghan wrote:
>> This change enables compatibility for measuring code coverage
>> with Clang versions 11 through 20 by supporting their respective raw
>> profile formats.
>>
>> 1- Added support for LLVM raw profile versions 5, 6, 7, 8, 9, and 10.
>> 2- Initialized llvm_profile_header for all versions based on llvm source
>>    code in compiler-rt/include/profile/InstrProfData.inc for each version.
>> 3- We tested this patch for all Clang versions from 11 through 20
>>    on x86 platform.
>> 4- Fixed linking warnings related to LLVM profile sections in x86.
>>
>>
>> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
>> Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Tested-by: Wentao Zhang <wentaoz5@illinois.edu>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> Changes from v3 to v4:
>>   1- Use LLVM_PROFILE_VERSION in preprocessor conditionals
>>      instead of __clang_major__.
>>   2- Use DIV_ROUND_UP helper.
>>   3- Remove unnecessary zero initialization inside struct.
>>   4- Remove fallback macro definitions in linker script.
>> Changes from v2 to v3:
>>   1- Additionally support raw profile version 5, 6, 7 in clang 11, 12, 13.
>>   2- Fix coverage related linking warnings in x86.
>>   3- Revert unnecessary type changes, casting, etc.
>> ---
> 
> Excellent.  Thankyou.  This all looks in order.  I've committed it.

I thought I would backport this, but I would need a variant that wouldn't
regress profile version 4 on the older branches.

Jan


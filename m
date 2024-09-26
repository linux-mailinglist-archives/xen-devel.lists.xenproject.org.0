Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F308986D1D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804976.1215970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiSh-0008Jb-Lw; Thu, 26 Sep 2024 06:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804976.1215970; Thu, 26 Sep 2024 06:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiSh-0008He-I8; Thu, 26 Sep 2024 06:58:51 +0000
Received: by outflank-mailman (input) for mailman id 804976;
 Thu, 26 Sep 2024 06:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stiSf-0008HY-Lx
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:58:49 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c722415d-7bd4-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 08:58:47 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso88428866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 23:58:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930c8a8bsm312590366b.131.2024.09.25.23.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 23:58:46 -0700 (PDT)
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
X-Inumbo-ID: c722415d-7bd4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727333927; x=1727938727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WKuCudIwEpJ6UeUIu59PW9LPtA8NRBKieKDi8MbqBzs=;
        b=XzBONwZkJJwPy9LY6cqCzFe7zDyMSEOa9LVKzFQ+TrcxYyzQkCX2N0dj+qVgCasjMr
         vdqwoBHxdCN6+UixaPr8PnSZfdpY5yGYPUw3RHNvQoUii834TYCuKPYKHh/cAgQEcK3R
         cC16pCnv5B/M0f3IbQuQJXGQOUuXFdUM+0ENrQX7x3uruYOixqtQKEs0HQcjQN+5fWCc
         QSu3QbLa8bwtpiXtOwSjTFZXzRM1cM6d2RojBZLOdhlOMyKIFBduwG7e/tpnR0KGdI8R
         JHFhjgRK1k9hjmVA8zsqH0Bg5lKSkY9liEVa7rcLzY67LzRqrMBR9rXNsqAxoEBIKLwe
         l4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333927; x=1727938727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKuCudIwEpJ6UeUIu59PW9LPtA8NRBKieKDi8MbqBzs=;
        b=BDfq0JZOfXPUyGXmKV7FjHQlCqDDA5WDUQ6K0TQpUrFEAHTXbI9srmTdLTrBzmCTIx
         nEdi+U8NKlXy1+wT/o72HNgB/5DLn21cEY9cWuPvR77bHxiwg7B890sWuhECp7yqvjD2
         aNOhZbRQAmAE15yYFkTgvgCK0+B3To6U0rUfFux5sjFYYpOrOLOgRDPMGiDVg9rHNnYl
         XDXqoy1tkypDXy8vqRM5c8kwjPnAAx9yCHE5kb7EYYmg3pizhjaQJYMt6wHngTBc391b
         wanrnV7Cohl9DHL3loihpvvfKHeET/yKpu8qdF0vH/cFwNl8lutlaE7zio9RVM53dTtz
         qKGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHkdCzIby9Ju0co1dOlsuAcjQxv9sxGERwinvhIW8HdVoN+u0HSex7HU+rcKCHPwuFDneUO5snrps=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpMOOg5I84vom5L2gS5L8WV/XhM/QS1eX0xpeUQXnjPd2/EymN
	PmahP7m3TVEb8b8tZYEw3ZGTPV1+2v1xgMRrh1aW1kf7vuPMmcWMgVs0dXYnug==
X-Google-Smtp-Source: AGHT+IFhgNiy/6NFXGCLEyL6nvL+3C9YPNJQxRGEpCCpcR/IHMxBX6fobiLnUKwabB+a1c9xIbZiIQ==
X-Received: by 2002:a17:906:fd86:b0:a86:743a:a716 with SMTP id a640c23a62f3a-a93a06b61d6mr469432366b.53.1727333927106;
        Wed, 25 Sep 2024 23:58:47 -0700 (PDT)
Message-ID: <2f14ad10-e863-4d7f-aab9-fbdc97154b1f@suse.com>
Date: Thu, 26 Sep 2024 08:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
 <20240925060101.259244-4-frediano.ziglio@cloud.com>
 <70416976-c18a-425d-95f0-ab218e101113@citrix.com>
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
In-Reply-To: <70416976-c18a-425d-95f0-ab218e101113@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2024 22:20, Andrew Cooper wrote:
> On 25/09/2024 7:01 am, Frediano Ziglio wrote:
>> +const char * asmlinkage __init
>> +efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
>> +{
>> +    const multiboot2_tag_t *tag;
>> +    EFI_HANDLE ImageHandle = NULL;
>> +    EFI_SYSTEM_TABLE *SystemTable = NULL;
>> +    const char *cmdline = NULL;
>> +    bool have_bs = false;
>> +
>> +    if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
>> +        return "ERR: Not a Multiboot2 bootloader!";
>> +
>> +    /* Skip Multiboot2 information fixed part. */
>> +    tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
>> +
>> +    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
>> +            && tag->type != MULTIBOOT2_TAG_TYPE_END;
> 
> && on previous line.
> 
> But, this can move into the switch statement and reduce the for()
> expression somewhat.

While it can in principle, it would require further adjustments to the
loop body, which I'm uncertain would be desirable. I notice Frediano
also didn't make any change in v5 for this particular comment. Frediano:
As indicated before, sending a new version without addressing all
comments isn't nice. If you don't agree with a comment and hence don't
make a change requested, you will want to "address" the comment verbally.

Jan


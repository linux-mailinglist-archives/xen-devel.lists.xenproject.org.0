Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B8B8D5A6F
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 08:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733274.1139412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCvaj-0004Cj-6H; Fri, 31 May 2024 06:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733274.1139412; Fri, 31 May 2024 06:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCvaj-0004Aq-36; Fri, 31 May 2024 06:18:17 +0000
Received: by outflank-mailman (input) for mailman id 733274;
 Fri, 31 May 2024 06:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCvah-0004Ak-A5
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 06:18:15 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e956857-1f15-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 08:18:12 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a673a60f544so83860766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 23:18:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67e6f038b5sm51499566b.34.2024.05.30.23.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 23:18:11 -0700 (PDT)
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
X-Inumbo-ID: 8e956857-1f15-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717136291; x=1717741091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nn/e8lquZXF1nnUIFfv4gc/2j2gaSh7SKplJqVn88Wo=;
        b=NaRGy3lc7J5qFSwSlmNqgkTAc1EwHNife8FVAEeK7FAG2NHhhTUnJtwhQjx14vFOah
         zAPCe9MFvmBRE9kUlDPsTah4pZopYWDNNNOFuDDbMWGPaOZA0STwKgvV/UCocf5M7SV1
         aFmQa7ioOdLAdFQRAvNfhlCQ8i5Zcr053dKQDZt4vYMAFX194BCPJXe7SqnDobqIJscT
         P42gqzcSeq7Zf+D0hJczxFYrHCmRaRwAcifjGujQP63ZcSS0E4NhVJ7gdzM7/5iTFVg7
         1+KjkJNou2lbO5GrbPQcB0zqdfAPD3Ye6a5q3vo8YcvgBxYHT5BPDSSDAKambHuZmNrx
         LYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717136291; x=1717741091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn/e8lquZXF1nnUIFfv4gc/2j2gaSh7SKplJqVn88Wo=;
        b=D7L8+OC/s4Uao4tE/amkPpRQt+BROrwAETP5vVC9Z3GHVCtaJ9b3GFn7vO6Xlkb54Y
         KhYZmdZhqzUEClYMCgmlTRnVjuKOFduWX/DuB3rPtlemOYBQkwDB2/mC51wQPBeVw1sa
         wxrxHEn/Th8va+FgrEr1cOUprQIW0lwOvFnOWBkMrKQLJxfYXFz0QaTUfUtghf64Tl2o
         MOipz1qtPd9kWkOdibXL7/393XWxAtUl4y/ZYIDMHSYuWgpEbFmSuCIeqCPsYFsRsxsx
         jZjtV0Rt6Gu1dcckBCY3hVeifoPGSqsbCTdCm1L1qSBM2M1LrURJuIGhb0ckTJDpqZ29
         NtOg==
X-Forwarded-Encrypted: i=1; AJvYcCVpR2OCp38DErTG1Q3OfZ2hTkfJhj/5hm7gVEpXjH80ClNoyp3dmIoOsw+Kj3auMMhkX8KUhplUjEX8F32rwpGQd14bE4ln9ZigDDVgHdU=
X-Gm-Message-State: AOJu0YzDaKoiMIiYWdbnHDH4svuPPXWC8OBlkbfEHFEQbbcJ7mUDWpso
	NgEY7HjYJqW2vopS8ebDfqyf979OCSSmH4C9HQZkthrYVs7P6aliSJEo395uXQ==
X-Google-Smtp-Source: AGHT+IGAKp6X3H2N43hNuNomACQu9vmApamfOd034G7EHuW0NbRvSs+WYYUBbKgyQ8Bj7osI+sC15g==
X-Received: by 2002:a17:906:fd55:b0:a68:5f08:2e2a with SMTP id a640c23a62f3a-a685f082eefmr27374466b.28.1717136291390;
        Thu, 30 May 2024 23:18:11 -0700 (PDT)
Message-ID: <79a2d936-62f1-4749-9e75-0be019cd3d99@suse.com>
Date: Fri, 31 May 2024 08:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 8/8] xen/README: add compiler and binutils versions
 for RISC-V64
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
 <d4e5b4c8-d494-440b-8970-488b49bee12e@citrix.com>
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
In-Reply-To: <d4e5b4c8-d494-440b-8970-488b49bee12e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2024 21:52, Andrew Cooper wrote:
> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
>> diff --git a/README b/README
>> index c8a108449e..30da5ff9c0 100644
>> --- a/README
>> +++ b/README
>> @@ -48,6 +48,10 @@ provided by your OS distributor:
>>        - For ARM 64-bit:
>>          - GCC 5.1 or later
>>          - GNU Binutils 2.24 or later
>> +      - For RISC-V 64-bit:
>> +        - GCC 12.2 or later
>> +        - GNU Binutils 2.39 or later
> 
> I would like to petition for GCC 10 and Binutils 2.35.
> 
> These are the versions provided as cross-compilers by Debian, and
> therefore are the versions I would prefer to do smoke testing with.

See why I asked to amend the specified versions by a softening sentence that
you (only now) said you dislike? The "this is what we use in CI" makes it a
very random choice, entirely unrelated to the compiler's abilities.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16081A68911
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 11:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920189.1324429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqKo-0005yQ-I6; Wed, 19 Mar 2025 10:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920189.1324429; Wed, 19 Mar 2025 10:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqKo-0005wg-FQ; Wed, 19 Mar 2025 10:07:38 +0000
Received: by outflank-mailman (input) for mailman id 920189;
 Wed, 19 Mar 2025 10:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuqKn-0005wa-77
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 10:07:37 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa94612f-04a9-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 11:07:35 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so29448625e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 03:07:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d440ed5e0sm13843015e9.37.2025.03.19.03.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 03:07:34 -0700 (PDT)
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
X-Inumbo-ID: fa94612f-04a9-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742378854; x=1742983654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TAn8XyJUemtOAA6Tfdyg0/k5/rkjdPdT+UHRvrWrxxM=;
        b=L5jduZfNmP06CnTJzuq0IG285bG7wr1YPnKUWkpHq1B8tUuVWGSxSsSxicXlm8BGrL
         E29erhqoJZqP8lQZibkZmZS6W4d8FQghqS74Kyz9EZUmyyMSgrMnbuUsgyaPLOBT8JQV
         iIHrUmeyvYkR8RvLY4OhoU6Qf/WhEAijRDj7tfL03lgBoKYIntBvgzrlvlQ7UJEq5Hmo
         J/rxVShGyb6VrbzeThXG3lwgZ0T5VCFR5RChDtdjPPS+6KrqM6AN6GWjBy21OeslKEKm
         Ib7O6J0M8WiGF4CobDO+pBxL9HKONRcURQCL+IHDJsZJSucqY3AggajKraDYx/Rvy/hs
         qRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742378854; x=1742983654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAn8XyJUemtOAA6Tfdyg0/k5/rkjdPdT+UHRvrWrxxM=;
        b=hESyU/6YgONj7UxU3Ug680KjTGT7H8cNWrDGAdu44IOJsIszxAFO4tx0tREh50SFcB
         otdN4hKDq6aT/h4aGuofg8wDcHuvcldjvgSx1QBoMa1GVdpNrc1qmzfH2DwAUxAhGlhi
         lKz+Rac7ew0LRoR26eZIhyKYp2tgaUrkpWBzgv9fUmn1puVZ3ogozxYjgKCkVNKh2qZS
         e71gJctaFz9GuZofsormI5jTpjYxueBy21n6D+3W6t6o2QKD4+RdbUpLURuV9lgbA+Zx
         HBEOxJ6oXhwNuMQKuucqfIJ9v1F6Ychpj5ffhDZvqXi2hw6fQZED8lwj5p1fegOtkSAz
         YYKA==
X-Forwarded-Encrypted: i=1; AJvYcCVrlyC/JxomhyEBwYZIuM8yQ3AfEkiFmGrpfWjTuayYIaopBevsvG25w4giYivmtP52BE9yi/E2OmM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVs0pm7JfX24QAWZmNanfcMW4nw5kpf56Ny4AkCklU65qoY32v
	1vNBvkTr/8fSLsbj3Qcu3d0CE6d90pOtmf5pJbKszIc5XxkDDoQz13Fs+aDiDcoPdOAkWsm0z7E
	=
X-Gm-Gg: ASbGncvfyHMEj3uHAMwrtbRwOQUS92tEEJGVML+pvJtAfmp0s4j4NMAAuFYBj5rbyzn
	n1i6g4rqIjbBzFwsZGBJYzu7A91k2RleMr92tTF83drGWEk8bMSSevDf/9QUkDcjWS+pPgEkxVs
	hWUVmovMbPvVfq65SkmdvXrP2u82QYw1bvVED/uVHcXDktAgfqhhmiyVCDt4H0RmJP+GP6ECcGU
	H6l5qvhgCa0irAzzBwnDUOEY3DAbXvC21Q8UUi7As1im5TpV7k5CKP1NANTxUbvYZYfHLvmIXfX
	z64UDC7nsy9TSrORocgMuTTyq5VWL0TEUeVEAMUFm4TiWG43jwUF1Q7zbSxKFtR+gVxMyhFr5L9
	EWp4iuH5jc3uWqdi8Z19/K06RX3lqZQ==
X-Google-Smtp-Source: AGHT+IGBASeIK1yPjh9iLkU+tmafUGUTQtXVWe4G5tcnCXntRWxRT39e4UuskYxp1hdAZyANq1qDpw==
X-Received: by 2002:a05:600c:5488:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-43d437f360dmr21883795e9.16.1742378854411;
        Wed, 19 Mar 2025 03:07:34 -0700 (PDT)
Message-ID: <1dce6993-09d7-4f04-8ccc-908a0a4cc10f@suse.com>
Date: Wed, 19 Mar 2025 11:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/mkelf32: account for offset when detecting note
 segment placement
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-3-roger.pau@citrix.com>
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
In-Reply-To: <20250318173547.59475-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 18:35, Roger Pau Monne wrote:
> mkelf32 attempt to check that the program header defined NOTE segment falls
> inside of the LOAD segment, as the build-id should be loaded for Xen at
> runtime to check.
> 
> However the current code doesn't take into account the LOAD program header
> segment offset when calculating overlap with the NOTE segment.  This
> results in incorrect detection, and the following build error:
> 
> arch/x86/boot/mkelf32 --notes xen-syms ./.xen.elf32 0x200000 \
>                `nm xen-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$/0x\1/p'`
> Expected .note section within .text section!
> Offset 4244776 not within 2910364!

Not your fault, but: Such printing of decimal numbers is of course very
unhelpful when ...

> When xen-syms has the following program headers:
> 
> Program Header:
>     LOAD off    0x0000000000200000 vaddr 0xffff82d040200000 paddr 0x0000000000200000 align 2**21
>          filesz 0x00000000002c689c memsz 0x00000000003f7e20 flags rwx
>     NOTE off    0x000000000040c528 vaddr 0xffff82d04040c528 paddr 0x000000000040c528 align 2**2
>          filesz 0x0000000000000024 memsz 0x0000000000000024 flags r--

... any half-way sane tool prints such values in hex.

> --- a/xen/arch/x86/boot/mkelf32.c
> +++ b/xen/arch/x86/boot/mkelf32.c
> @@ -358,7 +358,8 @@ int main(int argc, char **argv)
>          note_sz = in64_phdr.p_memsz;
>          note_base = in64_phdr.p_vaddr - note_base;
>  
> -        if ( in64_phdr.p_offset > dat_siz || offset > in64_phdr.p_offset )
> +        if ( in64_phdr.p_offset > (offset + dat_siz) ||
> +             offset > in64_phdr.p_offset )

This is an improvement, so fine to go in with Andrew's ack, but it still
doesn't match what the error message suggests is wanted: This checks only
whether .note starts after .text or ends before .text. A partial overlap,
which isn't okay either aiui, would go through fine.

Oh, and - even in your change there's an off-by-1: You mean >= in the lhs
of the ||.

Jan


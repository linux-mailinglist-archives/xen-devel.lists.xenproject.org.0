Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0ECA50140
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902310.1310263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppJQ-0008J3-IW; Wed, 05 Mar 2025 14:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902310.1310263; Wed, 05 Mar 2025 14:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppJQ-0008G7-F0; Wed, 05 Mar 2025 14:01:28 +0000
Received: by outflank-mailman (input) for mailman id 902310;
 Wed, 05 Mar 2025 14:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tppJP-0008Fz-IE
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:01:27 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53723f70-f9ca-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 15:01:25 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43bcf9612f4so11763905e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:01:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b6d31sm20853817f8f.42.2025.03.05.06.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:01:24 -0800 (PST)
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
X-Inumbo-ID: 53723f70-f9ca-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741183284; x=1741788084; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LzLepnddtgy5ZHTvXxN/RNFwvPNbyybm8o13vR0Pp3M=;
        b=QRjia+kC0BhOE1z2cbHGEEyJT48+zj57QUKpOkSybxAF4RfSv8vhp4xI11jh/rhNpb
         r+alqN2bCThhezKgy8nGnWnANW4rGPmfLLHb1h1MMfjDlAz9GpvCKfauhRtc9kISl5ga
         iejGzD7mhN4GnSIRFkLit/iF2bU4jZPov0jgC4HsibNC1xVR5NcDuiqXnuCJZlcwJ52v
         62DRRH+jalQqu930YlDpOW2dFvTb2q2HMKM1lsHDpd++WUG+IjxUux4EFtXOxdRtRpsS
         9RA6eM6kxP2nizyb3fUzBHVLXpuI76iKifxMC2+fjycZduecC++vDRNr1CYRpiGTtFib
         dRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741183284; x=1741788084;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzLepnddtgy5ZHTvXxN/RNFwvPNbyybm8o13vR0Pp3M=;
        b=BMtMH5W2tLYWDKErn+kU9drwUfAWhyUP7g1JD/eAIPNTy//iUuW1eggCGyUXeizVVf
         FfGlrPY/FNiey0GFqp5ObIcMN0cb+iQJDkJe49CDDoHcMOWquBo8PJG6+LX1P/Xxh90X
         7BWCaeJAHjRQjvQXkEzbrFUAjFVR1ZDOkftu+43sFkyymFjRyOTHKixyfKOQk0Zc6Pz8
         XPPyqv//eQ4wzgBTKuIC+JBGvjh2YoOfswx3OctuHoCjAD29rAsBRlpMbU0DYivD7T4u
         gAoC91bi4OJZe3eRRA+R43jyvwQ2iW5UKpa0+DSSte+c86rrwSoJmTaP4abelezjUuWj
         QGfw==
X-Forwarded-Encrypted: i=1; AJvYcCUckQQYFNZ7ZU5Cd4SkzNyMS21w3xTSN9oJ+8kttns3wy5GipZRZQRWul/vqmGlIl047Is68agJ37c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylgfZHfx88pnrC3w2ovUXjOMFqsvSOfgj3QwnxBsmm9YiuXemX
	x1W5QR9KeRt1OmpX1FsiqgomoZXil2PaqoLuo2CVfMyM4/s4BEi64yTZ4O7hcA==
X-Gm-Gg: ASbGncsRHZCq2r5GoWkLvvd4DEE1jB3NmvflIoQ+GCh3aFJP7F1eT6vuggX6y+rhYqu
	i/7bBSVnkxo6h5FRO8tpExNSyIQekCGAgpJ2PoFBZQgc7xzaVuw3X/wg94r+KFRwpeETKH7WuCE
	4UO/gl2d9KP+UoBq/OLPnZakNMbjOFwIsFII+nwVoc3QHr0ELNhxW90v1BgDTLBjNtvA7qBQesN
	lkj8Pj8jwnYmIeMQbUwO2oC4F9/cQlD5Dd/YJTa9St3UWRu5UUXlVgUkmBjsyMwIWNObYTr1pgQ
	pvglzbK4oh0D+rS5AbXNtqrvePuX//SgxhBBLIRmiiPsPKrKnJkA4924T7gVHLXmaoCUVsi2z4/
	vjw+zxltnpv+kV+N3dFmejq5MnSDZJg==
X-Google-Smtp-Source: AGHT+IFnpGTj6M2+b+9CQQaJmVGt9bFZhQAHPQoZy+mWQCGRRJqrSJPNpxaEOGpxxiDTBUqduQx4Ng==
X-Received: by 2002:a05:600c:1d01:b0:439:9f97:7d6c with SMTP id 5b1f17b1804b1-43bd2aec224mr23388355e9.29.1741183284442;
        Wed, 05 Mar 2025 06:01:24 -0800 (PST)
Message-ID: <636170c8-2b61-4918-8c17-5c4953aa25ca@suse.com>
Date: Wed, 5 Mar 2025 15:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/IDT: Make idt_tables[] be per_cpu(idt)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
 <20250305000247.2772029-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250305000247.2772029-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 01:02, Andrew Cooper wrote:
> This can be a plain per_cpu() variable, and __read_mostly seeing as it's
> allocated once and never touched again.

cpu_smpboot_free() certainly touches (really: modifies) it again. Just that ...

> @@ -1009,7 +1009,7 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>      if ( remove )
>      {
>          FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
> -        FREE_XENHEAP_PAGE(idt_tables[cpu]);
> +        FREE_XENHEAP_PAGE(per_cpu(idt, cpu));

... this function-like macro hides that the macro argument is written to. (This
is the kind of hiding that elsewhere I think you dislike, yet there macros were
an idea of yours, iirc.)

Jan


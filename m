Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219CA6467D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916336.1321442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6NN-0003fj-9w; Mon, 17 Mar 2025 09:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916336.1321442; Mon, 17 Mar 2025 09:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6NN-0003dk-5v; Mon, 17 Mar 2025 09:03:13 +0000
Received: by outflank-mailman (input) for mailman id 916336;
 Mon, 17 Mar 2025 09:03:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu6NL-0003dc-Gf
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:03:11 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6657ba6-030e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:03:10 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so10022165e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 02:03:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffbcf1dsm98206035e9.13.2025.03.17.02.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:03:09 -0700 (PDT)
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
X-Inumbo-ID: a6657ba6-030e-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742202190; x=1742806990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f8aQ8PNeqvfRseEXS1qRx7rfbhyRcMFF2cNRnM5Cw2c=;
        b=XL9RRABAqK4SlZrPCB8bU3C6owpHtBHa4l5EQxJpJaPemloX6VAM7akocjEpgYaXU6
         jpqR+iWbtHgjEplSpKOa/Qr/6cUdvN3bL5XHVmEP8b+rvWMJqA43m/bKwWi+oKRP6S/B
         FJ+B/T76ige5JRFkhLZqrdzHGbKW3wGpZ3wynXCRWAcaJOmRMU3HG8qViulWEpSzc2ax
         PLl0ixoj9MYFlwG11K0YrvEGOsMHJXfIhGAarR9DGeyyH7Xq35WfIcbpLJhhStrqBcaA
         vkH4/B3YJ6QtXoNN2pJ1W+CFHrjE3aw2P6bRvtSD+rd8VVhnwJ8lScCOv2FcjS6dlp6z
         yDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742202190; x=1742806990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8aQ8PNeqvfRseEXS1qRx7rfbhyRcMFF2cNRnM5Cw2c=;
        b=BMxUoL7PhFuCg+Wzsl5BdTygSJ3f+1/Yjwn5jmjwNjWte1OiSuLr9wwyFXNonFXymg
         7s+WeKvEOETb8duGY+wSbu2ulzvARMdzwlw4M1FsXro1KpLVrBuNhwaAvQYnpua6P6b8
         4liB+NvAVgL8edUj/mLDTS33hH36qP6oaGQwV+BfpAF2EznJ3Yaxf9GGDQ8Eqoq39APg
         it9Pt4V83wFmrwwCZD8a62Ir2gZ6rKLd956Jn5fvV2vkURnY0wD55T6V354n9rpkaKzH
         hnxuyvC7C6AcNhnn2aatwT2t+KhHwhg1dlpPVLd4n0s37KxrDKSZbnMX6gbJt2cF8aE6
         7mtg==
X-Forwarded-Encrypted: i=1; AJvYcCX5agMsdJr2p6dAEjdC5b+/S3oJEEVvZc83PhpwgqgNcWH4z9y+se5H21dW2MnDG7VMDTMB3T269Wg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiSUSPsfTH2itVAe8s0DSfPrptoZtYjGBP6gIpo/OiTkhNEp5F
	FYURHEnDi4wegFFh3e3trxpnOZ0m0dnaagbbbivrsKFyh66jT/2T1mClPSsqgQ==
X-Gm-Gg: ASbGncu31Um/bwyPnonzT3ZnJYoy6M4YW+IdNSkg+qB6i8ZVljtc1xR07gO3kHQjck/
	b/hj2xb+lyZ98gzhLC0RYnKRQdrR5Ug+21b2Hl4GcYjsUWuaVZaKlHOt9K7g31rdd6/aMZ02AxH
	gjjfOGoXeALFvL436sJcKQLDLG9Q24ARy3jvUitmEz3VyaEwI0l1dKMzIkcn+2OoJ7mBaiQ8rwy
	eqYYt3EzJufZ8tJfWBR8gM1GAoG73GyaZqe7EKxomQ+SyEcaXDKXNDCWGcUfOdkTdJqAK635mif
	lKMuDs4jj6DVeh2iDo1b6+h6KRwqPLhj9jbinrHLCziDCUKVNhhxZPFgZwkq5Tq/OqJ1IQTTo/7
	MXcf14pVwNDyn+rBKxEV1fP757hVjoA==
X-Google-Smtp-Source: AGHT+IGqOEyPmnEFPv75aPUF1laSsZdQQB0QDAPLfmRNazTACpTLafFf/YeHVw1b/06+gAHWjmXVrQ==
X-Received: by 2002:a7b:c387:0:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-43d180ac913mr136968135e9.12.1742202190031;
        Mon, 17 Mar 2025 02:03:10 -0700 (PDT)
Message-ID: <5fa5f84b-0cae-4757-af06-155d68de3209@suse.com>
Date: Mon, 17 Mar 2025 10:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/traps: Drop incorrect BUILD_BUG_ON() and comment in
 load_system_tables()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314183346.77356-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250314183346.77356-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 19:33, Andrew Cooper wrote:
> It is only the hardware task switching mechanism which cares about a TSS being
> at least 0x67 bytes long.

I/O bitmap accesses are where this particular limit comes into play. For
32-bit task switching a slightly shorter one would still do, I think?

>  Furthermore, since this check was added, the limit is now 0x6b if CET-SS is
> active.

Which isn't reflected at all in struct tss64: Aiui that's an addition to the
32-bit TSS only.

>  Nevertheless, task switches, being a relic
> of the 32-bit days, aren't relevant to Xen.

Yet as per above I/O bitmap handling is, even if all we put there is
IOBMP_INVALID_OFFSET.

> LTR is is perfectly possible to load a shorter TSS, and indeed we will be
> doing so with FRED active.

Well, yes; it is my understanding that shorter ones can already be loaded
without FRED.

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -900,8 +900,6 @@ void load_system_tables(void)
>  		wrmsrl(MSR_INTERRUPT_SSP_TABLE, (unsigned long)ist_ssp);
>  	}
>  
> -	BUILD_BUG_ON(sizeof(*tss) <= 0x67); /* Mandated by the architecture. */
> -
>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);

All of the above said, the removal worries me primarily with the sizeof()
still in use here.

Jan


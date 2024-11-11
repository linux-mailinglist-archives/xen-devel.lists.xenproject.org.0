Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3939C3AC3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833412.1248555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQbs-00087S-EJ; Mon, 11 Nov 2024 09:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833412.1248555; Mon, 11 Nov 2024 09:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQbs-00084e-B2; Mon, 11 Nov 2024 09:21:24 +0000
Received: by outflank-mailman (input) for mailman id 833412;
 Mon, 11 Nov 2024 09:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQbq-00084Y-2T
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:21:22 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eb466d8-a00e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 10:21:18 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d4ba20075so2815528f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:21:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970d4fsm12638087f8f.5.2024.11.11.01.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:21:17 -0800 (PST)
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
X-Inumbo-ID: 4eb466d8-a00e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzUiLCJoZWxvIjoibWFpbC13cjEteDQzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRlYjQ2NmQ4LWEwMGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzE2ODc4LjQyMTE2LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731316878; x=1731921678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ak3JEXcUuEnYrsteGJHDEZsA3uC1LaFR+UbhNKCFbBo=;
        b=FmaGq2yFPYd7kpP6OakD3FoGSo9SCO7RCPSHZMJ8Il0t45VQwIyp0424t9/+aAp1JM
         zONDq8//nbsfL6X6UXfprCiCyYvFBYjiqL5zhS7rvP0EaR3xKCvvAZf6nSn7ECNwYi4z
         HmJIOlfVh8GP4SYBkq8+pJL62s/fnGdbiekeAhlGPYTOh55/EY2u67nEt5BvaBCLtugf
         9SQ7BbhSvs9fwBCz43FuU0EnWnuKJIBYNc+zk0Y7v1FGoQFtczDUgiN6TJuCG59lCVsM
         J5rhF12jb4wWje7erzuTEEaAawpcq5AUp+vFqqxV6SxHWBoYecTO1nS5r/I610/1td5A
         Q9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316878; x=1731921678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak3JEXcUuEnYrsteGJHDEZsA3uC1LaFR+UbhNKCFbBo=;
        b=v5j6OM5R6sLMFRyS234hLJU8om5Iawm9qKqNpWhATrn2l/foAXXHZCq//VUIR1rVot
         J8MHBsLxaopwP1LtWpELGyJzijHQ3a1hoClrMBkSGgygrHi21vuoqJq8cdm5mQ7IyxrQ
         Wf7tsc/LEqAmz+rklT6erjqB7yt/fAJQOHrc99RrB7lLvS5tdUcH22DDc7vP/hdri6qG
         ++EiXxIOPuYKOTXP/6gu8gPWWi2XeDnny+jmwu3AJUCkvECy1lHC8Yyxh5Y6hKWDUs97
         WADfZwN+LPcOtznps1cvVky8EyFH0cssEknQUOOiEN1lzW0s/4rWieu/ICgM+AIfBrLG
         qdRg==
X-Forwarded-Encrypted: i=1; AJvYcCUVPO2d2mF23wM6NHDoVCFrtzMCsIRyx1SFO2OT0d1H9NzYOLQCmKD5pCR9X/WyEaMcWpylvsJzgV4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBYkwoI7+HEG3qzDDcNFXhGlr8krAtU/vSanimF5pFBSPpY9ij
	mM3PiZ7MdRhgYVqisrAjVM2n/KY54ViuICS/38ZwwZK1/nhLPOuBdBek0c/0dx+A8fIJDXTgeqk
	=
X-Google-Smtp-Source: AGHT+IHOdlLLvL+6F8gPv+3tx5LU1FbSIr1HWXopimys9zd2OpNeOtQumQVbtUX3E1bB0JYMO8wqBg==
X-Received: by 2002:a05:6000:4213:b0:37c:d1e3:ebd2 with SMTP id ffacd0b85a97d-381f1823488mr10460709f8f.29.1731316877823;
        Mon, 11 Nov 2024 01:21:17 -0800 (PST)
Message-ID: <63b510cf-b26c-41ab-a317-377eb56c434a@suse.com>
Date: Mon, 11 Nov 2024 10:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86: Drop mach-default/bios_ebda.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241108201147.812036-1-andrew.cooper3@citrix.com>
 <20241108201147.812036-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241108201147.812036-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 21:11, Andrew Cooper wrote:
> @@ -734,6 +732,13 @@ static void __init efi_check_config(void)
>  		efi_unmap_mpf();
>  }
>  
> +static unsigned int get_bios_ebda(void)
> +{
> +	unsigned int address = *(unsigned short *)maddr_to_virt(0x40E);

Now this is a case where I think use of uint16_t is not just optional, but
even a requirement.

Jan


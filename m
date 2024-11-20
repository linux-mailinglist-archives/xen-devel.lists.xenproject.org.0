Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26D69D38B9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 11:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841023.1256538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDiIO-0003ML-NE; Wed, 20 Nov 2024 10:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841023.1256538; Wed, 20 Nov 2024 10:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDiIO-0003JP-KO; Wed, 20 Nov 2024 10:50:52 +0000
Received: by outflank-mailman (input) for mailman id 841023;
 Wed, 20 Nov 2024 10:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDiIN-0003IW-Bj
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 10:50:51 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d39cba7-a72d-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 11:50:48 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso57112905e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 02:50:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-382549108c8sm1714188f8f.54.2024.11.20.02.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 02:50:47 -0800 (PST)
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
X-Inumbo-ID: 4d39cba7-a72d-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRkMzljYmE3LWE3MmQtMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDk5ODQ4LjU4ODQ5Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732099848; x=1732704648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fie6Y9rIOuxwiMWPwAvhoE5N7KVI2j2P/aDF73pN8TU=;
        b=DRW3XhJTTOTSupBAVfkUKniJqD/zf/RAGtKYkSJjcLi5cP0KY8Gh6iRFKNVBJOh2KK
         vj3nm5sBOo5aanMnKOWMQyjGqHV9IdG6pjdIb/atkmSqALdupohccwXEhz2G9llc9Z3R
         Duw7w5bko00OUHNkV+DYwiXtlxu1TIb1irDknerT6snJENqpWx+iWAmkLncdfBC/sqYx
         bq8m7fvV/lR9ix4Yzs1B15y1640JUgC41OREK7uEeR0XjriuUSgUvMQKvnOg81gI2Uqc
         lKipj3RBb3WJbulpV0c8nUIVJF0dxQltmY/n90qgIcrNfpAkaJxiv4HP0S3OwHX+PbOF
         dsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099848; x=1732704648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fie6Y9rIOuxwiMWPwAvhoE5N7KVI2j2P/aDF73pN8TU=;
        b=n4tMTGSQPKXb4FSNxIKw5IaJ6x+hTr8r/nA3LaJB8juW1J9g9nCaBQzFOuZ7s71jPc
         TzB5N1TrLvjQs55rxVi5di4tS24vF0nhiQ0qIuf5/PtuWxIpf4QGbASyGsPkJL0EAjtV
         HjSNLkS2ZBD+SeEzjl0lRfIRmmEws59Kb6jCBowgUkwD9/Hb4E45Bh/QZ2mFpiSUJTtW
         m3iFGtR1D1KSRFHdf7S+W+fZwWcgq3m0odnbyfvuh187KZoYjxQFZT/2oiB3FWZ++ePK
         Dy9WjRG7I8+Yonq6r/GVuusm3ypVVth4QM3Akf5ylGllvKtxeItSeWmh/CMNZ3n91QOE
         yMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj3nu7odTNhlDBGQxfu+Czeqr39UuIOYjhhPO+E09ejSGYt4YKSaT8i/4nnXazaZSWaLHDnATgjeA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgRRxFa/ceSXSWN4CoNbXbomdK9oEvwfhhz8K/cnmUi/oR1BQP
	E2yQUe0ARWGaisejUJl5S9HHUR8/2M+9VSHuMQhDk0y2QPB5PFanOfJe4aAeGg==
X-Google-Smtp-Source: AGHT+IED0Z0ZTbe5gnThEjS8KKmJ2FxBH2EnaxIDHvHZ/p/U90VVs29zdHIvHWGiQ5jCaabLQTuZ4A==
X-Received: by 2002:a5d:6c63:0:b0:382:4f7a:7a87 with SMTP id ffacd0b85a97d-38254b1b530mr1995262f8f.48.1732099847837;
        Wed, 20 Nov 2024 02:50:47 -0800 (PST)
Message-ID: <590cc46e-c4e2-44bc-b339-6ffc609314ce@suse.com>
Date: Wed, 20 Nov 2024 11:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Only rescan features on successful microcode
 load
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241119215827.2891332-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241119215827.2891332-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 22:58, Andrew Cooper wrote:
> There's no point rescanning if we didn't load something new.  Take the
> opportunity to make the comment a bit more concise.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -911,14 +915,5 @@ int __init early_microcode_init(struct boot_info *bi)
>  
>      rc = early_microcode_load(bi);
>  
> -    /*
> -     * Some CPUID leaves and MSRs are only present after microcode updates
> -     * on some processors. We take the chance here to make sure what little
> -     * state we have already probed is re-probed in order to ensure we do
> -     * not use stale values. tsx_init() in particular needs to have up to
> -     * date MSR_ARCH_CAPS.
> -     */
> -    early_cpu_init(false);
> -
>      return rc;
>  }

In principle with this rc could be dropped from the function. It's then further
unclear why early_microcode_load() needs to be a separate function, rather than
simply being inlined here (as I expect the compiler is going to do anyway). But
yes, one thing at a time ...

Jan


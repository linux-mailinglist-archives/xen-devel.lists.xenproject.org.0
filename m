Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB17B9E04E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 10:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130222.1469805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1hBT-0001Gw-Eq; Thu, 25 Sep 2025 08:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130222.1469805; Thu, 25 Sep 2025 08:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1hBT-0001E2-Bm; Thu, 25 Sep 2025 08:18:35 +0000
Received: by outflank-mailman (input) for mailman id 1130222;
 Thu, 25 Sep 2025 08:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1hBS-0001Dw-43
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 08:18:34 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39c000d9-99e8-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 10:18:33 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b07e3a77b72so299593766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 01:18:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f667asm116355866b.50.2025.09.25.01.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 01:18:31 -0700 (PDT)
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
X-Inumbo-ID: 39c000d9-99e8-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758788312; x=1759393112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7oB8D/DRhjwCKPnuI1xXrJHxU3Q5k/Cg5ZzsFYXwBHI=;
        b=FMvVe4hOA5Hb45kIKMUthGHYbjchisZac37x3eYNZ5I3jQRS4ziKdNCIzdXXFidC6S
         XqgRawcB3umXuKMKuCwpunLg0vBgIihltYWDDJuCKQmyfE/lC6/vW7L/wYURuo5U/PDL
         RgR8/7BmFvK40+K5P6/WiHW/jhFDqoKLXpLJevrDHnmS/ua39/sooiGzjHlTyQ5rZs2W
         Z8iio0JoOULzKYkY8pPC6L0fekFmNQ9/jNTFPbMostd9MPpNL0u4pv1xC/qljbqjNTsi
         EOkWWvYVBhy8xTAl0AMAgBRebzUW/qg6fwGyD96rXbJqcueRagA6uEJqZg8mcEfpuejY
         2TCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758788312; x=1759393112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oB8D/DRhjwCKPnuI1xXrJHxU3Q5k/Cg5ZzsFYXwBHI=;
        b=vtGX9Y6GU+sgyQMooVQzjOUFgNRjTgs3BVbbW2XQdvZIgFJDcdL4eFxxWvMV82T3+J
         9ey77WHxqp2KLQv0HKpotS8/fDW9aBR986+T4Pc8VyuB4vARpX1CgPQarOmzsUDLtHr3
         q+rCNJDNJIWZTb2NwDExDU5bNQeEmBxMWryxX9EYR5TNqDAeaRiahRpUC/fqpYNF0ngv
         PnYKFJkbzsqeFJS/PL+wRlEmIXseDlGpkuErlAvL7380IKtGsQ7lRasMVAllQLdJHIuQ
         FoxcgJdWyq3adXRmmaYxjAv1AiCj1XyraIY7g3QpyofWVk9JH3NHiZ7T5/85IYMgxwSV
         QR1g==
X-Forwarded-Encrypted: i=1; AJvYcCUEgGRDS3qnt6aHIrs8qCLZR1kNqUcuNZk1xHqJdQupPNFb8UJBAgAtm5swTU3TQTyXojz4gpl8hiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRbpTJ4C7qEhoIGUQMdWmLnnlzwE+k5oBpUj7NZNvJ/2T3yVsv
	nXU4RMJl68ixotshGSsVwzI3huylj1w4MmnJayyLxYGR1XG0JUbiGvQAOui0QNE88A==
X-Gm-Gg: ASbGncsWsM48XbPAyi6nyNBa5Bug+8coogVOHL2XFtVN3evpw5TD4QKS7DukEqXXo9l
	JhFnnjKy//XyRJjoBzP6gmjqm7gcKT1scczL/gHhZ3tc8YuGTjRdlKxpBqvxt85pCHoAM/grPCG
	ecS4j7OM1Fc7qEYktehx7btNP6seU1pxqPY2qIh1U+Vqc/mNfNZZofrUUudOuwKK9yLJkuuTkky
	0GR+Tx7pQghRxqP2nhnYy3v2Kb58A3U5aVK5bqPRpntHeizm7kyE0HUM77f8Unpj3RoQuAT4Ysk
	fr6Ikc4FmhJBc20suFGDItC67sMNLMg9YLAECVxtV7XHFPljh83NGEjRsw6g8NhiHy6/MrYhgPE
	hCW50HbemSVgDVMR43+I0G1+2WZA7pnUEHcL7jBqfUSyI/tUNImuzpTpAhp+HB2zOGp1zbPtuVm
	MMbiw4uxA=
X-Google-Smtp-Source: AGHT+IHg69n3u3Cn7ur47mR67y5MWbU7SdrIzz1gRMAWUFxQI0zjtDVSfLnlN88S/F9ereTA9zMwSA==
X-Received: by 2002:a17:907:890d:b0:b2f:65e5:a5dc with SMTP id a640c23a62f3a-b35486d76b5mr197840266b.6.1758788312369;
        Thu, 25 Sep 2025 01:18:32 -0700 (PDT)
Message-ID: <ba239de4-8073-4c0a-a815-7eeee8e3d0d2@suse.com>
Date: Thu, 25 Sep 2025 10:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/8] xen/cpufreq: bypass governor-related para for
 amd-cppc-epp
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
 <20250923043826.3831957-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250923043826.3831957-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2025 06:38, Penny Zheng wrote:
> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -294,4 +294,16 @@ int acpi_cpufreq_register(void);
>  int amd_cppc_cmdline_parse(const char *s, const char *e);
>  int amd_cppc_register_driver(void);
>  
> +/*
> + * Governor-less cpufreq driver indicates the driver doesn't rely on Xen
> + * governor to do performance tuning, mostly it has hardware built-in
> + * algorithm to calculate runtime workload and adjust cores frequency
> + * automatically, like Intel HWP, or CPPC in AMD.
> + */
> +static inline bool cpufreq_is_governorless(unsigned int cpuid)
> +{
> +    return processor_pminfo[cpuid]->init && (hwp_active() ||
> +                                             cpufreq_driver.setpolicy);
> +}

I have to admit that I'm quite disappointed, considering that I had made it
clear that you're expected to make sure you submit Misra-clean patches: This
introduces a new rule 5.3 violation. Which is even more so odd when - iirc -
there, earlier on, already was an issue with you naming a variable or
parameter "cpuid". Once again, in the interest of getting this in, I will
fix this up for you, but you really shouldn't be using committers' time like
this.

Jan


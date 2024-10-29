Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71E49B4438
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827114.1241611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ha1-0005KU-N2; Tue, 29 Oct 2024 08:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827114.1241611; Tue, 29 Oct 2024 08:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ha1-0005J1-KM; Tue, 29 Oct 2024 08:27:57 +0000
Received: by outflank-mailman (input) for mailman id 827114;
 Tue, 29 Oct 2024 08:27:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5hZz-0005Iv-Nr
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:27:55 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b141cc28-95cf-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 09:27:53 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so50741921fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:27:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b1c489sm11845303f8f.23.2024.10.29.01.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:27:52 -0700 (PDT)
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
X-Inumbo-ID: b141cc28-95cf-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730190473; x=1730795273; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XwpG1Pgc4kd9eN/tLeCckS0AniMPT1KXJyh7Nv27sS4=;
        b=ZNHxiVeeLciJCH+7jQpjdTq/aqudRX8gCsa0WsmGvVMyKbL9qKXckcBcnN55KtPSB7
         e+UVh8ch44g1xGyhoXchXQH5WpQPZbIiNZtZKpJz2DXlxfQ90pWqc9/P17Ftj0fAkQ+S
         RAa/kFcO3kvcEGKaUQckJ6nPQOPrHE5Wqi7SMQTrRJbgsqNACIsPWyMahcambgchtkUF
         ZhCnE9rjRqnpWRV0HqZ5WBL5/6GvUFVh3BHvpyfigER/J0mTTehwrfPAmrsNfZepUdpy
         zGReCUuAcPHOC4BypSyDgarrqeld7H4HunCG8HJ28fVS5Z8Eiu5IWrPjn+La6voQ0N7i
         Ehbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190473; x=1730795273;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwpG1Pgc4kd9eN/tLeCckS0AniMPT1KXJyh7Nv27sS4=;
        b=Y5bHMYuAiIw990eAVKDCt0gIfoKLAHGcDJK//uR5RXSWw9PwIG8rumNbSnqwenf5sV
         aYjkd/2l/eKndC9TQWUMXefqj0y1U/JCiiEQ4nb+BXXHfSq42j5LI8SogmW3HZRVNVaq
         FaxfSnlFuO63p+h05ULjkh0PZ3hnC0X2LgHGg0fAJpADzRCaC0hbubJhXVV++lovnZgG
         IQ95Y5egyd0yiB5B9gLVyQPQ7gPvrTYqSR0jYZNrZ74GYWv4JwsQl9u8xQnwPpLVj0S1
         TQc3TaLM/AXrIyXHgV6cAIpp5pJMCC6/6uWeLS9J9An091Skuv/B+On8SEuR7E830s45
         rX5g==
X-Forwarded-Encrypted: i=1; AJvYcCW2nvunxpYjjEK1lTrZ+j9e//n+tGxq3gQLopWe9+Z5RoOk9RTFt23SXp/hm/AxAw34HhDHw2LlGhQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzjk8XuXwIU1eBVoe+q/ZcHAa+FjtpF3Y7ckeGzjk2A7ARIjFZO
	Jn224D1Z5Rt3IiOhtCLMWbr8g1DM5G0ml0xworvnGpptfWb25fy545U2kc2ugQ==
X-Google-Smtp-Source: AGHT+IE8Zwy1/Ar57/E9ubWLRxXLEOk4TVvEz8udSY3QUDU/qdPFOPoqk0gNCGnu+AGuSTA+lVw3lg==
X-Received: by 2002:a2e:be9a:0:b0:2fb:58c0:de5b with SMTP id 38308e7fff4ca-2fcbdfb098emr44283181fa.11.1730190473120;
        Tue, 29 Oct 2024 01:27:53 -0700 (PDT)
Message-ID: <0df711de-35c7-4141-a27e-ef413c34b426@suse.com>
Date: Tue, 29 Oct 2024 09:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] x86/mpx: Map/unmap xsave area in in read_bndcfgu()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-11-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241028154932.6797-11-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 16:49, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -1021,9 +1021,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
>  
>  uint64_t read_bndcfgu(void)
>  {
> +    uint64_t ret = 0;

Seeing the purpose of the variable, imo it would better be named bndcfgu.

Jan

>      unsigned long cr0 = read_cr0();
> -    struct xsave_struct *xstate
> -        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
> +    struct vcpu *v = idle_vcpu[smp_processor_id()];
> +    struct xsave_struct *xstate = vcpu_map_xsave_area(v);
>      const struct xstate_bndcsr *bndcsr;
>  
>      ASSERT(cpu_has_mpx);
> @@ -1049,7 +1050,12 @@ uint64_t read_bndcfgu(void)
>      if ( cr0 & X86_CR0_TS )
>          write_cr0(cr0);
>  
> -    return xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR ? bndcsr->bndcfgu : 0;
> +    if ( xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR )
> +        ret = bndcsr->bndcfgu;
> +
> +    vcpu_unmap_xsave_area(v, xstate);
> +
> +    return ret;
>  }
>  
>  void xstate_set_init(uint64_t mask)



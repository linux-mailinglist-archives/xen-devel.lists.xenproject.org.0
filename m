Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954F3C73F51
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:25:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167195.1493543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3iz-0002rB-11; Thu, 20 Nov 2025 12:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167195.1493543; Thu, 20 Nov 2025 12:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3iy-0002oo-Tu; Thu, 20 Nov 2025 12:25:20 +0000
Received: by outflank-mailman (input) for mailman id 1167195;
 Thu, 20 Nov 2025 12:25:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM3iw-0002nw-Vw
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:25:18 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8a38561-c60b-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 13:25:16 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b7277324054so127617066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 04:25:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7655050c53sm194981566b.68.2025.11.20.04.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 04:25:15 -0800 (PST)
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
X-Inumbo-ID: f8a38561-c60b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763641516; x=1764246316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QPO9vkpsn26QqrgUccKXI6USem8UZhExoS4Wdn4E6KM=;
        b=fHqhG3I8WZQkPEZ05a6uTeVFmddY8xu4IQLrlnhEqcLJIxJB5vDslTDh59U/a2uNGB
         wYmnKzbvc2bAfqMvJz8rsuZGJx1UyY4xehGp9ciPGekdYsEm6itD9iFPNiU7iMSOF0gF
         2xNCOHaTPnnkc+mH49Je6EErNHlYA9qGSoxZO6WzAZe0npNjLUQmh/tZN8ixh2lgOWFE
         oFOUaAfXmz1uPkxV9/69c2EWlQdFiB3oJiwahJ4rHAEQBRQaniS7fvrmq51z9hBv0iV6
         RX7w3e+x74s3SwRn5P7mjYmxaOnVMyXjGo5AGmlrE2jM58Sn3yqa9pL6HkJyCfbmR98q
         5U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641516; x=1764246316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPO9vkpsn26QqrgUccKXI6USem8UZhExoS4Wdn4E6KM=;
        b=HQ1LsuHWmK8tVKRmsDlNdb/O+yUyATCP1IOgdSpO18wLmbL/rOJkb8K4TeVDXE0WF+
         2ieRftljsggQoYMTw6o25SPjjpHMoj9Qy5olTD0ziTkQ8BVGluwhat1pJ+0o07TCQeo8
         gGqfYhXjk8pkL7ES3C6dvyMyDAGEhzFxB6XKdjFH5kHD8lnxKzBV24A15S03h7dNgoZQ
         miNvEVIEVNVdCoF7WIgvQHeo7RQ7KkMFri1j/FGBGvMo8mjuTeCgel7dYy8+ncOhlwOZ
         Ncr8gcn2guBxbaN/PVEqFimq6zoG9ZuoDnxZmbewDIkZuHHFXQiEM5Km1fWK4vndt3p1
         6Uwg==
X-Forwarded-Encrypted: i=1; AJvYcCV12MEEDH7GN98FyTlZS6nGvMfM8f+ptZhsiIHadu94cRKpSGGdKp9uyCvXFPKY3dMLV9FniNgfG6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSKKUmcK8rLk+03hrfKFcgAJaYPu8sdXhjGPy/Gaoin/flMZCU
	sxi4iskEuauUf6/+J4yHPCmEJpIcAd2qx/eUJRmb7g6eEvssexffmXbckOpq8c3nOw==
X-Gm-Gg: ASbGncs8bM98yG1N278BNSd1pgHWI8bte9jcQCn/ISV0H67Sp/aXH5Z584Q6un1qEs1
	7sT0VU6M6S39aGiuRJOcEjfCcpzLLLijTca0s9YOtQMVmA8cfoF4OadCNI22g2z40a5savmtfF6
	PEZLyXN5BwahhcMH2msTVvU8Z8UGEUYK075PZAOFeu8k/z2pGWxI1Z8K1jlU27nUQVHfycqRb+n
	IlggCBykhZRS9THBkjhQCz+RNQNZ6ftMMnbtDaTX1xtERIF1p16jvVu4XpWRzO8VesO8BYkpZTu
	FZfzK8Wzh35/ONHnOC0yeBVzpElA0t4jiBItICuptc0tjoF1bWP4EVSgmLJCPkD8q6Zn/X9qldj
	x9ztSpYIjRFwMDyLkr7qAuPkLhCASmUZ3J3DjRJR5uqGUrAd3YPclWRZHonK1q1pqBsM2D1e6r6
	3ED1s72Tcuzoj1uyha0jtYFu3khVz2EXTkDUYGd8W5OAVDiId+k0qHE2E3ks2aJTjMGUImBIag6
	o4=
X-Google-Smtp-Source: AGHT+IEtyL7LX2hQrR1hJ+2Djfl81yvixxfpvTh8cFQ1aUk0J8eVzUDMQhZaugfFXw/eg4v20F3NTw==
X-Received: by 2002:a17:907:1c0f:b0:b73:8cea:62bb with SMTP id a640c23a62f3a-b76553ef5a6mr303764466b.31.1763641516247;
        Thu, 20 Nov 2025 04:25:16 -0800 (PST)
Message-ID: <97b32a81-27d8-4af4-9edd-127b431a9f53@suse.com>
Date: Thu, 20 Nov 2025 13:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/apic: remove vector_allocation_cpumask hook
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-3-roger.pau@citrix.com>
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
In-Reply-To: <20251120090637.25087-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 10:06, Roger Pau Monne wrote:
> All implementations use the same hook which is a wrapper around
> cpumask_of(cpu).  Adjust callers to no longer use such dummy mask with a
> single CPU set, as the CPU is already known to the caller.  This removes a
> pair of usages of for_each_cpu().
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one possible adjustment:

> @@ -688,12 +683,12 @@ next:
>                  release_old_vec(desc);
>          }
>  
> -        trace_irq_mask(TRC_HW_IRQ_ASSIGN_VECTOR, irq, vector, vec_mask);
> +        trace_irq_mask(TRC_HW_IRQ_ASSIGN_VECTOR, irq, vector, cpumask_of(cpu));
>  
> -        for_each_cpu(new_cpu, vec_mask)
> -            per_cpu(vector_irq, new_cpu)[vector] = irq;
> +        per_cpu(vector_irq, cpu)[vector] = irq;
>          desc->arch.vector = vector;
> -        cpumask_copy(desc->arch.cpu_mask, vec_mask);
> +        cpumask_clear(desc->arch.cpu_mask);
> +        cpumask_set_cpu(cpu, desc->arch.cpu_mask);

This being a LOCKed operation, might we better use

        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));

here? Otoh I expect this to go away later in the series anyway, so possibly not
a big deal.

Jan


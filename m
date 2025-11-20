Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3EC74169
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 14:07:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167362.1493690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4N3-0007VF-Pf; Thu, 20 Nov 2025 13:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167362.1493690; Thu, 20 Nov 2025 13:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4N3-0007TS-Mf; Thu, 20 Nov 2025 13:06:45 +0000
Received: by outflank-mailman (input) for mailman id 1167362;
 Thu, 20 Nov 2025 13:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM4N2-0007TK-5b
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 13:06:44 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1d78e89-c611-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 14:06:41 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b735b7326e5so350736466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 05:06:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536459d92sm2028104a12.31.2025.11.20.05.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 05:06:40 -0800 (PST)
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
X-Inumbo-ID: c1d78e89-c611-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763644001; x=1764248801; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qmRHCksAzQmDG4Ob5SdQvA3rI7T33SaUr2RCq6O7G6A=;
        b=DVXESA97RAejiQXyTFniSHTfZFbxZrV2lDpvTnzJqjPdJ+7aIihVyW247LNnLKHevO
         3rbV4Bau62rtIAKllygNSszV97shk++g5z53UkMMuPE+b8+th7C8O+/fSV2bGUTzT0t3
         x8pq1Zcim4n5VJYNaNmtPVFGlq1SXzNE/r+DgHbjvjS9owQGQCEnMr8Fe66RmsjySONf
         jUJ9HY8vfwKWglMli19WLCRWkiMqKZNv2f/1bGdhka+aALbXtMBvLQWkY9SpVVXGUedZ
         nKyEcqTRfDnDO/ZbaV6vFMlVrn8fBo1yVmYtSU2ai+NFWE278mCi9GHh1wXE85jGNooU
         G6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763644001; x=1764248801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmRHCksAzQmDG4Ob5SdQvA3rI7T33SaUr2RCq6O7G6A=;
        b=VVOahrrld+kzVL2/otLCnMmcOIjO+mA1Hd8O8YDDVDQ3JdHw/kvM1+VrkqoPCUijpr
         XM8h/mIMwX/I3JD0xmd7SRNV9MWqKbxIsnewNl7+8QX69RNdycmocqDbTQMgTltAv2a3
         Vi2k9s3NonBLd9L5utsz1NZMIZ/OoN4b/7cnCc6Eoyi4GsZQ1w4sdt7G9wU/wjR+ae9E
         AOq9uzVro+U/zr4UG95NjkFccax9nhZnmtUgxI+aqaXp/VKrSID53cEcRy/atI+Y9IV+
         UNtflU4URhkS5O0R/VZ2d2xUXeQxXU+clNHqNNk6plGlrfo1/olxii0tqorzuv0Mwa59
         yhLw==
X-Forwarded-Encrypted: i=1; AJvYcCWKZqpQGZOVFimGyZdQ6FkZJnhFg3HNoLrL9s3cCt3Ts/BFqLL+7uIY6KMv7Zee927AhspXnl9crzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAwnL8TYR5s5aj76LSrebeE8F0DP9TV4d4wRBH+OFTfVrUeAH2
	1xymvYjfWTVKfinigSoioL9t+Jfo+bv1DoXdm2UEJhueyRqsF20KPwtYTUt5vioPaw==
X-Gm-Gg: ASbGnct8lIyDeAM3FDP5qR4nGoaHTRda03bOB7IfQ2hNOZkVzBy+uyIoNvH7T94ot8F
	0Dky//WIsHmAoBlo2mKdfTH6D1A1gx+RZMTzGWxH0gYjIArZObnmA/YhrNxfSm3pieK1q1O6g3o
	rzgEmsp8e0fwZRU8BWpz7IuXzHDqXOfTzwUGDEU+4eeVzuSusKrHnJvGjyEkBPtJF4sgn89eGnO
	H6qYF7g3e6lMAeAnJPQ68e1uRzRZ/NzNfx3bvXtBcVQE0Cl5ZGCAFRUx5dwSEGzCQcTpMr676XY
	Bbtm7Ad3v/yaHYI3BP7W8UpOabxNakKX1vwAsIvAopwnIMelP7yuf3I6d6aZqmjNMrkVcWMbbtZ
	iKTRb7phUCHiRNboR3ztOFYLc1mo342M+kBi8ybHruTAP/QERxzmQwjST+ufAMrk1j6kjrKK/E3
	jRASZaKJqfAd/Db+6PEDeZ60Yo1Njq5MXsduGaZeTRn60EE317hmD/Kt/k1yNDks3M3ic2gS6mD
	FU=
X-Google-Smtp-Source: AGHT+IGW5izs1QbxQ5CnXpixBXiK0BpEwZjjuU2rTQcyfef9/nbTJSWVqMK3KqMfPIri49SuMLhFIg==
X-Received: by 2002:a17:907:3da4:b0:b70:aebe:2ef7 with SMTP id a640c23a62f3a-b765728545fmr285045566b.14.1763644001309;
        Thu, 20 Nov 2025 05:06:41 -0800 (PST)
Message-ID: <3491d3ee-08b8-4678-9f18-5a4daa972e02@suse.com>
Date: Thu, 20 Nov 2025 14:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86/irq: set accurate cpu_mask for high priority
 vectors used by external interrupts
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-5-roger.pau@citrix.com>
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
In-Reply-To: <20251120090637.25087-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 10:06, Roger Pau Monne wrote:
> Setting the irq descriptor target CPU mask of high priority interrupts to
> contain all online CPUs is not accurate.  External interrupts are
> exclusively delivered using physical destination mode, and hence can only
> target a single CPU.  Setting the descriptor CPU mask to contain all online
> CPUs makes it impossible for Xen to figure out which CPU the interrupt is
> really targeting.
> 
> Instead handle high priority vectors used by external interrupts similarly
> to normal vectors, keeping the target CPU mask accurate.  Introduce
> specific code in _assign_irq_vector() to deal with moving high priority
> vectors across CPUs, this is needed at least for fixup_irqs() to be able to
> evacuate those if the target CPU goes offline.
> 
> Fixes: fc0c3fa2ad5c ("x86/IO-APIC: fix setup of Xen internally used IRQs (take 2)")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further request:

> @@ -756,12 +770,10 @@ void setup_vector_irq(unsigned int cpu)
>          if ( !irq_desc_initialized(desc) )
>              continue;
>          vector = irq_to_vector(irq);
> -        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
> -             vector <= LAST_HIPRIORITY_VECTOR )
> -            cpumask_set_cpu(cpu, desc->arch.cpu_mask);
> -        else if ( !cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> -            continue;
> -        per_cpu(vector_irq, cpu)[vector] = irq;
> +        if ( (vector >= FIRST_HIPRIORITY_VECTOR &&
> +              vector <= LAST_HIPRIORITY_VECTOR) ||
> +             cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> +            per_cpu(vector_irq, cpu)[vector] = irq;

Going beyond desc->arch.cpu_mask for hiprio vectors may deserve a comment here. When
the vector is global, this is necessary. But for e.g. the serial IRQ (which still
moves, but isn't bound to multiple CPUs, the more normal way of respecting
desc->arch.cpu_mask would be sufficient. It is merely (largely) benign if we set
vector_irq[] also for other CPUs. "Largely" because strictly speaking if that vector
triggered on the wrong CPU for whatever reason, we rather shouldn't treat it as a
legitimate interrupt.

Jan


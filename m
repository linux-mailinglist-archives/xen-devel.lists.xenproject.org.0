Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A140ACDE3E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 14:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005500.1384954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnSM-0000YX-G9; Wed, 04 Jun 2025 12:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005500.1384954; Wed, 04 Jun 2025 12:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMnSM-0000WD-DN; Wed, 04 Jun 2025 12:42:58 +0000
Received: by outflank-mailman (input) for mailman id 1005500;
 Wed, 04 Jun 2025 12:42:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMnSK-0000Vd-Fh
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 12:42:56 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f205ea7-4141-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 14:42:54 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a36e090102so3940694f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 05:42:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e2c284dsm8835785a91.11.2025.06.04.05.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 05:42:53 -0700 (PDT)
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
X-Inumbo-ID: 6f205ea7-4141-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749040974; x=1749645774; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mA4TmxYayexRiMjd9XMf0pd9INNo8GBli4r/JCX2tuA=;
        b=R0IcJGo9+B2BPKa+wSXRHTwX60hpU91IMVz3GEEdeNU/zOmMX4T7nLkrsUJBjhN23B
         uUhhPcKt12UlS3uO7Yhl02hEUuIm4BK3nXzy918T6fjllC9ALpfxRhVeKj1x1xFI9qrx
         ZAPzJkhGFevmrK5iR6ttFu/Vz0IL5Hl8oBRaHIIoXH+Uet5K6Np1rCRjyUKLVlYbAB/U
         5pb23VYICExPuicIOv9Cbqx1jqouLCW6bGeVDFLVsqtXeyw3vsEgWQOGQ8phZzenz8pP
         t2ryOZ4MWuPwYjJ8Uw2oqKe1r/E4ERZgInN+1tEkseD68mfjtZK8RnH9zLDcXgU5ztxz
         vWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040974; x=1749645774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mA4TmxYayexRiMjd9XMf0pd9INNo8GBli4r/JCX2tuA=;
        b=oY9YJoDgd8OcM88M2INhhS1JHjT1zf53BRfloDSoLaZRNeXQuBwd+KVwqWPctb8Unk
         o+oUTHFKV5hJN+xHgBzCs+vqzviBQ/VIz1X0vXnqT30iyEc6JJeRD4BXCSmydeYMYnks
         smI4Zw9gfgpmcGIal9wDaD47rlyd3hqeOq26SC+8EOuwDpHgpHybJDXfqNI5ka+BFeWU
         tknR33cEWx24dzctODdm0sOz06GWJLUdFP4uih1wZJ8qF2DWQzwFtV1+8v3KWbWfPKyA
         ZH5TV7KBjUeWEF5ZpOFpjOnzYmPYoHSLLtQ+9EfkO+U1zGJwtyTyEV2uZjbaSiRCmF/O
         1pxg==
X-Forwarded-Encrypted: i=1; AJvYcCW6MLQArZqyPvlQZo5Hff6JfRO8s/N1dJZS7axv2uFp44U7aOv2BR8nnO3uKx6Z8DI5no/6ChQ+qVs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysLpb3UUPBwY8IAzLOh01unZ1suK+RJw50VO5q9ZzGnwoMLJmR
	hahm1RYK14A20vD8O3/aFuSqSah/ZMt0me/JNGMlfzat7EQgNHgTE1Al6+Ol0d4rKg==
X-Gm-Gg: ASbGncvBOcDAytc42ZAwhBwZDRTDOh1Nc0zeboowG9Zf8Bh1nbuBeRNWjMirosfsENS
	Xv48TIJRtJcHTK9BjQhXHzAkXQVlhUfjk86ZJlIlDINm7+e8nWClxc7ZiqFhVnxQx5axMNWkWld
	rNm8m/IQrlRRtonsSSO2XnyPXga4fViH6KN+4dMmjF6312Csx+U7iHXgwgAP7Q8sHb8tauAtEqI
	WGlJKlqa6+wdmOKP3sDIVsyEIF3lQIs1U5cWLXfOT3VkL4tx8ekVTvm/b62PJz+vw8qL5RLy/XQ
	Q9VQcg8eI/zC02Aqy2H/ZvPXVsXBRQt43WUe5f/ZBEeUIIGDAXWJntdKMIP1pQ2hBTUM/zupOMP
	i+Yn1SQXFgd8pJnDdYa6zW3ZxFCYKy5HQ1fyBEYUTEORbXJ0=
X-Google-Smtp-Source: AGHT+IH2DIwyN/2U28Q8nyTv+/5DQc1G3N6C56uxMa4glVhhGGnNtYx2FzenrLx2u33Dl8/tnARTBg==
X-Received: by 2002:a5d:4805:0:b0:3a5:2182:bd17 with SMTP id ffacd0b85a97d-3a52182c0eamr1350639f8f.19.1749040973761;
        Wed, 04 Jun 2025 05:42:53 -0700 (PDT)
Message-ID: <2c120e48-edaa-4518-a92e-38872bfc6eac@suse.com>
Date: Wed, 4 Jun 2025 14:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/numa: introduce per-NUMA node flush locks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250522084815.825-1-roger.pau@citrix.com>
 <20250522084815.825-3-roger.pau@citrix.com>
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
In-Reply-To: <20250522084815.825-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2025 10:48, Roger Pau Monne wrote:
> +bool flush_numa_node(const cpumask_t *mask, const void *va, unsigned int flags)
> +{
> +    nodeid_t node = num_online_nodes() > 1 ? cpumask_to_node(mask)
> +                                           : NUMA_NO_NODE;
> +    struct arch_numa_node *info;
> +
> +    if ( node == NUMA_NO_NODE )
> +        return false;

One further question: Here you limit NUMA flushing to a single node, using
global flushes in all other cases. Did you consider extending this? Savings
ought to be had also when you want to e.g. flush on 2 out of 8 nodes. That
is, would it perhaps make sense to break up the file-scope flush_* variables
in smp.c altogether, using the NUMA approach uniformly?

> +    info = node_info[node];

node_info[0] would then need populating from a static struct instance, of
course, and ...

> +    if ( !info )
> +        return false;

... such conditionals of course would need to go away. Then we'd also get
away without requiring yet another direct-APIC-vector, as ...

> +    spin_lock(&info->flush_lock);
> +    cpumask_and(&info->flush_mask, mask, &cpu_online_map);
> +    cpumask_clear_cpu(smp_processor_id(), &info->flush_mask);
> +    info->flush_va = va;
> +    info->flush_flags = flags;
> +    send_IPI_mask(&info->flush_mask, INVALIDATE_NUMA_VECTOR);

... INVALIDATE_TLB_VECTOR could then be used here.

Jan

> +    while ( !cpumask_empty(&info->flush_mask) )
> +        cpu_relax();
> +    spin_unlock(&info->flush_lock);
> +
> +    return true;
> +}


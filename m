Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45916A6DEF7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925847.1328725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twk1s-0005Jg-9M; Mon, 24 Mar 2025 15:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925847.1328725; Mon, 24 Mar 2025 15:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twk1s-0005ID-6d; Mon, 24 Mar 2025 15:47:56 +0000
Received: by outflank-mailman (input) for mailman id 925847;
 Mon, 24 Mar 2025 15:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twk1r-0005I7-6k
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:47:55 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 556fc8d4-08c7-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 16:47:47 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so2420597f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 08:47:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d3ae04a94sm97695435e9.0.2025.03.24.08.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:47:46 -0700 (PDT)
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
X-Inumbo-ID: 556fc8d4-08c7-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742831267; x=1743436067; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ofLcFiJye2/fFMKa39X3Mzc9G6Qa6RD4veVQBRgk+4Q=;
        b=XFjhYyMNtCGiREnfYdDmMP6vPqyq+nhKxmZlxdes8NMpSttMtDQTbdLN1QyrEgl2dN
         WjUj0/r4We0nZZLO1xer+dNrs+Jwojp920m8twhmbopiRtoqBAEpSQnz893HTRAPNEjp
         uQosU1Jk1ifprGZv/xP4VXVh5Rl9Pmj5egC3r8ysaic+v2xp4iMQqqNw3XPQ98CMpWQA
         wHGwKhxsgLVrrvsGPv0iqv4qtULoCaZkLDDCHNT00BGqzhxoYGmzUjXqiiMBzPxeTa0w
         Sq+WeE+NBJwoq4epJaRG/6/SUAF9QDAmQ7Dq2IKrv6aPNS46lacigmoeJigNEobB7a0y
         x/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831267; x=1743436067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofLcFiJye2/fFMKa39X3Mzc9G6Qa6RD4veVQBRgk+4Q=;
        b=v0uemIUPWAshlPlBuIPPDKaeB6MgTV6140Q5yZooxJ2IsghewDa9i5xA52R4/3DrvM
         k/+KoG0YbmmN34yJYlLNJi5Q5gwkzUWX/1lyJdyjPKyaX6Wfwtx9wNJ8sloU9DyfFJll
         VXIDYQwXU16Tng0WQ9Xr2D5hn8LwL6k6EcgroLUs/vEyKLQGUmf817tJ8VaX8NFS5+LP
         SCP8Ok0WRIBO7dS2xULGkOMZigvTFplnUGRrCrZvmde5IttnrfQtjsJVYEYc1XOoXWHi
         tqsE+tyMT+kpURs08fMxi+5h3CtTlqcWsj6lOycjPnp4GV4dXU4pZWLR0uGOC0VRVJDw
         8bJw==
X-Forwarded-Encrypted: i=1; AJvYcCUdZuFiXtHBlUMknDW7dlRAK6a9dAYs54nL+Re0iunGx/v8JMRRN/yQJfsRSCqCMmfrx57mHPcI/QU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnOWT1Sqn/zsB5jAVG0ghTBZY2bREnEpiVc6pmz7BzYQ5R5Q/5
	XYjBtSYzJutt0ABmRiVHKX6fZeCsErbRG7ivP6+qC81xD74/CFwaOrKef/NUYw==
X-Gm-Gg: ASbGncv0Mki1WfVjsR0//r4/tftBmojfPrNV/L8jgJE+QfQExY2I7DSewBH+/rhszSE
	rqA59T3OFdjlJ4yXCXycHIXRNB5OsnZAKGeyLZRmScrlTm5oETAWuUyO8+WlJ/tzxhTGSorTK8h
	tWIKEZAMAeUMiAJjxeXsfEcgpMROAAy5OU/zfKUoD1785ZGjw3m6mw/KmUIgDnTyKaPQerG24Nz
	PIZST62Khwu7pRSbRRsn25M2K51ZMrWcdRohHd5KUOqSwqo+txVMPfRBkAEn7sTUDBHKsBdekIv
	SPWvCKXcVcwesb8TlJYJE4L6gW/v2VOpTwqKBzQZ+GbxBWkZdTqDhPYQRXCAhKDZ7iN+onvzHL/
	7BsonE1Wja3NeMaA/8eP78JVWxxwBJQ==
X-Google-Smtp-Source: AGHT+IHMxKBOyQpr/sSOsEKFQtzMEcuzdpKZOD410F+RWyv/WnKs8oK3SQbOo+IVBDE4XC1I8wewBg==
X-Received: by 2002:a5d:47a2:0:b0:391:23de:b1b4 with SMTP id ffacd0b85a97d-3997f9371e5mr12870440f8f.45.1742831266797;
        Mon, 24 Mar 2025 08:47:46 -0700 (PDT)
Message-ID: <0b340303-db4e-4723-b53d-178b2676a36c@suse.com>
Date: Mon, 24 Mar 2025 16:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> This commit fixes core frequency calculation for AMD Family 1Ah CPUs, due to
> a change in the PStateDef MSR layout in AMD Family 1Ah+.
> In AMD Family 1Ah+, Core current operating frequency in MHz is calculated as
> follows:

Why 1Ah+? In the code you correctly limit to just 1Ah.

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -572,12 +572,24 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
>                                                            : c->cpu_core_id);
>  }
>  
> +static uint64_t amd_parse_freq(const struct cpuinfo_x86 *c, uint64_t value)
> +{
> +	ASSERT(c->x86 <= 0x1A);
> +
> +	if (c->x86 < 0x17)
> +		return (((value & 0x3f) + 0x10) * 100) >> ((value >> 6) & 7);
> +	else if (c->x86 <= 0x19)
> +		return ((value & 0xff) * 25 * 8) / ((value >> 8) & 0x3f);
> +	else
> +		return (value & 0xfff) * 5;
> +}

Could I talk you into omitting the unnecessary "else" in cases like this one?
(This may also make sense to express as switch().)

> @@ -658,19 +670,20 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>  	if (!(lo >> 63))
>  		return;
>  
> -#define FREQ(v) (c->x86 < 0x17 ? ((((v) & 0x3f) + 0x10) * 100) >> (((v) >> 6) & 7) \
> -		                     : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 0x3f))
>  	if (idx && idx < h &&
>  	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
>  	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
>  		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
> -		       smp_processor_id(), FREQ(val), FREQ(lo), FREQ(hi));
> +		       smp_processor_id(),
> +		       amd_parse_freq(c, val),
> +		       amd_parse_freq(c, lo), amd_parse_freq(c, hi));

I fear Misra won't like multiple function calls to evaluate the parameters
to pass to another function. Iirc smp_process_id() has special exception,
so that's okay here. This may be possible to alleviate by marking the new
helper pure or even const (see gcc doc as to caveats with passing pointers
to const functions). Cc-ing Nicola for possible clarification or correction.

Jan


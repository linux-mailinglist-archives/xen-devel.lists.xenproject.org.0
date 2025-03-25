Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D6A702CE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 14:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926500.1329340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4hN-0002QQ-P5; Tue, 25 Mar 2025 13:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926500.1329340; Tue, 25 Mar 2025 13:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4hN-0002Nl-MN; Tue, 25 Mar 2025 13:52:09 +0000
Received: by outflank-mailman (input) for mailman id 926500;
 Tue, 25 Mar 2025 13:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+BiV=WM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tx4hM-0002Nf-3u
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 13:52:08 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54848aff-0980-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 14:52:02 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso37901475e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 06:52:02 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f32fb3sm202812005e9.2.2025.03.25.06.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 06:52:01 -0700 (PDT)
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
X-Inumbo-ID: 54848aff-0980-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742910722; x=1743515522; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1sMYtP9QzESt1bs281F2trOPEb4WP60tv3Ry4o/M2/Q=;
        b=ssh5orG2qJf9yJwJMaMFH9qVu2tI4a5WtjehH0W4b4qZeNtXaVRAkDA+f0F9bjNsDU
         5N635512+RngvFwpYvOhIDLmwJLwaE8Jcjig8Yo3S/wKPufT4dE1IPnPmwd+jYLNKP6W
         pl79/aXiZVPXm4RYO+QX+QFc20Vy6d1B60qsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910722; x=1743515522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sMYtP9QzESt1bs281F2trOPEb4WP60tv3Ry4o/M2/Q=;
        b=h4D+tCgEIjFAcDQIDzYuWIDKgYgSPGEbsvl9Z3Vm+WhdXN6nK4d9LLZ80dAm+bT9L3
         yRldsS9dfAqe5PbpY0cQVDUyWOs8lF7vSZ9s1zc94/wu1Qpd7hDwkf7N0PiL4W9sdmm4
         xrYNrqHkvMkE4daIBXirPLh25ghw8lqjQcNtGlULn86t4gd9Go2aCkwHwkgTpo3inWjk
         zDZo6/l0oEculkSXf7MwtFrOTnIk6OTGwHBVA/JKpILM2c1YzcuP4lpybEom/RE0qftB
         39xSc4Bx/5XsG1Ky6HsbnxRjLbJPW5Ljbm2Kb5K0HSGnPGhYmECgqsO9uZJhhwAjYCeu
         03NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjzwaYQn4bTnfvR/q6+QkDvDtGm6H7s5dDiihdjttc2ZUeNvAmeZsRJIv0KMNqZL63q8QZxnzoI9c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzjz0EbnKxEbNwua8X8Wnd/avMLOH9JbKSKxs8AOJK+c5fvvmN/
	u2a4PMpUmmSF0a11GBXTUXhHtaoMRF2MeUw8+/Nq5yq+beutbVC3571l0wOrmhs=
X-Gm-Gg: ASbGncufHZ0wLRlAafWwdKGYIbgWXKXRqf15r63KcAMkwzY6jtfT3XES5+BhH8cjQc/
	q3arKxihotRxRtSt9PniWTto3q2T3qrHRF17yO86tEbvypwL4USSBfGVKBGAk+FyEW1oQ2aIyiZ
	xOnkaxZiy7e1On4etALKi5ysyLL42C2x04zUvzT3dxm4+rkq5ASvtp/AzTuBdxGQU2kv/Fz9JkK
	0/KZqpnhXQsvNxuJygXrk559GtVIgMrDDpNMbFtbRTnpk8bbawirm7WkhPNjD3fj/En1/wMQVGH
	s+fx1PRk46O/VOIg+mBT/Nu6YjP1AEx04JY4b0Azywd5JEO/4I0KlNSO6h6XDSWrOzxQ14ohjXE
	mnMvy6PG66g==
X-Google-Smtp-Source: AGHT+IGFVjiu8OTe2wum4xRIv8e+nFFbju78h4W8UhTu1w5WE/5MPiGk2BEU87GUUhHuElopuCX83A==
X-Received: by 2002:a05:600c:249:b0:43d:cc9:b0a3 with SMTP id 5b1f17b1804b1-43d567a2f59mr94908325e9.22.1742910722187;
        Tue, 25 Mar 2025 06:52:02 -0700 (PDT)
Message-ID: <31635ea1-cac9-4a5e-a4d3-2349d2bfb942@citrix.com>
Date: Tue, 25 Mar 2025 13:52:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pmstat: fold two allocations in get_cpufreq_para()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <b2f1d0dc-54b0-4520-b4b6-3a1892662e53@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b2f1d0dc-54b0-4520-b4b6-3a1892662e53@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2025 12:53 pm, Jan Beulich wrote:
> There's little point in allocation two uint32_t[] arrays separately.
> We'll need the bigger of the two anyway, and hence we can use that
> bigger one also for transiently storing the smaller number of items.
>
> While there also drop j (we can use i twice) and adjust the type of
> the remaining two variables on that line.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Wow this function is a mess.

It is an improvement, so Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>, but the allocations could be removed
entirely by restructuring the logic some more.

Also, one extra observation.

>
> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -193,11 +193,10 @@ static int get_cpufreq_para(struct xen_s
>      const struct processor_pminfo *pmpt;
>      struct cpufreq_policy *policy;
>      uint32_t gov_num = 0;
> -    uint32_t *affected_cpus;
> -    uint32_t *scaling_available_frequencies;
> +    uint32_t *data;
>      char     *scaling_available_governors;
>      struct list_head *pos;
> -    uint32_t cpu, i, j = 0;
> +    unsigned int cpu, i = 0;
>  
>      pmpt = processor_pminfo[op->cpuid];
>      policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> @@ -219,25 +218,22 @@ static int get_cpufreq_para(struct xen_s
>          return -EAGAIN;
>      }
>  
> -    if ( !(affected_cpus = xzalloc_array(uint32_t, op->u.get_para.cpu_num)) )
> +    if ( !(data = xzalloc_array(uint32_t,
> +                                max(op->u.get_para.cpu_num,
> +                                    op->u.get_para.freq_num))) )
>          return -ENOMEM;
> +
>      for_each_cpu(cpu, policy->cpus)
> -        affected_cpus[j++] = cpu;
> +        data[i++] = cpu;
>      ret = copy_to_guest(op->u.get_para.affected_cpus,
> -                       affected_cpus, op->u.get_para.cpu_num);
> -    xfree(affected_cpus);
> -    if ( ret )
> -        return ret;
> +                        data, op->u.get_para.cpu_num);
>  
> -    if ( !(scaling_available_frequencies =
> -           xzalloc_array(uint32_t, op->u.get_para.freq_num)) )
> -        return -ENOMEM;
>      for ( i = 0; i < op->u.get_para.freq_num; i++ )
> -        scaling_available_frequencies[i] =
> -                        pmpt->perf.states[i].core_frequency * 1000;
> +        data[i] = pmpt->perf.states[i].core_frequency * 1000;
>      ret = copy_to_guest(op->u.get_para.scaling_available_frequencies,
> -                   scaling_available_frequencies, op->u.get_para.freq_num);
> -    xfree(scaling_available_frequencies);
> +                        data, op->u.get_para.freq_num) ?: ret;
> +
> +    xfree(data);
>      if ( ret )
>          return ret;
>  

Not altered by this patch, but `ret` is bogus here.

It's the number of bytes not copied, and needs transforming into -EFAULT
here and later.

~Andrew


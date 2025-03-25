Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D83BA6ED25
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 11:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926239.1329098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx153-0006hX-6E; Tue, 25 Mar 2025 10:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926239.1329098; Tue, 25 Mar 2025 10:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx153-0006g5-2u; Tue, 25 Mar 2025 10:00:21 +0000
Received: by outflank-mailman (input) for mailman id 926239;
 Tue, 25 Mar 2025 10:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx151-0006fz-Sk
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 10:00:19 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f48343d9-095f-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 11:00:17 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso37243825e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 03:00:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9957efsm13496054f8f.14.2025.03.25.03.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 03:00:16 -0700 (PDT)
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
X-Inumbo-ID: f48343d9-095f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742896817; x=1743501617; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fCr/03QSEpNhPVtR+nbU8IiJAdYVSyG6owrltyFLkR8=;
        b=bdsgCFUb/4vUfRbvSrA26IDc4UeQ6Cv9s5lUU0ijLDgx7EYjPDh1U7wUVyc1FaiY7r
         o+mTsqpZJSWXWxamWyVDuWEK+SH0tJubHK+cZhSu35AnVlFJSePvbug96JLvluLecuZH
         MkS9THCIroXwFi7/05s5ChTo4PeYWE5xMwVOw+O28/tLKoVYNn282dSb7+obMS4M3OD5
         VmKvNEtMKXxWfBTCklFa1AX6DjvzwqvcsLmw2HkAA9wiAkEvfyEvG6Mc+ZGzJUODiNA1
         Mj9jQ8DleGvZtmsEU+pT8o/PhJofs2xTQQRJ9FvvHANqEdJmiSts3XBGGhUEnURSjQyx
         m0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742896817; x=1743501617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCr/03QSEpNhPVtR+nbU8IiJAdYVSyG6owrltyFLkR8=;
        b=YtIMx09G1zkr0Z7mAXrvmlUpmmYWljEbYX9ImZcTMoJPiggDQ3dcXHK7tfFkEFllow
         DDO+3tcEjvoa3FM/6rsetGEaOEtg//hqUxLbenXQLBVpXW520CMdgfUHIELq4mP+VuDc
         SddexWo8wWX+zbd8kPEumr5V9OIrcgV++hmh01qED2sT5iwHg3FkkJcL3H6pmQkSfmKz
         nVCZuU84hGPlnRrMViLqvQCLoSn8+tUZCGoIVzSMg+0rlHzRY02luYQNZGpoBQ9zDUA+
         6Z1uzSAu266GOlEe/8NFIEzewueIVLbu6zSLZ1GbC6mUDQUwrUUVuFAIoeUT50pS0EaG
         RAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPtcjBKH1VwPTbSdq1sPpPjV7veZ0XsULwoxkMaxFzs9e7T0JriNROa5AtX6MDAnsnXHh5IC03oX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxqdP0TN2CBrSMAAGwxTLj7zSTGJgoUmodoem731dk4Y9r5bU9
	qvbGXY445eiIr4KA2gJye9/sPS1c3djxcuQS2fwaFhRq5G+ATZ7ZFJ2BvxItpg==
X-Gm-Gg: ASbGncv6QQHpRGy/J44zOKTz+hYAewmhxUrPTaUeTUwonNmDsIQjUmwpILgesdPr+7L
	ICebGunPVkoz3AXdehP5xzKoE121RqmJsmLwm8MBLR+WTNIZJDVDrXWTzLhPGkx+75O5nN4BcEh
	YEC8ppgZx3q09d9gfCt6CeK6AE0hmSrrfnG9aT4/Xi0kasPyFAES3i/+ISvhnrnhWNlcgR6o9br
	2PGBPDJ5TPIiAjLkSteNqQ3Mfb8Ms28O2sq2KcLKctvlT8SlgbthS14PVAKiz4E+NayDrQX9rzH
	AHPdYpA1Ub4PpK+ITnMcppgMko8OVko0tQtCouK46fGg7yjpU1urF3qSirMzn1cAFCzf3gruRLq
	S8OTA8N76nSPjAD3q6yxUI/tp/78pZA==
X-Google-Smtp-Source: AGHT+IH4cZJj2REdoijoGpmu/p/nRN1UitMnSYopZYhunNGvu0YB9EThnq8BeEIGTpfFfQUPM4edBA==
X-Received: by 2002:a05:6000:18a2:b0:391:3915:cfea with SMTP id ffacd0b85a97d-3997f94da24mr15248885f8f.38.1742896817123;
        Tue, 25 Mar 2025 03:00:17 -0700 (PDT)
Message-ID: <426a505f-34b7-456d-91c3-79091f0e24b4@suse.com>
Date: Tue, 25 Mar 2025 11:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> +static const struct cpufreq_driver __initconst_cf_clobber
> +amd_cppc_cpufreq_driver =
> +{
> +    .name   = XEN_AMD_CPPC_DRIVER_NAME,
> +};

Because of the hook pointers not being set right here, ...

> +int __init amd_cppc_register_driver(void)
> +{
> +    int ret;
> +
> +    if ( !cpu_has_cppc )
> +    {
> +        xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
> +        return -ENODEV;
> +    }
> +
> +    ret = cpufreq_register_driver(&amd_cppc_cpufreq_driver);
> +    if ( ret )
> +        return ret;

... this - afaict - will fail up until patch 09. This may want mentioning
in the description here. (Initially I thought you'd leave NULL derefs around
for several patches, until I checked cpufreq_register_driver().)

Jan


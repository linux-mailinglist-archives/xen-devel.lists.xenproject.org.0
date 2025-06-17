Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA2ADC890
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 12:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018108.1395028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTlQ-0001Sw-J6; Tue, 17 Jun 2025 10:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018108.1395028; Tue, 17 Jun 2025 10:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTlQ-0001RA-Fp; Tue, 17 Jun 2025 10:42:00 +0000
Received: by outflank-mailman (input) for mailman id 1018108;
 Tue, 17 Jun 2025 10:41:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRTlO-0001R4-UF
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 10:41:58 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0691522-4b67-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 12:41:56 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a589d99963so380006f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 03:41:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1639f97sm7167169a12.6.2025.06.17.03.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 03:41:55 -0700 (PDT)
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
X-Inumbo-ID: b0691522-4b67-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750156916; x=1750761716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9XVUbgTH5fUnqcfnCTzFYc/VmoaQkC1tHorq0Mjd8VM=;
        b=GYH9a/nhbOY3ybxeUoPuimcTRbxzqHm5tCvOlaiC1IGanet2dg6By4WY8avVEV4Q/3
         pqF7HI0bEj4+wyeS0TtTsDRZ0UIAC69zFX2NsN4FVKWosSbk8OiUmEa9f4IW2MLtFlV/
         DqcAcMnEl/ANHi2bw3sAyJdbnEzxpuYvOLjBAe/UTaHUaM3gpCtdtIjSeb7VHX60pSnX
         Mh334OQjZDdOPfm2A7za5+M2dL/Q8UGAQtumvPSvP+bS3IPgwDwMqGKzUJWQHLYYBn+B
         zsiQAyfsoFRqqxYAClsQnF3tl7bjCPxE+7wrLqrYlij+rl9NIHeTOd1Kl2vxHq8o/1mx
         UZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156916; x=1750761716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XVUbgTH5fUnqcfnCTzFYc/VmoaQkC1tHorq0Mjd8VM=;
        b=wCZjs8SHJ6cRRGvDCnle3nTqf6GDhTX6vXQg3H9PMNi5WOuqW/83g3MAKEj4FFOFqq
         3n7LOP//+bPsNuo3OHZI8qavRfs65+p4a/xu8h2Y8XECV+hmKO+uG3k12q4DrkHpJjL1
         EHZuMn0m/cYPvdzJSUBdTpBTHR3pd/qPtAh7Xx44YtwZXwT8Cas3AgUI5ye76cqDlY+E
         VQ/Ij1kzy0qbCPZbg+iGM8vZFdFOeMt/fuF+B98sT6o6MCPr8ReRI8HQGfuJv2b9K5HG
         B2LLBjYi/fh2oJKQNmnCOhcsowQAoa7mXyNno8gZBb/8EK0UJEHB3P+za4YuIk74O7PC
         r/eA==
X-Forwarded-Encrypted: i=1; AJvYcCXv/8hIZ9Pek/H7sCT8gKkvU9GQQvqorSAbchwEOwokqh8R/Vv1z2MnWXK4+08LnAMGfcncEW/2bmg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsPCUAwUy1cpq1g7ymdJO4b8ZI9sDKYzXfhud+PCENmehEhZIn
	WOKupBc4uPPvqq1hslXgjQYRxxeOE0tiVSX50XMElBcHX7+cCpahKkVS41DsbZdCsQ==
X-Gm-Gg: ASbGnct2dxJnPR3KtThJlIJRFDwDSjgbhKEwV1XZaHB7NQN+V2QCWLDuDDvvnPyBfXR
	OOSZEaIDT+/I/qaI9J333U98NXZZ02+kqUptSq50b6l6iJN8kWeGyLzBlwsYpLgCS5A4PaGfkq+
	wiPQHwJ/Hk0zZms6TsyOmZ1yGi19Ss9+f7ZpsQtINrrN/PIWgbBKx538mK6OMhx80nmu9oQVfNB
	OIhFKfCPkqcMGSUM/kT1K0FHCy8Mpamva8yUCl84+aW2a5il4qBfP/mLn4Ddgru35c2HX5gM1+M
	GKigx+KWGTC5VsM1sJFmxJQkmT2YJT9iFd1xCUhyuZz6NXBx8kfmmAkrHiHY/2WLtXDqiUbKHdm
	0E+MU585uvGsRR2Vapl1jd6Eyd0McV8QEPpHeCe/vleSB8MY=
X-Google-Smtp-Source: AGHT+IFCaK459zifzsmsptsoG3CBxxqdMq4sLXCGh/9c3nnwuWy2HzxlGstBGysLCrq1pdOPnGpLwA==
X-Received: by 2002:a05:6000:2884:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3a572373c1emr11332622f8f.15.1750156915699;
        Tue, 17 Jun 2025 03:41:55 -0700 (PDT)
Message-ID: <e5048b21-b1c6-447b-824b-9be7a6909948@suse.com>
Date: Tue, 17 Jun 2025 12:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/18] amd-cppc CPU Performance Scaling Driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> amd-cppc is the AMD CPU performance scaling driver that introduces a
> new CPU frequency control mechanism on modern AMD APU and CPU series in
> Xen. The new mechanism is based on Collaborative Processor Performance
> Control (CPPC) which provides finer grain frequency management than
> legacy ACPI hardware P-States. Current AMD CPU/APU platforms are using
> the ACPI P-states driver to manage CPU frequency and clocks with
> switching only in 3 P-states. CPPC replaces the ACPI P-states controls
> and allows a flexible, low-latency interface for Xen to directly
> communicate the performance hints to hardware.
> 
> amd_cppc driver has 2 operation modes: autonomous (active) mode,
> and non-autonomous (passive) mode. We register different CPUFreq driver
> for different modes, "amd-cppc" for passive mode and "amd-cppc-epp"
> for active mode.
> 
> The passive mode leverages common governors such as *ondemand*,
> *performance*, etc, to manage the performance tuning. While the active mode
> uses epp to provides a hint to the hardware if software wants to bias
> toward performance (0x0) or energy efficiency (0xff). CPPC power algorithm
> in hardware will automatically calculate the runtime workload and adjust the
> realtime cpu cores frequency according to the power supply and thermal, core
> voltage and some other hardware conditions.
> 
> amd-cppc is enabled on passive mode with a top-level `cpufreq=amd-cppc` option,
> while users add extra `active` flag to select active mode.
> 
> With `cpufreq=amd-cppc,active`, we did a 60s sampling test to see the CPU
> frequency change, through tweaking the energy_perf preference from
> `xenpm set-cpufreq-cppc powersave` to `xenpm set-cpufreq-cppc performance`.
> The outputs are as follows:
> ```
> Setting CPU in powersave mode
> Sampling and Outputs:
>   Avg freq      580000 KHz
>   Avg freq      580000 KHz
>   Avg freq      580000 KHz
> Setting CPU in performance mode
> Sampling and Outputs:
>   Avg freq      4640000 KHz
>   Avg freq      4220000 KHz
>   Avg freq      4640000 KHz
> 
> Penny Zheng (18):
>   xen/cpufreq: guard perf.states[] access with XEN_PX_INIT
>   xen/cpufreq: move "init" flag into common structure
>   xen/cpufreq: extract _PSD info from "struct xen_processor_performance"
>   xen/cpufreq: introduce new sub-hypercall to propagate CPPC data
>   xen/cpufreq: refactor cmdline "cpufreq=xxx"
>   xen/cpufreq: introduce "cpufreq=amd-cppc" xen cmdline
>   xen/cpufreq: disable px statistic info in amd-cppc mode
>   xen/cpu: Expand core frequency calculation for AMD Family 1Ah CPUs
>   xen/amd: introduce amd_process_freq() to get processor frequency
>   xen/cpufreq: introduce a new amd cppc driver for cpufreq scaling
>   xen/cpufreq: implement EPP support for the amd-cppc driver in active
>     mode
>   xen/cpufreq: get performance policy from governor set via xenpm
>   xen/cpufreq: normalize hwp driver check with hwp_active()
>   xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
>   xen/cpufreq: bypass governor-related para for amd-cppc-epp
>   tools: drop "has_num" condition check for cppc mode
>   tools: optimize cpufreq average freq print
>   xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
>     driver

As indicated in individual replies, three of the patches may be possible to
go in before you re-post. Subject to what I said in the replies (patches 02,
08, and 13). Please clarify what (if anything) to do.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FADB39C5C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098599.1452605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbSD-0000Io-NR; Thu, 28 Aug 2025 12:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098599.1452605; Thu, 28 Aug 2025 12:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbSD-0000GY-KR; Thu, 28 Aug 2025 12:10:09 +0000
Received: by outflank-mailman (input) for mailman id 1098599;
 Thu, 28 Aug 2025 12:10:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urbSB-0007kk-V6
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:10:07 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efea690f-8407-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 14:10:07 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-61cb9f6dbe7so1554436a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:10:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cd59d6ff5sm1456301a12.25.2025.08.28.05.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:10:06 -0700 (PDT)
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
X-Inumbo-ID: efea690f-8407-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756383007; x=1756987807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ix2NySS9r3VEUHyFHBqvwy8adJrs4J+hBt/gltIKQM=;
        b=PSXCUQNkxLGGji1/s2YI8uDG/T24B6GML2kPesJeTNO8flv20Efa8GGhrpMOIpt+kG
         2sPUEXV831PYWZBJHXVM2Jtmz1Jai8045e29Do9V7Fu7k01moOQsNlNHYCwY1uSN9snD
         8Js1Dime0zPzmj3e/2Z1Y0sIYnlYSYkwEDJI83PEi2ut18tDGG+3GK/i3o8XpGH9CdeU
         dSnq76YyEciK3UDE5aG8cLHIM+JOhS5W8N6cpsbJlOizvWIpcYreVxDZ8BEgntkkCLNQ
         IC18pyH0vk2YssJn7XVmbBcpYZJ6RTk8Oa90iKyko3JOfYJGuPPuOSlQY+XOZxVrrm9V
         KBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383007; x=1756987807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ix2NySS9r3VEUHyFHBqvwy8adJrs4J+hBt/gltIKQM=;
        b=r9yMVQAEc+q0oDiN4KgRnaeMy9WhEh10uCIr0R/Kr6E+ecwa7o8M+aM7Kcsiwiotq7
         byV4NEaKKew71izkHQNEBl5jeqAfE9UQ7FyghftxSFM5fkpT8Y9dhtWhb4RkVI0rWC6+
         Zn5vlmWsGIPJD9BPW+MKoq1vfPIXkwTCUkDlFXeQ8muFFiO8fXzNCT6QQeVcv19EX/Ls
         qwhpr0O7MrGlIJ04mLu1ETrn2o7/kynTLM+IsdzBoBTZ155Aoa6foudLCFYKE68Yfk4+
         5D+oz1GzWq8jtzORUObYjzDT/czh0tdNrZUtVjwzhnllpKy3oQs28bCLLSn7dHFBwY2O
         Xhaw==
X-Forwarded-Encrypted: i=1; AJvYcCX+eGk5cJqEtD7RPwoVYA+CNNSh8SI8C0BXTo6mfuNjjUz6cHgjdvtq+U55sfPcYsckZQQAvM6iVKg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf82Qn/4mDkH7iZ9sjCL7pGbr1jeqWezAqMKIDoBE6/NNl4Naz
	/qpX8KFgGEP1tEjEd/p+Hb6Q6MYS2+NFjEz1nvPAsHSInhwFSDV3ckHE+21fw/DrCA==
X-Gm-Gg: ASbGncv6hM4l9JfjaTFrd/jzTRQkP2ZMKaDCA2Wc/7fS4VrE24MdTeMgCmK2yNfGuRH
	dk0oRNhHFXM967ztOH9zLKCqgaGijNV4NqroDPnFSBN9ZqO7v9q4m3jUIMWAf3zAEcy1QNXf+DY
	w8WNnjx4WrMRVA9K+fDNkWsLSbYtXbiCKf1OQo/3toc9hNitKHX4ogr/+9j7jNy66XO8lXxLMIA
	KqcWJh0wz3y1QB7kiBZE/OKdLkCmjzwmGcKLjEPxwpXy02GusUuMcJU2UFTuF7I5+BqYfOo1tEH
	3mWbDaX7zDbrpshElJMAdTa+SUJI2qDaweN7QRsHY+RCFd3/2YSvYVRUg/ZtnVa5k4G3UFb1xnb
	F3QORAuhm1tJaPE2Sn0oWu59UV2kmzqqkSO65Mp9zWEOQ2qUdlqa+ldPHuLbDcjTPDHzDgiYhrL
	3cs6mr8D6pdpxm1zX9pA==
X-Google-Smtp-Source: AGHT+IE7HwbEx1dPNJJA1NmqU7wKzVE6ZSer28jgVK4+ImjmFMvl+btEBrFEYlQuH9ZY3RizRhpA8Q==
X-Received: by 2002:a05:6402:52c4:b0:607:28c9:c3c9 with SMTP id 4fb4d7f45d1cf-61c1b453182mr20917367a12.6.1756383006737;
        Thu, 28 Aug 2025 05:10:06 -0700 (PDT)
Message-ID: <a84ed680-9e19-4f35-bd9e-c3effd05ff5b@suse.com>
Date: Thu, 28 Aug 2025 14:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] amd-cppc CPU Performance Scaling Driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250828100306.1776031-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 12:02, Penny Zheng wrote:
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
> ```
> 
> Penny Zheng (8):
>   xen/cpufreq: introduce new sub-hypercall to propagate CPPC data
>   xen/cpufreq: introduce "cpufreq=amd-cppc" xen cmdline and amd-cppc
>     driver
>   xen/cpufreq: implement amd-cppc driver for CPPC in passive mode
>   xen/cpufreq: implement amd-cppc-epp driver for CPPC in active mode
>   xen/cpufreq: get performance policy from governor set via xenpm
>   tools/cpufreq: extract CPPC para from cpufreq para
>   xen/cpufreq: bypass governor-related para for amd-cppc-epp
>   xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
>     driver
> 
>  docs/misc/xen-command-line.pandoc         |  14 +-
>  tools/include/xenctrl.h                   |   3 +-
>  tools/libs/ctrl/xc_pm.c                   |  25 +-
>  tools/misc/xenpm.c                        |  94 ++-
>  xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
>  xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 766 ++++++++++++++++++++++
>  xen/arch/x86/acpi/cpufreq/cpufreq.c       |  69 +-
>  xen/arch/x86/cpu/amd.c                    |   8 +-
>  xen/arch/x86/include/asm/amd.h            |   2 +
>  xen/arch/x86/include/asm/msr-index.h      |   6 +
>  xen/arch/x86/platform_hypercall.c         |  19 +
>  xen/arch/x86/x86_64/cpufreq.c             |  19 +
>  xen/arch/x86/x86_64/platform_hypercall.c  |   3 +
>  xen/drivers/acpi/pm-op.c                  |  68 +-
>  xen/drivers/acpi/pmstat.c                 |   4 +
>  xen/drivers/cpufreq/cpufreq.c             | 137 +++-
>  xen/drivers/cpufreq/utility.c             |  15 +
>  xen/include/acpi/cpufreq/cpufreq.h        |  40 +-
>  xen/include/acpi/cpufreq/processor_perf.h |  14 +-
>  xen/include/public/platform.h             |  26 +
>  xen/include/public/sysctl.h               |   5 +-
>  xen/include/xen/pmstat.h                  |   5 +
>  xen/include/xlat.lst                      |   1 +
>  23 files changed, 1283 insertions(+), 61 deletions(-)
>  create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

Oh, and - what is still missing is a CHANGELOG.md entry.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB18BB399CD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098294.1452385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZrI-0007Ml-N0; Thu, 28 Aug 2025 10:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098294.1452385; Thu, 28 Aug 2025 10:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZrI-0007KW-Jx; Thu, 28 Aug 2025 10:27:56 +0000
Received: by outflank-mailman (input) for mailman id 1098294;
 Thu, 28 Aug 2025 10:27:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urZrG-0007KQ-UX
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:27:54 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8007f21-83f9-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:27:53 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ae1e8so807965a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 03:27:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c78e49ca4sm6885779a12.47.2025.08.28.03.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 03:27:52 -0700 (PDT)
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
X-Inumbo-ID: a8007f21-83f9-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756376873; x=1756981673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HL94KxyFJYc9B8+8KlZ8ezNhRhzjF24IdvuCgVkbmxc=;
        b=bH4ywbhh7GJ744sCxXLHermmI6OHJ1o3RKnAQy8ahCooZ05fj43pAfr7XLLq2U2BZp
         fbN0EbHLG1Fze00Sx32jC3VH9HsePh66Q4qA6+P6hju35USJHC23y/ugkULJtMCGsWft
         zblPBNkl5PprEvCLjrVOPtspkW98QyogPygt3DkQjvvhNSnTee+RlzUKZwr0uYxi8FZe
         Z2dfrSDFQj/pYsuVV/OcgThy39J8cs1s0PNFGBw2sLcgSFlphFyKkPSvyRbT7bIS1rW9
         bieboWiwxGg/fDIQ9pTZnj4IRo0xd2KHVCY85xReNDDLAkK/wlW1xnQesjh78nh0WqPG
         7lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376873; x=1756981673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HL94KxyFJYc9B8+8KlZ8ezNhRhzjF24IdvuCgVkbmxc=;
        b=rsp+X1EZnLJrdARPi/6SsdwAlGqgHxBAxxTMVHX7UNb4F4DPsEVruULr2wZKAvIaRc
         3t0hnh2MHrmdVdb2Y9hXfwmYIlrkIiiuHUY1Ur3xdDLK/iM+JFwtSOHjB11wAxoBLYe2
         tvJBN6V6qguqeZb4vyswfhGutXGGQU01qRfB67NWBOqjTnk7UD0LoghT1thua4z46X+H
         0YboW/Emd6C45qADBwYq+sT2EAjVwZYNE6g6RcGKbcKfYKH6veT7DeneiN4nLN9U9uEK
         l9wE1m/O6moNFCD93ARrLdjPTGodaGMXSaLdc2qDoPcmmaFzOnjMVeSw0pLtO+ugMsiN
         FJmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpEqC9yBbF4Tatmx+QDagb9PfgCAuQybRsqUXuYnfMJyYejrexI7y/INhwHkq80+BdsxEXKyczVmY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2E8FJ3X7IvrgcMpBkkrvgr5qmqwbKZbs1XRMVIFX4PUdST0Rd
	Ok3jEqw/cgEASTCF+MCAcawh1Q9QwPEG6s8PDygEMuWL2w/urgmDQtq1A+DzFx40pw==
X-Gm-Gg: ASbGnct3re1CVvcIiWUN8xS1gmLwqHe56tOsgqih79GdKPHqQWcXlmmSErRkyi3IBuW
	dwygIyG7jcA8eLm75MbdX61pjeON62TE97Xp7axLWLVhaUIglkcB9ZAAXYi4CWYb+ZfG5JSZpoI
	AjxIc+ox8PyEleWtB6feqAgVqC+ZslMhqizrh6PxSyCMIGZr3q7mpppfQt/YnXbRjIr3NtKbHPc
	Bdh3KaKt3F1awLeqCdkNzXTbG5r7FTxzFEiLGYCFf14DZfcXBEYXjL4BdrcU0ly5BC6Venvdxjh
	8E7CyOJyDu1O+YWZYrYANeD5qzFwSQv/opei6Gmm1B6cxK1AURndAdhRM5HQmuXUT7inS3lEK1f
	zFDCR/MpeAt1aZDxGz7RfBeoIzZsHLYG1CSsFqbfTbHZaF9158dIK6H3m3jU6uM8NwKmRfVvYPz
	Vdi4nxX4Qyo/Rs7kxGew==
X-Google-Smtp-Source: AGHT+IEM+N69YXN6xi84/RX4fUvBXZWNWGqUSFrfyzc1O3L2LlUM3na38seFYCGQ7+8XdsWVrrKi8g==
X-Received: by 2002:a05:6402:34d6:b0:61c:6ca1:1a8c with SMTP id 4fb4d7f45d1cf-61c6ca1237fmr11306935a12.20.1756376873162;
        Thu, 28 Aug 2025 03:27:53 -0700 (PDT)
Message-ID: <255a5906-ffa8-4fb6-89b5-23605a17b38c@suse.com>
Date: Thu, 28 Aug 2025 12:27:51 +0200
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

I'm somewhat confused by the submission: Both my mailbox and
https://lists.xen.org/archives/html/xen-devel/2025-08/threads.html agree that
cover letter and patch 1 were submitted twice, while patches 4 through 8 came
through un-threaded. I can only assume that the duplicates are identical.

Jan


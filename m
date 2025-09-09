Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E30B5022A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 18:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117200.1463411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw0vZ-00014h-0o; Tue, 09 Sep 2025 16:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117200.1463411; Tue, 09 Sep 2025 16:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw0vY-00012X-TS; Tue, 09 Sep 2025 16:10:40 +0000
Received: by outflank-mailman (input) for mailman id 1117200;
 Tue, 09 Sep 2025 16:10:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uw0vX-00012R-CK
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 16:10:39 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 863c9505-8d97-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 18:10:38 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6229f5ed47fso5073201a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 09:10:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62bfe99ffcbsm1489694a12.3.2025.09.09.09.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 09:10:37 -0700 (PDT)
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
X-Inumbo-ID: 863c9505-8d97-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757434237; x=1758039037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aI8vG4osWbp5OgmNqe2HTMG3tJfN+5O+Z++VTtjIlHI=;
        b=S46tD9g/YYA9yZsdGdRMfEAeAkupFvbxQDr+HMwGYlaXmYZ9R55mWfGIES0WUefvuo
         Tqde6o8ohZ5PC9Pr8tgWgQvwTJLnrtsvaNXbWv2r9jzYAJ7sBVGPS6HpM2cWgO3O5E1X
         Ix57zeW5GqvZmxzGOUy/So3tL0nCymyOb9VY1xjYt0ADcw0oqBRiFHdZCJ6cu8EXhCU0
         tpa9KWVDIydRVjZUY6ShbM2q+xfKx4uVTifbdgOMUtL2lswtBrsEHhxBEuv3NnVzmvfn
         tPy8hpksF9oDCxm2423z+8fFCJF5EC0oqQyQLI6r/t/8C42Dz9trxSKWshoG3LGtTpoN
         gzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757434237; x=1758039037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI8vG4osWbp5OgmNqe2HTMG3tJfN+5O+Z++VTtjIlHI=;
        b=nvdUSPe23o36/Amo14VGSkQiBl+/a4WR75aIKXGp6LznL7n+xQiHkHrBxiwIQbqhex
         KfAgsuMOmJcH9+0oNMpL8AF7bEapkagBNwOrr7PEsHHIoHphCa4KA+SWgm0GjGamyzYj
         vhohgyZBI21kYkumgSOfTdi9EWlG0gG+VlCX/1LyzakumXfl2yPw1ZUPoW9poWQVk5ID
         oA2hzAyI1/cLbRTjOqtFYGRQmizWk8pjfLdbxCrQRh7w+5o5LFUaZJKGqfO3n/SYxg78
         98HYREVpCj8LPT2/OfCH4wCXEEv2z2tG+EqrIg+LSCYQeAAMFZF9aLfzwYX4YvnJfs1F
         nF/A==
X-Forwarded-Encrypted: i=1; AJvYcCVoxRFNbb4+DLB1BED56i5oOTE4ozcoATlpgBEQlO5bul2W4CHXHjP7+r5CiPVW2yReOQNg1YJuaWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysOjRSAwqvrMJoUVEpZvLF7MUDUyJ3L414DIAZJRhQhWdqlmpm
	gq361WKS3laSpIq9jZI8qa9FLhvcKQbPtAOCTArOm8KWhZUs+t3vmHhjZhxrNjoyig==
X-Gm-Gg: ASbGncuSo60MS5S15TvTO74uwur7V+3bRuPX+A+0mK96/lnF3CxmCJxUqU6gddnta6d
	iq4eA2ayIdWVctUzuxZBKqCunq1T7WCITaRvcL+RpOSrU6kZmoa/3Jcb9SLCt0QF7/gCF1WxlLY
	rC3hS3U2fG1cefvzc2s+UAbCeqR0vc7zoPmz0JNANq4UUeYU4ITXWQlQL5RLYyqLyfyRK/6L7uB
	5lE6ib3oZLhyTM8BVFbt5EpEN+EwIoXcHH541n5+2wxI5EoV3TE/ryH+csHhwsObgtDQ6IemSUb
	2pci9acQB270nCyDS7+PnY+73V52/HcmRiEnD5atMER8E/1waim5sGR+PvPey2uT1fD4+DJqGFt
	EUxqktCWTTeTJaUB/5eYsIcKiVzQmcSm9L70aJ5/T6vZqJOhLaX5FbQeZLI7FwwEpUaAAeDJepM
	vTb5S1fXI=
X-Google-Smtp-Source: AGHT+IEmQZVnY03evAkGxNSAH3gUvungsQdQcgukf8Sb4hBm9qoOI8jQgMFMZ2bgyRx3i9gcEIcLqA==
X-Received: by 2002:a05:6402:5107:b0:62a:768c:2223 with SMTP id 4fb4d7f45d1cf-62a768c24famr5122328a12.11.1757434237379;
        Tue, 09 Sep 2025 09:10:37 -0700 (PDT)
Message-ID: <b648990a-7efe-4400-8b85-9e437cfc6eaa@suse.com>
Date: Tue, 9 Sep 2025 18:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] amd-cppc CPU Performance Scaling Driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250904063518.2097629-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 08:35, Penny Zheng wrote:
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
>   xen/cpufreq: embed hwp into struct cpufreq_policy{}
>   xen/cpufreq: implement amd-cppc driver for CPPC in passive mode
>   xen/cpufreq: implement amd-cppc-epp driver for CPPC in active mode
>   xen/cpufreq: get performance policy from governor set via xenpm
>   tools/cpufreq: extract CPPC para from cpufreq para
>   xen/cpufreq: bypass governor-related para for amd-cppc-epp
>   xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
>     driver
>   CHANGELOG.md: add amd-cppc/amd-cppc-epp cpufreq driver support
> 
>  CHANGELOG.md                         |   1 +
>  docs/misc/xen-command-line.pandoc    |   9 +-
>  tools/include/xenctrl.h              |   3 +-
>  tools/libs/ctrl/xc_pm.c              |  25 +-
>  tools/misc/xenpm.c                   |  94 ++--
>  xen/arch/x86/acpi/cpufreq/amd-cppc.c | 703 ++++++++++++++++++++++++++-
>  xen/arch/x86/acpi/cpufreq/hwp.c      |  32 +-
>  xen/arch/x86/cpu/amd.c               |   8 +-
>  xen/arch/x86/include/asm/amd.h       |   2 +
>  xen/arch/x86/include/asm/msr-index.h |   6 +
>  xen/drivers/acpi/pm-op.c             |  58 ++-
>  xen/drivers/cpufreq/utility.c        |  15 +
>  xen/include/acpi/cpufreq/cpufreq.h   |  44 ++
>  xen/include/public/sysctl.h          |   5 +-
>  14 files changed, 936 insertions(+), 69 deletions(-)

As we're considering our options towards getting this work in, can you clarify
two things please:
(1) In v9, the sole changes were related to the use of per-CPU data and the
    adding of a ChangeLog entry?
(2) The driver is inactive by default, i.e. requires use of the command line
    option to come into play?

If the answer to both is yes, we're leaning towards committing v8 plus the
ChangeLog entry.

Jan


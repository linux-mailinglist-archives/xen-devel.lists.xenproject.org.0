Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732A69E1688
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847481.1262560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOmN-0006b0-OB; Tue, 03 Dec 2024 09:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847481.1262560; Tue, 03 Dec 2024 09:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOmN-0006YT-LU; Tue, 03 Dec 2024 09:01:11 +0000
Received: by outflank-mailman (input) for mailman id 847481;
 Tue, 03 Dec 2024 09:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tIOmM-0006YN-Ac
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:01:10 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 231225d6-b155-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:01:09 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53df67d6659so8123241e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:01:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa59991f1b1sm588820066b.165.2024.12.03.01.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 01:01:08 -0800 (PST)
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
X-Inumbo-ID: 231225d6-b155-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733216468; x=1733821268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4YRb2XHdKNSFAGkA9/fZjUUYBUqXrLnykySbZz9RxHM=;
        b=gLLwlEDwhUOFCcC+Ui5b1EZYnCISjbAYSue68tPkfc6srZZSbGHnQQzzZs2aJzq0cQ
         5u8eJWzjBFihK6t/9v01N1FgY4AEjvBSTxxPLRDkc1Xi3oYsG2FSp5L07siIvuFjPszi
         +Gh2bzs9+UGW8WadnwDiXqHx5xvjA1XrfFNamYxm5FrqgnZ1PZc/c2XTv9ZmMUBBVW2I
         v3A7zOGlurLV8Yr0+RgIdp7D7m5P+YqeH+HRwe9rFE0jdfKsMXw8/n+AJ1317VJafpWf
         9etKTxq9fCbr+5xGm+CmkYmxa/nYaREnNywbRzQnkSoIqAbHx7OyhN14YrIuEDTyTY2a
         UrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733216468; x=1733821268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YRb2XHdKNSFAGkA9/fZjUUYBUqXrLnykySbZz9RxHM=;
        b=Sl9lypat7TvkDCHFQzS8pDdl0jwJZ4rahB2POymno0dty7/fXKEntHyxq6iVNUUKnE
         VmpwaeB7dJRc3kOs7ZSLUePiCfqLiTO+Ai3pQwROoUAUJjDSrc//uZuUuY2qFoerdUSh
         QaAT/tNAGNXuP1OKDErjtA8XOgR8g7bQauO1plrJvXRo8DsY9AUuYyBe4nQxMO+wKYR0
         UN3U4HR1fnHi9x8u6BL5pAqkgJvW7/fkkqQB9Q991fOZ3Rp0jjzg+yy2gyL4eEqCxqP0
         NbYYXN0wVB5FyoMVoe8SfeTaXf8gg5DdfiaEpQGDwjZVRK8tQrO1t3z673r+d8jSc24s
         Io1A==
X-Forwarded-Encrypted: i=1; AJvYcCXF1rWnNDtP+LaF0xDAmFDAxsMeHAfvAVoGEiH/Xp5xAmXGz7xFphlu35ypCiDqjZvmnxHvYi4l+eQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJNQ2xBj5yHlgQuVTN3Fwc/MJXJpMbZL6T/yoDTTWZWPDO8JX6
	j1Szr/peRk0nS4J3BR/fgIVkSMljH3aRnlS5FEqWSL1dxCEo4UZQhfN1D3KtOQ==
X-Gm-Gg: ASbGnct0ZjBoLRf8tDLPbzOdok6x18Xt96CDixXBuDTFo9e233qD0od1iB2p2gs2zPN
	7eyUTnqbfTbR6W2HqJNh2tCf8w2gTQCuxiRF4rmPqxbXGtZTopQgcfU6FDuIkj4MXXfglcF+YRh
	8kocuZOrUW2iqAIIBfGokFg2X6KG7VA+B3+HXxicFW/FL8HZfDki3Cg9RJ7zL9m6vatQYAQA769
	kzQlRf1LkPHIhdlJazEUGtYVa0atCoy6NrS3RoUoPgJ38rNTfxIpLjtbKhldBtw4yrSK8oVzRhE
	pdZN/UX0MeKP6PxBxfdIvuiWaISoleUsJRo=
X-Google-Smtp-Source: AGHT+IFCoZx9jD9ylrLhyUpnHj7rce1pa6sjPuv8/ddPVXjBP2Elo7tKAZmg+o9z8MkBNSA32IOdOA==
X-Received: by 2002:a05:6512:b14:b0:53d:e7b6:c701 with SMTP id 2adb3069b0e04-53e12a06d37mr1395337e87.33.1733216468557;
        Tue, 03 Dec 2024 01:01:08 -0800 (PST)
Message-ID: <593baee2-9bf1-4db4-86e8-015cae48dc1a@suse.com>
Date: Tue, 3 Dec 2024 10:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] amd-pstate CPU Performance Scaling Driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:11, Penny Zheng wrote:
> amd-pstate is the AMD CPU performance scaling driver that introduces a
> new CPU frequency control mechanism on modern AMD APU and CPU series in
> Xen. The new mechanism is based on Collaborative Processor Performance
> Control (CPPC) which provides finer grain frequency management than
> legacy ACPI hardware P-States. Current AMD CPU/APU platforms are using
> the ACPI P-states driver to manage CPU frequency and clocks with
> switching only in 3 P-states. CPPC replaces the ACPI P-states controls
> and allows a flexible, low-latency interface for Xen to directly
> communicate the performance hints to hardware.
> 
> amd_pstate CPPC has 2 operation modes: autonomous (active) mode,
> and non-autonomous (passive) mode. We register different CPUFreq driver
> for different modes, "amd-pstate" for passive mode and "amd-pstate-epp"
> for active mode.
> 
> The passive mode leverages common governors such as *ondemand*,
> *performance*, etc, to manage the performance hints. And the active mode
> uses epp to provides a hint to the hardware if software wants to bias
> toward performance (0x0) or energy efficiency (0xff). CPPC power algorithm
> will calculate the runtime workload and adjust the realtime cpu cores
> frequency according to the power supply and thermal, core voltage and some
> other hardware conditions.
> 
> amd-pstate is enabled with a top-level cpufreq=amd-pstate option. It will
> fallback to cpufreq=xen if amd-pstate is unavailable.
> 
> With `cpufreq=amd-pstate,active`, We did a 60s sampling test to see the CPU
> frequency change, through tweaking the energy_perf preference from
> `xenpm set-cpufreq-cppc powersave` to `xenpm set-cpufreq-cppc performance`.
> The outputs are as follows:
> ```
> Setting CPU in powersave mode
> Sampling and Outputs:
>   Avg freq      2000000 KHz
>   Avg freq      2000000 KHz
>   Avg freq      2000000 KHz
> Setting CPU in performance mode
> Sampling and Outputs:
>   Avg freq      4640000 KHz
>   Avg freq      4220000 KHz
>   Avg freq      4640000 KHz
> ```
> 
> Penny Zheng (11):
>   xen/x86: add CPPC feature flag for AMD processors
>   xen/x86: introduce new sub-hypercall to get CPPC data
>   xen/x86: introduce "cpufreq=amd-pstate" xen cmdline
>   xen/x86: get processor max speed from DMI table
>   xen/x86: introduce a new amd pstate driver for cpufreq scaling
>   xen/cpufreq: introduce policy type when cpufreq_driver->setpolicy
>     exists
>   xen/cpufreq: only set gov NULL when cpufreq_driver.target() exists
>   x86/cpufreq: add "cpufreq=amd-pstate,active" para
>   xen/x86: implement EPP support for the AMD processors
>   tools/xenpm: Print CPPC parameters for amd-pstate driver
>   xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for
>     amd-pstate driver

Just to clarify: While certainly fine, it is a little surprising to see
such a submission just after the submission deadline for 4.20 was passed.
This is intended for 4.21 then, I expect? Or else have you talked to the
release manager?

Jan


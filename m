Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C380C92B00B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755845.1164334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4HA-0006GU-Gq; Tue, 09 Jul 2024 06:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755845.1164334; Tue, 09 Jul 2024 06:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4HA-0006Ec-ED; Tue, 09 Jul 2024 06:24:32 +0000
Received: by outflank-mailman (input) for mailman id 755845;
 Tue, 09 Jul 2024 06:24:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR4H9-0006EW-3F
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:24:31 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e530b298-3dbb-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 08:24:28 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so13526201fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 23:24:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d61c00772sm796590a12.43.2024.07.08.23.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 23:24:27 -0700 (PDT)
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
X-Inumbo-ID: e530b298-3dbb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720506268; x=1721111068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vEwkiHNqgbSeryv9qOaLaWb0nJxDnDujfLULPhV/H+Q=;
        b=FIunBp5GAFbOqBa83i3Cn6jNRSauD9Ssp5cMraKamu4TTA6NmDjBzFx7APq0PrBvzp
         bM/aBtHs1rGNFY7Ax70azfHRGz4WW/GFfwQoYDNhs6esuXBCTR8GQl004ERSR3FIWC91
         a6CxDNljszzIlAWx2eX/GgaBgHCbQ1k07K5qMamqqqs7epESOAnVJpn7F8eBc6ucD1UX
         C1seTKNAUvmm5SL8nN6OHeIXcSIpX5lFsSkh+hTr2es9ppUMMpqc0WDOI9/+KmHTaDSa
         fyith6cjWHuSPF3PVpJZtOFFp03b0JMxvY/0DPTGRx895Suo+vBtciXufhaCaPQ24HDP
         Yscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720506268; x=1721111068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEwkiHNqgbSeryv9qOaLaWb0nJxDnDujfLULPhV/H+Q=;
        b=txyuXuZd6BE9H4KO6LyPu7hGTHCXNzwOEmhY9lhDsF7j4E+FzKmaeC6a0BFugWOiwJ
         p07Uz6ovmxWcQ2sZdxvOW2iwfE6jq6ZUNaWMEBWs6lqjuiXhLDCL6BjbbF/qlwfki7+j
         32rFUcpecwcVdtSlCilmy4ILk2lu1gRBKC5014xnI6cjlUZVHI6U8kEpJojNDYGGnRhN
         Ct9biLX/tSnm8kFO+59z1Uv25nGfpbd6MVGhbu1VbAV6jdSRtJzpeLH/K/8KM7Y+vUIU
         QlqHgw6UFcAx8D68xHhjZnAYtVHYnUQ5c2nmNDWaxx9XFfeYQM1Kob6O5cFmsdjMFzI+
         /Arg==
X-Forwarded-Encrypted: i=1; AJvYcCWTgYNykWINhU9VduA2QP7qAuQZDR4/2lPXLz1FAjI+8PwUSWVKGNlYy6BZzdq8dx8twwBGV9Ejyo51/xwsKaOgy2shTbJx5TajyyrQHm8=
X-Gm-Message-State: AOJu0YwzxZauQBtqux68bcma+o4wLeH6BAhEJim5xhguF7ZsrfUcGMvt
	DQl+mcrwSRLztcvOV+l6VZ1seqtaPHITN0Plu2EjyUry77Mu7iuaXVV1f2JAFQ==
X-Google-Smtp-Source: AGHT+IE3LF8hfpNLSMSSPWqWUkfiVGomFnbLr7m2kI1sM/4iiK+ulpaUDdPJbphGBmkrasuO35ZnGQ==
X-Received: by 2002:a2e:7c0a:0:b0:2ee:8407:2f58 with SMTP id 38308e7fff4ca-2eeb30e5110mr10075831fa.17.1720506268043;
        Mon, 08 Jul 2024 23:24:28 -0700 (PDT)
Message-ID: <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
Date: Tue, 9 Jul 2024 08:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
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
In-Reply-To: <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.07.2024 23:30, Jason Andryuk wrote:
> On 2024-07-08 05:12, Jan Beulich wrote:
>> On 08.07.2024 11:08, Roger Pau Monné wrote:
>>> On Mon, Jul 08, 2024 at 10:37:22AM +0200, Jan Beulich wrote:
>>>> On 08.07.2024 10:15, Jürgen Groß wrote:
>>>>> I've got an internal report about failures in dom0 when booting with
>>>>> Xen on a Thinkpad P14s Gen 3 AMD (kernel 6.9).
>>>>>
>>>>> With some debugging I've found that the UCSI driver seems to fail to
>>>>> map MFN feec2 as iomem, as the hypervisor is denying this mapping due
>>>>> to being part of the MSI space. The mapping attempt seems to be the
>>>>> result of an ACPI call of the UCSI driver:
>>>>>
>>>>> [   44.575345] RIP: e030:xen_mc_flush+0x1e8/0x2b0
>>>>> [   44.575418]  xen_leave_lazy_mmu+0x15/0x60
>>>>> [   44.575425]  vmap_range_noflush+0x408/0x6f0
>>>>> [   44.575438]  __ioremap_caller+0x20d/0x350
>>>>> [   44.575450]  acpi_os_map_iomem+0x1a3/0x1c0
>>>>> [   44.575454]  acpi_ex_system_memory_space_handler+0x229/0x3f0
>>>>> [   44.575464]  acpi_ev_address_space_dispatch+0x17e/0x4c0
>>>>> [   44.575474]  acpi_ex_access_region+0x28a/0x510
>>>>> [   44.575479]  acpi_ex_field_datum_io+0x95/0x5c0
>>>>> [   44.575482]  acpi_ex_extract_from_field+0x36b/0x4e0
>>>>> [   44.575490]  acpi_ex_read_data_from_field+0xcb/0x430
>>>>> [   44.575493]  acpi_ex_resolve_node_to_value+0x2e0/0x530
>>>>> [   44.575496]  acpi_ex_resolve_to_value+0x1e7/0x550
>>>>> [   44.575499]  acpi_ds_evaluate_name_path+0x107/0x170
>>>>> [   44.575505]  acpi_ds_exec_end_op+0x392/0x860
>>>>> [   44.575508]  acpi_ps_parse_loop+0x268/0xa30
>>>>> [   44.575515]  acpi_ps_parse_aml+0x221/0x5e0
>>>>> [   44.575518]  acpi_ps_execute_method+0x171/0x3e0
>>>>> [   44.575522]  acpi_ns_evaluate+0x174/0x5d0
>>>>> [   44.575525]  acpi_evaluate_object+0x167/0x440
>>>>> [   44.575529]  acpi_evaluate_dsm+0xb6/0x130
>>>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>>>> [   44.575550]  ucsi_register+0x24/0xa0
>>>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>>>> [   44.575559]  platform_probe+0x48/0x90
>>>>> [   44.575567]  really_probe+0xde/0x340
>>>>> [   44.575579]  __driver_probe_device+0x78/0x110
>>>>> [   44.575581]  driver_probe_device+0x1f/0x90
>>>>> [   44.575584]  __driver_attach+0xd2/0x1c0
>>>>> [   44.575587]  bus_for_each_dev+0x77/0xc0
>>>>> [   44.575590]  bus_add_driver+0x112/0x1f0
>>>>> [   44.575593]  driver_register+0x72/0xd0
>>>>> [   44.575600]  do_one_initcall+0x48/0x300
>>>>> [   44.575607]  do_init_module+0x60/0x220
>>>>> [   44.575615]  __do_sys_init_module+0x17f/0x1b0
>>>>> [   44.575623]  do_syscall_64+0x82/0x170
>>>>> [   44.575685] 1 of 1 multicall(s) failed: cpu 4
>>>>> [   44.575695]   call  1: op=1 result=-1 caller=xen_extend_mmu_update+0x4e/0xd0
>>>>> pars=ffff888267e25ad0 1 0 7ff0 args=9ba37a678 80000000feec2073
>>>>>
>>>>> The pte value of the mmu_update call is 80000000feec2073, which is rejected by
>>>>> the hypervisor with -EPERM.
>>>>>
>>>>> Before diving deep into the UCSI internals, is it possible that the hypervisor
>>>>> needs some update (IOW: could it be the mapping attempt should rather be
>>>>> honored, as there might be an I/O resources at this position which dom0 needs
>>>>> to access for using the related hardware?)
>>>>
>>>> Adding to Andrew's reply: Is there any BAR in the system covering that address?
>>>> Or is it rather ACPI "making up" that address (which would remind me of IO-APIC
>>>> space being accessed by certain incarnations of ACPI, resulting in similar
>>>> issues)?
>>>
>>> So you think ACPI is using some kind of backdoor to access the local
>>> APIC registers?
>>
>> No, I'm wondering if they're trying to access *something*. As it stands we
>> don't even know what kind of access is intended; all we know is that they're
>> trying to map that page (and maybe adjacent ones).
> 
>  From the backtrace, it looks like the immediate case is just trying to 
> read a 4-byte version:
> 
>  >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>  >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>  >>>> [   44.575550]  ucsi_register+0x24/0xa0
>  >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
> 
> int ucsi_register(struct ucsi *ucsi)
> {
>          int ret;
> 
>          ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
>                                sizeof(ucsi->version));
> 
> ->read being ucsi_acpi_read()
> 
> However, the driver also appears write to adjacent addresses.

There are also corresponding write functions in the driver, yes, but
ucsi_acpi_async_write() (used directly or indirectly) similarly calls
ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
ACPI object evaluation, which isn't obvious without seeing the
involved AML whether it might write said memory region. The writing
done in the write function(s) looks to be

	memcpy(ua->base + offset, val, val_len);

with their read counterpart being

	memcpy(val, ua->base + offset, val_len);

where ua->base may well be an entirely different address (looks like
it's the first of the BARs as per ucsi_acpi_probe()).

If acpi_evaluate_dsm() would only ever read the region, an option (if
all else fails) might be to similarly (to what we do for IO-APICs)
permit read accesses / mappings (by inserting the range into
mmio_ro_ranges). Yet of course first we need to better understand
what's actually going on here.

Jan


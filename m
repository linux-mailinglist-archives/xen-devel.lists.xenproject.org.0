Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594392B043
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755863.1164364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4Sl-0002IH-VA; Tue, 09 Jul 2024 06:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755863.1164364; Tue, 09 Jul 2024 06:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4Sl-0002Fi-S6; Tue, 09 Jul 2024 06:36:31 +0000
Received: by outflank-mailman (input) for mailman id 755863;
 Tue, 09 Jul 2024 06:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7TZB=OJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sR4Sk-0002EC-L8
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:36:30 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91f0d688-3dbd-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 08:36:28 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-58b0beaf703so5789973a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 23:36:28 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bbe2d006sm684055a12.31.2024.07.08.23.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 23:36:27 -0700 (PDT)
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
X-Inumbo-ID: 91f0d688-3dbd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720506987; x=1721111787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82QXH0/gTeVA0w9omUJ7STYiHJ1kyvR6i6ujfzHQfEs=;
        b=Dp3Cu1qd05IhxJHULEtDbEozoWj6yPiMwgPQ1blUdXLH1l0UI8O3EqKvPKJ0DqZcLe
         DUGZ7YNw3j2ygYPVvPtUkxiuYljHqiV9y2fwmlCHeTLfYSVa73QUTMSu/3+WhMHjoQ07
         1lNeLwaNGwNNLIOj5zaTG8Zv6/eWNSCTe9gFHL1H99w/AzWfMruYuhpRKCvTQBJf5t4r
         1vhxjzWzK0UGtyIWFeqm7k/NBbpdGUZ8zc/D+5VAiBMVVw/m5UwRB6v7nkfH0bAvEys5
         b6YNoVBM0ePhb7oSE/Uir89Xekhnzv8rxcOOf1ob09UrrGbZDT0DbZlmIPUk1EwWfazb
         MbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720506987; x=1721111787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82QXH0/gTeVA0w9omUJ7STYiHJ1kyvR6i6ujfzHQfEs=;
        b=pojrAw0YTo5N5M2O9bCMch4Pm3rJgJgWNE9YHltu6ypiIAmsBd9Rwu/comP9sqnU/c
         LqDo+zsdqp63yN4kGHwJ+2sUOI4h5VXiRY37lVNClEL5kE+aswSvsNQ16HQZ6Sh7M1O0
         /WEgkuPLjeKdvLV/gHRUWWllfMFqo/96v2fZCu5vkV5vAbzwa5lQLK4kCdHy6aWHDRoP
         3JFrso2AV8ML5fcIUlMNayOi4liyCu82i5JKdhmMRTAbHD++KjpIJD0Ae8bDN+4Gubru
         P+voBc6TrOPWxQCLq+FvGlMfnh2tpI1YSASP0l823Z/xbgoylmopTUYKMctrtq1+LVMY
         LD5A==
X-Gm-Message-State: AOJu0Ywv8jMbSATR5RSELBK/ia7yCqrOmCAmGj4Bn0ujrIdG18RaOFi9
	fBbdYB2ezSuUrFlB1IVc/KXlap+6i+QzaspFyLXEUPZxK+cAbkTjDBisEIk6pOQ=
X-Google-Smtp-Source: AGHT+IFPynBlJbGObMRCQkFZ+bVoZic/CQuGyVAm8tfcS1cJvWOQfm3mnmkNWLQ4kRVeJZp6WmOgqA==
X-Received: by 2002:a05:6402:358e:b0:57c:9d54:67db with SMTP id 4fb4d7f45d1cf-594ba98f455mr1199148a12.9.1720506987340;
        Mon, 08 Jul 2024 23:36:27 -0700 (PDT)
Message-ID: <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
Date: Tue, 9 Jul 2024 08:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.07.24 08:24, Jan Beulich wrote:
> On 08.07.2024 23:30, Jason Andryuk wrote:
>> On 2024-07-08 05:12, Jan Beulich wrote:
>>> On 08.07.2024 11:08, Roger Pau Monné wrote:
>>>> On Mon, Jul 08, 2024 at 10:37:22AM +0200, Jan Beulich wrote:
>>>>> On 08.07.2024 10:15, Jürgen Groß wrote:
>>>>>> I've got an internal report about failures in dom0 when booting with
>>>>>> Xen on a Thinkpad P14s Gen 3 AMD (kernel 6.9).
>>>>>>
>>>>>> With some debugging I've found that the UCSI driver seems to fail to
>>>>>> map MFN feec2 as iomem, as the hypervisor is denying this mapping due
>>>>>> to being part of the MSI space. The mapping attempt seems to be the
>>>>>> result of an ACPI call of the UCSI driver:
>>>>>>
>>>>>> [   44.575345] RIP: e030:xen_mc_flush+0x1e8/0x2b0
>>>>>> [   44.575418]  xen_leave_lazy_mmu+0x15/0x60
>>>>>> [   44.575425]  vmap_range_noflush+0x408/0x6f0
>>>>>> [   44.575438]  __ioremap_caller+0x20d/0x350
>>>>>> [   44.575450]  acpi_os_map_iomem+0x1a3/0x1c0
>>>>>> [   44.575454]  acpi_ex_system_memory_space_handler+0x229/0x3f0
>>>>>> [   44.575464]  acpi_ev_address_space_dispatch+0x17e/0x4c0
>>>>>> [   44.575474]  acpi_ex_access_region+0x28a/0x510
>>>>>> [   44.575479]  acpi_ex_field_datum_io+0x95/0x5c0
>>>>>> [   44.575482]  acpi_ex_extract_from_field+0x36b/0x4e0
>>>>>> [   44.575490]  acpi_ex_read_data_from_field+0xcb/0x430
>>>>>> [   44.575493]  acpi_ex_resolve_node_to_value+0x2e0/0x530
>>>>>> [   44.575496]  acpi_ex_resolve_to_value+0x1e7/0x550
>>>>>> [   44.575499]  acpi_ds_evaluate_name_path+0x107/0x170
>>>>>> [   44.575505]  acpi_ds_exec_end_op+0x392/0x860
>>>>>> [   44.575508]  acpi_ps_parse_loop+0x268/0xa30
>>>>>> [   44.575515]  acpi_ps_parse_aml+0x221/0x5e0
>>>>>> [   44.575518]  acpi_ps_execute_method+0x171/0x3e0
>>>>>> [   44.575522]  acpi_ns_evaluate+0x174/0x5d0
>>>>>> [   44.575525]  acpi_evaluate_object+0x167/0x440
>>>>>> [   44.575529]  acpi_evaluate_dsm+0xb6/0x130
>>>>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>>>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>>>>> [   44.575550]  ucsi_register+0x24/0xa0
>>>>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>>>>> [   44.575559]  platform_probe+0x48/0x90
>>>>>> [   44.575567]  really_probe+0xde/0x340
>>>>>> [   44.575579]  __driver_probe_device+0x78/0x110
>>>>>> [   44.575581]  driver_probe_device+0x1f/0x90
>>>>>> [   44.575584]  __driver_attach+0xd2/0x1c0
>>>>>> [   44.575587]  bus_for_each_dev+0x77/0xc0
>>>>>> [   44.575590]  bus_add_driver+0x112/0x1f0
>>>>>> [   44.575593]  driver_register+0x72/0xd0
>>>>>> [   44.575600]  do_one_initcall+0x48/0x300
>>>>>> [   44.575607]  do_init_module+0x60/0x220
>>>>>> [   44.575615]  __do_sys_init_module+0x17f/0x1b0
>>>>>> [   44.575623]  do_syscall_64+0x82/0x170
>>>>>> [   44.575685] 1 of 1 multicall(s) failed: cpu 4
>>>>>> [   44.575695]   call  1: op=1 result=-1 caller=xen_extend_mmu_update+0x4e/0xd0
>>>>>> pars=ffff888267e25ad0 1 0 7ff0 args=9ba37a678 80000000feec2073
>>>>>>
>>>>>> The pte value of the mmu_update call is 80000000feec2073, which is rejected by
>>>>>> the hypervisor with -EPERM.
>>>>>>
>>>>>> Before diving deep into the UCSI internals, is it possible that the hypervisor
>>>>>> needs some update (IOW: could it be the mapping attempt should rather be
>>>>>> honored, as there might be an I/O resources at this position which dom0 needs
>>>>>> to access for using the related hardware?)
>>>>>
>>>>> Adding to Andrew's reply: Is there any BAR in the system covering that address?
>>>>> Or is it rather ACPI "making up" that address (which would remind me of IO-APIC
>>>>> space being accessed by certain incarnations of ACPI, resulting in similar
>>>>> issues)?
>>>>
>>>> So you think ACPI is using some kind of backdoor to access the local
>>>> APIC registers?
>>>
>>> No, I'm wondering if they're trying to access *something*. As it stands we
>>> don't even know what kind of access is intended; all we know is that they're
>>> trying to map that page (and maybe adjacent ones).
>>
>>   From the backtrace, it looks like the immediate case is just trying to
>> read a 4-byte version:
>>
>>   >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>   >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>   >>>> [   44.575550]  ucsi_register+0x24/0xa0
>>   >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>
>> int ucsi_register(struct ucsi *ucsi)
>> {
>>           int ret;
>>
>>           ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
>>                                 sizeof(ucsi->version));
>>
>> ->read being ucsi_acpi_read()
>>
>> However, the driver also appears write to adjacent addresses.
> 
> There are also corresponding write functions in the driver, yes, but
> ucsi_acpi_async_write() (used directly or indirectly) similarly calls
> ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
> ACPI object evaluation, which isn't obvious without seeing the
> involved AML whether it might write said memory region.

I guess an ACPI dump would help here?

> The writing
> done in the write function(s) looks to be
> 
> 	memcpy(ua->base + offset, val, val_len);
> 
> with their read counterpart being
> 
> 	memcpy(val, ua->base + offset, val_len);
> 
> where ua->base may well be an entirely different address (looks like
> it's the first of the BARs as per ucsi_acpi_probe()).

According to the lspci -v output there are no BARs in the MSI space:

66:00.6 USB controller: Advanced Micro Devices, Inc. [AMD] Pink Sardine 
USB4/Thunderbolt NHI controller #2 (prog-if 40 [USB4 Host Interface])
	Subsystem: Lenovo Device 50d9
	Flags: bus master, fast devsel, latency 0, IRQ 71
	Memory at 78a00000 (64-bit, non-prefetchable) [size=512K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
	Capabilities: [64] Express Endpoint, MSI 00
	Capabilities: [a0] MSI: Enable- Count=1/16 Maskable- 64bit+
	Capabilities: [c0] MSI-X: Enable+ Count=16 Masked-
	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [2a0] Access Control Services
	Kernel driver in use: thunderbolt
	Kernel modules: thunderbolt

> If acpi_evaluate_dsm() would only ever read the region, an option (if
> all else fails) might be to similarly (to what we do for IO-APICs)
> permit read accesses / mappings (by inserting the range into
> mmio_ro_ranges). Yet of course first we need to better understand
> what's actually going on here.

As the mapping is currently trying to allow write access, too, the kernel
would need some modification as well.


Juergen


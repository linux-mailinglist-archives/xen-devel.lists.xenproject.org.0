Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A5929E7F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 10:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755163.1163429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQk36-0000fB-LI; Mon, 08 Jul 2024 08:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755163.1163429; Mon, 08 Jul 2024 08:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQk36-0000cE-IG; Mon, 08 Jul 2024 08:48:40 +0000
Received: by outflank-mailman (input) for mailman id 755163;
 Mon, 08 Jul 2024 08:48:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jnsg=OI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sQk35-0000c8-6G
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 08:48:39 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de10f4f5-3d06-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 10:48:37 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-367a9ab4d81so1582915f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 01:48:37 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367a40a6d4bsm8883267f8f.51.2024.07.08.01.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 01:48:37 -0700 (PDT)
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
X-Inumbo-ID: de10f4f5-3d06-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720428517; x=1721033317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N3H/7sIcu6e8tjUnpwSrY0BYJ+kCDOUC8GfFTiWu95U=;
        b=HriTI3Kq7zjiS7G187A6tNHDlfP79T5CVppmaJV6pRPcGFAzj/MZfQWqAB5rxsOqH1
         YJy02kU91ArEdc+6O9kf1BJxrlQynlna8BgoQ3msawmhFNGrD2q0hxtmP2I6ZK94Em39
         Nwfyw/uV1AqILLA/BAuWp6lfGCmwQk26SRLvzO+wVBOPb8DUgLOqIHVSXrQa4nykfWOk
         pfL9+yw4HP+DM6uRG4SLSOZzWvwPOVUNBHM0f0KMZBJukkP+P1rihX3iqWWxBqRhTzcA
         4I75Y+ehqZehuBVSeQzEGqRoZeXxjkqlEplBA06kkN21XQcSal1nE1cmsrngLcmQrDEq
         H1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720428517; x=1721033317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3H/7sIcu6e8tjUnpwSrY0BYJ+kCDOUC8GfFTiWu95U=;
        b=cm7L5j+nIAH9jULMJtGc512sfeMNg3N6kKuPV6GzjytZjxXz+hy/VyYkyph8KGpZql
         TJv+8NQIjC0m6BZx2AalSgPdmX1GiAaXAo9lAiHa1Sibp6vDdLJQToCFcQgvnfemqbT2
         NSru2aKKCNPmcXk9axrLq0jA+pNi+iSY23vg825823wPPSKT1Wn34tMVTLb8XBk4F3/g
         cb866kjhHCIW2IIh3mittdrC5y8qJ4fB/3MmneCqcggAxL7ych0fxfKumu/9424RlntT
         wIRMsEavROWp5HcgTXXjkTJdd24rk8kHNyj4Ko1eZ9Lz4HvZtb1V/H7w86P0LcJHE4ip
         Q+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZpwtlJcHy4/XWkeZPMHe/6qLdrV0JeNTfoevY1iLhM/afTZkLkW1rrFXWzK+Y84P251CLT/32Llme+ZQTm0LZSo3bHeb1vnu4trHsH4M=
X-Gm-Message-State: AOJu0Yz1CO2R1Av/RH0KBvKkruVYPi1EdXnkZZ/oGdZEP7eC/3GAJdh9
	Vpar2gDObYc2K8gv/C3irbtrkt521TN93o4Kd+p5BxUl9UlIIMNE1Am/f42gliw=
X-Google-Smtp-Source: AGHT+IHbkkLEbAz/wC+xNT7hJZLHErhZKKCz6adcbnP1BQz3VeonBrLsWazKM7tttKEJxugt+eMPnw==
X-Received: by 2002:a5d:5847:0:b0:367:84fe:cd79 with SMTP id ffacd0b85a97d-367c8f85932mr793258f8f.49.1720428517242;
        Mon, 08 Jul 2024 01:48:37 -0700 (PDT)
Message-ID: <9d0adb5a-4506-42d4-a3ee-59998352f2d1@suse.com>
Date: Mon, 8 Jul 2024 10:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <fed11761-e609-4308-a161-2fc2e64c6898@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <fed11761-e609-4308-a161-2fc2e64c6898@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08.07.24 10:32, Andrew Cooper wrote:
> On 08/07/2024 9:15 am, Jürgen Groß wrote:
>> I've got an internal report about failures in dom0 when booting with
>> Xen on a Thinkpad P14s Gen 3 AMD (kernel 6.9).
>>
>> With some debugging I've found that the UCSI driver seems to fail to
>> map MFN feec2 as iomem, as the hypervisor is denying this mapping due
>> to being part of the MSI space. The mapping attempt seems to be the
>> result of an ACPI call of the UCSI driver:
>>
>> [   44.575345] RIP: e030:xen_mc_flush+0x1e8/0x2b0
>> [   44.575418]  xen_leave_lazy_mmu+0x15/0x60
>> [   44.575425]  vmap_range_noflush+0x408/0x6f0
>> [   44.575438]  __ioremap_caller+0x20d/0x350
>> [   44.575450]  acpi_os_map_iomem+0x1a3/0x1c0
>> [   44.575454]  acpi_ex_system_memory_space_handler+0x229/0x3f0
>> [   44.575464]  acpi_ev_address_space_dispatch+0x17e/0x4c0
>> [   44.575474]  acpi_ex_access_region+0x28a/0x510
>> [   44.575479]  acpi_ex_field_datum_io+0x95/0x5c0
>> [   44.575482]  acpi_ex_extract_from_field+0x36b/0x4e0
>> [   44.575490]  acpi_ex_read_data_from_field+0xcb/0x430
>> [   44.575493]  acpi_ex_resolve_node_to_value+0x2e0/0x530
>> [   44.575496]  acpi_ex_resolve_to_value+0x1e7/0x550
>> [   44.575499]  acpi_ds_evaluate_name_path+0x107/0x170
>> [   44.575505]  acpi_ds_exec_end_op+0x392/0x860
>> [   44.575508]  acpi_ps_parse_loop+0x268/0xa30
>> [   44.575515]  acpi_ps_parse_aml+0x221/0x5e0
>> [   44.575518]  acpi_ps_execute_method+0x171/0x3e0
>> [   44.575522]  acpi_ns_evaluate+0x174/0x5d0
>> [   44.575525]  acpi_evaluate_object+0x167/0x440
>> [   44.575529]  acpi_evaluate_dsm+0xb6/0x130
>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>> [   44.575550]  ucsi_register+0x24/0xa0
>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>> [   44.575559]  platform_probe+0x48/0x90
>> [   44.575567]  really_probe+0xde/0x340
>> [   44.575579]  __driver_probe_device+0x78/0x110
>> [   44.575581]  driver_probe_device+0x1f/0x90
>> [   44.575584]  __driver_attach+0xd2/0x1c0
>> [   44.575587]  bus_for_each_dev+0x77/0xc0
>> [   44.575590]  bus_add_driver+0x112/0x1f0
>> [   44.575593]  driver_register+0x72/0xd0
>> [   44.575600]  do_one_initcall+0x48/0x300
>> [   44.575607]  do_init_module+0x60/0x220
>> [   44.575615]  __do_sys_init_module+0x17f/0x1b0
>> [   44.575623]  do_syscall_64+0x82/0x170
>> [   44.575685] 1 of 1 multicall(s) failed: cpu 4
>> [   44.575695]   call  1: op=1 result=-1
>> caller=xen_extend_mmu_update+0x4e/0xd0 pars=ffff888267e25ad0 1 0 7ff0
>> args=9ba37a678 80000000feec2073
>>
>> The pte value of the mmu_update call is 80000000feec2073, which is
>> rejected by
>> the hypervisor with -EPERM.
>>
>> Before diving deep into the UCSI internals, is it possible that the
>> hypervisor
>> needs some update (IOW: could it be the mapping attempt should rather be
>> honored, as there might be an I/O resources at this position which
>> dom0 needs
>> to access for using the related hardware?)
>>
> 
> It's only MSI space for external accesses.  For CPU accesses its other
> things, notably the LAPIC MMIO window.
> 
> Do we know what this range is supposed to be for?  I do find it
> surprising for a USB BAR to be here.

I have requested more information from a bare metal boot, especially
/proc/iomem and output of lspci -v.


Juergen



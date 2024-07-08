Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4845D929E52
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 10:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755147.1163409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQjnj-0005y4-32; Mon, 08 Jul 2024 08:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755147.1163409; Mon, 08 Jul 2024 08:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQjnj-0005vu-0E; Mon, 08 Jul 2024 08:32:47 +0000
Received: by outflank-mailman (input) for mailman id 755147;
 Mon, 08 Jul 2024 08:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQjni-0005vo-DY
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 08:32:46 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a622157a-3d04-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 10:32:44 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4266ea6a488so81135e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 01:32:44 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679c03fb09sm10552898f8f.70.2024.07.08.01.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 01:32:43 -0700 (PDT)
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
X-Inumbo-ID: a622157a-3d04-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720427564; x=1721032364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d07enfS5AH35cmYfa6m2rP8erM86X3kGx3eSc+Lg2zE=;
        b=L4rF6dWRF93AFrxPYEuUpxjL1ewGROlwvaqqHFVi11CdnSHl+xvyEJ9mPQYro+i0r4
         WoqiiNQ1QAAcxuRb9J1GwXQdQHP9e90jUQUTDm48nAfZIbtjdo7OhjFvPaTV4fIoLiGo
         YYjtJPEWjAYOWrRDpFXOUNGUZQ7nQ0bNXmGq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720427564; x=1721032364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d07enfS5AH35cmYfa6m2rP8erM86X3kGx3eSc+Lg2zE=;
        b=Vzr6HyRX3B2T/R6TvbiSIfCplsEvhAxeYAh7kBMXiNhBb4jayB2Ffa0W4CheLuOISg
         yQZLpFG1vixBRr3qxTzgYYNQ9w7xU3kOzt6ij7+jH+/i/okAOEQ6PssdPxAlDgdRLz0v
         aPWP049IKgTtwxyPnQOIQ+OPTqJc9pO/Q33UqgCCMshLja88ZXXREYsoBIncjDSc9wQO
         C7hmxjrph2OQBIEISPHr2KETS8lEPLa/6flVnMPONcscuwCZytWMgaYiQQz2/RU56i7C
         9uDFw/Mb04EgVnfClKuyWlaH86wb2wmrf5djAeC6jjNc6FZnD3U76B2R1IOUDriYqBZ/
         3BDw==
X-Forwarded-Encrypted: i=1; AJvYcCUC30HHHKKyTOwQNf8gy65MeW6c0IcBcHPqpMp3WcAFX7AD8qdAtlDYIyDTGs72H39yZswYdqFoYpjuaypW9rywdt4+H1+K+haW1EZeyD4=
X-Gm-Message-State: AOJu0YyOEP/s8kHGk7dgYmXUitgjknxWKItQeJqsO+TYPoUIMt1mvkss
	U297v1dnDycli/hERftHni5vy9zScHbGGvLC4HIJld/ZtfaG4MG+5XrEUIGwsVA=
X-Google-Smtp-Source: AGHT+IFXcdI78kAQtV2LTIQKWnILcOMSxEl5h2OF7GQ2LoGkx5VV0Kw4pYgSjcaiQdLWu2StJeXVMg==
X-Received: by 2002:a7b:cd98:0:b0:426:6158:5b09 with SMTP id 5b1f17b1804b1-42661585c1fmr41809525e9.17.1720427564270;
        Mon, 08 Jul 2024 01:32:44 -0700 (PDT)
Message-ID: <fed11761-e609-4308-a161-2fc2e64c6898@citrix.com>
Date: Mon, 8 Jul 2024 09:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/07/2024 9:15 am, Jürgen Groß wrote:
> I've got an internal report about failures in dom0 when booting with
> Xen on a Thinkpad P14s Gen 3 AMD (kernel 6.9).
>
> With some debugging I've found that the UCSI driver seems to fail to
> map MFN feec2 as iomem, as the hypervisor is denying this mapping due
> to being part of the MSI space. The mapping attempt seems to be the
> result of an ACPI call of the UCSI driver:
>
> [   44.575345] RIP: e030:xen_mc_flush+0x1e8/0x2b0
> [   44.575418]  xen_leave_lazy_mmu+0x15/0x60
> [   44.575425]  vmap_range_noflush+0x408/0x6f0
> [   44.575438]  __ioremap_caller+0x20d/0x350
> [   44.575450]  acpi_os_map_iomem+0x1a3/0x1c0
> [   44.575454]  acpi_ex_system_memory_space_handler+0x229/0x3f0
> [   44.575464]  acpi_ev_address_space_dispatch+0x17e/0x4c0
> [   44.575474]  acpi_ex_access_region+0x28a/0x510
> [   44.575479]  acpi_ex_field_datum_io+0x95/0x5c0
> [   44.575482]  acpi_ex_extract_from_field+0x36b/0x4e0
> [   44.575490]  acpi_ex_read_data_from_field+0xcb/0x430
> [   44.575493]  acpi_ex_resolve_node_to_value+0x2e0/0x530
> [   44.575496]  acpi_ex_resolve_to_value+0x1e7/0x550
> [   44.575499]  acpi_ds_evaluate_name_path+0x107/0x170
> [   44.575505]  acpi_ds_exec_end_op+0x392/0x860
> [   44.575508]  acpi_ps_parse_loop+0x268/0xa30
> [   44.575515]  acpi_ps_parse_aml+0x221/0x5e0
> [   44.575518]  acpi_ps_execute_method+0x171/0x3e0
> [   44.575522]  acpi_ns_evaluate+0x174/0x5d0
> [   44.575525]  acpi_evaluate_object+0x167/0x440
> [   44.575529]  acpi_evaluate_dsm+0xb6/0x130
> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
> [   44.575546]  ucsi_acpi_read+0x2e/0x60
> [   44.575550]  ucsi_register+0x24/0xa0
> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
> [   44.575559]  platform_probe+0x48/0x90
> [   44.575567]  really_probe+0xde/0x340
> [   44.575579]  __driver_probe_device+0x78/0x110
> [   44.575581]  driver_probe_device+0x1f/0x90
> [   44.575584]  __driver_attach+0xd2/0x1c0
> [   44.575587]  bus_for_each_dev+0x77/0xc0
> [   44.575590]  bus_add_driver+0x112/0x1f0
> [   44.575593]  driver_register+0x72/0xd0
> [   44.575600]  do_one_initcall+0x48/0x300
> [   44.575607]  do_init_module+0x60/0x220
> [   44.575615]  __do_sys_init_module+0x17f/0x1b0
> [   44.575623]  do_syscall_64+0x82/0x170
> [   44.575685] 1 of 1 multicall(s) failed: cpu 4
> [   44.575695]   call  1: op=1 result=-1
> caller=xen_extend_mmu_update+0x4e/0xd0 pars=ffff888267e25ad0 1 0 7ff0
> args=9ba37a678 80000000feec2073
>
> The pte value of the mmu_update call is 80000000feec2073, which is
> rejected by
> the hypervisor with -EPERM.
>
> Before diving deep into the UCSI internals, is it possible that the
> hypervisor
> needs some update (IOW: could it be the mapping attempt should rather be
> honored, as there might be an I/O resources at this position which
> dom0 needs
> to access for using the related hardware?)
>

It's only MSI space for external accesses.  For CPU accesses its other
things, notably the LAPIC MMIO window.

Do we know what this range is supposed to be for?  I do find it
surprising for a USB BAR to be here.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B94929E24
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 10:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755139.1163399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQjXN-0002O7-P8; Mon, 08 Jul 2024 08:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755139.1163399; Mon, 08 Jul 2024 08:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQjXN-0002Mb-MT; Mon, 08 Jul 2024 08:15:53 +0000
Received: by outflank-mailman (input) for mailman id 755139;
 Mon, 08 Jul 2024 08:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jnsg=OI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sQjXM-0002MT-Kl
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 08:15:52 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49dc1299-3d02-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 10:15:51 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52ea2f58448so4397809e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 01:15:51 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266c3650f4sm14674445e9.1.2024.07.08.01.15.50
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 01:15:50 -0700 (PDT)
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
X-Inumbo-ID: 49dc1299-3d02-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720426550; x=1721031350; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0PmZbE58TcaC2n1hmm/HVpvSJXSTp9dGOYpPIBbQQc=;
        b=J3tY2f4LanAIyYIrSVIxKUOzlowfRqkb8bW52T8llkeIeSfgN18j+Q+yF5agDY2NNR
         wR4XpFCSTpXa+Zo4/gRxWm1XIOfPhZSqKv28JjF0jiAbpc3ASA1Qi/cAP/aD3VwzWXv6
         H6KaRj8t0tXh/U1McnGHLl6/1HFytxNDlPZzmLvdUHF5q/iA17ziBASTPwtjgO7a+e8E
         wUZVy/5sbk7zaxXI3WpQFDTXpB/ZsdGcWpjfLnGeAPD5ndUYy3DB4CIIuui3dn3KZU2Z
         IlOR/64vi0276Kz8wGYz3JDDjd4kBgHNTFoPFP7n+I1/+FBgrMR3kpZNu2V3QnCM54U2
         tAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720426550; x=1721031350;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0PmZbE58TcaC2n1hmm/HVpvSJXSTp9dGOYpPIBbQQc=;
        b=M3q8rjMR0Mtvo/N5GyR+4hnmbghv0aEcprxfPgdv2AWIphBVFw3hyI02UYDVUNM+zA
         x9K/cpPq0a9qwiwydNqG+fufhTAlBGU5/lYJXq+bXtLJGVvk2aVQaaT30WbhQozbrNTg
         cYCUiLLV56D2sQvihHNyrIt5BDLGx+31MhtLh9pW1vhYm7q+D2vif2gIjO5N32wpVnoc
         sUePDq1VLw4obD31HxosnDm4wCaXhWbuw/jJHjk75tyeQrT1HXaLr+SdmaccyRL1ZYvb
         h2N/9RrC8+TDeqgi0dJozi/q77xjw2nyTKrgj923znAEPaTiOBcg32lC+2zDzEzS1bfB
         rnJA==
X-Gm-Message-State: AOJu0Yz0kR2LyIAN1HvENzR/y7kxblFUE8V2SH7Z3vdPAJxjS2ZMobh6
	Tjd9TjRWcRkHajjkNAvNJs8C+QBvnSJsm2gEERdVykeG4ujmNQGEF6OlpT1KnI6BFM3Sp057jVi
	7
X-Google-Smtp-Source: AGHT+IEX37lQWKkdJq/CJpfgf/8Wu7Y0RdmLTi5amiTphGzrOOx/4bxJglXFexcs8L9rArfqhcMG5Q==
X-Received: by 2002:ac2:5e2a:0:b0:52c:e112:4b0c with SMTP id 2adb3069b0e04-52ea06133f1mr5880432e87.9.1720426550482;
        Mon, 08 Jul 2024 01:15:50 -0700 (PDT)
Message-ID: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
Date: Mon, 8 Jul 2024 10:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Problems in PV dom0 on recent x86 hardware
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I've got an internal report about failures in dom0 when booting with
Xen on a Thinkpad P14s Gen 3 AMD (kernel 6.9).

With some debugging I've found that the UCSI driver seems to fail to
map MFN feec2 as iomem, as the hypervisor is denying this mapping due
to being part of the MSI space. The mapping attempt seems to be the
result of an ACPI call of the UCSI driver:

[   44.575345] RIP: e030:xen_mc_flush+0x1e8/0x2b0
[   44.575418]  xen_leave_lazy_mmu+0x15/0x60
[   44.575425]  vmap_range_noflush+0x408/0x6f0
[   44.575438]  __ioremap_caller+0x20d/0x350
[   44.575450]  acpi_os_map_iomem+0x1a3/0x1c0
[   44.575454]  acpi_ex_system_memory_space_handler+0x229/0x3f0
[   44.575464]  acpi_ev_address_space_dispatch+0x17e/0x4c0
[   44.575474]  acpi_ex_access_region+0x28a/0x510
[   44.575479]  acpi_ex_field_datum_io+0x95/0x5c0
[   44.575482]  acpi_ex_extract_from_field+0x36b/0x4e0
[   44.575490]  acpi_ex_read_data_from_field+0xcb/0x430
[   44.575493]  acpi_ex_resolve_node_to_value+0x2e0/0x530
[   44.575496]  acpi_ex_resolve_to_value+0x1e7/0x550
[   44.575499]  acpi_ds_evaluate_name_path+0x107/0x170
[   44.575505]  acpi_ds_exec_end_op+0x392/0x860
[   44.575508]  acpi_ps_parse_loop+0x268/0xa30
[   44.575515]  acpi_ps_parse_aml+0x221/0x5e0
[   44.575518]  acpi_ps_execute_method+0x171/0x3e0
[   44.575522]  acpi_ns_evaluate+0x174/0x5d0
[   44.575525]  acpi_evaluate_object+0x167/0x440
[   44.575529]  acpi_evaluate_dsm+0xb6/0x130
[   44.575541]  ucsi_acpi_dsm+0x53/0x80
[   44.575546]  ucsi_acpi_read+0x2e/0x60
[   44.575550]  ucsi_register+0x24/0xa0
[   44.575555]  ucsi_acpi_probe+0x162/0x1e3
[   44.575559]  platform_probe+0x48/0x90
[   44.575567]  really_probe+0xde/0x340
[   44.575579]  __driver_probe_device+0x78/0x110
[   44.575581]  driver_probe_device+0x1f/0x90
[   44.575584]  __driver_attach+0xd2/0x1c0
[   44.575587]  bus_for_each_dev+0x77/0xc0
[   44.575590]  bus_add_driver+0x112/0x1f0
[   44.575593]  driver_register+0x72/0xd0
[   44.575600]  do_one_initcall+0x48/0x300
[   44.575607]  do_init_module+0x60/0x220
[   44.575615]  __do_sys_init_module+0x17f/0x1b0
[   44.575623]  do_syscall_64+0x82/0x170
[   44.575685] 1 of 1 multicall(s) failed: cpu 4
[   44.575695]   call  1: op=1 result=-1 caller=xen_extend_mmu_update+0x4e/0xd0 
pars=ffff888267e25ad0 1 0 7ff0 args=9ba37a678 80000000feec2073

The pte value of the mmu_update call is 80000000feec2073, which is rejected by
the hypervisor with -EPERM.

Before diving deep into the UCSI internals, is it possible that the hypervisor
needs some update (IOW: could it be the mapping attempt should rather be
honored, as there might be an I/O resources at this position which dom0 needs
to access for using the related hardware?)


Juergen


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B1E929EAC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755189.1163462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkMM-0005Di-PO; Mon, 08 Jul 2024 09:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755189.1163462; Mon, 08 Jul 2024 09:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkMM-0005BC-Mo; Mon, 08 Jul 2024 09:08:34 +0000
Received: by outflank-mailman (input) for mailman id 755189;
 Mon, 08 Jul 2024 09:08:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFgZ=OI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sQkML-0005B6-RQ
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:08:33 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a649f455-3d09-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 11:08:32 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52ccc40e72eso2006834e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:08:32 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367960deabdsm12331131f8f.24.2024.07.08.02.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 02:08:31 -0700 (PDT)
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
X-Inumbo-ID: a649f455-3d09-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720429712; x=1721034512; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvuJUQX81KBl0J8VWW4TsRBecxF+LQVa0Tw/R5s080A=;
        b=lPcba13lg9Lb2TpiOSpA08Q8Wo6SrNsVsBQweBx7fzj01xsf2BO6JyHB3ve2wK51Bg
         2DKOg+MIb44v20iQOPgq6t9QFnRuG9qd7FuZzz1w6yrNzmeOoCsPQhgin7BEi/5KnMdM
         MG7iC+++hwxZKjFfzz/bwLqNNYU8iDWpOb2gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720429712; x=1721034512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvuJUQX81KBl0J8VWW4TsRBecxF+LQVa0Tw/R5s080A=;
        b=HG2hoqj5Nqr0Q7Cf9CBaetcmUFYmiVmDo44yPVvm9LVfhFZ+9H8QrHH/ZmFD4vrlcY
         CNT1h1/7EUEIxTtfOu34HdFKBb6kdeTbb9n8XkkJ94CJc+DkOYgHe7UMyV53moHwszMl
         mw6jPM/eLnFfWOScQtVmCwX9OnOTbpjZwM8Hx/wPxTum1UAZjWTobDzE/NMYVD08gYuZ
         bNjxCxE5nmFiXfrsQ9IS9w2CcNy4XUM1ybGOmaqHy7Ce5EvG7IyEzczaz6lQfWeqjhXP
         iE2Mpd1fAH4GkR+A/G0idfSoY/sVqSnd8GSPt1NN+RXTU8sJZj+msc7E79EzQk3rSR4z
         SInA==
X-Forwarded-Encrypted: i=1; AJvYcCW8AqRopEHViU4E8qZ45bFg9vTna72ovoi7h3yjSkz4YBjOJ14NtSXK3P7vjpTFxnyZTBZM+89/UCopMP32TS5H8ekPigV4yaEk4Vcx9vk=
X-Gm-Message-State: AOJu0YwHsUlHcj+UTEiGxYbj5NK91ZSc+j2RicBfU7LWYo31gT8kmAnI
	YlZvPbnk2BVHX03IlmaOZfRhzVygqnQFfNz9caRhVmKSjT82VUAjigk49uHuwMzCbq0D65VfP/V
	L
X-Google-Smtp-Source: AGHT+IHwgCIyXWOzb/B5eu9AeMpyElJOnKEVh4bDtkL/1IrUu8EzOsYBISroqTjK2yG9CB8I9CWChw==
X-Received: by 2002:ac2:5924:0:b0:52c:d20b:22c8 with SMTP id 2adb3069b0e04-52ea06cf08cmr8005932e87.64.1720429711866;
        Mon, 08 Jul 2024 02:08:31 -0700 (PDT)
Date: Mon, 8 Jul 2024 11:08:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Problems in PV dom0 on recent x86 hardware
Message-ID: <ZousjqOAFJgO6681@macbook.local>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>

On Mon, Jul 08, 2024 at 10:37:22AM +0200, Jan Beulich wrote:
> On 08.07.2024 10:15, Jürgen Groß wrote:
> > I've got an internal report about failures in dom0 when booting with
> > Xen on a Thinkpad P14s Gen 3 AMD (kernel 6.9).
> > 
> > With some debugging I've found that the UCSI driver seems to fail to
> > map MFN feec2 as iomem, as the hypervisor is denying this mapping due
> > to being part of the MSI space. The mapping attempt seems to be the
> > result of an ACPI call of the UCSI driver:
> > 
> > [   44.575345] RIP: e030:xen_mc_flush+0x1e8/0x2b0
> > [   44.575418]  xen_leave_lazy_mmu+0x15/0x60
> > [   44.575425]  vmap_range_noflush+0x408/0x6f0
> > [   44.575438]  __ioremap_caller+0x20d/0x350
> > [   44.575450]  acpi_os_map_iomem+0x1a3/0x1c0
> > [   44.575454]  acpi_ex_system_memory_space_handler+0x229/0x3f0
> > [   44.575464]  acpi_ev_address_space_dispatch+0x17e/0x4c0
> > [   44.575474]  acpi_ex_access_region+0x28a/0x510
> > [   44.575479]  acpi_ex_field_datum_io+0x95/0x5c0
> > [   44.575482]  acpi_ex_extract_from_field+0x36b/0x4e0
> > [   44.575490]  acpi_ex_read_data_from_field+0xcb/0x430
> > [   44.575493]  acpi_ex_resolve_node_to_value+0x2e0/0x530
> > [   44.575496]  acpi_ex_resolve_to_value+0x1e7/0x550
> > [   44.575499]  acpi_ds_evaluate_name_path+0x107/0x170
> > [   44.575505]  acpi_ds_exec_end_op+0x392/0x860
> > [   44.575508]  acpi_ps_parse_loop+0x268/0xa30
> > [   44.575515]  acpi_ps_parse_aml+0x221/0x5e0
> > [   44.575518]  acpi_ps_execute_method+0x171/0x3e0
> > [   44.575522]  acpi_ns_evaluate+0x174/0x5d0
> > [   44.575525]  acpi_evaluate_object+0x167/0x440
> > [   44.575529]  acpi_evaluate_dsm+0xb6/0x130
> > [   44.575541]  ucsi_acpi_dsm+0x53/0x80
> > [   44.575546]  ucsi_acpi_read+0x2e/0x60
> > [   44.575550]  ucsi_register+0x24/0xa0
> > [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
> > [   44.575559]  platform_probe+0x48/0x90
> > [   44.575567]  really_probe+0xde/0x340
> > [   44.575579]  __driver_probe_device+0x78/0x110
> > [   44.575581]  driver_probe_device+0x1f/0x90
> > [   44.575584]  __driver_attach+0xd2/0x1c0
> > [   44.575587]  bus_for_each_dev+0x77/0xc0
> > [   44.575590]  bus_add_driver+0x112/0x1f0
> > [   44.575593]  driver_register+0x72/0xd0
> > [   44.575600]  do_one_initcall+0x48/0x300
> > [   44.575607]  do_init_module+0x60/0x220
> > [   44.575615]  __do_sys_init_module+0x17f/0x1b0
> > [   44.575623]  do_syscall_64+0x82/0x170
> > [   44.575685] 1 of 1 multicall(s) failed: cpu 4
> > [   44.575695]   call  1: op=1 result=-1 caller=xen_extend_mmu_update+0x4e/0xd0 
> > pars=ffff888267e25ad0 1 0 7ff0 args=9ba37a678 80000000feec2073
> > 
> > The pte value of the mmu_update call is 80000000feec2073, which is rejected by
> > the hypervisor with -EPERM.
> > 
> > Before diving deep into the UCSI internals, is it possible that the hypervisor
> > needs some update (IOW: could it be the mapping attempt should rather be
> > honored, as there might be an I/O resources at this position which dom0 needs
> > to access for using the related hardware?)
> 
> Adding to Andrew's reply: Is there any BAR in the system covering that address?
> Or is it rather ACPI "making up" that address (which would remind me of IO-APIC
> space being accessed by certain incarnations of ACPI, resulting in similar
> issues)?

So you think ACPI is using some kind of backdoor to access the local
APIC registers?

It's my understanding the local APIC registers are all located in the
first page of the range (0xfee00).  It would also be weird because
ACPI doesn't know whether the APIC is in x2APIC mode.

Roger.


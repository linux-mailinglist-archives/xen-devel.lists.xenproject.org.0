Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9592B0E3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:13:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755903.1164424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR529-00089v-P6; Tue, 09 Jul 2024 07:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755903.1164424; Tue, 09 Jul 2024 07:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR529-00087h-MF; Tue, 09 Jul 2024 07:13:05 +0000
Received: by outflank-mailman (input) for mailman id 755903;
 Tue, 09 Jul 2024 07:13:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/YBx=OJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sR528-00083F-I0
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:13:04 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae0dda03-3dc2-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 09:13:02 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-367a183df54so2943508f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:13:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89133sm1661554f8f.54.2024.07.09.00.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 00:13:01 -0700 (PDT)
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
X-Inumbo-ID: ae0dda03-3dc2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720509182; x=1721113982; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uvgNUAUrzsCYlo5sn05uFO2ZrXzH7/S2QV0Ym7DA/Hs=;
        b=qSuPjFNs44wiPe3hSj9Br5hVJ/YymRCTHoBIw+m5UA539EMwnEH0CHEmMQIiOgyTdb
         go+fED7Qi3vAW97LFiTVh4dXG9vzCzdgrWR2loUHdchSQlCrFLeiO3ePomYYEjHMNsZQ
         jrSuVb7+ttPNJpL76hbRmwenyqwJa7k4l3nHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509182; x=1721113982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvgNUAUrzsCYlo5sn05uFO2ZrXzH7/S2QV0Ym7DA/Hs=;
        b=tNH04E2ZJ+i7Bl0WV/2UuJBvOmz47pERExagnWYs8OOuTjC0I1nj/7xiLA9EVYyaCB
         uuDdCPwsHdZpwEPLmMbgxM4q5J6te2dL/GS7vRAzcodJe97PlDqSyTAESJw3R584Kd1S
         9BCUx9TbdXMlP5YC1eh89X8uwLxX5Sx1v1OepmaSeEJH3st9mu7CSQSKphlMDPxmiUI2
         llD+TdvUnRMyxJtGQGLPlK4BwsYx4kkHuMjBm9gOQJysNboKFuRQPGFNGNki+f5OHnae
         8x2vgKQxlgo5Q3JRnvBLOoWuX+w+/ZjNApGVdrFfR1Nvrl95m9hF8rFo+QDn8TdfRXbk
         z7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkIQBNIcpMRzqvSkwyJTzHG1EN++b2H/JnB1OgJ1zzVhaSBsb+Z0jXGcQ1CK4czEkqoVY4I5wQIxZMReACvzphK7C8KUFB9pScmLz9JE4=
X-Gm-Message-State: AOJu0YzLLPa3tCuB5/dTeCGuhJ67aXApJi6uROrnsTvHAci19HXzlnrC
	X9ay2Iu5+MqeJSdcOiWOdZvv0Nx22QRt6ym6K76zdNSXpz0w7IKOCGG1//yEKPQ=
X-Google-Smtp-Source: AGHT+IFghBQdqK8rcUi2fvUsO9ChDjcJNgijMvLFBPMVg2HVY8nnM0KMc5Z6S8qim35qicO93tAk+g==
X-Received: by 2002:adf:ef01:0:b0:367:979c:bedb with SMTP id ffacd0b85a97d-367cea7352amr1140495f8f.23.1720509181820;
        Tue, 09 Jul 2024 00:13:01 -0700 (PDT)
Date: Tue, 9 Jul 2024 09:13:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Problems in PV dom0 on recent x86 hardware
Message-ID: <Zozi_ExY_JjnjvRZ@macbook.local>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>

On Tue, Jul 09, 2024 at 08:24:20AM +0200, Jan Beulich wrote:
> On 08.07.2024 23:30, Jason Andryuk wrote:
> > On 2024-07-08 05:12, Jan Beulich wrote:
> >> On 08.07.2024 11:08, Roger Pau Monné wrote:
> >>> On Mon, Jul 08, 2024 at 10:37:22AM +0200, Jan Beulich wrote:
> >>>> On 08.07.2024 10:15, Jürgen Groß wrote:
> >>>>> I've got an internal report about failures in dom0 when booting with
> >>>>> Xen on a Thinkpad P14s Gen 3 AMD (kernel 6.9).
> >>>>>
> >>>>> With some debugging I've found that the UCSI driver seems to fail to
> >>>>> map MFN feec2 as iomem, as the hypervisor is denying this mapping due
> >>>>> to being part of the MSI space. The mapping attempt seems to be the
> >>>>> result of an ACPI call of the UCSI driver:
> >>>>>
> >>>>> [   44.575345] RIP: e030:xen_mc_flush+0x1e8/0x2b0
> >>>>> [   44.575418]  xen_leave_lazy_mmu+0x15/0x60
> >>>>> [   44.575425]  vmap_range_noflush+0x408/0x6f0
> >>>>> [   44.575438]  __ioremap_caller+0x20d/0x350
> >>>>> [   44.575450]  acpi_os_map_iomem+0x1a3/0x1c0
> >>>>> [   44.575454]  acpi_ex_system_memory_space_handler+0x229/0x3f0
> >>>>> [   44.575464]  acpi_ev_address_space_dispatch+0x17e/0x4c0
> >>>>> [   44.575474]  acpi_ex_access_region+0x28a/0x510
> >>>>> [   44.575479]  acpi_ex_field_datum_io+0x95/0x5c0
> >>>>> [   44.575482]  acpi_ex_extract_from_field+0x36b/0x4e0
> >>>>> [   44.575490]  acpi_ex_read_data_from_field+0xcb/0x430
> >>>>> [   44.575493]  acpi_ex_resolve_node_to_value+0x2e0/0x530
> >>>>> [   44.575496]  acpi_ex_resolve_to_value+0x1e7/0x550
> >>>>> [   44.575499]  acpi_ds_evaluate_name_path+0x107/0x170
> >>>>> [   44.575505]  acpi_ds_exec_end_op+0x392/0x860
> >>>>> [   44.575508]  acpi_ps_parse_loop+0x268/0xa30
> >>>>> [   44.575515]  acpi_ps_parse_aml+0x221/0x5e0
> >>>>> [   44.575518]  acpi_ps_execute_method+0x171/0x3e0
> >>>>> [   44.575522]  acpi_ns_evaluate+0x174/0x5d0
> >>>>> [   44.575525]  acpi_evaluate_object+0x167/0x440
> >>>>> [   44.575529]  acpi_evaluate_dsm+0xb6/0x130
> >>>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
> >>>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
> >>>>> [   44.575550]  ucsi_register+0x24/0xa0
> >>>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
> >>>>> [   44.575559]  platform_probe+0x48/0x90
> >>>>> [   44.575567]  really_probe+0xde/0x340
> >>>>> [   44.575579]  __driver_probe_device+0x78/0x110
> >>>>> [   44.575581]  driver_probe_device+0x1f/0x90
> >>>>> [   44.575584]  __driver_attach+0xd2/0x1c0
> >>>>> [   44.575587]  bus_for_each_dev+0x77/0xc0
> >>>>> [   44.575590]  bus_add_driver+0x112/0x1f0
> >>>>> [   44.575593]  driver_register+0x72/0xd0
> >>>>> [   44.575600]  do_one_initcall+0x48/0x300
> >>>>> [   44.575607]  do_init_module+0x60/0x220
> >>>>> [   44.575615]  __do_sys_init_module+0x17f/0x1b0
> >>>>> [   44.575623]  do_syscall_64+0x82/0x170
> >>>>> [   44.575685] 1 of 1 multicall(s) failed: cpu 4
> >>>>> [   44.575695]   call  1: op=1 result=-1 caller=xen_extend_mmu_update+0x4e/0xd0
> >>>>> pars=ffff888267e25ad0 1 0 7ff0 args=9ba37a678 80000000feec2073
> >>>>>
> >>>>> The pte value of the mmu_update call is 80000000feec2073, which is rejected by
> >>>>> the hypervisor with -EPERM.
> >>>>>
> >>>>> Before diving deep into the UCSI internals, is it possible that the hypervisor
> >>>>> needs some update (IOW: could it be the mapping attempt should rather be
> >>>>> honored, as there might be an I/O resources at this position which dom0 needs
> >>>>> to access for using the related hardware?)
> >>>>
> >>>> Adding to Andrew's reply: Is there any BAR in the system covering that address?
> >>>> Or is it rather ACPI "making up" that address (which would remind me of IO-APIC
> >>>> space being accessed by certain incarnations of ACPI, resulting in similar
> >>>> issues)?
> >>>
> >>> So you think ACPI is using some kind of backdoor to access the local
> >>> APIC registers?
> >>
> >> No, I'm wondering if they're trying to access *something*. As it stands we
> >> don't even know what kind of access is intended; all we know is that they're
> >> trying to map that page (and maybe adjacent ones).
> > 
> >  From the backtrace, it looks like the immediate case is just trying to 
> > read a 4-byte version:
> > 
> >  >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
> >  >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
> >  >>>> [   44.575550]  ucsi_register+0x24/0xa0
> >  >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
> > 
> > int ucsi_register(struct ucsi *ucsi)
> > {
> >          int ret;
> > 
> >          ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
> >                                sizeof(ucsi->version));
> > 
> > ->read being ucsi_acpi_read()
> > 
> > However, the driver also appears write to adjacent addresses.
> 
> There are also corresponding write functions in the driver, yes, but
> ucsi_acpi_async_write() (used directly or indirectly) similarly calls
> ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
> ACPI object evaluation, which isn't obvious without seeing the
> involved AML whether it might write said memory region. The writing
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
> 
> If acpi_evaluate_dsm() would only ever read the region, an option (if
> all else fails) might be to similarly (to what we do for IO-APICs)
> permit read accesses / mappings (by inserting the range into
> mmio_ro_ranges). Yet of course first we need to better understand
> what's actually going on here.

When accessing from the CPU, what's in this range apart from the first
page (0xfee00) being the APIC MMIO window in xAPIC mode?

Regards, Roger.


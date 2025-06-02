Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A075CACAF4A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:43:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003384.1382926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5S7-0005lN-VG; Mon, 02 Jun 2025 13:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003384.1382926; Mon, 02 Jun 2025 13:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5S7-0005j5-Rq; Mon, 02 Jun 2025 13:43:47 +0000
Received: by outflank-mailman (input) for mailman id 1003384;
 Mon, 02 Jun 2025 13:43:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM5S6-0005iz-HC
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:43:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99fe48e1-3fb7-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 15:43:44 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so47903785e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:43:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb28c20sm5542304a12.21.2025.06.02.06.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 06:43:43 -0700 (PDT)
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
X-Inumbo-ID: 99fe48e1-3fb7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748871824; x=1749476624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p5mRCfrBwdgU9xmW7xvQQcWoE9THaQT42+bThtdVls4=;
        b=d5Ohb/QrD1T/ckqYdgIkbDaBYKj1TLEWeRKXQJChn2ExVUj/PAa3lCxcXKDc5lXxSN
         f2QY61WRzAzqRggukE9OF8swI8wZF7Gl+FjwBmzfqRdkeGeJvAeqcX6xyphMzLxsF0z3
         gtopiYdpDX8ayKiTRyBCMu3yVf62+A7gpIrcrzzQYKKuCiJYzF0hamiFnZBAFjhndt70
         vehsNsLhW7y2INTn6e4JJ9dB8M/3J/MVW4RwKhsDTmZwJCy7HPJWPFLtJJ/e/ozrw1k/
         eqLtM5S17moGQhHvo3FehrVvCwsl3U2vRhDb0J0QH37IZMgjwACabA3TNhffQLRVD0Pb
         Yukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871824; x=1749476624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5mRCfrBwdgU9xmW7xvQQcWoE9THaQT42+bThtdVls4=;
        b=rGCc5CFHWECQpJ989ltGX2ty6YXEy8GWXcIDMzCRgmPTg6eXSV0xML5LdDFslPuMaT
         T0/WIqgSaZMUtuWCL2iUubBrx5yXv93OyW2SUmdQ7tFW8nOn2bWXLx65BRkskFbm22W1
         BWsRliogTSIZbcR048Da1t0o3X+zhUIDhI9Nw9Fz6U+XryXRMC1/xGYySBzA6Pue9Bbk
         tyTIFgOFvblTEKmZ0OlxRDie5VTokA4z0az0NT0L35PomH+d+Tp5lKae7BzxUQWJvTMs
         Fb1RCsMneeFBCL11TbyFpZZKG2mRWusp6jvmZBZCsaiqc1lm/fhv3OFG6/LLWaIOOYZm
         Vxrg==
X-Gm-Message-State: AOJu0YzEyvovVQrFDwUvl6fJi1ZCzMWkoyGhvgTz2sZLD24NljjUzWo5
	Zz/monajQPUXCXMRq+4Hetb31Gl0kkPzfizuSDSqjZZUJCBeGbyowYkPss0zpH8fZHq/IruEYvN
	YDUE=
X-Gm-Gg: ASbGnctAmYb1pfqsEOoyLXD3BJmdX7z7Jz1XWYcdbhvlGho7hk1bV0u9Q1xWnVQPHSX
	SgAMPvkZPl3x/AZTuiaAXMNahqPRD3TuTCvWKHbmcU20kgCAgMErXHzAaV7xxzFK4xQgZ2W7KcO
	OTe42nhaoFvzFc15i8kY1O52s/r89NzZDABXrZ82SDQV6+CIbu93s8xIJ6YqdWcEkgEadym/bXr
	EEc385k9V+UW1FF8xrs5koCUvP1COV09/tjdHfdqMx0+2Wc1+hFkMBLtWRixZwGXTpbvjXaDwGB
	VzdX8VXjEur887qaFXNyAQuizuNwn7pNcspUdko4xUs1dRXpbHomxhzCzB9/7m+XCZExHn5lFtc
	UPu0wuwyxi3hvNpOzAsEGXf6rUtzzA47D3D1N
X-Google-Smtp-Source: AGHT+IFDaALxptVo8kTH2xMW0nL84eAmgsC83l0Yxbtwknuw/gFrDkKi8IW5ialAKK0L64UYPYCcfg==
X-Received: by 2002:a05:6000:250d:b0:3a4:c95f:c1d1 with SMTP id ffacd0b85a97d-3a4f7a3e4d6mr10111303f8f.4.1748871823929;
        Mon, 02 Jun 2025 06:43:43 -0700 (PDT)
Message-ID: <e55147a4-4894-4031-a22e-04ec926c5b4f@suse.com>
Date: Mon, 2 Jun 2025 15:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel panic when passing through 2 identical PCI devices
To: "J. Roeleveld" <joost@antarean.org>
References: <2226691.irdbgypaU6@persephone>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <2226691.irdbgypaU6@persephone>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 14:28, J. Roeleveld wrote:
> I have a domain to which I pass through 4 PCI devices:
> 2 NVMe drives
> 83:00.0   Samsung 980 NVMe
> 84:00.0   Samsung 980 NVMe
> 
> 2 HBA Controllers
> 86:00.0   LSI SAS3008
> 87:00.0   LSI SAS3008
> 
> This works fine with Xen version 4.18.4_pre1.
> However, when trying to update to 4.19, this fails.

To make it explicit: The domain in question is a PV one.

> Checking the output during boot, I think I found something. But my knowledge 
> is insufficient to figure out what is causing what I am seeing and how to fix 
> this.
>  
> From the below (where I only focus on the 2 NVMe drives), it is similar to the 
> succesfull boot up until it tries to "claiming resource 0000:84:00.0/0".
> At which point sysfs fails because the entry for "84" is already present.

What would be interesting is to know why / how this 2nd registration happens.
It's the same (guest) kernel version afaics, so something must behave
differently on the host. Are you sure the sole (host side) difference is the
hypervisor version? I.e. the Dom0 kernel version is the same in the failing
and successful cases? I ask because there's very little Xen itself does
that would play into pass-through device discovery / resource setup by a
(PV) guest (which doesn't mean Xen can't screw things up). The more relevant
component is the xen-pciback driver in Dom0.

Sadly the log provided does, to me at least, not have enough data to draw
conclusions. Some instrumenting of the guest kernel may be necessary ...

Jan

> The SAS drives appear be dones correctly, but am unable to confirm this as the 
> NVMEs are required for a succesful boot.
> 
> For completeness, I have attached the output for the failed boot, a normal 
> succesfull boot (using 4.18.4_pre1) and my xl.conf (which might need 
> adjusting)
> 
> === (output for just the NVME devices) ===
> pci_bus 0000:83: root bus resource [io  0x0000-0xffff]
> pci_bus 0000:83: root bus resource [mem 0x00000000-0x3fffffffffff]
> pci_bus 0000:83: root bus resource [bus 00-ff]
> pci 0000:83:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
> pci 0000:83:00.0: BAR 0 [mem 0xfbc00000-0xfbc03fff 64bit]
> pcifront pci-0: claiming resource 0000:83:00.0/0
> pcifront pci-0: Creating PCI Frontend Bus 0000:84
> pcifront pci-0: PCI host bridge to bus 0000:84
> pci_bus 0000:84: root bus resource [io  0x0000-0xffff]
> pci_bus 0000:84: root bus resource [mem 0x00000000-0x3fffffffffff]
> pci_bus 0000:84: busn_res: can not insert [bus 84-ff] under domain [bus 00-ff] 
> (conflicts with (null) [bus 83-ff])
> pci_bus 0000:84: root bus resource [bus 00-ff]
> pci 0000:84:00.0: [144d:a809] type 00 class 0x010802 PCIe Endpoint
> pci 0000:84:00.0: BAR 0 [mem 0xfbb00000-0xfbb03fff 64bit]
> pcifront pci-0: claiming resource 0000:84:00.0/0
> sysfs: cannot create duplicate filename '/devices/pci-0/
> pci0000:84/0000:84:00.0/resource0'
> CPU: 2 UID: 0 PID: 39 Comm: xenwatch Not tainted 6.12.21-gentoo-generic #1
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x56/0x80
>  sysfs_warn_dup+0x51/0x60
>  sysfs_add_bin_file_mode_ns+0x8a/0xa0
>  sysfs_create_bin_file+0x5e/0x80
>  pci_create_attr+0xfc/0x140
>  pci_create_resource_files+0x30/0x90
>  pci_bus_add_device+0x26/0x80
>  pci_bus_add_devices+0x27/0x60
>  pcifront_rescan_root+0x18a/0x220
>  pcifront_connect+0x117/0x170
>  ? xenbus_read_driver_state+0x32/0x60
>  ? xenbus_otherend_changed+0x49/0xa0
>  ? __pfx_xenwatch_thread+0x10/0x10
>  xenwatch_thread+0xf6/0x130
>  ? __pfx_autoremove_wake_function+0x10/0x10
>  kthread+0xea/0x100
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x1f/0x40
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1a/0x30
>  </TASK>
> ===
> 



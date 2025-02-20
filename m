Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7FA3D349
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 09:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893617.1302487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl20G-0005cI-NK; Thu, 20 Feb 2025 08:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893617.1302487; Thu, 20 Feb 2025 08:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl20G-0005aE-Kd; Thu, 20 Feb 2025 08:33:52 +0000
Received: by outflank-mailman (input) for mailman id 893617;
 Thu, 20 Feb 2025 08:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl20F-0005a8-6T
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 08:33:51 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 682f9415-ef65-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 09:33:49 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e0373c7f55so949057a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 00:33:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1b4e02sm11595739a12.3.2025.02.20.00.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 00:33:47 -0800 (PST)
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
X-Inumbo-ID: 682f9415-ef65-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740040429; x=1740645229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k3bYMmNeHJ9PscYp3QuB38RM4PVnzTEWZBmoj30cBuI=;
        b=AISvM9St0EYzprWfCIkuDOJUlEp3qNoqCBkxq1eZAzITKsF5usoHUOGTH7EltMt9qo
         ivT+vfNo4ZB/BMX++U97y3EN/EV7cQv9I5xX/vMr/B2lJxbUMaym4DSyCQdJz6aQi4j1
         2Ct1GwPnlJWfw16Z0OSoeMA4yO03tmlxKVFrP/LWKH1oK8zNDRi6Em64Jrk5JsM36Rul
         XIsHQ52E6ruoaa74g981NB84KweHHUoBROGr+z80EmbFVyJqADqH0wjUgpT5DUvJYNnC
         u+oNR6noPr/tvX63jHqFdFQjaLlXU2CBzLyEGgYIAuyZiGJLWcPIVjTwdjWRA+qJ7Ktz
         T+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740040429; x=1740645229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3bYMmNeHJ9PscYp3QuB38RM4PVnzTEWZBmoj30cBuI=;
        b=G66D8ODdrJc8panRxFjbZGp7tsGN1G9tvChKuUiJaOGWuXHK7JFCL+X6PvgqUaxNwr
         Wlpf1IxvM5UPivnlrodThAgfndqDojlraA2uKOTjuuVJjHPLIKAGnmdZHOTwvrRCIW5M
         WFjI0PH8pdjjPcA11Gauoe3GU8HT4U6HISOOedEBxybwLaby7CWlv6HICKczM3luS74s
         6b4lnq3VEochP5niWgsELKcYgNyuyfsPOMHCgeXUorhX9BbS3ZUMdviETyvc39ssiAKP
         pO7yCNNIwE9Gh/cdQdvuxo8PDr2JW8CXfAHtdfGrsaSaVDuvxYElbzTvli/v2BJPz5BE
         dgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyF64/DxOGJIEhrBFwgWXyfkPdCujj8mGfUNVngVwbKqzeTfEtjgDHCLrf/b6PcVT/GPhF5cdyOxQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDI+T9AzNx+9XjTgi8xQVglsp+6S6zmdo0APEDLXgY/GttZrYL
	eKJUtyXDFcBPGEVbRs8tqgfFecpwB6pCi71+z7QZ5diBxh7SaLmWlQSY/YAeVgpyx0SePFaL4vA
	=
X-Gm-Gg: ASbGncvpeWScorBCjj63QwhQW76w7JhRGr9mtGsnfTNrzuHP+FVaJdecZ20OzydqTQg
	5qfz071NgMBjX5NJtZNkvjLeVhiMT0KvlJz+BDqEEmrgpx736imzhTNrPrNxakAtxKzCoHk5t2k
	gwg7YjaG/ya098ylHZcwqHvGRzQQjr8Dyyjc810jHkHBZGWLC4GwOKPdJcrjFOO4OsQkaMO+guy
	2gRv2qWhDXvstc+HHx5hf0fsErwmXJXq4i1bQQz1vrhli0p+0qTU+Z5yQo6GA4AouHuXpK1RpT0
	j4TpnT00wOS5A52ublGl7lM6Z3Zz7TFdF5S1AeSOFLwU3MXPg3DgY5xj5VPiCER62IvrCB1A3Sk
	h
X-Google-Smtp-Source: AGHT+IHG0Nn7OO0y17ODiEhiZtvqPzMNHTmKSf/wSaMrVxiJjeI26fqeF38WKqVkGciTCee3nBgnzA==
X-Received: by 2002:a05:6402:35c9:b0:5e0:5605:211a with SMTP id 4fb4d7f45d1cf-5e089524014mr7564410a12.18.1740040428118;
        Thu, 20 Feb 2025 00:33:48 -0800 (PST)
Message-ID: <1e8ef6d3-09db-4d53-b7c8-4b10a7f5d8f0@suse.com>
Date: Thu, 20 Feb 2025 09:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <20250219164840.94803-4-roger.pau@citrix.com>
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
In-Reply-To: <20250219164840.94803-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2025 17:48, Roger Pau Monne wrote:
> Xen currently prevents dom0 from creating CPU or IOMMU page-table mappings
> into the interrupt address range [0xfee00000, 0xfeefffff].  This range has
> two different purposes.  For accesses from the CPU is contains the default
> position of local APIC page at 0xfee00000.  For accesses from devices
> it's the MSI address range, so the address field in the MSI entries
> (usually) point to an address on that range to trigger an interrupt.
> 
> There are reports of Lenovo Thinkpad devices placing what seems to be the
> UCSI shared mailbox at address 0xfeec2000 in the interrupt address range.
> Attempting to use that device with a Linux PV dom0 leads to an error when
> Linux kernel maps 0xfeec2000:
> 
> RIP: e030:xen_mc_flush+0x1e8/0x2b0
>  xen_leave_lazy_mmu+0x15/0x60
>  vmap_range_noflush+0x408/0x6f0
>  __ioremap_caller+0x20d/0x350
>  acpi_os_map_iomem+0x1a3/0x1c0
>  acpi_ex_system_memory_space_handler+0x229/0x3f0
>  acpi_ev_address_space_dispatch+0x17e/0x4c0
>  acpi_ex_access_region+0x28a/0x510
>  acpi_ex_field_datum_io+0x95/0x5c0
>  acpi_ex_extract_from_field+0x36b/0x4e0
>  acpi_ex_read_data_from_field+0xcb/0x430
>  acpi_ex_resolve_node_to_value+0x2e0/0x530
>  acpi_ex_resolve_to_value+0x1e7/0x550
>  acpi_ds_evaluate_name_path+0x107/0x170
>  acpi_ds_exec_end_op+0x392/0x860
>  acpi_ps_parse_loop+0x268/0xa30
>  acpi_ps_parse_aml+0x221/0x5e0
>  acpi_ps_execute_method+0x171/0x3e0
>  acpi_ns_evaluate+0x174/0x5d0
>  acpi_evaluate_object+0x167/0x440
>  acpi_evaluate_dsm+0xb6/0x130
>  ucsi_acpi_dsm+0x53/0x80
>  ucsi_acpi_read+0x2e/0x60
>  ucsi_register+0x24/0xa0
>  ucsi_acpi_probe+0x162/0x1e3
>  platform_probe+0x48/0x90
>  really_probe+0xde/0x340
>  __driver_probe_device+0x78/0x110
>  driver_probe_device+0x1f/0x90
>  __driver_attach+0xd2/0x1c0
>  bus_for_each_dev+0x77/0xc0
>  bus_add_driver+0x112/0x1f0
>  driver_register+0x72/0xd0
>  do_one_initcall+0x48/0x300
>  do_init_module+0x60/0x220
>  __do_sys_init_module+0x17f/0x1b0
>  do_syscall_64+0x82/0x170
> 
> Remove the restrictions to create mappings the interrupt address range for

Nit: Missing "in"?

> dom0.  Note that the restriction to map the local APIC page is enforced
> separately, and that continues to be present.  Additionally make sure the
> emulated local APIC page is also not mapped, in case dom0 is using it.

But that's in GFN space, not in MFN one. Why would that matter for iomem_caps?

Jan


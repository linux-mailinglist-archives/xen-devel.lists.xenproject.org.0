Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E77A3A166
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891919.1300928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPeA-0001Lm-SO; Tue, 18 Feb 2025 15:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891919.1300928; Tue, 18 Feb 2025 15:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPeA-0001JS-Pi; Tue, 18 Feb 2025 15:36:30 +0000
Received: by outflank-mailman (input) for mailman id 891919;
 Tue, 18 Feb 2025 15:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkPe8-0001I6-Ov
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:36:28 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1daaf0ab-ee0e-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 16:36:26 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso41318115e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 07:36:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb7a04f8e6sm661216366b.177.2025.02.18.07.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 07:35:44 -0800 (PST)
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
X-Inumbo-ID: 1daaf0ab-ee0e-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739892986; x=1740497786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DXYWc2/187WBJPoHh+iJ69Ps33SC+olVmqYwWKvLcuo=;
        b=eFwVILtOOJgjQDEZtTKzkWd5VydvNoixZ5ylVOiOF7XlzyqJAE2ecwN4zRbtdTuaiF
         ed3vrmcPAImYmqN+YvqkcQGlieBU8mtJfWK3HLLWsyIlAS7dLu2otJLHExXBf7+p9/jg
         ATxbSiSNrsuasVqTbqd1oXhnuT5Z3Hp6QSfFXzWtS2fTgzPWoIWtM93m4oSUv/3ScKsE
         vZbiJvF++WTLawsouGcfl45zmJUFUxj43brntB8LVLGiCP2U7kH1mOAJ4hL2I1iXqkly
         wXKGk74SFNuSYpPpJmAtzmQxmcaFytpZxPe03sDSz2yS2el3PJGQU55u/+VmdB3Daaj1
         3j5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892986; x=1740497786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXYWc2/187WBJPoHh+iJ69Ps33SC+olVmqYwWKvLcuo=;
        b=F6d2UfTJL7JtdxCMsmt2t90XBD73di8DeX1LB3Sm6+y5MHR3fyEdOcsaIK81XPcZ+s
         JP9BDP3OSFOIlKwFm7yPy5nDqLHkOIbKxuIMxnc4PSQWIx/wXQiHxDVJEMJ8q4Orn/5n
         /uM4m25h7RcYMR5ySf5hcT9Ay92RutO5A+81UH7QPxovngDFmluQ68PsH+7JUu7DnWzU
         ZUsxvuBGB0HqPwcwvcWX/yTdTYSGPyGGNToUCtT4SLcBKQDCNJK41OIGIezZX2umvH7W
         ZSvrh9lvWy7fEkA1TOjDGtWy0v4nS7e0Bu7vY0szHM+b4QGMz88HYyWhY+84jW8drMCT
         bG3g==
X-Forwarded-Encrypted: i=1; AJvYcCUNiOTRxGCP+RABVnfV332dtRYIL3moks8gOm02XJW+gtuUlr14boJUwpGcLlWaEMbLA9T0MwC8TvA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywsi3NhyhwpyeuMxuj5maxX1exaomXLG4iZYZKfG9RhZxCBLbVi
	Czf1mfeM0wOq4Q85NTqGDGE//ZLjv3pt3/jRK36IBWm6OncnlLpEe60Erf7VP63hBVT9Fxr0oQc
	=
X-Gm-Gg: ASbGncsLcKOWkZt58CCbrS9D5hiUtcGeifo2L2rHAeV06kojz1fxiZxe8i7J0MpHAUd
	WiWyKqazrOXiqGXWbbsROHGLKGQMy+r/YawUIr14H+uZrDVbOTrJt8DEEKH2pYNzhHaQye1a02b
	T64lJCLjCcjofmbwJuom2akeQJ0QWmCCnoixuwwS6dK/qCV5qqcSyyH0BaVuMInUov3XvKOGOe7
	MwZd97qrnvM+S13uDwtKrJFmzGFp29z7tofWlGKxy/rGrjmjIaav0V0uC0FQLoCFtyiiQWMJaT/
	ifNX3d4dQ6XPTilFRT38J8SYCXy3vGDC3ArrExxeIgLMtO7yosldMTl1vY0bl5vRWQ3rYh4Dl3c
	8
X-Google-Smtp-Source: AGHT+IH3iU11Y3J+zm6VGuJZijwclKxXZFpL0jqVTyg0QtBeBcHe5bC9MHA40VNGN6hRYSs5sY5sxA==
X-Received: by 2002:a17:906:794d:b0:ab7:b0e4:aa93 with SMTP id a640c23a62f3a-abbcce19ac5mr9646666b.13.1739892944771;
        Tue, 18 Feb 2025 07:35:44 -0800 (PST)
Message-ID: <0c835059-d8ce-4776-b53f-e98fc0224be9@suse.com>
Date: Tue, 18 Feb 2025 16:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/dom0: be less restrictive with the Interrupt
 Address Range
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250217141602.64014-1-roger.pau@citrix.com>
 <20250217141602.64014-3-roger.pau@citrix.com>
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
In-Reply-To: <20250217141602.64014-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.02.2025 15:16, Roger Pau Monne wrote:
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
> dom0.  Note that the restriction to map the local APIC page is enforced
> separately, and that continues to be present.
> 
> Note that even if the interrupt address range entries are populated in the
> IOMMU page-tables no device access will reach those pages.  Device accesses
> to the Interrupt Address Range will always be converted into Interrupt
> Messages and are not subject to DMA remapping.
> 
> There's also the following restriction noted in Intel VT-d:
> 
>> Software must not program paging-structure entries to remap any address to
>> the interrupt address range. Untranslated requests and translation requests
>> that result in an address in the interrupt range will be blocked with
>> condition code LGN.4 or SGN.8. Translated requests with an address in the
>> interrupt address range are treated as Unsupported Request (UR).
> 
> Similarly for AMD-Vi:
> 
>> Accesses to the interrupt address range (Table 3) are defined to go through
>> the interrupt remapping portion of the IOMMU and not through address
>> translation processing. Therefore, when a transaction is being processed as
>> an interrupt remapping operation, the transaction attribute of
>> pretranslated or untranslated is ignored.
>>
>> Software Note: The IOMMU should
>> not be configured such that an address translation results in a special
>> address such as the interrupt address range.
> 
> However those restrictions don't apply to the identity mappings possibly
> created for dom0, since the interrupt address range is never subject to DMA
> remapping, and hence there's no output address after translation that
> belongs to the interrupt address range.
> 
> Reported-by: Jürgen Groß <jgross@suse.com>
> Link: https://lore.kernel.org/xen-devel/baade0a7-e204-4743-bda1-282df74e5f89@suse.com/
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



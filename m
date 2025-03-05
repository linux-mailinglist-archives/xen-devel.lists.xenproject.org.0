Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC7A4FA79
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902135.1310071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplHc-0004jT-6w; Wed, 05 Mar 2025 09:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902135.1310071; Wed, 05 Mar 2025 09:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplHc-0004gR-3m; Wed, 05 Mar 2025 09:43:20 +0000
Received: by outflank-mailman (input) for mailman id 902135;
 Wed, 05 Mar 2025 09:43:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tplHa-0004gJ-8v
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:43:18 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d4b89c-f9a6-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:43:17 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bd5644de8so2815755e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:43:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4291ffbsm12147285e9.15.2025.03.05.01.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 01:43:16 -0800 (PST)
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
X-Inumbo-ID: 43d4b89c-f9a6-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741167796; x=1741772596; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iTQMus1QCOmBrZ6SvmoKw2n5PpJzTvkJ+r/HAwUoPCA=;
        b=eRsR+gLGOhqB0KSDpSryuYhQsCr91MOi1ki5zd2k/VVctfsL+o2AVwQAeTb7O47GzY
         N4L0S/UzveBZ3p8w8/Y3fAjchJ3JFF76+b5q04JcTNymDJmTtf6MwuVqcBzOyEkyZgmj
         GZJ7e9X+Id+a0PdzffPSouTpD02g0DGmmDOsRixc9NYwyZzHKksxn4IrMLmgbm2HJHEz
         HsVWElBOui8I8wwNnzj4hH69fZYzqDBaPyk413dvUqI3O+u9KwHNBFB89V7rm8y+9EyJ
         +z37GfJ2BbtOjhhEa7VNeGqWjl5Kt+QXN80Xriu/PQ0iu7F6mO6BLTsh90El+OTpTtlG
         UMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741167796; x=1741772596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTQMus1QCOmBrZ6SvmoKw2n5PpJzTvkJ+r/HAwUoPCA=;
        b=J3jMsrex/v10Ie0DmnXX7IS0VoRJHWJjA8cZwq7BJ4s+RJOeHX27PNAtT52YXB+4sN
         wpU18RL1iQez2b7gdgvHNXiUSn7CjQ8ButurTNNTNRiDswWimzD+JuSdpN7MUufEJE0B
         7yVHHVOPNawvyAPCyXQCOaMGG/JFK85XgEWLDokPLso50eMIfdQ8mZA8oCPh/XYcZ6zy
         7IhxKmaJst/J+w76w2ndm6SCEm1zGorhmic+Ndj+A5w+FdNyTNcHPy+1jd6jQ7fBusLV
         DObe0fd9HX0pRS0LnOeca7yPe5PZkyt8dvmIIp217p4waK4m0uuYb8XD+VO+C6tKvgsB
         PB8g==
X-Forwarded-Encrypted: i=1; AJvYcCUN7DPIHcHYhoEsKpXAd7RjjOHEVtIk21GmZsvO8OMrSHV7jsFc/NGemowF2YW/ba2FChDGjzFEeoY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQeKfSFAB+UcyodNBZNxkh6+dckZoGM3PW77pNnPBKA0gVu2RV
	O5qEK36ZWRaY98qoOZfodTmBLko2hVSS/4qp7c1vprB9up4Fb0VTHzJz/QDsHQ==
X-Gm-Gg: ASbGncvV8YpkCp23g+j5gCFHEpfwn3kvh48jtD6hIqIVDG8EsDphhndQybnCHihDpsJ
	6klKR13ho64G3kGUSnQ1gp//pQV/9jJKVnxToE+6xXcP1I+jiBxxRSHCG12DndppqZNFTMWukrE
	KXxOfAZdrjW+A8Xj5Sr+tRzDszLfDSaHStVS5x78QHuVxEioCDPkJA419V9AMZYL6bvhaTsbvB/
	h56/cFdW4DAxcCMNk9DiRV3QkmzNr7l/L7Dwqy131xm5TTc0U4v+0kwZrXKC1/7jzADH3YSwwmq
	7NB6PCsMz1fDd2qaQRZKpYZ2xxeflfMAiPc5SYEBDtgCumQXf8X1xxfP1opIWyrLY0Aja4emGHA
	BKrl5TmBOYyJFk/SZuDztP6kJgbWwRA==
X-Google-Smtp-Source: AGHT+IGEHYHLYZ/B6i9OBVcVb48QUht6Sg/mUO0XAuiGDxG8NM1y+TUn6Dge9KkUGReVJkCfmWpk0g==
X-Received: by 2002:a05:600c:1c07:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43bd29d0474mr15633335e9.25.1741167796506;
        Wed, 05 Mar 2025 01:43:16 -0800 (PST)
Message-ID: <5166d75c-2f6a-43fe-b8e0-67d309cefc96@suse.com>
Date: Wed, 5 Mar 2025 10:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250303091908.38846-1-roger.pau@citrix.com>
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
In-Reply-To: <20250303091908.38846-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.03.2025 10:19, Roger Pau Monne wrote:
> The MMIO_CONF_BASE reports the base of the MCFG range on AMD systems.
> Currently Linux is unconditionally attempting to read the MSR without a
> safe MSR accessor, and since Xen doesn't allow access to it Linux reports
> the following error:
> 
> unchecked MSR access error: RDMSR from 0xc0010058 at rIP: 0xffffffff8101d19f (xen_do_read_msr+0x7f/0xa0)
> Call Trace:
>  <TASK>
>  ? ex_handler_msr+0x11e/0x150
>  ? fixup_exception+0x81/0x300
>  ? exc_general_protection+0x138/0x410
>  ? asm_exc_general_protection+0x22/0x30
>  ? xen_do_read_msr+0x7f/0xa0
>  xen_read_msr+0x1e/0x30
>  amd_get_mmconfig_range+0x2b/0x80
>  quirk_amd_mmconfig_area+0x28/0x100
>  ? quirk_system_pci_resources+0x2b/0x150
>  pnp_fixup_device+0x39/0x50
>  __pnp_add_device+0xf/0x150
>  pnp_add_device+0x3d/0x100
>  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
>  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
>  ? acpi_walk_resources+0xbb/0xd0
>  pnpacpi_add_device_handler+0x1f9/0x280
>  acpi_ns_get_device_callback+0x104/0x1c0
>  ? _raw_spin_unlock_irqrestore+0x18/0x20
>  ? down_timeout+0x3a/0x60
>  ? _raw_spin_lock_irqsave+0x14/0x40
>  acpi_ns_walk_namespace+0x1d0/0x260
>  ? _raw_spin_unlock_irqrestore+0x18/0x20
>  ? __pfx_acpi_ns_get_device_callback+0x10/0x10
>  acpi_get_devices+0x8a/0xb0
>  ? __pfx_pnpacpi_add_device_handler+0x10/0x10
>  ? __pfx_pnpacpi_init+0x10/0x10
>  pnpacpi_init+0x50/0x80
>  do_one_initcall+0x46/0x2e0
>  kernel_init_freeable+0x1da/0x2f0
>  ? __pfx_kernel_init+0x10/0x10
>  kernel_init+0x16/0x1b0
>  ret_from_fork+0x30/0x50
>  ? __pfx_kernel_init+0x10/0x10
>  ret_from_fork_asm+0x1b/0x30
>  </TASK>
> 
> Such access is conditional to the presence of a device with PnP ID
> "PNP0c01", which triggers the execution of the quirk_amd_mmconfig_area()
> function.  Note that prior to commit 3fac3734c43a MSR accesses when running
> as a PV guest would always use the safe variant, and thus silently handle
> the #GP.
> 
> Fix by allowing access to the MSR on AMD systems, returning 0 for
> unprivileged domains (MMIO configuration space disabled), and the native
> value for the hardware domain.
> 
> The non hardware domain logic will need to be adjusted if in the future we
> expose an MCFG region to such domains.
> 
> Write attempts to the MSR will still result in #GP for all domain types.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(assuming you sufficiently addressed Andrew's concern)

Jan


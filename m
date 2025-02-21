Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59582A3F478
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 13:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894456.1303161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSEb-00069w-QO; Fri, 21 Feb 2025 12:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894456.1303161; Fri, 21 Feb 2025 12:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlSEb-000681-Ml; Fri, 21 Feb 2025 12:34:25 +0000
Received: by outflank-mailman (input) for mailman id 894456;
 Fri, 21 Feb 2025 12:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TFm=VM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tlSEa-00067v-GU
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 12:34:24 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e162c42-f050-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 13:34:23 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f3486062eso1683936f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 04:34:23 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fa1esm23065612f8f.100.2025.02.21.04.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 04:34:22 -0800 (PST)
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
X-Inumbo-ID: 2e162c42-f050-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740141263; x=1740746063; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AuJ3PXnWQ+qrnRjWQ3DzHmS/IXTw0ydwCPMidPi+k/4=;
        b=HBuMb7RqxnVbTg/tW72P5NEAb6PBL1ljvhnAKE3FMsOC3NwoCWoSbpHVmttejIfCzc
         N9Yi+BSZrq05lOAREHVGHZcXu4rEgVtYRbfcV2Wystc5Lujss6qHIWxZwU0P779A8NKJ
         2eALYpdwdQ7ccpXDoW/K3gMEbeDOmneiDaxKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740141263; x=1740746063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuJ3PXnWQ+qrnRjWQ3DzHmS/IXTw0ydwCPMidPi+k/4=;
        b=wmDAtsiNTRBAtbqf3fRwOj2cx2wxjnm7tPhnYt0LPSzBcPrcqLLD40xwH/pS6YFNag
         w/Yk6D31+ul7eaiPah+dG+XUEPvsg8bXYIffBpKSZEz+UwJnLZTjRf2yLI3J7Xwbopkn
         Rp8GQtZkCfI7P8TCd5aAAxNZlH5Od/frVKivjb8IyubRfR4wZOd+uSfAsbJ/adnTFAE1
         3pYzwR9cQBQ0Y/GFLbsGK8xrG6Hy7mu+4i5FO6daL4D4YUzTC8KtmoaJ14GkjY6y4Qcr
         QZNdf/n6MnPFrKoiWvNi9Mpe6W3VDKZqBfkVlLyOZGH95vbXCHHxn+nCnvxpAElcxXX/
         VYSA==
X-Forwarded-Encrypted: i=1; AJvYcCXB8DLuNpt4q4PZUobQr2ASg3eystcOOD9S6ODP8aiobJ2ObumyL6+Fqt5ggwbQnzWnFynrPG1CF4w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNPDQ9ZkWvwazhoDQGJ2OwQZPPBQ3InCdZDIABzZpP6lzHfGfF
	mSoJ/0SN9DeAg4z4qmGck3rL+Krb/EZYEe9QHrv7h9+YdaY1ieWw+IpyEKv+gta5jfjlACEsUUb
	S
X-Gm-Gg: ASbGnctOpQugi8oz0SvSZuxFz2FZp/+I6pmpyQ+gNDwCJxH5CFaMeSmmo/eh7Ct5URP
	s0gOsU4tlM8ZlqVRCqsc+3pQQNVke96GShsiQGPn7kClSe0ury1qkxIX/NCcSS8P+YKSLPlhLbe
	hYTUy/xv83XBpvvNijSysboF2tmkPU469xr1bgVTurK3zms+kQT+uaB3jL1UWhPtX92PFdskuob
	Gu0SWKAEobvOOn3WE73DMcfEAG0aag0JqnWmBgBKy3wvGhfZBbeJKehRi4Kb/jtyTdsJvdb6K1z
	KbD8smlUFf5MYPIhMicJCYH1nkzUhdXNOlU6uo77UByCZzg2lIPBtZxThJb16r4+nA==
X-Google-Smtp-Source: AGHT+IHsNoJK8nbA6SR4VXef28sY4ae79oUqBSr3+3AkowzZeDpWJ/UYKegmRhP80NKPnrfSEF8olQ==
X-Received: by 2002:a05:6000:1ac7:b0:38d:d299:709f with SMTP id ffacd0b85a97d-38f6f0d1d13mr2659381f8f.48.1740141262745;
        Fri, 21 Feb 2025 04:34:22 -0800 (PST)
Message-ID: <30a21ae6-14a0-4069-a715-e8b906169199@citrix.com>
Date: Fri, 21 Feb 2025 12:34:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250221120417.20431-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250221120417.20431-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/02/2025 12:04 pm, Roger Pau Monne wrote:
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
> Fix by allowing access to the MSR on AMD systems, returning 0 for
> unprivileged domains (MMIO configuration space disabled), and the native
> value for the hardware domain.
>
> The non hardware domain logic will need to be adjusted if in the future we
> expose an MCFG region to such domains.
>
> Write attempts to the MSR will still result in #GP for all domain types.
>
> Fixes: 84e848fd7a16 ('x86/hvm: disallow access to unknown MSRs')
> Fixes: 322ec7c89f66 ('x86/pv: disallow access to unknown MSRs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/msr.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 289cf10b783a..c588c9131337 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -245,6 +245,21 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          *val = 0;
>          break;
>  
> +    case MSR_FAM10H_MMIO_CONF_BASE:
> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +            goto gp_fault;
> +
> +        /*
> +         * Report MMIO configuration space is disabled unconditionally for
> +         * domUs, as the emulated chipset doesn't support ECAM.  For dom0
> +         * return the hardware value.
> +         */
> +        *val = 0;
> +        if ( is_hardware_domain(d) && rdmsr_safe(msr, *val) )
> +            goto gp_fault;
> +
> +        break;
> +
>      case MSR_VIRT_SPEC_CTRL:
>          if ( !cp->extd.virt_ssbd )
>              goto gp_fault;

Looking at the linux code, can we not fix this just by turning it into a
rdmsr_safe(), noting that not all hypervisors virtualise this MSR?

Given the number of VMs which genuinely don't have PCI (emulated or
otherwise), it's a buggy assumption in Linux.

~Andrew


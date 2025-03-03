Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C96A4C238
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 14:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900280.1308197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp62r-0002pC-NT; Mon, 03 Mar 2025 13:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900280.1308197; Mon, 03 Mar 2025 13:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp62r-0002nU-Kn; Mon, 03 Mar 2025 13:41:21 +0000
Received: by outflank-mailman (input) for mailman id 900280;
 Mon, 03 Mar 2025 13:41:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tp62p-0002nJ-Ng
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 13:41:19 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ececfb3-f835-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 14:41:17 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso28901115e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 05:41:17 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc032d049sm42143815e9.5.2025.03.03.05.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 05:41:16 -0800 (PST)
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
X-Inumbo-ID: 2ececfb3-f835-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741009277; x=1741614077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NNWjXg2MbYw3M2sN0f6p8zueWcvOU/XnaalIRCv1Bio=;
        b=sVDQfxDaKx6UmxE+fzFxTs/pW7kafTeAX80RB194Xh7u6q7LgsQrQUwicpkE9PTJBy
         G6nUfCUievRtR4cNBfjaYWpb919MlEgK52Kz4mDCFKL9xbfn8Q6NB2L8d7+KQe8mSeiv
         tr9gqSEg0vu43SCk/pSIktkZJxIX9oRbrIBn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741009277; x=1741614077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNWjXg2MbYw3M2sN0f6p8zueWcvOU/XnaalIRCv1Bio=;
        b=nnRJyyIMmf9/I3Ve/4A6bCsEFQyGG459N8xA3ZezqOrAaDxmbDQBMfe9n4sNx9DK2m
         F6w0G1vW4gxqEQYkfuYr7ja8/JhWNVmk1P5J3ikaZumTzBKFu22PntmNfO/h+08O225Y
         FNNDYQEfROiYOsqEKPQgV9qYYmdQtstkX+y4NnmLA443Le8rw5WDFoDSzJeIG9GqfUc7
         ea7PuxGny5HeZmRy1N3lrjl1THV1DL4ZbZFUf11SJyRNq96FOMmoZdGeWO2dnxNCPVCW
         Dxx8KoabbbFsPn6h9uI8n0hmYsHgJNixslVjeotUykQVtJ/sKvuMT/ykh2V7IQxN1IHL
         Koog==
X-Forwarded-Encrypted: i=1; AJvYcCW6UQ49aPx+VPvEVhPHBxtw9NcSONldDjRONusR0+kbWuI7I2ku+ph1qJtVXX/h9NXy4/UbgN6A9yg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfLzlV+35sw7f8XVTo6yChqgVeru9UCvYJ4bNQ+UkLst7h9YG5
	IItp4dzk9Jw5rOdZF8+fdcfcd5MVoXOUK+pqIfivQib45zSX/8jI3yCemNDUqbU=
X-Gm-Gg: ASbGncv2zTlhvGg0z9oYDI6kwpL7IrBdegt9PYSVeHb9flLR8lubZ5JBZtptD+yGUP1
	m8GOt1ZxTeHQOJmVAo+xGtr4hB2f4cruFeCB+AJKK1QlNbG9riZE4Q9guL0gfXrHGBHjiYaHsjd
	HLyEHt2GCVXYgo/R59l95qASbddkxO/i9M9VLqnc2FPK2Jblr01t2PYOx4kV1a6inTjFMXKzJtV
	NBOWw3iwtjLwGRtpR+B8Pygj54vVyuOovkKcPWC4Hvqs5RJvd7JKAO/fhyNjcfGl4jWlhKTrcdR
	lXfFKaC87ylO8T9Od2OoDC568d7RLpQG8Va85oN/3gkQ0eNs2iNelQ==
X-Google-Smtp-Source: AGHT+IHArfMtrlkDuSBkXTkU2cpDt/A9+4Fv1TN6tXHCzRqkeDa4hSNkCir7dHRqLHSTxQXm6v2lxQ==
X-Received: by 2002:a05:600c:5014:b0:439:9a40:aa09 with SMTP id 5b1f17b1804b1-43ba730d731mr92929715e9.25.1741009276888;
        Mon, 03 Mar 2025 05:41:16 -0800 (PST)
Message-ID: <915229bd-a930-422e-a915-6414c3224c93@citrix.com>
Date: Mon, 3 Mar 2025 13:41:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250303091908.38846-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250303091908.38846-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/03/2025 9:19 am, Roger Pau Monne wrote:
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
> ---
> Changes since v2:
>  - Expand commit message to note which device triggers the MSR read.
> ---
>  xen/arch/x86/msr.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 1550fd9ec9f3..c1e616a3a757 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -318,6 +318,21 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
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

It doesn't matter right now, but reporting MMCFG disable is likely to
interfere with Q35 support when we do present such a range.

For PVH dom0, do we guarantee this range is identity mapped?  Or at
least, doesn't have plain RAM in?

~Andrew


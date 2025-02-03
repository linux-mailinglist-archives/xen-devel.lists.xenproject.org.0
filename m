Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F3A259AF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 13:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880562.1290641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tevpq-0007BY-Ds; Mon, 03 Feb 2025 12:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880562.1290641; Mon, 03 Feb 2025 12:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tevpq-0007A6-Au; Mon, 03 Feb 2025 12:45:54 +0000
Received: by outflank-mailman (input) for mailman id 880562;
 Mon, 03 Feb 2025 12:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/pT=U2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tevpp-0007A0-Fn
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 12:45:53 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccf804c9-e22c-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 13:45:51 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso750461666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 04:45:51 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7e7asm752696866b.18.2025.02.03.04.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 04:45:50 -0800 (PST)
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
X-Inumbo-ID: ccf804c9-e22c-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738586751; x=1739191551; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lF09s9DMhHXSSXXxuRqkSgy1aYUtlxyY2h+vI7Yj4mk=;
        b=qoIXQnq/xIOfYl2Uqhv6YzMMjKb3dnfzgtFw2NU4qQoT1bulOhYtaZhBb5w08a6ArA
         74Di88H7l5Wvy1fjnBXsHh+esGp3FIUza9YrGe44dagvtDzbWqr8P0CI1p0Zxs00i+M2
         Ikvq2pAQIPFyGRff4CSzWs6hOyvrYxputy8tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586751; x=1739191551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lF09s9DMhHXSSXXxuRqkSgy1aYUtlxyY2h+vI7Yj4mk=;
        b=pHXtcCXMGvEW7CE2qQ/BjlxBr8CvpEXwsNRv6J2tRlQjd7ZlTZkcH2xukNxekpOZyI
         qNKY99kMOM6wIshfBeT2VJYCiemcbOLdFLBsKqR6SpWRr+DRZEIP1DBruFHLq/V6BLQI
         WTyeFI6HAgC6W+XUTBn6Wa09wunJHDcmxbOelKfEAFkyGIUUv3IietMf4KQyZiamvVxo
         ZHhAhe10jtbMjihotom6Vlp+k1qP1Zko+qa+/FHRbviowpqksY1St/ZBbw7Vtdi0/Tpi
         bJUzg0eAuKUGcZEvJpnZklvUYiQ4nEEEA13eNe6K69sw1X2wr4gDoMONxPhilmvsqpmf
         g4sA==
X-Gm-Message-State: AOJu0YybGDbEbAc7O+Q6rB9jxiD7kUX2ry/CRG7PXoMdxiTCNTKrsy2b
	G7tNEeQKgBoKDjAE1mLxI8gCjr2YQ89vCXbHmQV3cqKoxwtRfS3hmJo4IpR1+M0=
X-Gm-Gg: ASbGncu0VAblWIViqiS8OV0KCuaAf4hABB+vtKcjJCrnJ+ejb1xphMU6JBasuX/QAiI
	Z1ydFAUI6iO0O0vEBoEdndPtWm96mV1j+Z5BF7Df1MBlO8CMsJwOiHbp+Eb90N+Sw5F7bQFM6/2
	p3kJfUDAcrhuZUJaismFeF1acZ7Wz66uAT9NEP5d4mHk/tka9a5qFYV81GP37CZ6Z/2pUocGMuF
	WL0YlmX/iGZIPiDNA+DXtItuJRtb+AwDjgHrg+gL72W/p0uIVY7xLXnjttO2BRYlmYhgKwhfIF2
	jDvjJJxeNvGsjnsTKdfBEOt5bw==
X-Google-Smtp-Source: AGHT+IGmILbPH7qlhtCBJGro8ojc+jCvhz5e7GFTTDVxypDMDnhwRSd2pPTLBiVh8IV9dckBaM5Wsw==
X-Received: by 2002:a17:907:86a8:b0:ab6:de35:336c with SMTP id a640c23a62f3a-ab6de3533b4mr2000250866b.19.1738586751171;
        Mon, 03 Feb 2025 04:45:51 -0800 (PST)
Date: Mon, 3 Feb 2025 13:45:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
Message-ID: <Z6C6fUeB4mFfGfJc@macbook.local>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>

On Thu, Jan 30, 2025 at 12:12:31PM +0100, Jan Beulich wrote:
> In order for amd_iommu_detect_one_acpi()'s call to pci_ro_device() to
> have permanent effect, pci_segments_init() needs to be called ahead of
> making it there. Without this we're losing segment 0's r/o map, and thus
> we're losing write-protection of the PCI devices representing IOMMUs.
> Which in turn means that half-way recent Linux Dom0 will, as it boots,
> turn off MSI on these devices, thus preventing any IOMMU events (faults
> in particular) from being reported on pre-x2APIC hardware.
> 
> As the acpi_iommu_init() invocation was moved ahead of
> acpi_mmcfg_init()'s by the offending commit, move the call to
> pci_segments_init() accordingly.
> 
> Fixes: 3950f2485bbc ("x86/x2APIC: defer probe until after IOMMU ACPI table parsing")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course it would have been quite a bit easier to notice this issue if
> radix_tree_insert() wouldn't work fine ahead of radix_tree_init() being
> invoked for a given radix tree, when the index inserted at is 0.
> 
> While hunting down various other dead paths to actually find the root
> cause, it occurred to me that it's probably not a good idea to fully
> disallow config space writes for r/o devices: Dom0 won't be able to size
> their BARs (luckily the IOMMU "devices" don't have any, but e.g. serial
> ones generally will have at least one), for example. Without being able
> to size BARs it also will likely be unable to correctly account for the
> address space taken by these BARs. However, outside of vPCI it's not
> really clear to me how we could reasonably emulate such BAR sizing
> writes - we can't, after all, allow Dom0 to actually write to the
> underlying physical registers, yet we don't intercept reads (i.e. we
> can't mimic expected behavior then).

For properly sizing the domain will also attempt to toggle the memory
decoding bit ahead of sizing the BARs, and letting that trough will
break the usage of the device from Xen.  IOW: we would likely need to
emulate a fair amount of device state to make the view coherent from a
guest PoV, but is it worth it for a device that the hardware domain
cannot interact with?

Would it make more sense to just hide those devices instead of
allowing read-only access to their PCI config space?

> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
> @@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
>  {
>      bool valid = true;
>  
> -    pci_segments_init();
> -
>      /* MMCONFIG disabled */
>      if ((pci_probe & PCI_PROBE_MMCONF) == 0)
>          return;
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -55,6 +55,8 @@ void __init acpi_iommu_init(void)
>  {
>      int ret = -ENODEV;
>  
> +    pci_segments_init();

My preference might be to just place the pci_segments_init() call in
__start_xen(), instead of hiding it again in what might look like an
unrelated function (there's no mention of PCI in acpi_iommu_init()
function name for example).

Thanks, Roger.


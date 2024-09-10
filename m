Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 570699738B3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 15:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795559.1204950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0zV-0006bX-9b; Tue, 10 Sep 2024 13:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795559.1204950; Tue, 10 Sep 2024 13:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0zV-0006Z4-69; Tue, 10 Sep 2024 13:33:09 +0000
Received: by outflank-mailman (input) for mailman id 795559;
 Tue, 10 Sep 2024 13:33:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1so0zT-0006Yy-Ei
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 13:33:07 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 359a3842-6f79-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 15:33:05 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d0d82e76aso418980366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 06:33:05 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2583c1e9sm484329566b.23.2024.09.10.06.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 06:33:03 -0700 (PDT)
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
X-Inumbo-ID: 359a3842-6f79-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725975185; x=1726579985; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oVPkEv5vPLBgeqwyH0leW+35cpI+tPWxoSdqyj8C184=;
        b=fQ3MPkD1s54DHMAGmLaEprJsDWvLVvIO/aUpHYJ50ePpbvQqzQtZ2S7YY0VQWRTTF+
         5OT8VCF/ckoC4emg33hYrAOHcfnWjHinSc/Obcr8DWt6u7bCS733nsfxTU5zVVS/4rKT
         jijxb3DMeMHdz55/VvJLDsIJWSeXDnLDZz1Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725975185; x=1726579985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVPkEv5vPLBgeqwyH0leW+35cpI+tPWxoSdqyj8C184=;
        b=sCB1mwWYjtPcQihBrtbKO7CFR9MZ+6A9k9V/9u5jg22SP+j4FozdQKeEGSj0bu7GkG
         4h351a8mcFw9yvdPBWSjvVNBNC9zwcsVlLzLmVwoI2hT20f3O91cn7MuE1M7kHkNxhwB
         YYNIUUdG7Hv/lQNuSz4bdhjd7jjSjfxyaCMwgVgGbIh01OMc2OzvDl6P4/aFhulh+IH3
         ZjRtKSwJPktvDM1Lz3RfgTZls7OQUiZKVoMTnGk91oQgArqXJgt8zyxfTR20oxLJr+4w
         o/PfQ1yRv1/S2IWB02uJcD8y2AV16Feej0MvidDs27mVuz8VUgqgFmW7l3vwRnxxpBvw
         myNg==
X-Gm-Message-State: AOJu0YwzzyLwkiYZPPIUxx2F3SaPvpHBiQXy6LQ0xKxehcqVd6Ahq18F
	tQ5ycvwVd8HSmt6AccocycB2IjtO4ZZ2/Zl3k0vNOMHWfh1zS2Y2vTPzB2V+YKlKwWPYOHEaT5f
	A
X-Google-Smtp-Source: AGHT+IGy4kx8qGXoS25SotFU5oJ6FHr9E3Voo+qIkFTikR/VvbCmnwN6Nj3TFckzcazwoSN3Matm5w==
X-Received: by 2002:a17:907:948a:b0:a86:c825:7678 with SMTP id a640c23a62f3a-a8ffae1fbd2mr78516866b.64.1725975184075;
        Tue, 10 Sep 2024 06:33:04 -0700 (PDT)
Date: Tue, 10 Sep 2024 15:33:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Message-ID: <ZuBKjkUeR3sAs7j6@macbook.local>
References: <20240424191826.23656-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424191826.23656-1-dpsmith@apertussolutions.com>

Ping?

I think this is a useful change, could we please have a new version
with the proposed adjustments?

Thanks, Roger.

On Wed, Apr 24, 2024 at 03:18:26PM -0400, Daniel P. Smith wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Xen always generates as XSDT table even if the firmware provided an RSDT table.
> Copy the RSDT header from the firmware table, adjusting the signature, for the
> XSDT table when not provided by the firmware.
> 
> Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> 
> This patch is used for development and testing of hyperlaunch using the QEMU
> emulator. After dicussiong with Stefano, he was okay with me addressing Jan's
> comment regarding the table signature and reposting for acceptance.
> 
> Changes in v3:
> - ensure the constructed XSDT table always has the correct signature
> 
> ---
>  xen/arch/x86/hvm/dom0_build.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index ac71d43a6b3f..781aac00fe72 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -1077,7 +1077,16 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>          rc = -EINVAL;
>          goto out;
>      }
> -    xsdt_paddr = rsdp->xsdt_physical_address;
> +    /*
> +     * Note the header is the same for both RSDT and XSDT, so it's fine to
> +     * copy the native RSDT header to the Xen crafted XSDT if no native
> +     * XSDT is available.
> +     */
> +    if ( rsdp->revision > 1 && rsdp->xsdt_physical_address )
> +        xsdt_paddr = rsdp->xsdt_physical_address;
> +    else
> +        xsdt_paddr = rsdp->rsdt_physical_address;
> +
>      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
>      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
>      if ( !table )
> @@ -1089,6 +1098,9 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>      xsdt->header = *table;
>      acpi_os_unmap_memory(table, sizeof(*table));
>  
> +    /* In case the header is an RSDT copy, blindly ensure it has an XSDT sig */
> +    xsdt->header.signature[0] = 'X';
> +
>      /* Add the custom MADT. */
>      xsdt->table_offset_entry[0] = madt_addr;
>  
> -- 
> 2.30.2
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F411A7326B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929200.1331821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmai-000777-Id; Thu, 27 Mar 2025 12:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929200.1331821; Thu, 27 Mar 2025 12:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmai-00074i-FK; Thu, 27 Mar 2025 12:44:12 +0000
Received: by outflank-mailman (input) for mailman id 929200;
 Thu, 27 Mar 2025 12:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txmag-00074O-K8
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:44:10 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cc4e3eb-0b09-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 13:44:08 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5ed43460d6bso1612036a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 05:44:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3efbdfcd3sm1231133166b.132.2025.03.27.05.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 05:44:07 -0700 (PDT)
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
X-Inumbo-ID: 2cc4e3eb-0b09-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743079448; x=1743684248; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3DmwnzUNcXB5Eih0+9sfvmw0nKEFxMb7UJTMhi8uPc=;
        b=SsXZRCdw6uNMJIbrnYH1e8nNKgHf9cfCOsoip/BFABg7cgCZTPAiVyVUkSFdvzQNqF
         +6rB2Q5zPQ94o3/H1AXFht5i+n5wAXgQT5wVdN/6JDe2dFqwRgVFJ3qdy+VwfcXLOjaV
         SD5ehMJL8nXYvoZVtXoKfZ1p0Im3G5OfDT53M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079448; x=1743684248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3DmwnzUNcXB5Eih0+9sfvmw0nKEFxMb7UJTMhi8uPc=;
        b=uUT7Zy2KldIDq949ls8MlS8CLPvIImU04ijQAhKwp/LsAF+CBfJ96GSRvWUlhQ1EHE
         SLkwY7UfiKMX5OwBSiJ+2RaT2kZEa8AggFFyzVi6P8PiFy+EmDgZ7/w1B9AXT9sz5u9F
         cHFWUixfaNov+oi3ocO/NSTa5bkvMj26u4Q7BVfUYl6vk7KU/2F+ZV+e+zeg/tIccXfd
         83Gzls7RM00gLBaB98gvGF0TaJck42yH+Ztm/Eybz38SH+8CuSveLzvVr87XNc89qCHe
         rBAQg/ZTzzoBBelKhyLN9MgaUV4q4py3uBq8PhaYxjzZODTQZ7STOxswhOgxKWifXZj4
         48fA==
X-Gm-Message-State: AOJu0YwMi7/hSWdh/YMuuhFTWfGgBpeyOS0mYzsMkNsYY/RBrgy14TZq
	U4BE4rZqS+NWlfDJz1ZKYYOz7hIjA25z2hA6nPCfWrdAUIqYMqCC6Emn0sqjb9Q=
X-Gm-Gg: ASbGncunkkHs/P2y0yUCGfZ3Z0dks2UVHYLm7IdBNG6h3xKizoH0KSSJvAn4M9Nx3uA
	2de8o2hM9xXJrFmzTfLB+9eRll51YN4Jfy/5dSR6a5UU2BQdW+fyQUE4rfKUDNgiNiJuAdO6yzA
	l4nrwhQicP0UlMeaEwYXrMTrm/emj69a1vpXJiwqG18ziv4/Um0yAz6xkHfUEyc3Ne3ViGIRQtk
	4F/HWNNQXVhUtVl2ezL9lV+26YZksaxszvBR/tuFM6snFsyg26BsaUoB1Gt5NRzrchh+bGRwFwZ
	98z3nvWarHQ+B4wmqJ1MZJ/0bu7jbrZ20H7fmhR0Ic3H2GrLf0X5Y5rLPSgK
X-Google-Smtp-Source: AGHT+IFThDfifOI1vPInoI/vqOrD8NcuahPIOclEgTxDsVjakUjkHHmNIn1MWcf/UixUMbrq1xoq3A==
X-Received: by 2002:a17:906:6a04:b0:ac0:6e7d:cd0b with SMTP id a640c23a62f3a-ac6faf0b809mr301316466b.34.1743079447543;
        Thu, 27 Mar 2025 05:44:07 -0700 (PDT)
Date: Thu, 27 Mar 2025 13:44:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v1 3/3] vpci/msi: Remove registers when init_msi() fails
Message-ID: <Z-VIFo7q7-UNsLCt@macbook.local>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
 <20250327073214.158210-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327073214.158210-3-Jiqian.Chen@amd.com>

On Thu, Mar 27, 2025 at 03:32:14PM +0800, Jiqian Chen wrote:
> When init_msi() fails, the new codes will try to hide MSI
> capability, so it can't rely on vpci_deassign_device() to
> remove all MSI related registers anymore, those registers
> must be cleaned up in failure path of init_msi.
> 
> To do that, use a vpci_register array to record all MSI
> registers and call vpci_remove_register() to remove registers.

As I'm just seeing 3 patches on the series, isn't there one missing
for MSI-X at least?

> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  xen/drivers/vpci/msi.c | 57 +++++++++++++++++++++++++++++-------------
>  1 file changed, 39 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 9d7a9fd8dba1..30ef97efb7b0 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -195,6 +195,9 @@ static void cf_check mask_write(
>  
>  static int cf_check init_msi(struct pci_dev *pdev)
>  {
> +    unsigned int offset;
> +    unsigned int reg_index = 0;
> +    struct vpci_register registers[VPCI_CAP_MAX_REGISTER];
>      unsigned int pos = pdev->msi_pos;
>      uint16_t control;
>      int ret;
> @@ -206,15 +209,13 @@ static int cf_check init_msi(struct pci_dev *pdev)
>      if ( !pdev->vpci->msi )
>          return -ENOMEM;
>  
> +    offset = msi_control_reg(pos);
>      ret = vpci_add_register(pdev->vpci, control_read, control_write,
> -                            msi_control_reg(pos), 2, pdev->vpci->msi);
> +                            offset, 2, pdev->vpci->msi);
>      if ( ret )
> -        /*
> -         * NB: there's no need to free the msi struct or remove the register
> -         * handlers form the config space, the caller will take care of the
> -         * cleanup.
> -         */
> -        return ret;
> +        goto fail;
> +    registers[reg_index].offset = offset;
> +    registers[reg_index++].size = 2;
>  
>      /* Get the maximum number of vectors the device supports. */
>      control = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
> @@ -234,33 +235,42 @@ static int cf_check init_msi(struct pci_dev *pdev)
>      pdev->vpci->msi->address64 = is_64bit_address(control);
>      pdev->vpci->msi->masking = is_mask_bit_support(control);
>  
> +    offset = msi_lower_address_reg(pos);
>      ret = vpci_add_register(pdev->vpci, address_read, address_write,
> -                            msi_lower_address_reg(pos), 4, pdev->vpci->msi);
> +                            offset, 4, pdev->vpci->msi);
>      if ( ret )
> -        return ret;
> +        goto fail;
> +    registers[reg_index].offset = offset;
> +    registers[reg_index++].size = 4;
>  
> +    offset = msi_data_reg(pos, pdev->vpci->msi->address64);
>      ret = vpci_add_register(pdev->vpci, data_read, data_write,
> -                            msi_data_reg(pos, pdev->vpci->msi->address64), 2,
> -                            pdev->vpci->msi);
> +                            offset, 2, pdev->vpci->msi);
>      if ( ret )
> -        return ret;
> +        goto fail;
> +    registers[reg_index].offset = offset;
> +    registers[reg_index++].size = 2;
>  
>      if ( pdev->vpci->msi->address64 )
>      {
> +        offset = msi_upper_address_reg(pos);
>          ret = vpci_add_register(pdev->vpci, address_hi_read, address_hi_write,
> -                                msi_upper_address_reg(pos), 4, pdev->vpci->msi);
> +                                offset, 4, pdev->vpci->msi);
>          if ( ret )
> -            return ret;
> +            goto fail;
> +        registers[reg_index].offset = offset;
> +        registers[reg_index++].size = 4;
>      }
>  
>      if ( pdev->vpci->msi->masking )
>      {
> +        offset = msi_mask_bits_reg(pos, pdev->vpci->msi->address64);
>          ret = vpci_add_register(pdev->vpci, mask_read, mask_write,
> -                                msi_mask_bits_reg(pos,
> -                                                  pdev->vpci->msi->address64),
> -                                4, pdev->vpci->msi);
> +                                offset, 4, pdev->vpci->msi);
>          if ( ret )
> -            return ret;
> +            goto fail;
> +        registers[reg_index].offset = offset;
> +        registers[reg_index++].size = 4;

As commented on the previous patch, I don't like much the usage of
this registers array to store which handlers have been added.  It
would be best if you just removed every possible handler that could be
added, without keeping track of them.

Thinking about it, do we maybe need a helper vcpi function that wipes
all handlers from a specific range?  I think it could be helpful here,
as the size of the capabilities is well-known, so on error it would be
easier to just call such a generic handler to wipe all hooks added to
the region covered by the failing capability.

Let me know what you think of it.

Thanks, Roger.


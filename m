Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FFCA89F72
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953943.1348319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gLo-00009D-MQ; Tue, 15 Apr 2025 13:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953943.1348319; Tue, 15 Apr 2025 13:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gLo-00007f-Jg; Tue, 15 Apr 2025 13:29:20 +0000
Received: by outflank-mailman (input) for mailman id 953943;
 Tue, 15 Apr 2025 13:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4gLn-00007W-CN
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:29:19 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1d0e524-19fd-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 15:29:18 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso4426461f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 06:29:18 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eaf445315sm14200627f8f.82.2025.04.15.06.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 06:29:17 -0700 (PDT)
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
X-Inumbo-ID: a1d0e524-19fd-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744723758; x=1745328558; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=umVEFvvhuAUX9tcOJFZJ1jDYZ4/gde0SM32dXszM3eM=;
        b=uHS8T5RNvPS5oAuKDYJhWVSG2pOpw4S5Q0LOE2S/0zQQqsCLQPSMjjOBj+OnHQyWSZ
         Qeeq3LEdXIWakkfqWnfeYI1KVVGRGVz5KYY/Qlou+x+tj6JCFlq1vQvkb7AX03E/zT+V
         rihdde4d76SPDl2dBNvZFATXRXiiGtFQAq/J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723758; x=1745328558;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umVEFvvhuAUX9tcOJFZJ1jDYZ4/gde0SM32dXszM3eM=;
        b=toGac0ncJC7QeeWt6tu4XVB+68MQdePBu/6iI2AH2zhiMen6ckK+bI8Sk/AQuD5LQ1
         40CjyP9fvuUPuhNs6dk/1PQhaKDz/6hfvdWZTp2IdH1yFmhhGX27NJuKlv+WESHmLnuL
         bXbPApKTGuw5PwgKNhwbvaqJ0XTKJnMoIOgO8SGGxdHpM8Qv7XefaPXvuKWFwmBhXNNs
         ij2gna6RVl1eXrK8t3NlPU4hd7xKZZcRhBe9354pyyhv0q3ibqW0KMwvsqoXhZ602Rvc
         66qgRNw3yU1PjvE80JkMP0SeRILThulexbpNkw3a7jFzUseZ9Qf+zGdK4YZSHDrqGdPw
         YAPg==
X-Gm-Message-State: AOJu0YxHduKbkZysY7YE8KU3eHeLcfn4/hAbZ9LcFCeoTsbUIprz6ogN
	DwzH5mL4eFGiA+Ntg3FPfOisOitmsIqVuxxdfxwDBQh2MGAhA5TkHI8ut00apN8=
X-Gm-Gg: ASbGncuCnOlakHSIMkgK4ViE4tu5qjx2gl2VN9j1iBbaMhD7mBHH97/0ZzdVMFAt7ZA
	cKdrunuFvmvtoqdH+i6Sb9Jhc03Wl2KAAMpHEfAQQcSqBuOD+sPB1r32hqXkcsnatvMx9pJ2GGz
	bqdpjCti/OyREWrxw7aAnViKivzqWvyZL7QzLqaD4+tx7y5DqXB1DZu972SmDZm2IHh4wwH6+3V
	5nXIMcL9JmtLkWdAy9K94mLQt/q5l0GrP1v72q4dR03fUx8659K6jFYnmSEMXJ+CO0PKyuLYJJy
	p1ktKu0qPJqkDVrOuX/jRMux+UZ+Zl1M4DbVp2mgcxXT0g==
X-Google-Smtp-Source: AGHT+IFROwtiwJ5KZFONniBUiV+I9IwTrDxDpn1CBaINhRuV2gxIm4xsWxCciTlENcrdxUBDIr3ovA==
X-Received: by 2002:a05:6000:2905:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39edc317e60mr2913352f8f.25.1744723757529;
        Tue, 15 Apr 2025 06:29:17 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:29:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v2 7/8] vpci/msi: Free MSI resources when init_msi() fails
Message-ID: <Z_5fLB1GoyoxpuOL@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-8-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409064528.405573-8-Jiqian.Chen@amd.com>

On Wed, Apr 09, 2025 at 02:45:27PM +0800, Jiqian Chen wrote:
> When init_msi() fails, the previous new changes will hide MSI
> capability, it can't rely on vpci_deassign_device() to remove
> all MSI related resources anymore, those resources must be
> cleaned up in failure path of init_msi.
> 
> To do that, add a new function to free MSI resources.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v1->v2 changes:
> * Added a new function fini_msi to free all MSI resources instead of using an array to record registered registers.
> ---
>  xen/drivers/vpci/msi.c | 47 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index ca89ae9b9c22..48a466dba0ef 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -193,6 +193,33 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +/* 12 is size of MSI structure for 32-bit Message Address without PVM */
> +#define MSI_STRUCTURE_SIZE_32 12

I'm confused by this.  The minimum size of the capability is 4 bytes
for the capability pointer, plus 4 bytes for the message address,
plus 2 bytes for the message data.  So that's 10 bytes in total.

I think it would be best if you calculate the size based on the
existing msi_ macros.

if ( masking )
    end = msi_pending_bits_reg(msi_pos, address64);
else
    end = msi_mask_bits_reg(msi_pos, address64) - 2;

size = end - msi_control_reg(msi_pos);

> +
> +static void fini_msi(struct pci_dev *pdev)
> +{
> +    unsigned int size = MSI_STRUCTURE_SIZE_32;
> +
> +    if ( !pdev->vpci->msi )
> +        return;
> +
> +    if ( pdev->vpci->msi->address64 )
> +        size += 4;
> +    if ( pdev->vpci->msi->masking )
> +        size += 4;
> +
> +    /*
> +     * Remove all possible registered registers except capability ID
> +     * register and next capability pointer register, which will be
> +     * removed in mask function.
> +     *msi_mask_bits_reg/
> +    vpci_remove_registers(pdev->vpci,
> +                          msi_control_reg(pdev->msi_pos),
> +                          size - PCI_MSI_FLAGS);
> +    xfree(pdev->vpci->msi);
> +    pdev->vpci->msi = NULL;
> +}
> +
>  static int cf_check init_msi(struct pci_dev *pdev)
>  {
>      unsigned int pos = pdev->msi_pos;
> @@ -209,12 +236,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>      ret = vpci_add_register(pdev->vpci, control_read, control_write,
>                              msi_control_reg(pos), 2, pdev->vpci->msi);
>      if ( ret )
> -        /*
> -         * NB: there's no need to free the msi struct or remove the register
> -         * handlers form the config space, the caller will take care of the
> -         * cleanup.
> -         */
> -        return ret;
> +        goto fail;
>  
>      /* Get the maximum number of vectors the device supports. */
>      control = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
> @@ -237,20 +259,20 @@ static int cf_check init_msi(struct pci_dev *pdev)
>      ret = vpci_add_register(pdev->vpci, address_read, address_write,
>                              msi_lower_address_reg(pos), 4, pdev->vpci->msi);
>      if ( ret )
> -        return ret;
> +        goto fail;
>  
>      ret = vpci_add_register(pdev->vpci, data_read, data_write,
>                              msi_data_reg(pos, pdev->vpci->msi->address64), 2,
>                              pdev->vpci->msi);
>      if ( ret )
> -        return ret;
> +        goto fail;
>  
>      if ( pdev->vpci->msi->address64 )
>      {
>          ret = vpci_add_register(pdev->vpci, address_hi_read, address_hi_write,
>                                  msi_upper_address_reg(pos), 4, pdev->vpci->msi);
>          if ( ret )
> -            return ret;
> +            goto fail;
>      }
>  
>      if ( pdev->vpci->msi->masking )
> @@ -260,7 +282,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>                                                    pdev->vpci->msi->address64),
>                                  4, pdev->vpci->msi);
>          if ( ret )
> -            return ret;
> +            goto fail;
>          /*
>           * FIXME: do not add any handler for the pending bits for the hardware
>           * domain, which means direct access. This will be revisited when
> @@ -269,6 +291,11 @@ static int cf_check init_msi(struct pci_dev *pdev)
>      }
>  
>      return 0;
> +
> + fail:
> +    fini_msi(pdev);
> +
> +    return ret;
>  }
>  REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi);

I wonder if the fini_msi should be referenced in
REGISTER_VPCI_{EXTENDED,LEGACY}_CAP(), so that the caller of
init_msi() can call fini_msi() on failure and thus avoid all those
fail hooks and labels, as the caller can take care of the cleanup.

Thanks, Roger.


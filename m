Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EAFB0C8A2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 18:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051663.1420036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udtJz-00053X-UU; Mon, 21 Jul 2025 16:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051663.1420036; Mon, 21 Jul 2025 16:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udtJz-00050u-Qx; Mon, 21 Jul 2025 16:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1051663;
 Mon, 21 Jul 2025 16:24:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udtJy-00050o-8R
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 16:24:58 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3db691bb-664f-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 18:24:57 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451d54214adso32717675e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 09:24:57 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4563b74f8a9sm106717665e9.26.2025.07.21.09.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 09:24:56 -0700 (PDT)
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
X-Inumbo-ID: 3db691bb-664f-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753115097; x=1753719897; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPgqbXeYWqGuawUiBKwVrW+cDZCTgT3NJeAi4jxSClY=;
        b=C1dfMHWemkLewpbkz169B+nDcip1ES5unyZMCI0hyH/lLZGVDiWM8lHq4GF7uNTek2
         3gHPdUawC0qtzCaFhIq3PK33TEpgf83LJiEQmteRLZS+larcqS8Z8R2tLpAVuEC8Q9OL
         eywKUGr32uem/p7hN6PhP/Cp3CGlbBG7VEwXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753115097; x=1753719897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPgqbXeYWqGuawUiBKwVrW+cDZCTgT3NJeAi4jxSClY=;
        b=phHK3ELiUIKrnMzV342cv/5c7zLLZ/2ts0v00i0OAxqGknIP5zL4bear7+nVY3wN9v
         Vi5VHoVyYco+8shwUGOSxQ31K/ABOcK+bl9CRt94vn3bPhEnBC2XKwiiCKtRdab7moBL
         4elLgfRhr0oBI0NZN8RTWdaWxmAmY2CaA1jFqKdZdCKizgAnZW+EUi7hAds99dsR+yhC
         gq/b1x2dxuhfT/qMuPYhEvKItAZc4QK7bcneSWYQr/8YM8aaAfVxFmobWwJXfAuAmWHC
         lpALvZEDWTSVkcaWGrqB1/BWNvxyhPu0O7UVkkDWEvWV49jOfbzAMGjTP8+fIkkBn3gH
         U0ew==
X-Gm-Message-State: AOJu0Yy1paGPiDDGRtL2/1uRqtkPEtJ4ezjutYrspF6n7mPTZJ4rzDAW
	W9aQ2QLuF0QHZSL2stp7d8pQmg8K8RxTXPH0XxY1tpNkGGB64BebiSeoeayPZ+NDetA9L+d4wic
	UyyzC
X-Gm-Gg: ASbGncvaQQvuPTOuhpR9ytCQtVnTnoXmc20GXGXLL/5RC3r6xH2em5vb+7mRrmdgsUT
	ihGZG0au9Rth0VLk+ER3aiggkAIqe870AwJnpT2ctSpAlScS/Z+W1b2MlSE2MKANFHh5B6Ff7sR
	8yvmG/ubG6NPg9dE5X2mASOzKZJMfqfDCJH5mciGDdQW9ciqJbkaQiQ83VNJfC7LCtTg6KV+Pe/
	0gT1RN8gZiXmUuwO+1knpdVx4Mnv/a1BJQyG6+fXwcaiZdGwiXwiTwMtJ1rsxqfLHHYAp3K6iqX
	vrkoIDcahwauoKkEjzEN7L4eZYXmJqOFPPi29CI29a9XXJMXa7XxjWieu7grrQQ7sATSKsvGX+F
	nbNw+DkyYDp5Dvz0i1xHWNLP0RRS2FPsWkepUwCTmKXv41z9TmcxAZs6jVzZfdehaeg==
X-Google-Smtp-Source: AGHT+IFCMu5vGOhPEJg+dE7ZdR9JlCmi7C9KvCgXZpqYh1z4K5ytL3wcGekfpdMuCqGiDTfGKZR8lw==
X-Received: by 2002:a05:600c:314a:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-456352e9d36mr169539205e9.14.1753115096668;
        Mon, 21 Jul 2025 09:24:56 -0700 (PDT)
Date: Mon, 21 Jul 2025 18:24:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v7 8/8] vpci/msix: Free MSIX resources when init_msix()
 fails
Message-ID: <aH5p129QgIPdc0Hx@macbook.local>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-9-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704070803.314366-9-Jiqian.Chen@amd.com>

On Fri, Jul 04, 2025 at 03:08:03PM +0800, Jiqian Chen wrote:
> When init_msix() fails, current logic return fail and free MSIX-related
> resources in vpci_deassign_device(). But the previous new changes will
> hide MSIX capability and return success, it can't reach
> vpci_deassign_device() to remove resources if hiding success, so those
> resources must be removed in cleanup function of MSIX.
> 
> To do that, implement cleanup function for MSIX.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v6->v7 changes:
> * Change the pointer parameter of cleanup_msix() to be const.
> * When vpci_remove_registers() in cleanup_msix() fails, not to return
>   directly, instead try to free msix and re-add ctrl handler.
> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msix in
>   init_msix() since we need that every handler realize that msix is NULL
>   when msix is freed but handlers are still in there.
> 
> v5->v6 changes:
> * Change the logic to add dummy handler when !vpci->msix in cleanup_msix().
> 
> v4->v5 changes:
> * Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix"
>   since cleanup hook is changed to be int.
> * Add a read-only register for MSIX Control Register in the end of cleanup_msix().
> 
> v3->v4 changes:
> * Change function name from fini_msix() to cleanup_msix().
> * Change to use XFREE to free vpci->msix.
> * In cleanup function, change the sequence of check and remove action according to
>   init_msix().
> 
> v2->v3 changes:
> * Remove unnecessary clean operations in fini_msix().
> 
> v1->v2 changes:
> new patch.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msix.c | 54 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index a1692b9d9f6a..114280337f3f 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -36,7 +36,11 @@
>  static uint32_t cf_check control_read(
>      const struct pci_dev *pdev, unsigned int reg, void *data)
>  {
> -    const struct vpci_msix *msix = data;
> +    const struct vpci *vpci = data;
> +    const struct vpci_msix *msix = vpci->msix;
> +
> +    if ( !msix )
> +        return pci_conf_read16(pdev->sbdf, reg);
>  
>      return (msix->max_entries - 1) |
>             (msix->enabled ? PCI_MSIX_FLAGS_ENABLE : 0) |
> @@ -74,12 +78,16 @@ static void update_entry(struct vpci_msix_entry *entry,
>  static void cf_check control_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> -    struct vpci_msix *msix = data;
> +    struct vpci *vpci = data;
> +    struct vpci_msix *msix = vpci->msix;
>      bool new_masked = val & PCI_MSIX_FLAGS_MASKALL;
>      bool new_enabled = val & PCI_MSIX_FLAGS_ENABLE;
>      unsigned int i;
>      int rc;
>  
> +    if ( !msix )
> +        return;
> +
>      if ( new_masked == msix->masked && new_enabled == msix->enabled )
>          return;
>  
> @@ -656,6 +664,44 @@ static int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +static int cf_check cleanup_msix(const struct pci_dev *pdev)
> +{
> +    int rc;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msix_pos = pdev->msix_pos;
> +
> +    if ( !msix_pos )
> +        return 0;
> +
> +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
> +    if ( rc )
> +        printk(XENLOG_WARNING "%pd %pp: fail to remove MSIX handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);

The same comment as in the previous patch: vpci_remove_registers()
returning an error would likely imply memory corruption, and hence
it's best to just return error and avoid having to modify the
handlers.

Thanks, Roger.


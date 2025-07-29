Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040B5B15176
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062911.1428647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugnJa-0006sj-Ky; Tue, 29 Jul 2025 16:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062911.1428647; Tue, 29 Jul 2025 16:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugnJa-0006qw-IC; Tue, 29 Jul 2025 16:36:34 +0000
Received: by outflank-mailman (input) for mailman id 1062911;
 Tue, 29 Jul 2025 16:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y9DQ=2K=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugnJZ-0006qp-Kd
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:36:33 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ccd271d-6c9a-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 18:36:28 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so3157435f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 09:36:28 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b778f04abcsm12672488f8f.48.2025.07.29.09.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 09:36:27 -0700 (PDT)
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
X-Inumbo-ID: 2ccd271d-6c9a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753806987; x=1754411787; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TfwJAeMWjm+pvVk++OoaaxempcY+qP3kopeq+tEK08c=;
        b=SmptScF3P6uSSzFzuQHzzaVblcYsELFPn7lIqSCu5rCYDtP0EcHRxfriGZcLM3yOod
         rNZp2FqIH5XL50tM5W5gqaQk0cFACn0fne7YzdWsaA9jXT86lTihctZ6DIsGDEkiTy6V
         hAyGCzb5NA1pKuoMKqZbGA6TCX/pLrB69o7W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753806987; x=1754411787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfwJAeMWjm+pvVk++OoaaxempcY+qP3kopeq+tEK08c=;
        b=kNab5LWZjlCLd7wdRVPL20u+KpYN0zduX4rEeXarC5Va3ncrnV+bFZ/at3A7/op4+k
         snvRw0oSy4aAIwfXtt4zfjoiFklmvPK3QM6mAhdMm/vNEp7xYuzPwmZtBbeqcWm0s2OY
         5wWFqf55u6vz/NuMca0kkIHmOmFWRoLdrYFKoBBl5lEULRlZVwQ2Zqweap8l0c7Mp+/o
         lF30s684KooOmD2XkgbKyRqBR7waVUsapmzuWAZsEMBuEpOzCqmeCSCoNQhvn1kp3D+S
         E+4fHVr3nNIlPMxiP84aGJZiPEdsAFr4fljTROVLqEDGHLG+GhGADVwCzWZhGEUZr+1j
         U7Gg==
X-Gm-Message-State: AOJu0YwrOiS6WMe+MWqBXxs16xHjJWKg/X/VsPsdd5snH8AVnt3NtQ+I
	ePy3gIhgh40h7Mz/QOsIHfoJOV5UsdDNHyu/fYRoFC4I9u/SAHEuYJKHV5F7FRbSOVw=
X-Gm-Gg: ASbGncv8SeMByaH251ezpgKMaF16NunqKw0NEtBl83GkZ4eaU2+maUPvCQ2mvwqvmGk
	Av7JwNLLxlJO0/56Y7CLKDqFN/M6fS74yAJdaxe5rpAGgwSOsgu9TQlmedlTUJUlE9BAtdbMjZ6
	iA8uWEcOYinEa8IayNPyyUpR2U32Gb5xDX27y8wGj09eDsbvZ4kT0df0t+BNCXgvc61mAXrzONE
	FLku7FFt/QIBckYDrD4kRI0hnEbCzQ/M0bjb9SD582vBuTAdP0dwFLdZ3BSyBuyi4EK3DHp6AoS
	ZjRA+0x6aAFq01c6Ks6aOoOwoRQf2ic+IY/eM+lZXGYBIKEtfWQpRLWgdgjR5vrCrUuVJ7VgiIg
	K+TWv6BXivIkGJfeyI5K1NoLcfkupNrAstV9cuuedDniOjD7lHKzfOlLyLIZ0ZoeLCw==
X-Google-Smtp-Source: AGHT+IGxUQHkVVsoxPEmUyPB1jHbx5WDyAptIGIPuBRFLpgmf/gTlbDElLAIwk6M3WH+DRBgoS+KLA==
X-Received: by 2002:a5d:5889:0:b0:3b7:5cae:52b3 with SMTP id ffacd0b85a97d-3b795010d42mr274517f8f.57.1753806987404;
        Tue, 29 Jul 2025 09:36:27 -0700 (PDT)
Date: Tue, 29 Jul 2025 18:36:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v9 8/8] vpci/msix: Free MSIX resources when init_msix()
 fails
Message-ID: <aIj4ghW2dpnY1HhO@macbook.local>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-9-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728050401.329510-9-Jiqian.Chen@amd.com>

On Mon, Jul 28, 2025 at 01:04:01PM +0800, Jiqian Chen wrote:
> When MSI-X initialization fails vPCI will hide the capability, but
> remove of handlers and data won't be performed until the device is
> deassigned.  Introduce a MSI-X cleanup hook that will be called when
> initialization fails to cleanup MSI-X related hooks and free it's
> associated data.
> 
> As all supported capabilities have been switched to use the cleanup
> hooks call those from vpci_deassign_device() instead of open-code the
> capability specific cleanup in there.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v8->v9 changes:
> * Modify commit message.
> * Call cleanup_msix() in vpci_deassign_device() to remove the open-code to cleanup msix datas.
> * In cleanup_msix(), move "list_del(&vpci->msix->next);" above for loop of iounmap msix tables.
> 
> v7->v8 changes:
> * Given the code in vpci_remove_registers() an error in the removal of
>   registers would likely imply memory corruption, at which point it's
>   best to fully disable the device. So, Rollback the last two modifications of v7.
> 
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
>  xen/drivers/vpci/msix.c | 44 ++++++++++++++++++++++++++++++++++++++++-
>  xen/drivers/vpci/vpci.c | 16 +++++++--------
>  xen/include/xen/vpci.h  |  2 ++
>  3 files changed, 53 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 54a5070733aa..8ee315eb928c 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +int cleanup_msix(const struct pci_dev *pdev)
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
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +
> +    if ( vpci->msix )
> +    {
> +        list_del(&vpci->msix->next);
> +        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> +            if ( vpci->msix->table[i] )
> +                iounmap(vpci->msix->table[i]);
> +
> +        XFREE(vpci->msix);
> +    }
> +
> +    /*
> +     * The driver may not traverse the capability list and think device
> +     * supports MSIX by default. So here let the control register of MSIX
> +     * be Read-Only is to ensure MSIX disabled.
> +     */
> +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
> +                           msix_control_reg(msix_pos), 2, NULL);
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +
> +    return rc;
> +}
> +
>  static int cf_check init_msix(struct pci_dev *pdev)
>  {
>      struct domain *d = pdev->domain;
> @@ -710,7 +752,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
>       */
>      return vpci_make_msix_hole(pdev);
>  }
> -REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
> +REGISTER_VPCI_CAP(MSIX, init_msix, cleanup_msix);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 4b8e6b28bd07..258356019535 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -321,6 +321,14 @@ void vpci_deassign_device(struct pci_dev *pdev)
>                      &pdev->domain->vpci_dev_assigned_map);
>  #endif
>  
> +    if ( pdev->vpci->msix )
> +    {
> +        int rc = cleanup_msix(pdev);
> +        if ( rc )
> +            printk(XENLOG_ERR "%pd %pp: fail to cleanup MSIX datas rc=%d\n",
> +                   pdev->domain, &pdev->sbdf, rc);
> +    }
> +
>      spin_lock(&pdev->vpci->lock);
>      while ( !list_empty(&pdev->vpci->handlers) )
>      {
> @@ -332,18 +340,10 @@ void vpci_deassign_device(struct pci_dev *pdev)
>          xfree(r);
>      }
>      spin_unlock(&pdev->vpci->lock);
> -    if ( pdev->vpci->msix )
> -    {
> -        list_del(&pdev->vpci->msix->next);
> -        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
> -            if ( pdev->vpci->msix->table[i] )
> -                iounmap(pdev->vpci->msix->table[i]);
> -    }
>  
>      for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
>          rangeset_destroy(pdev->vpci->header.bars[i].mem);
>  
> -    xfree(pdev->vpci->msix);

Oh, I'm afraid this is not what I was expecting.  You should call all
the cleanup hooks here, so that you can also remove the vpci->msi
xfree() (and any future ones).  You want a loop over the array of
registered vpci_capability_t and call all the defined cleanup()
methods against the deassigned device IMO.

That avoids having to reference any specific capability here, and new
capabilities will only need to implement a cleanup handler without
having to modify vpci_deassign_device().  You won't need to export
cleanup_msix() either, which is ugly.

Thanks, Roger.


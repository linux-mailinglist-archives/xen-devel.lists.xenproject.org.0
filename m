Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0DB10F4B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056316.1424538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyLd-0001x2-8N; Thu, 24 Jul 2025 15:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056316.1424538; Thu, 24 Jul 2025 15:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyLd-0001ue-5A; Thu, 24 Jul 2025 15:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1056316;
 Thu, 24 Jul 2025 15:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ueyLb-0001uY-GR
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 15:59:07 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 208b8f9e-68a7-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 17:59:06 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so610252f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 08:59:06 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fcc3c4csm2611370f8f.76.2025.07.24.08.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 08:59:05 -0700 (PDT)
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
X-Inumbo-ID: 208b8f9e-68a7-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753372746; x=1753977546; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=83HsHQ6jd5WYNl8xdxdltHo8LVSJjKorasE8qLNMk9U=;
        b=WAAkTElRYZwNT5wG2LoPyL7Zry3lbBjXyu4XupWKZV4lIICPGz/p/BbKbsaFtlw+D5
         ygKU07vYqcWxbIRt8ICfb6WwIUG0XKRRbLuL7ZQZvZHd/qqTmyduzH5Mz44Lwn7fginW
         G1BTXf+8KIy1BxWBMhNYLQuV5BLeH2buqeG44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372746; x=1753977546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83HsHQ6jd5WYNl8xdxdltHo8LVSJjKorasE8qLNMk9U=;
        b=da5W9fHDlCnB1fbmUcuB6rBI+hRXwH/XO2qllI6zrWV0PL3j2kmyebbBRc4LXLV1Ya
         jvwASB20LBWYtx5L620rBFwQztNB9e5ZBb/Mk2lqXSzj6jdamQIq9uUrz2p/dTS6TkZe
         hfGpXBvpXLRhvRMDDXBSmsQj8Ot9b0JCdnXBH/LweClCmA5EEMA+HSKHrkCMcF5HCU+f
         P3nTM6NxFwWWUPmj+MctnOQ3B+I8RFnCQxz1IVqLHigasbdmYx1Aeq6vZ3zG1Zrvnsi4
         hfJkoVlNboF9/oCciln5KM2ykvKypg6t2oiwEnTigkBwvtxn1/Rx2gKXbEmNET9frgnJ
         Idsg==
X-Gm-Message-State: AOJu0YxtL0q+fvXWY/Aeo00Jn+Ika9WaaLX7RRlGpvgWDFBBww7WwhMz
	8qh+YPwyGAIFo5e4L6XUWSe6bn3pwLEe3aIwQd8bx9mT52qNzSeeJ6Q0xMmCelmcv20=
X-Gm-Gg: ASbGnctKf9use7nK18cu9+V4nxrLcZ65POBFcjDFS3ySZNeJHq7zpRo8uqJToyQGQmx
	sT8zaz6cvJ90CyqAj0MbSO41/X5eFJ+HVONB4NQgvcXeKsWRBn5OufkVYCEiEuzUNi+PxgZ7ZnP
	Vsaxt03HFHH5e+Am5IJ6CFpV0r05BC9Rq0HUhfeHO+rCmsrXAFeRGnZx3PsDEl8yzVtuI6htDsa
	ThsyfzHGDFRhdjsNxi9Wtofp95yFr8Z7/CwIRu/qP7ELx3noB8QerAcw7Tj+1I3jVPT4stWvFFn
	c3G9ypqBWGnzlRpC9ZQquCfsmpcPjhnje/8RHk1uCzMi0715y+y4U0FpBlr1cgLMDRKKwvRiCHd
	Z31N2ZhexZBN8zY/zzXRnmx3xW8ECEtOnlp/N4/DrduOwQ1Qnyv7+CrNQ8wnKLC9u+Q==
X-Google-Smtp-Source: AGHT+IGUihfMb5Oi0Tgu8uH6/x7IbzUrE5jEJi5/ZyksdK1gJ4WRz5NAdCiwyNwxt5lGKSnySy3vGg==
X-Received: by 2002:a05:6000:240c:b0:3a5:3af1:e21b with SMTP id ffacd0b85a97d-3b768f07c99mr6197501f8f.47.1753372745647;
        Thu, 24 Jul 2025 08:59:05 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:59:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v8 8/8] vpci/msix: Free MSIX resources when init_msix()
 fails
Message-ID: <aIJYSGSGQ76MgKF2@macbook.local>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
 <20250724055006.29843-9-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724055006.29843-9-Jiqian.Chen@amd.com>

On Thu, Jul 24, 2025 at 01:50:06PM +0800, Jiqian Chen wrote:
> When init_msix() fails, current logic return fail and free MSIX-related
> resources in vpci_deassign_device(). But the previous new changes will
> hide MSIX capability and return success, it can't reach
> vpci_deassign_device() to remove resources if hiding success, so those
> resources must be removed in cleanup function of MSIX.

The text here is a bit convoluted IMO.  It would be clearer as:

When MSI-X initialization fails vPCI will hide the capability, but
remove of handlers and data won't be performed until the device is
deassigned.  Introduce a MSI-X cleanup hook that will be called when
initialization fails to cleanup MSI-X related hooks and free it's
associated data.

As all supported capabilities have been switched to use the cleanup
hooks call those from vpci_deassign_device() instead of open-code the
capability specific cleanup in there.

(see below for the reasoning behind the last paragrpah).

> To do that, implement cleanup function for MSIX.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
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
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index eb3e7dcd1068..8ab159969da6 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
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
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +
> +    if ( vpci->msix )
> +    {
> +        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> +            if ( vpci->msix->table[i] )
> +                iounmap(vpci->msix->table[i]);
> +
> +        list_del(&vpci->msix->next);
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
> @@ -714,7 +756,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
>  
>      return rc;
>  }
> -REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
> +REGISTER_VPCI_CAP(MSIX, init_msix, cleanup_msix);

Don't you need to also call the cleanup hooks in
vpci_deassign_device() and remove the open-coded cleaning of MSI-X
done there?

Otherwise the code here is duplicated with the code in
vpci_deassign_device() for MSI-X cleanup (apart from it being a bit of
a layering violation to open-code the MSI-X cleanup in there).

Thanks, Roger.


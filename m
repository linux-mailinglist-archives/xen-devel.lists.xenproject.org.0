Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2FAACA54
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977500.1364486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCKiM-0001I4-PD; Tue, 06 May 2025 16:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977500.1364486; Tue, 06 May 2025 16:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCKiM-0001G4-M7; Tue, 06 May 2025 16:00:14 +0000
Received: by outflank-mailman (input) for mailman id 977500;
 Tue, 06 May 2025 16:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCKiL-0001Fu-SU
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:00:13 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2efd8506-2a93-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:00:08 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso51526385e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:00:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b89d1358sm175278315e9.10.2025.05.06.09.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:00:07 -0700 (PDT)
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
X-Inumbo-ID: 2efd8506-2a93-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746547208; x=1747152008; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/j7jbN9Fkwr9tloBRTb3BOtshwMRSAZH4Egv3TbRy5A=;
        b=qR7dkkE3k+SGscuQz11brVPVBWFQ12G7w4fCQCrDjd7VgE0J8FypGCtS1oiQQsnRak
         /KiT8rOo4CNJ4I0uBhhYzbfJeGW6X5ql46/DdpEQu0U0e3v2T3faiwDKvIyl8eaGxb50
         oy8RM6YtNY7avZLj3+Q1c9PgCCUN0KcAR++bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547208; x=1747152008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/j7jbN9Fkwr9tloBRTb3BOtshwMRSAZH4Egv3TbRy5A=;
        b=q7s2bnLh+EMgbjXxbciaCJlR1WoTeJPfq5RKVLBkd+xPEvib6MvyYYA4XCbJyR4P42
         sdbGilVHFa0YDN5ebO+OqVasWeIX46900eqkIUlzKW5N3c++V/YRcCF3HCvhmOQeJUFi
         r1ZmFkyyao/NXPQVFf0DjGzrrAllVhYeID1cnHPyAWl+XUkmGUoLzENm7faXx9WVUWsc
         koeLE7k58z3i4w2vfAmkf4PSrOqXqOXK3NmYjCAdl5wBgAZkXPzoTOHN9fZD9omLKVLI
         q+QYNAjH3k0rcwtdpE9hRdAk+sTLgQFI2iU7sh+VNHZ5c5JQcOXh8Pm2+NaA/fSiDbYv
         N/ZA==
X-Gm-Message-State: AOJu0YyWhXVKF6QN+6lJ90i87ACuwxmVzAFspcWNuGdNiciJw/XgZR/3
	cFz4P/1pm0sOkazR3hKEGpi06+r9h6xSpzISNH56oF03sAvAktGz+ZHxXjTaZ22lEJikch+X84n
	k
X-Gm-Gg: ASbGncvHiV/eJ3iHUxANA1EeScPFB8TUoS6v3pbnUUruDfNun9n/KhSPvm7ktmdayCk
	kHYlqL+cMwbFD2kc9e09QrzKUvyihD46jMYfbqt96ciOk/2/R7Ed/32Id/bGB6CctBpXxTQvTTo
	aBNIUWbvW+IhysVzxlyKFKZUvAEsVjjGo66dE8yNXl1A7vKcRzBDCem3AXIRQRZv0xnTsMAk9x4
	AbAWqKa6oBOFYsCHuUOdDkTkTJOFPNDkLn/guXr+Dt/nwd9dngQX72tCBefAESfIjlR1fbplqqE
	kWyxUz4lbL2PmrMetoUlsjHew+5L5OJbOiaTCuxMyEhnzbJW/28=
X-Google-Smtp-Source: AGHT+IGRGWJCJKEB71VsBgPTb1RB78m+iduq1PAWQTUa6UqSoBSCG4fWlBlP+mtIx9bbn2hpCJFPew==
X-Received: by 2002:a05:600c:1d8e:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-441d054db77mr30886255e9.33.1746547207958;
        Tue, 06 May 2025 09:00:07 -0700 (PDT)
Date: Tue, 6 May 2025 18:00:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3 06/11] vpci: Hide legacy capability when it fails to
 initialize
Message-ID: <aBoyBlRFG8W8wJla@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-7-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-7-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:18:58PM +0800, Jiqian Chen wrote:
> When vpci fails to initialize a legacy capability of device, it just
> return error instead of catching and processing exception. That makes
> the entire device unusable.

I think "catching and processing exception" is a weird terminology to
use when writing C.  It's IMo more accurate to use:

"When vpci fails to initialize a legacy capability of device, it just
returns an error and vPCI gets disabled for the whole device.  That
most likely renders the device unusable, plus possibly causing issues
to Xen itself if guest attempts to program the native MSI or MSI-X
capabilities if present."

> So, add new a function to hide legacy capability when initialization
> fails. And remove the failed legacy capability from the vpci emulated
> legacy capability list.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v2->v3 changes:
> * Separated from the last version patch "vpci: Hide capability when it fails to initialize"
> * Whole implementation changed because last version is wrong.
>   This version adds a new helper function vpci_get_register() and uses it to get
>   target handler and previous handler from vpci->handlers, then remove the target.
> 
> v1->v2 changes:
> * Removed the "priorities" of initializing capabilities since it isn't used anymore.
> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
>   remove failed capability from list.
> * Called vpci_make_msix_hole() in the end of init_msix().
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/vpci.c | 133 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 112 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 5474b66668c1..f97c7cc460a0 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -35,6 +35,22 @@ struct vpci_register {
>      uint32_t rsvdz_mask;
>  };
>  
> +static int vpci_register_cmp(const struct vpci_register *r1,
> +                             const struct vpci_register *r2)
> +{
> +    /* Return 0 if registers overlap. */
> +    if ( r1->offset < r2->offset + r2->size &&
> +         r2->offset < r1->offset + r1->size )
> +        return 0;
> +    if ( r1->offset < r2->offset )
> +        return -1;
> +    if ( r1->offset > r2->offset )
> +        return 1;
> +
> +    ASSERT_UNREACHABLE();
> +    return 0;
> +}
> +
>  #ifdef __XEN__
>  extern vpci_capability_t *const __start_vpci_array[];
>  extern vpci_capability_t *const __end_vpci_array[];
> @@ -83,7 +99,91 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> -static int vpci_init_capabilities(struct pci_dev *pdev)
> +static struct vpci_register *vpci_get_register(struct vpci *vpci,
> +                                               const unsigned int offset,
> +                                               const unsigned int size)

We don't usually use const attributes for scalar function parameters.

> +{
> +    const struct vpci_register r = { .offset = offset, .size = size };
> +    struct vpci_register *rm;
> +
> +    ASSERT(spin_is_locked(&vpci->lock));
> +    list_for_each_entry ( rm, &vpci->handlers, node )
> +    {
> +        int cmp = vpci_register_cmp(&r, rm);
> +
> +        if ( !cmp && rm->offset == offset && rm->size == size )
> +            return rm;
> +        if ( cmp <= 0 )
> +            break;
> +    }
> +
> +    return NULL;
> +}
> +
> +static struct vpci_register *vpci_get_previous_cap_register
> +                (struct vpci *vpci, const unsigned int offset)

The style preference here would be:

static struct vpci_register *vpci_get_previous_cap_register(
    struct vpci *vpci, unsigned int offset)
{
...

> +{
> +    uint32_t next;
> +    struct vpci_register *r;
> +
> +    if ( offset < 0x40 )

I would possibly add an ASSERT_UNREACHABLE() here, as attempting to
pass an offset below 0x40 is a sign of a bug elsewhere?

> +        return NULL;
> +
> +    r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1);
> +    ASSERT(r);
> +
> +    next = (uint32_t)(uintptr_t)r->private;
> +    while ( next >= 0x40 && next != offset )
> +    {
> +        r = vpci_get_register(vpci, next + PCI_CAP_LIST_NEXT, 1);
> +        ASSERT(r);
> +        next = (uint32_t)(uintptr_t)r->private;
> +    }
> +
> +    if ( next < 0x40 )
> +        return NULL;
> +
> +    return r;
> +}
> +
> +static void vpci_capability_mask(struct pci_dev *pdev,

This possibly needs to return an error code, as it can fail, and just
adding ASSERTs all around seems a bit clumsy, plus we might really
want to prevent assigning the device to the domain if
vpci_capability_mask() fails for whatever reason.

> +                                 const unsigned int cap)
> +{
> +    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
> +    struct vpci_register *prev_next_r, *next_r;
> +    struct vpci *vpci = pdev->vpci;
> +
> +    spin_lock(&vpci->lock);
> +    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
> +    if ( !next_r )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return;
> +    }
> +
> +    prev_next_r = vpci_get_previous_cap_register(vpci, offset);
> +    ASSERT(prev_next_r);
> +
> +    prev_next_r->private = next_r->private;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        struct vpci_register *id_r =
> +            vpci_get_register(vpci, offset + PCI_CAP_LIST_ID, 1);
> +
> +        ASSERT(id_r);
> +        /* PCI_CAP_LIST_ID register of target capability */
> +        list_del(&id_r->node);
> +        xfree(id_r);

You could use vpci_remove_register() here?

> +    }
> +
> +    /* PCI_CAP_LIST_NEXT register of target capability */
> +    list_del(&next_r->node);
> +    spin_unlock(&vpci->lock);
> +    xfree(next_r);

Here vpci_remove_register() could also be used, but it will involve
searching again for the register to remove, which is a bit pointless.

> +}
> +
> +static void vpci_init_capabilities(struct pci_dev *pdev)
>  {
>      for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
>      {
> @@ -107,10 +207,17 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
>          rc = capability->init(pdev);
>  
>          if ( rc )
> -            return rc;
> +        {
> +            if ( capability->fini )
> +                capability->fini(pdev);
> +
> +            printk(XENLOG_WARNING "%pd %pp: %s cap %u init fail rc=%d, mask it\n",

Best to split to next line:

              printk(XENLOG_WARNING
	             "%pd %pp: %s cap %u init fail rc=%d, mask it\n",

Thanks, Roger.


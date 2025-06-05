Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584CACF0CD
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006893.1386153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAl3-0001r4-Sa; Thu, 05 Jun 2025 13:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006893.1386153; Thu, 05 Jun 2025 13:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAl3-0001ok-Ow; Thu, 05 Jun 2025 13:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1006893;
 Thu, 05 Jun 2025 13:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNAl2-0001LF-3E
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 13:35:48 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc2480bd-4211-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 15:35:46 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so5203395e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 06:35:46 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5236d4466sm3830417f8f.100.2025.06.05.06.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 06:35:45 -0700 (PDT)
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
X-Inumbo-ID: fc2480bd-4211-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749130546; x=1749735346; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQ/jRID1McYK5kSvWo683gzCCMc2GCjXLg/u+H+QyLA=;
        b=QbuB2DskTkH4xby0VvSC2C1eqDm1u6Aog0pTGrZZdYSaOlJTvoB7bKRDJhKFbEdIkd
         WEJEg1ZZK2ML9KaBymL0mIyfVUbI1CLQqc0S+QrQNdI5eAxeWM9G9cXd8GbXON0bOc1D
         W8dZJanK+Z6SOsISH5JkH9t/S2jbQBljzf68E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130546; x=1749735346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ/jRID1McYK5kSvWo683gzCCMc2GCjXLg/u+H+QyLA=;
        b=dI2CWKvRbmdAN+hmtQMRbpLRK9Wzj2yT33Bc4dhNjtooCo+nPmf0lpRWd444nN8o2O
         WFK/kd3/l/dW9b8onezSddYiPUXQoFGgJlfzRkZEtXmxMufXQUOiRvrndsfvJJoRB+lF
         MLjnYt1asIyyrS3pDW2zbacpNY6CNL3qpddvFet9SwT8UF9IJvlZv9k9g5ly6JN1ivYM
         Odd8TW6mbjnWWxtS6l8nq9kW+lfnDfqPhZcxBCIJ9sbD6lYNnhuMGx93hHkTW9WqslH8
         BW7IfIzQQNMdRYiKT3Vz0QEdTKQ/wL+i96ga/yc7LXPqa1L8qXv7QoHqAMgAMd6/HVxH
         mklA==
X-Gm-Message-State: AOJu0YwkvGbNUn+zMvr1VHZSzbbKcYqQHdTenDs4cSo0UDAzPOTHDuEo
	IutkoKLJjNVaPz6W39nK9fHtGQMQKp50Fy+eE6Pa+Fo0pHREsfBq40MN1UKMGMwFLFE=
X-Gm-Gg: ASbGncu/URV9j+WdnPVLdPxjd86hnIF/M03vLFcBUkmRPOrXUoIybU1Nk6+a1c0o76U
	DIl3/bTOlAtkHU3V3pRJeufwgrzG10aNpmZrxhRhjQiRPixKw/QT5bvtx8KQfUi6GfoVDe77ncv
	EoQwKmnuTBweOe3KVRNBdIAfzwApA9W+mDiEFnRB2c4hqpLTKmr2Hr5o9Ni7eM60odzJt0Lk2h0
	8dy/ArK405jlL0tLdkv2LJgeUgDlIkHxqtjwokSeGV2XIf42N9hYMGu6scnwGNNIRVvzr6mS+Ss
	o05VTsjmenq+1N0fFxxj7Kt7Zgj8jXzEHAEI35To1QT540ZaFWGrEW4eKvio7sWEif4mV+ing+5
	OC23xa/Z0pFqt8JdR55A=
X-Google-Smtp-Source: AGHT+IFKvGAsjt58i8TD5iBhNxJeDuesXrMdBfrrvsKe2th459ziI4h37GCaLcWy+DHu1gAjpDp9GQ==
X-Received: by 2002:a05:600c:190c:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-451f0a75a7emr65555145e9.8.1749130545554;
        Thu, 05 Jun 2025 06:35:45 -0700 (PDT)
Date: Thu, 5 Jun 2025 15:35:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v5 05/10] vpci: Hide legacy capability when it fails to
 initialize
Message-ID: <aEGdMBmZsfQaRdJC@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-6-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526094559.140423-6-Jiqian.Chen@amd.com>

On Mon, May 26, 2025 at 05:45:54PM +0800, Jiqian Chen wrote:
> When vpci fails to initialize a legacy capability of device, it just
> returns an error and vPCI gets disabled for the whole device.  That
> most likely renders the device unusable, plus possibly causing issues
> to Xen itself if guest attempts to program the native MSI or MSI-X
> capabilities if present.
> 
> So, add new function to hide legacy capability when initialization
> fails. And remove the failed legacy capability from the vpci emulated
> legacy capability list.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v4->v5 changes:
> * Modify vpci_get_register() to delete some unnecessary check, so that I don't need to move function vpci_register_cmp().
> * Rename vpci_capability_mask() to vpci_capability_hide().
> 
> v3->v4 changes:
> * Modify the commit message.
> * In function vpci_get_previous_cap_register(), add an ASSERT_UNREACHABLE() if offset below 0x40.
> * Modify vpci_capability_mask() to return error instead of using ASSERT.
> * Use vpci_remove_register to remove PCI_CAP_LIST_ID register instead of open code.
> * Add check "if ( !offset )" in vpci_capability_mask().
> 
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
>  xen/drivers/vpci/vpci.c | 117 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 113 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 2861557e06d2..60e7654ec377 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -83,6 +83,99 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static struct vpci_register *vpci_get_register(struct vpci *vpci,
> +                                               unsigned int offset,
> +                                               unsigned int size)
> +{
> +    struct vpci_register *rm;

Nit: I think you re-used part of the code from vpci_remove_register()
that names the local variable rm (because it's for removal).  Here it
would better to just name it 'r' (for register).

> +
> +    ASSERT(spin_is_locked(&vpci->lock));
> +
> +    list_for_each_entry ( rm, &vpci->handlers, node )
> +    {
> +        if ( rm->offset == offset && rm->size == size )
> +            return rm;
> +
> +        if ( offset <= rm->offset )
> +            break;
> +    }
> +
> +    return NULL;
> +}
> +
> +static struct vpci_register *vpci_get_previous_cap_register(
> +    struct vpci *vpci, unsigned int offset)
> +{
> +    uint32_t next;
> +    struct vpci_register *r;
> +
> +    if ( offset < 0x40 )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return NULL;
> +    }
> +
> +    r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1);
> +    if ( !r )
> +        return NULL;
> +
> +    next = (uint32_t)(uintptr_t)r->private;
> +    while ( next >= 0x40 && next != offset )
> +    {
> +        r = vpci_get_register(vpci, next + PCI_CAP_LIST_NEXT, 1);
> +        if ( !r )
> +            return NULL;
> +        next = (uint32_t)(uintptr_t)r->private;
> +    }
> +
> +    if ( next < 0x40 )
> +        return NULL;

The code below I think it's a bit simpler (and compact) by having a
single return instead of multiple ones:

for ( r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1); r;
      r = next >= 0x40 ? vpci_get_register(vpci,
                                           next + PCI_CAP_LIST_NEXT, 1)
                       : NULL )
{
    next = (uint32_t)(uintptr_t)r->private;
    ASSERT(next == (uintptr_t)r->private);
    if ( next == offset )
        break;
}

return r;

I haven't tested it however.

> +
> +    return r;
> +}
> +
> +static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
> +{
> +    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
> +    struct vpci_register *prev_next_r, *next_r;

I think it might be clear to just name this prev_r, next_r,
prev_next_r is IMO a bit confusing.  I understand it refers to the next
capability register in the previous capability, and I think prev_r
might be enough.

> +    struct vpci *vpci = pdev->vpci;
> +
> +    if ( !offset )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    spin_lock(&vpci->lock);
> +    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
> +    if ( !next_r )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return -ENODEV;
> +    }
> +
> +    prev_next_r = vpci_get_previous_cap_register(vpci, offset);
> +    if ( !prev_next_r )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return -ENODEV;
> +    }

You can join both the above into a single check IMO:

next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
prev_r = vpci_get_previous_cap_register(vpci, offset);
if ( !next_r || !prev_r )
{
    spin_unlock(&vpci->lock);
    return -ENODEV;
}

There's no benefit in using two equal error condition checks (just
makes the code longer)

> +
> +    prev_next_r->private = next_r->private;
> +    /*
> +     * Not calling vpci_remove_register() here is to avoid redoing
> +     * the register search
> +     */
> +    list_del(&next_r->node);
> +    spin_unlock(&vpci->lock);
> +    xfree(next_r);
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +        return vpci_remove_register(vpci, offset + PCI_CAP_LIST_ID, 1);
> +
> +    return 0;
> +}
> +
>  static int vpci_init_capabilities(struct pci_dev *pdev)
>  {
>      for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
> @@ -91,7 +184,6 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
>          const unsigned int cap = capability->id;
>          const bool is_ext = capability->is_ext;
>          unsigned int pos;
> -        int rc;
>  
>          if ( !is_ext )
>              pos = pci_find_cap_offset(pdev->sbdf, cap);
> @@ -103,9 +195,26 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
>          if ( !pos )
>              continue;
>  
> -        rc = capability->init(pdev);
> -        if ( rc )
> -            return rc;
> +        if ( capability->init(pdev) )

I think you want to store rc here to print it in the warning message
below.

> +        {
> +            int rc;
> +
> +            if ( capability->cleanup ) {
> +                rc = capability->cleanup(pdev);
> +                if ( rc )
> +                    return rc;

Here where both init and cleanup failed, you simply don't print any
message.

> +            }
> +
> +            printk(XENLOG_WARNING "%pd %pp: %s cap %u init fail, mask it\n",
> +                   pdev->domain, &pdev->sbdf,
> +                   is_ext ? "extended" : "legacy", cap);

I think this needs to be done ahead of the cleanup(), and print the
returned error code.  Overall we need messages printed when any of
those fails, as that makes it easier to debug when things go wrong.

Thanks, Roger.


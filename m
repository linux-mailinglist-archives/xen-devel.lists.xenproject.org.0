Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71BAB0C804
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 17:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051607.1419965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udskl-0004Cf-T1; Mon, 21 Jul 2025 15:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051607.1419965; Mon, 21 Jul 2025 15:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udskl-0004AK-QI; Mon, 21 Jul 2025 15:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1051607;
 Mon, 21 Jul 2025 15:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udskk-0004AE-WD
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 15:48:35 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2857b8f1-664a-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 17:48:34 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so30983745e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 08:48:34 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b61ca2bc6fsm10917873f8f.28.2025.07.21.08.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:32 -0700 (PDT)
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
X-Inumbo-ID: 2857b8f1-664a-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753112913; x=1753717713; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jqQvSx5jBSfesi4sIGQQd27+fTW1nrSz8/cSydVsFQs=;
        b=Gy+0Qrp65p3ZzFthbktQFvyrLV3SiR/kMm/5LWX+0qljFeihYt7HfLBQ1lCRP0WRMZ
         r+fvYwNjztFHUNvskDk2sOdOEBkX5h/2DwJ2FTHQgKkdbJtBjASBCPb7A2H52vsszMcC
         FtdezWKvI+zpvmxxvVv2icex3diTkWuMUTk1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753112913; x=1753717713;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqQvSx5jBSfesi4sIGQQd27+fTW1nrSz8/cSydVsFQs=;
        b=WJ1XB9kDxVs8yyKQhp69Rgjgc33jHNO/OrFvOMMnmVI6Wfvhp3ADPwDLUl3b3dv+Mf
         6WZzCeHhiI0voTvcLE8d35SEuEGcTffcAAPiQUNCVYDilEIFbPUa6gFiOym6Lqclajvr
         hz0Ny4ns+gxnbRJ191yrMeJwUSndklgga46DabnmEszCRe+sbGpmAWSc+WSe/anUFZdc
         NvTQDkp6W76nkPqlC5VONjVi47ixEVw/AGb7FIoB7m4vF5r/I3cQoXMvXLR/opy6rvHd
         7xHBwds/kTYwYAzfi3cRTXNfxWNkZD00odh238OPJGGJtaRN1UyEOKAQMLiJopUrD6AQ
         YDow==
X-Gm-Message-State: AOJu0YyW3+P/8LmCoVtFlqV32l5k6tYiGEW4tpkbDstqgNodh9MGCUsU
	JcOLdNt08cZ/aZo6r2vNFE+tuAIgnpror406X/6tlMOOo5Wi8e3QnuX/MatmpVFi/XE=
X-Gm-Gg: ASbGncvC3RWBQkOK8UQySOO/MF/9BnmcK9xOEQCoaHOGt06KBAiDi0qWlz44zm0/cSC
	9MXKa3PkuhwD7606Dbsi5ON7F19sV5u7MpuSvZO5UvbAZbSWyKgFFfqnKY1BtTyLJgBJtbScS6n
	+q6zW78lKqVwOzJWha/HHCgUdGPXEtKJe0t98kIT5w31G/GvQlj4JuPue44qVcjNa28IgBadMvA
	fTrC0bCkKxH/Nhau0pJgHkO8PZuRV0lEDZZpgpQIoRqWVCtGBa5eKgpf/EMjt5xc8U6Zpsl/xWh
	L02pc5OTOmY5Q9aVIGIiF4dLxllM/EhOQi4etcPyrQ+rQvyHpRqhnpvi4qKO8FHdVKcX+X1tMGT
	8JA3tRskqV7SiAS3VWRfsSZQmSjDbEqpqyIYzSOf5iQrIIl1T8uiwSuPfpLz5iNaTZQ==
X-Google-Smtp-Source: AGHT+IGU5IiEPGPKYWC8KTB6xcq1uVuIkxyVP1xlcgGpKH16EHquRcL+66cmUDdFUYeipPYIXgNS/A==
X-Received: by 2002:a05:600c:4f85:b0:456:43d:1198 with SMTP id 5b1f17b1804b1-4562e3801ddmr182171385e9.32.1753112913232;
        Mon, 21 Jul 2025 08:48:33 -0700 (PDT)
Date: Mon, 21 Jul 2025 17:48:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v7 3/8] vpci: Hide legacy capability when it fails to
 initialize
Message-ID: <aH5hUC1JBYLyF0h6@macbook.local>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704070803.314366-4-Jiqian.Chen@amd.com>

On Fri, Jul 04, 2025 at 03:07:58PM +0800, Jiqian Chen wrote:
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
> v6->v7 changes:
> * Change the pointer parameter of vpci_get_register(),
>   vpci_get_previous_cap_register() and vpci_capability_hide() to be const.
> 
> v5->v6 changes:
> * Rename parameter rm to r in vpci_get_register().
> * Use for loop to compact the code of vpci_get_previous_cap_register().
> * Rename prev_next_r to prev_r in vpci_capability_hide(().
> * Add printing when cap init, cleanup and hide fail.
> 
> v4->v5 changes:
> * Modify vpci_get_register() to delete some unnecessary check, so that
>   I don't need to move function vpci_register_cmp().
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
>  xen/drivers/vpci/vpci.c | 109 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 108 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index e7e5b64f1be4..a91c3d4a1415 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -83,6 +83,88 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static struct vpci_register *vpci_get_register(const struct vpci *vpci,
> +                                               unsigned int offset,
> +                                               unsigned int size)
> +{
> +    struct vpci_register *r;
> +
> +    ASSERT(spin_is_locked(&vpci->lock));
> +
> +    list_for_each_entry ( r, &vpci->handlers, node )
> +    {
> +        if ( r->offset == offset && r->size == size )
> +            return r;
> +
> +        if ( offset <= r->offset )
> +            break;
> +    }
> +
> +    return NULL;
> +}
> +
> +static struct vpci_register *vpci_get_previous_cap_register(
> +    const struct vpci *vpci, unsigned int offset)
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
> +    for ( r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1); r;
> +          r = next >= 0x40 ? vpci_get_register(vpci,
> +                                               next + PCI_CAP_LIST_NEXT, 1)
> +                           : NULL )
> +    {
> +        next = (uint32_t)(uintptr_t)r->private;

Both 'next' type and the explicit truncation done here would better
use "unsigned int" to match the type of the input offset parameter?

> +        ASSERT(next == (uintptr_t)r->private);
> +        if ( next == offset )
> +            break;
> +    }
> +
> +    return r;
> +}
> +
> +static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
> +{
> +    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
> +    struct vpci_register *prev_r, *next_r;
> +    struct vpci *vpci = pdev->vpci;
> +
> +    if ( !offset )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    spin_lock(&vpci->lock);
> +    prev_r = vpci_get_previous_cap_register(vpci, offset);
> +    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
> +    if ( !prev_r || !next_r )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return -ENODEV;
> +    }
> +
> +    prev_r->private = next_r->private;
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
> @@ -103,7 +185,32 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
>  
>          rc = capability->init(pdev);
>          if ( rc )
> -            return rc;
> +        {
> +            const char *type = is_ext ? "extended" : "legacy";
> +
> +            printk(XENLOG_WARNING "%pd %pp: init %s cap %u fail rc=%d, mask it\n",

Nit: in order to avoid the strictly speaking overly long line here you
could split it like:

            printk(XENLOG_WARNING
                   "%pd %pp: init %s cap %u fail rc=%d, mask it\n",
                   pdev->domain, ...

> +                   pdev->domain, &pdev->sbdf, type, cap, rc);
> +
> +            if ( capability->cleanup )
> +            {
> +                rc = capability->cleanup(pdev);
> +                if ( rc )
> +                {
> +                    printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
> +                           pdev->domain, &pdev->sbdf, type, cap, rc);

I think it would be fine to not return error here for the hardware
domain, and try to mask the capability even if cleanup() has failed?

For the hardware domain it's likely better to not fail and attempt to
mask, rather than fail and then end up exposing the device without any
kind of vPCI mediation.  For domU the proposed behavior is fine.

Thanks, Roger.


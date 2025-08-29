Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9215AB3B8BD
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 12:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101106.1454302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwNz-0006jP-Un; Fri, 29 Aug 2025 10:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101106.1454302; Fri, 29 Aug 2025 10:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwNz-0006hG-Qn; Fri, 29 Aug 2025 10:31:11 +0000
Received: by outflank-mailman (input) for mailman id 1101106;
 Fri, 29 Aug 2025 10:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urwFN-0004NE-Ej
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 10:22:17 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08e56945-84c2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 12:22:15 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b7da4101fso3982385e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 03:22:15 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b6f0d3073sm124654065e9.7.2025.08.29.03.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:22:14 -0700 (PDT)
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
X-Inumbo-ID: 08e56945-84c2-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756462935; x=1757067735; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZ3WXGHAITG4NL0OQNIQYH4tMA7WBzEYvhsSVufX5H0=;
        b=JqaotF/SCWIXCGNQ83Af4v0a2PUZalPad759sa03gdfqbtMlihSKLhEgFCPBjdk+6e
         RxkNVBdQQo2ShfCqHyfUadR6YQg3L7XUpJZiAJvXtYuumoQBzeWltqBqouqehWVxQ18b
         ksaSWJr9QKYO/XWQ6ZRewQwalSHKCNvZMmf3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462935; x=1757067735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZ3WXGHAITG4NL0OQNIQYH4tMA7WBzEYvhsSVufX5H0=;
        b=cIrCzYbr1YMqkanOe3Tgsz0c6SMNcmYrbKPXaQITxp6Ot2Dx1bAEh50ioOFbCjni6S
         +uL8y+kDJ3IoBWixUhB4slarFrkA7TDPfVQGPjEoAMQwe2EJLErkE/BisW7O1ZyK1kNj
         w3U9K7bt7moe9IVR/dzZgYfuc5lsRZoP4OgVpE9yQYexRrcp67jfUDcdgG4LuQ9Jznsq
         SOe3V3dB9LjIfPnodhRbF/3FpQhENggo5fUDSDRm/xn2Hwqk5LsSlwnqCkkRTyXprUP9
         GIpc0CcqPuz2y66lBXHFIttBjNYOz4N9CKzrlKQhotjQlrMQ5l25eMfHPLy4s0pLnwwk
         hJCg==
X-Gm-Message-State: AOJu0Ywh6PEtVy0LNQeZxZKjKNQJMIpWTjcfxdCv8NOyHIVWnhyH/qgO
	9bvm8EEtzmYITElC+u7QEaLNQ1VGbxOIICg6C2RRz50c3htsoytar9RHM4QjwXZcI3gQVjDjD79
	LmBhV
X-Gm-Gg: ASbGncvcoVM2armnMsOQGby0JZPLKskr1SksTmMWQGl/hhjJbP6E3vbLOqPPPmNpauY
	xyeWqZkYQ4NynAA1hEzzn9L1c6GncMqQKlm9VczIhzCT7KBDGUVuGP8BYcHfNobB8ntLgwkuhuT
	GQ90uDLzvqBvnR9GZjfhwzi7RR27eHqkXLBvhtIiW0n415nnI5YwcmkuJFrpZuDHYYty6B4Os4a
	hHpkSVeGTmA+YLa1HoM2QoOIZnCdHnZXp2EPjpdNcDI7TNsNc2vkibWYgo5imPVS0gEZHy96DU7
	JUAlhKZHotZhCyfo+cMCPWeYBlG3fPFLI4GYRNsxg9m4Kqy7or8OH0LNA5oLyKqPYHEy7jnn0qK
	q22VqQlu5VUc4qunEh7r7Kvc2SR4Hx5HAUIGGlw3z40pRrpSoWuyAc5nHWW+g3aJu9bBv3dN1e/
	0u
X-Google-Smtp-Source: AGHT+IGGqvqacn/kJGuZG29D732SAFJPMU5NYSICQBzM1QjiomdNUMtMoNsQq03oozEDDVxKsDefYg==
X-Received: by 2002:a05:600c:35c9:b0:456:201a:99f with SMTP id 5b1f17b1804b1-45b517cbf0emr235906495e9.18.1756462934976;
        Fri, 29 Aug 2025 03:22:14 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:22:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v11 3/5] vpci/rebar: Implement cleanup function for Rebar
Message-ID: <aLF_VWs-njIzLk7e@Mac.lan>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808080337.28609-4-Jiqian.Chen@amd.com>

On Fri, Aug 08, 2025 at 04:03:35PM +0800, Jiqian Chen wrote:
> When Rebar initialization fails, vPCI hides the capability, but
> removing handlers and datas won't be performed until the device is
> deassigned. So, implement Rebar cleanup hook that will be called to
> cleanup Rebar related handlers and free it's associated data when
> initialization fails.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v10->v11 changes:
> * Add ASSERT_UNREACHABLE() when vpci_remove_registers() fails
> * When hide == true, add handlers to let Rebar ctrl be RO.
> * Remove Roger's Reviewed-by since patch change.
> 
> v9->v10 changes:
> v8->v9 changes:
> No.
> 
> v7->v8 changes:
> * Add Roger's Reviewed-by.
> 
> v6->v7 changes:
> * Change the pointer parameter of cleanup_rebar() to be const.
> * Print error when vpci_remove_registers() fail in cleanup_rebar().
> 
> v5->v6 changes:
> No.
> 
> v4->v5 changes:
> * Change definition "static void cleanup_rebar" to "static int cf_check cleanup_rebar" since cleanup hook is changed to be int.
> 
> v3->v4 changes:
> * Change function name from fini_rebar() to cleanup_rebar().
> * Change the error number to be E2BIG and ENXIO in init_rebar().
> 
> v2->v3 changes:
> * Use fini_rebar() to remove all register instead of in the failure path of init_rebar();
> 
> v1->v2 changes:
> * Called vpci_remove_registers() to remove all possible registered registers instead of using a array to record all registered register.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/rebar.c | 66 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 55 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> index 3c18792d9bcd..91d5369d75e2 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -49,6 +49,57 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>      bar->guest_addr = bar->addr;
>  }
>  
> +static int cf_check cleanup_rebar(const struct pci_dev *pdev, bool hide)
> +{
> +    int rc;
> +    uint32_t ctrl;
> +    unsigned int nbars;
> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> +                                                        PCI_EXT_CAP_ID_REBAR);
> +
> +    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> +
> +    rc = vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
> +                               PCI_REBAR_CTRL(nbars - 1));
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove Rebar handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +
> +    if ( !hide )
> +        return 0;

Now that the handler can differentiate between calls to hide the
capability versus calls from device deassign, do we need to call
vpci_remove_registers() for the non-hiding case?

The non-hiding case is only used from vpci_deassign_device(), and just
after having called all the cleanup hooks that function purges any
remaining registered handlers.  It would be OK to do something like:

static int cf_check cleanup_rebar(const struct pci_dev *pdev, bool hide)
{
    int rc;
    uint32_t ctrl;
    unsigned int nbars;
    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
                                                        PCI_EXT_CAP_ID_REBAR);

    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
    {
        ASSERT_UNREACHABLE();
        return 0;
    }

    if ( !hide )
        return 0;

    ... remove handler + mask register ...

Thoughts?

> +
> +    /*
> +     * The driver may not traverse the capability list and think device
> +     * supports Rebar by default. So here let the control register of Rebar
> +     * be Read-Only is to ensure Rebar disabled.
> +     */
> +    for ( unsigned int i = 0; i < nbars; i++ )
> +    {
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, NULL,
> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, NULL);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pd %pp: fail to add Rebar ctrl handler rc=%d\n",
> +                   pdev->domain, &pdev->sbdf, rc);
> +            return rc;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static int cf_check init_rebar(struct pci_dev *pdev)
>  {
>      uint32_t ctrl;
> @@ -80,7 +131,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>          {
>              printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
>                     pdev->domain, &pdev->sbdf, index);
> -            continue;
> +            return -E2BIG;
>          }
>  
>          bar = &pdev->vpci->header.bars[index];
> @@ -88,7 +139,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>          {
>              printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
>                     pdev->domain, &pdev->sbdf, index);
> -            continue;
> +            return -ENXIO;

I'm unsure we want to return an error here and in the check above,
given this capability is dom0 only, we might want to just skip the BAR
and continue, aiming for the other resizable BARs to be functional?

Thanks, Roger.


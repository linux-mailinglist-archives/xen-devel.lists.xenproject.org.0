Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB68A72C4E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928779.1331443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjUs-0007Bq-UA; Thu, 27 Mar 2025 09:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928779.1331443; Thu, 27 Mar 2025 09:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjUs-0007AO-RJ; Thu, 27 Mar 2025 09:25:58 +0000
Received: by outflank-mailman (input) for mailman id 928779;
 Thu, 27 Mar 2025 09:25:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txjUr-00079s-CL
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:25:57 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7acc7f21-0aed-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 10:25:54 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22409077c06so24513335ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:25:54 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7390611ccf8sm13684380b3a.120.2025.03.27.02.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 02:25:51 -0700 (PDT)
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
X-Inumbo-ID: 7acc7f21-0aed-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743067552; x=1743672352; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVxOrG7NX/8GJReusnmyb66C6kB8TVwAgk8AWHcgWrI=;
        b=JeJ2EPwk77yJw8bQp3r8WvH3XIX/nWefMGEEP3o2gAJN9rkbhDFQtOfD9uTm6Oscl5
         2EZUj5kJh4PQDxKUhr5bRhGJOtOPVGTmHy+98/uXUVfP+Fpm5VArUVqrorNRj8PZdiam
         oe1VKYmVW4PhRlb4DjRI5Am9yFUIuegPsxaaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743067552; x=1743672352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVxOrG7NX/8GJReusnmyb66C6kB8TVwAgk8AWHcgWrI=;
        b=f+807UyZSfVqBrhZPtAIsSZ2fU8qqkHVu/Q+PNCIiD3s2EzQ3g/fgWlttyUWQdy/Xt
         XLhy+RoUcJj7XcNxJHPWcF/T+g3P1oxXvrPuivZGMA5ucAqKdSFLNOZ8+y9mAgRPrljl
         21sxI2Kx5WLXeQeMSruFwckEZwZl4L5wbUz73yb6CyBeLgCfnwjc3/QkCD5Krbv7l//6
         HCnssXiTkX/YdxO/p+lrRcbuXGd2gCXczrauPm9ODhQcQKOf7DID9QuR4UAp53xrGBI7
         M/tTiubG5LhSHZoIEdOTRQwHj8YtQL3bxdUwBSFmVjRUmgKGYayo8M/YH4nxbcTQEwpU
         NARg==
X-Gm-Message-State: AOJu0YxToAbQnFrcaZfufts2Q2Ol4PN3Nh11VQI3kE232eQNx6JsgPh4
	3lNqTpfW9e6KLpnZr8RtaOP8Cmc1wUAiKN3x6is5+91gcHmDiFS0KxB9DnExqPo=
X-Gm-Gg: ASbGncsE5G7HTzZZvPnI0scjtdpmNvH/y43VwSuAtALfWx0JQZ9XugLluDqqiBW+4ML
	EkQtoHfkvjFvWdbuOTMkN5hOhBsA08HEL6pl2ylqMURCVjPkbqdMWsYFmjjZtIngxpKFt5IPL+E
	rIu3JAn/rg495QZN1KXRxqyliIVUSlboo6dTjqb/lgRBDvbz2np77hO5LjjBYVXcqoQxG6ZEwb2
	FNHjlfAM28ej6aeIrxsTyUJPpgl/fFhc2DX0ox/I42f4VM7FjQ+D+qq9O9ZncuNSO6NzOy0dHKa
	vqwQC5tmHIS9ePoU+K3r+NkbfPKE5IPlI+zpscMdRA10pg9uyn/uvag5Kbq7
X-Google-Smtp-Source: AGHT+IHo/zMKCjwoQ/MhP1QDNeBARcf7QQFqm8bL8PXYNrxXwo46QFsQdgUBRVdytoNtf3Z1unwitQ==
X-Received: by 2002:a05:6a21:58b:b0:1f5:86f2:ba57 with SMTP id adf61e73a8af0-1fea2ef626cmr7220933637.30.1743067552423;
        Thu, 27 Mar 2025 02:25:52 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:25:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v1 1/3] vpci: Hide capability when it fails to initialize
Message-ID: <Z-UZm5sTIz4nOt4-@macbook.local>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327073214.158210-1-Jiqian.Chen@amd.com>

On Thu, Mar 27, 2025 at 03:32:12PM +0800, Jiqian Chen wrote:
> When vpci fails to initialize a capability of a device, it just
> return error instead of catching and processing exception. That
> makes the entire device unusable.
> 
> So, refactor REGISTER_VPCI_INIT to contain more capability specific
> information, and try to hide capability when initialization fails
> in vpci_assign_device().
> 
> What's more, change the definition of init_header() since it is
> not a capability and it is needed for all devices' PCI config space.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> Hi all,
> 
> This patch aims to hide a capability when its initialization fails.
> That causes we can't rely on vpci_deassign_device() to clean up assigned
> resources, so, following two patches clean up resources in the failure
> path of init function.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/header.c |  3 +-
>  xen/drivers/vpci/msi.c    |  2 +-
>  xen/drivers/vpci/msix.c   |  2 +-
>  xen/drivers/vpci/rebar.c  |  2 +-
>  xen/drivers/vpci/vpci.c   | 65 +++++++++++++++++++++++++++++++++------
>  xen/include/xen/vpci.h    | 27 ++++++++++++----
>  6 files changed, 81 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ef6c965c081c..8c8e4ac5698a 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -745,7 +745,7 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
>      return !bar->mem ? -ENOMEM : 0;
>  }
>  
> -static int cf_check init_header(struct pci_dev *pdev)
> +int vpci_init_header(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
>      uint64_t addr, size;
> @@ -1007,7 +1007,6 @@ static int cf_check init_header(struct pci_dev *pdev)
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>      return rc;
>  }
> -REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 66e5a8a116be..9d7a9fd8dba1 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -270,7 +270,7 @@ static int cf_check init_msi(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_msi, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSI, init_msi, VPCI_PRIORITY_LOW);
>  
>  void vpci_dump_msi(void)
>  {
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 6bd8c55bb48e..50e5f38c1e09 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -753,7 +753,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
> +REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, VPCI_PRIORITY_HIGH);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> index 793937449af7..7c53ee031887 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -118,7 +118,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>  
>      return 0;
>  }
> -REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
> +REGISTER_VPCI_EXTEND_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, VPCI_PRIORITY_LOW);
>  
>  /*
>   * Local variables:
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 1e6aa5d799b9..a8362e46e097 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -36,8 +36,8 @@ struct vpci_register {
>  };
>  
>  #ifdef __XEN__
> -extern vpci_register_init_t *const __start_vpci_array[];
> -extern vpci_register_init_t *const __end_vpci_array[];
> +extern vpci_capability_t *const __start_vpci_array[];
> +extern vpci_capability_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> @@ -83,6 +83,47 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static int vpci_init_cap_with_priority(struct pci_dev *pdev,
> +                                       const char *priority)
> +{
> +    for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
> +    {
> +        const vpci_capability_t *capability = __start_vpci_array[i];
> +        const unsigned int cap_id = capability->id;
> +        unsigned int pos;
> +        int rc;
> +
> +        if ( *(capability->priority) != *priority )
> +            continue;
> +
> +        if ( !capability->is_ext )
> +            pos = pci_find_cap_offset(pdev->sbdf, cap_id);
> +        else
> +            pos = pci_find_ext_capability(pdev->sbdf, cap_id);
> +
> +        if ( !pos )
> +            continue;
> +
> +        rc = capability->init(pdev);
> +
> +        if ( rc )
> +        {
> +            printk(XENLOG_WARNING "%pd %pp: cap init fail rc=%d, try to hide\n",
> +                   pdev->domain, &pdev->sbdf, rc);
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   pos, capability->is_ext ? 4 : 1, NULL);

Are you sure this works as intended?  The capability ID 0 is marked as
"reserved" in the spec, so it's unclear to me how OSes would handle
finding such capability on the list - I won't be surprised if some
implementations decide to terminate the walk.  It's fine to mask the
capability ID for the ones that we don't want to expose, but there's
further work to do IMO.

The usual way to deal with masking capabilities is to short circuit
the capability from the linked list, by making the previous capability
"Next Capability Offset" point to the next capability in the list,
thus skipping the current one. So:

capability[n - 1].next_cap = capability[n].next_cap

IOW: you will need to add the handler to the previous capability on
the list.  That's how it's already done in init_header().

> +            if ( rc )
> +            {
> +                printk(XENLOG_ERR "%pd %pp: fail to hide cap rc=%d\n",
> +                       pdev->domain, &pdev->sbdf, rc);
> +                return rc;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  void vpci_deassign_device(struct pci_dev *pdev)
>  {
>      unsigned int i;
> @@ -128,7 +169,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
>  
>  int vpci_assign_device(struct pci_dev *pdev)
>  {
> -    unsigned int i;
>      const unsigned long *ro_map;
>      int rc = 0;
>  
> @@ -159,12 +199,19 @@ int vpci_assign_device(struct pci_dev *pdev)
>          goto out;
>  #endif
>  
> -    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> -    {
> -        rc = __start_vpci_array[i](pdev);
> -        if ( rc )
> -            break;
> -    }
> +    /*
> +     * Capabilities with high priority like MSI-X need to
> +     * be initialized before header
> +     */
> +    rc = vpci_init_cap_with_priority(pdev, VPCI_PRIORITY_HIGH);
> +    if ( rc )
> +        goto out;

I understand this is not introduced by this change, but I wonder if
there could be a way to ditch the priority stuff for capabilities,
specially now that we only have two "priorities": before or after PCI
header initialization.

Thanks, Roger.


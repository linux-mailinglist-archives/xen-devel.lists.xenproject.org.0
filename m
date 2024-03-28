Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B968889073D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 18:33:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699140.1091745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rptbz-00077y-9f; Thu, 28 Mar 2024 17:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699140.1091745; Thu, 28 Mar 2024 17:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rptbz-000761-70; Thu, 28 Mar 2024 17:32:23 +0000
Received: by outflank-mailman (input) for mailman id 699140;
 Thu, 28 Mar 2024 17:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ab0Y=LC=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rptbx-00075v-Bi
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 17:32:21 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 208c8110-ed29-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 18:32:19 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56890b533aaso1395400a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 10:32:19 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 dl5-20020a170907944500b00a4e28b2639asm490385ejc.209.2024.03.28.10.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 10:32:18 -0700 (PDT)
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
X-Inumbo-ID: 208c8110-ed29-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711647139; x=1712251939; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pdr6uR7LCJjvjFILccCpwKZPipHQau/u+1nfVS9NK3E=;
        b=j0kMfOxYB2wQ7oCUK7TbO1JtRRoZqGUBfkgAJiuabYM9FlXC4M5kh+jWT3v9qD1DC9
         ZcVZxzmoE/lTd8s2PNIHkhSODFPkwBQQLiFz/NYw4xX+i5rUxhvmo6sWJ6tj/x08qfIW
         TcX6CKTU4J90qFPShkBAmsrkrxQRneDZwI9sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711647139; x=1712251939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdr6uR7LCJjvjFILccCpwKZPipHQau/u+1nfVS9NK3E=;
        b=o6174CWfW44kvArRHKaMFpgULV6CVWbJDjsCdCWL7yr2fhVbPcQexsUpqfcnFiY+Dl
         8Us8qIH1NWol2FA5A/4C03HDI/Q2ToDUtYHmB22HbSExUPlYnNaGKE6Ey6ja/Z2H+K9G
         HaasJuJJc4YolQD2vFlIpJF49f47x88WBKutj34za3HLdMt+iqhcjrNv7XBisiQ2Q6ev
         EWYw0mPuAZi2KsTSknGDcWdoTslZt3egBNj0uY33agvfedCLXOlUFHKZzFwrDk7oV3qY
         7CxM6+5Q+fY1PCK+2tNixUujJRrVgX/WKW8mCouCdxL9sJsHp8iPbxi1G0YsNiPUf2vK
         K5uA==
X-Gm-Message-State: AOJu0YweEqkJaYCbr9/dECer/tbTB6Hzu+pqQcr1hqmcwIhZznRjlO6U
	naFMQxfm24WC3Sqm5zgH3O53YNwZnyyc9l4CTPoTTd6Ab+p1lD0axnk5CWkST+s=
X-Google-Smtp-Source: AGHT+IEMZYyEjAzpFjP3n8C915PTFs+IX5VRjRi2fjWqFlTHsgbB9hBweHiUxIkE1fO79jlV+/ccpg==
X-Received: by 2002:a17:906:e299:b0:a4e:233b:e470 with SMTP id gg25-20020a170906e29900b00a4e233be470mr1467475ejb.53.1711647138578;
        Thu, 28 Mar 2024 10:32:18 -0700 (PDT)
Date: Thu, 28 Mar 2024 17:32:17 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v6 4/5] libxl: Use gsi instead of irq for mapping
 pirq
Message-ID: <81c6e63f-b493-4bbd-a91a-ec0e04cc69e2@perard>
References: <20240328063402.354496-1-Jiqian.Chen@amd.com>
 <20240328063402.354496-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328063402.354496-5-Jiqian.Chen@amd.com>

On Thu, Mar 28, 2024 at 02:34:01PM +0800, Jiqian Chen wrote:
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 96cb4da0794e..2cec83e0b734 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1478,8 +1478,14 @@ static void pci_add_dm_done(libxl__egc *egc,
>      fclose(f);
>      if (!pci_supp_legacy_irq())
>          goto out_no_irq;
> -    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
>                                  pci->bus, pci->dev, pci->func);
> +    r = access(sysfs_path, F_OK);
> +    if (r && errno == ENOENT) {
> +        /* To compitable with old version of kernel, still need to use irq */

There's a typo, this would be "To be compatible ...". Also maybe
something like "Fallback to "/irq" for compatibility with old version of
the kernel." might sound better.

> +        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +                               pci->bus, pci->dev, pci->func);
> +    }
>      f = fopen(sysfs_path, "r");
>      if (f == NULL) {
>          LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
> @@ -2229,9 +2235,15 @@ skip_bar:
>      if (!pci_supp_legacy_irq())
>          goto skip_legacy_irq;
>  
> -    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/gsi", pci->domain,
>                             pci->bus, pci->dev, pci->func);
>  
> +    rc = access(sysfs_path, F_OK);

Please, don't use the variable `rc` here, this one is reserved for libxl
error/return code in libxl. Introduce `int r` instead.

> +    if (rc && errno == ENOENT) {
> +        /* To compitable with old version of kernel, still need to use irq */
> +        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +                               pci->bus, pci->dev, pci->func);
> +    }
>      f = fopen(sysfs_path, "r");
>      if (f == NULL) {
>          LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);

With those two things fixed: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


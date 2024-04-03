Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB9897308
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 16:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700579.1093938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1v6-0004z1-Ei; Wed, 03 Apr 2024 14:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700579.1093938; Wed, 03 Apr 2024 14:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1v6-0004xT-Bz; Wed, 03 Apr 2024 14:48:56 +0000
Received: by outflank-mailman (input) for mailman id 700579;
 Wed, 03 Apr 2024 14:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPGy=LI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rs1v4-0004xN-Lj
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 14:48:54 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a56aa94-f1c9-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 16:48:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4156a29ff70so20632525e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 07:48:53 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b00414854cd257sm21697802wmq.20.2024.04.03.07.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 07:48:52 -0700 (PDT)
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
X-Inumbo-ID: 4a56aa94-f1c9-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712155733; x=1712760533; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Thkm/xBLLYoHHKowPDwaLaDVv6ytZcBYJ7wDDXdCj2M=;
        b=A4XYWtuLbZoWYO4xjE8B7wm1ZXjTeP/egFUigWEN59n6UeWM2aG0aXpW388HI1RglA
         l1Jvdo89bwiqk7wki8hGbLD7ZTGNUqroWyQem4CEVi0eV7adPumXvrzx7w654QZiUVy5
         1ebFdpKotTUGL/CLwcyQRoSzJu3TCkTMLf2MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712155733; x=1712760533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Thkm/xBLLYoHHKowPDwaLaDVv6ytZcBYJ7wDDXdCj2M=;
        b=oohz5xdzgwn+e8O0HWkeuVHaOYsDIK/Fj0dHCT7pNm4BgJSDTAxmCereRYH5wza06p
         dP+En1IZSovDSyjF5fScKXt1kJDu8qez1vcSV844ridirHh3963LTKtLjMrhY9HOir3X
         RU0j5QDJg7RyDke4vM1e0PgBMLKhuputT5cx6HAYBLG2mUulKxk7KNr82ar5sB8mVrRl
         4I3uqjsuYIs49kZ4pCm46QHp6Yw6tyZQuL8YriGNfuLG3fqOVpwAhS69kLPRReiZML4x
         PKfgP3UMC6UivP7iEbiM8On1W6kpxJcTAKmZKpAQmTLJGA5KwgW6xNZbke9cB0G7jscj
         qVoA==
X-Gm-Message-State: AOJu0Yw8duEEm26KwXofo0zeq7w7rRhZ8dbaA+Q2rfCxVVeXI3qNJob3
	SqjIKrQ/hMT8kA3/FDtgmaWDVrfNnIZTvUhu5QtNOyEeybL1Qp2I6Xs2X5aCXAA=
X-Google-Smtp-Source: AGHT+IE9kSscRj83xw5NxlJVRgWxFOsH/oTtHiAHRUxgCUrtbaPaF6ixlaW7fgMweZB9UR/xOK2kxQ==
X-Received: by 2002:a05:600c:a69d:b0:415:52f8:ca74 with SMTP id ip29-20020a05600ca69d00b0041552f8ca74mr2365655wmb.36.1712155732829;
        Wed, 03 Apr 2024 07:48:52 -0700 (PDT)
Date: Wed, 3 Apr 2024 15:48:51 +0100
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
Subject: Re: [RFC XEN PATCH v6 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Message-ID: <316358e3-be27-4e4b-8ac4-2935442071c5@perard>
References: <20240328063402.354496-1-Jiqian.Chen@amd.com>
 <20240328063402.354496-6-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328063402.354496-6-Jiqian.Chen@amd.com>

On Thu, Mar 28, 2024 at 02:34:02PM +0800, Jiqian Chen wrote:
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 2cec83e0b734..debf6ec6ddc7 100644
> @@ -1500,13 +1510,25 @@ static void pci_add_dm_done(libxl__egc *egc,
>              rc = ERROR_FAIL;
>              goto out;
>          }
> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> -        if (r < 0) {
> -            LOGED(ERROR, domainid,
> -                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
> -            fclose(f);
> -            rc = ERROR_FAIL;
> -            goto out;
> +        if (is_gsi) {
> +            r = xc_domain_gsi_permission(ctx->xch, domid, gsi, 1);
> +            if (r < 0 && r != -EOPNOTSUPP) {

Is it correct to check `r` for "-EOPNOTSUPP" ? Because `man ioctl` and
"xenctrl.h:105" says that `r` is 0 on success or -1 on error with `errno`
set.

> +                LOGED(ERROR, domainid,
> +                      "xc_domain_gsi_permission gsi=%d (error=%d)", gsi, r);

Is the `r` value useful to print? Because LOGED() already prints
strerror(errno).

> +                fclose(f);
> +                rc = ERROR_FAIL;
> +                goto out;
> +            }
> +        }
> +        if (!is_gsi || r == -EOPNOTSUPP) {
> +            r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> +            if (r < 0) {
> +                LOGED(ERROR, domainid,
> +                    "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
> +                fclose(f);
> +                rc = ERROR_FAIL;
> +                goto out;
> +            }
>          }
>      }
>      fclose(f);
> @@ -2180,6 +2202,7 @@ static void pci_remove_detached(libxl__egc *egc,
>      FILE *f;
>      uint32_t domainid = prs->domid;
>      bool isstubdom;
> +    bool is_gsi = true;
>  
>      /* Convenience aliases */
>      libxl_device_pci *const pci = &prs->pci;
> @@ -2243,6 +2266,7 @@ skip_bar:
>          /* To compitable with old version of kernel, still need to use irq */
>          sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                                 pci->bus, pci->dev, pci->func);
> +        is_gsi = false;
>      }
>      f = fopen(sysfs_path, "r");
>      if (f == NULL) {
> @@ -2261,9 +2285,17 @@ skip_bar:
>               */
>              LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
>          }
> -        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
> -        if (rc < 0) {
> -            LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
> +        if (is_gsi) {
> +            rc = xc_domain_gsi_permission(ctx->xch, domid, irq, 0);

Could you store the return code of this system call into `r` instead?
`rc` is supposed to be use exclusively for libxl error code, so the
current code is wrong, but we can partially fixed that in your patch.

> +            if (rc < 0 && rc != -EOPNOTSUPP) {

Shouldn't you check EOPNOTSUPP in `errno` instead?

> +                LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d", irq);
> +            }
> +        }
> +        if (!is_gsi || rc == -EOPNOTSUPP) {
> +            rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);

Same here, use `r` instead of `rc`.

> +            if (rc < 0) {
> +                LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
> +            }
>          }
>      }
>  

Thanks,

-- 
Anthony PERARD


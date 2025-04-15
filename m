Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56630A8998F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952504.1347930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dFM-0003oZ-DK; Tue, 15 Apr 2025 10:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952504.1347930; Tue, 15 Apr 2025 10:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dFM-0003mX-Af; Tue, 15 Apr 2025 10:10:28 +0000
Received: by outflank-mailman (input) for mailman id 952504;
 Tue, 15 Apr 2025 10:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4dFL-0003mN-0b
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:10:27 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9cb5790-19e1-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 12:10:26 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5cded3e2eso8554032a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:10:26 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acaa1cb40e3sm1050151866b.122.2025.04.15.03.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 03:10:24 -0700 (PDT)
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
X-Inumbo-ID: d9cb5790-19e1-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744711826; x=1745316626; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gY43497sSxUtdzpZ2hM8DobKNxC8/fxSO4K8OtOWh18=;
        b=I9sU8YY8yY1YKfZ1NoGDE17b/4b0LpXjQ9xDiyh6TCiutLmdrtN8p+f0hdwIK5FQHv
         xO9jE+J/+O2kGDt30F7oo93O+pWHrE8EON74+2hnzoT0UfZfa1z2NDZOVEkdeebC/jAU
         qosoGzL5KrGn528x79K7dVnPegVsKEdzBijdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744711826; x=1745316626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gY43497sSxUtdzpZ2hM8DobKNxC8/fxSO4K8OtOWh18=;
        b=srbSp+K8tA2aCZwQ1H1dKtYMGMQJ4wDrIHDq1MhI0jAjm+8G2RFg8bDYSWAzC2tJ/D
         rN9TCsdefV53b0acKkIz9ODJm7A9vWm4LE8q7S+/tKXR7fAZJIEgaFfTT9xav0rkebOf
         1kyij+9H0QNacGTiDjZGkKoZsmpn4wlbqRYsNSf+HSs5HGQdBlW6jfXcVg9geAvYzZLn
         iHDoI7C1A8fS6D014lbabomtGdk1Ys32OF9KIuF/uTdY6LeiNqvknYHMJn4RviDvVtZ6
         10/FoyHqGYNrCxM5lhhE+srJJFw7HlWVQiESnCYIWjqHpvjZH+V1wgHi0CsXlE0B2nxK
         b5Yw==
X-Gm-Message-State: AOJu0Yx4PeJGEERZfbL+3Zaaqb/Qz9XF3W2amYucbqn4LbyjigAeS61d
	0zx6B/dsrBmrXzNENRHGoZsuUuHZoAMvNZzZcEbXWDGrsrNk2+YsSIQOhrVQo9k=
X-Gm-Gg: ASbGncsN1UKfcZs8UeGYhaJaEMskxS1Ng6hoUOMBlyVeOEKp8fpLKuRknPSLXpi6Tlq
	iop6SpGTrrRdPpJyID9Q8NbtyhbcWxvl0QA1Iqg13vTb73UvqEzsG0uox4Cu5iUY/vwpXi1GksU
	1suZQwYCh+YhbC118oL+UB4v3jZfMGANVHqZPGMemIvXuF2+NHXdzj9IkQbyQD6XsMXniZ4qWms
	fFIYiq8BiLH8DxWjFTpB5bm5c1zqODAPFdM9zUm08d2jTD0iT/4NWtfhMzkbTZro1eqtvKtZS6H
	hkNMfk7qXL2epSrs+/kUfXBY300PVnDVlL+XfyZpt4PxDw==
X-Google-Smtp-Source: AGHT+IGNagXJsLWL0AwxJS+PThdmTAQHhspaXhGliosb16F2UnzZ8O6wCUBtvfuDNkP+11BewYW7hw==
X-Received: by 2002:a17:907:724c:b0:aca:a357:d5f7 with SMTP id a640c23a62f3a-acad343c75amr1640513866b.3.1744711825519;
        Tue, 15 Apr 2025 03:10:25 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:10:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Message-ID: <Z_4wkFn1VvBe_6Eh@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409064528.405573-3-Jiqian.Chen@amd.com>

On Wed, Apr 09, 2025 at 02:45:22PM +0800, Jiqian Chen wrote:
> Current logic of init_header() only emulates legacy capability list
> for guest, expand it to emulate for host too. So that it will be
> easy to hide a capability whose initialization fails and no need
> to distinguish host or guest.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v1->v2 changes:
> new patch
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/header.c | 139 ++++++++++++++++++++------------------
>  1 file changed, 74 insertions(+), 65 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ef6c965c081c..0910eb940e23 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -745,6 +745,76 @@ static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
>      return !bar->mem ? -ENOMEM : 0;
>  }
>  
> +/* These capabilities can be exposed to the guest, that vPCI can handle. */
> +static const unsigned int guest_supported_caps[] = {
> +    PCI_CAP_ID_MSI,
> +    PCI_CAP_ID_MSIX,
> +};
> +
> +static int vpci_init_capability_list(struct pci_dev *pdev)
> +{
> +    int rc;
> +    bool mask_cap_list = false;
> +    bool is_hwdom = is_hardware_domain(pdev->domain);
> +    const unsigned int *caps = is_hwdom ? NULL : guest_supported_caps;
> +    const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(guest_supported_caps);
> +
> +    if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
> +    {
> +        unsigned int next, ttl = 48;
> +
> +        next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
> +                                     caps, n, &ttl);
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                               PCI_CAPABILITY_LIST, 1,
> +                               (void *)(uintptr_t)next);
> +        if ( rc )
> +            return rc;
> +
> +        next &= ~3;
> +
> +        if ( !next && !is_hwdom )
> +            /*
> +             * If we don't have any supported capabilities to expose to the
> +             * guest, mask the PCI_STATUS_CAP_LIST bit in the status register.
> +             */
> +            mask_cap_list = true;
> +
> +        while ( next && ttl )
> +        {
> +            unsigned int pos = next;
> +
> +            next = pci_find_next_cap_ttl(pdev->sbdf, pos + PCI_CAP_LIST_NEXT,
> +                                         caps, n, &ttl);
> +
> +            rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
> +                                   pos + PCI_CAP_LIST_ID, 1, NULL);
> +            if ( rc )
> +                return rc;
> +
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   pos + PCI_CAP_LIST_NEXT, 1,
> +                                   (void *)(uintptr_t)next);
> +            if ( rc )
> +                return rc;
> +
> +            next &= ~3;
> +        }
> +    }
> +
> +    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
> +    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
> +                                PCI_STATUS, 2, NULL,
> +                                PCI_STATUS_RO_MASK &
> +                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
> +                                PCI_STATUS_RW1C_MASK,
> +                                mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
> +                                PCI_STATUS_RSVDZ_MASK);

One further remark I've forgot to make on the previous reply: I'm
unsure we want to do this for dom0, as we in general allow dom0
unfiltered write access (unless it's for accesses mediated by Xen).

Thanks, Roger.


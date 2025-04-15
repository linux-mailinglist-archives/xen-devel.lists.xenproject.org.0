Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5816A897DA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 11:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952335.1347815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4cXk-0004hh-OM; Tue, 15 Apr 2025 09:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952335.1347815; Tue, 15 Apr 2025 09:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4cXk-0004fT-KI; Tue, 15 Apr 2025 09:25:24 +0000
Received: by outflank-mailman (input) for mailman id 952335;
 Tue, 15 Apr 2025 09:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4cXj-0004fN-8B
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 09:25:23 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e253a8b-19db-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 11:25:22 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e5cd420781so10403003a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 02:25:22 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f36ee54ff7sm6335838a12.15.2025.04.15.02.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:25:21 -0700 (PDT)
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
X-Inumbo-ID: 8e253a8b-19db-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744709122; x=1745313922; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bj7+jgdHRC+qY+aWF+rUsDWrAOqhBYGYclz5yeDtUbA=;
        b=nB68DHF43jRmXDv91Fl4OJlb8Cqp0OhxX+ZJlT3PVWEGSp3zSecbh7eZV6aBnvKg9B
         CC6H0QfVTRM8vJoyF4OV1cp7YLj+/yDh5wE+Z+OuFSinpb80GUMH8FIiiUWcyH9DUFnw
         poeBd1YuUJsR1t90XTQOdaNKhDnKTmn4SsXQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709122; x=1745313922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bj7+jgdHRC+qY+aWF+rUsDWrAOqhBYGYclz5yeDtUbA=;
        b=e0GZJCjjvG3onkN934LPkdtduZP+p414Rq2FWTyKoUHlm92aUi8LPN4vl1odhd8eN2
         mJ9UvFwGQ8JFxrc+MQEkWRgfPJssjTAa4+pPE2b/bec7MtYefzoNc0i++gUoByRwbuA5
         ZCcpe9Au7yqmTO+IHhio67IuZMRg0jvhYEOcSlVlhByKrzmR74Ok212Q8syfZISnmp0h
         Ac48epH3R4AqDnj2Ch0+3pmCuAjg+d4SDOOFuWb9p4AbQhRnFBwFw+bEShJR3jr76go/
         YVYjBBZ4w2dh/YOxAaRSRoyRD+j7b1UmyIYOZYyQ6kzT2AavtYdm7N3MxKqmU8ZdptRx
         M79w==
X-Gm-Message-State: AOJu0Yx47NurkGoXNhyUE8Hu+9o+nqfon3/J8B1hECBxuPp7AtByPuDU
	P0x9UGvg+eUhom9s+ivDiGA/yMHpvWmayqa1L6k0/xCy1zkZPxDqa7d/x2axJvo=
X-Gm-Gg: ASbGncsslj6AdQlgn3L/qYmnCvGjaFJbcUrvaoRINNPEdTu29uC2sMMLf8teIKfbEns
	xBMR+ETbRgFwTW6QeOL3EmeTTeW+9rvOfB7/P3g5mkoVRAS2NEAO5+PxcPsoH0pfB5GxV2TAF1l
	EkbDJbZyc5/JukK1O3re2bo72Tm8fqqQjFioaxfa5tLiEHVaDvZ+Px6GCxj5AJlhXyjHddMoNee
	JexDcZwUslE333RzvtPadjGpBSEHr3J8poL3A/VXTvYBAbAqKmKq2WHSbZhATrKTACo5nMYzPhB
	dv4RAihnqJndpbuxkcO1aqGQWbZCVUlugOKCV4+RmEynlg==
X-Google-Smtp-Source: AGHT+IEzCBD7KHoC4XLKkEBNqDyCUVaw3wvnSUn7LTHWro1XX3rAv3Kni1Lb5aDFGwcxS2PnHjJR0g==
X-Received: by 2002:a05:6402:5187:b0:5de:dfd0:9d20 with SMTP id 4fb4d7f45d1cf-5f36ff07331mr13074304a12.24.1744709121672;
        Tue, 15 Apr 2025 02:25:21 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:25:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Message-ID: <Z_4mAAm-gCmZTJub@macbook.lan>
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

It might be best if the initial code movement of the logic in
init_header() into it's own separate function was done as a
non-functional change, and a later patch added support for dom0.

It's easier to then spot the differences that you are adding to
support dom0.

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

Is there a reason this needs to be defined outside of the function
scope?  So far it's only used by vpci_init_capability_list().

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

There's no need to add this handler for the hardware domain, that's
already the default behavior in that case.

Thanks, Roger.


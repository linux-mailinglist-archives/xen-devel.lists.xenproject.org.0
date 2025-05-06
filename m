Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274ADAAC795
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 16:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977380.1364395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJ45-0004vX-Uk; Tue, 06 May 2025 14:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977380.1364395; Tue, 06 May 2025 14:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJ45-0004sw-S6; Tue, 06 May 2025 14:14:33 +0000
Received: by outflank-mailman (input) for mailman id 977380;
 Tue, 06 May 2025 14:14:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCJ44-0004sq-HY
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 14:14:32 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dfa8867-2a84-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 16:14:31 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso26215205e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 07:14:31 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2ad78f6sm218721635e9.2.2025.05.06.07.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 07:14:31 -0700 (PDT)
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
X-Inumbo-ID: 6dfa8867-2a84-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746540871; x=1747145671; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZz4YrC1KS2SabAnChJUkqQGGPUK/TePs3MU2l5rXRM=;
        b=bv3QbVoBIY82aPqulHki7N50vEF+XIbkl4rQmZ34e2aiFsHaMnx7wi7+htovnu2CyV
         lGCjAtG0SG7TNbsB7Bcp0evLX9gQ/Rm7/yqEXcs822r9rQsWLxropXOKjsz95t3dcHgo
         9O97r/HK8EdqaecxQqbhGFYB8jVZHx8U3nNbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540871; x=1747145671;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZz4YrC1KS2SabAnChJUkqQGGPUK/TePs3MU2l5rXRM=;
        b=EfDyZp+b2tRFJGGtOZ8lpuSuj3RuCRXG14vvC0NCdjQtNoQ86yhf0LDjdIMMO5SZN8
         BY3L1W6aJpKo376/S0jiTTVPPjREYf1R+gez77S6TYpQH5gjgVxhb4Pqyv4oMXV2sMIz
         6sR0zN2G9Fd6WqwKZEslJOjrVgk7UlqyzOGGqEE/EvNDNL0dk52doJUd/uhzXgm0B6F/
         WDSGcUOuvvwdr4rXc49kQfBeu2C7vUdSZnf2PCr6o85u9P8X6wX/VY9Kdfw+VBh2dCW+
         lOCbfLfmvG4S/6QJOX+sh2wLSIadpaMx/avJfoweNCKJswX7a3OfYJpZztFh8WHo3ubI
         v0bg==
X-Gm-Message-State: AOJu0YxgNYgyF7t/4zBoKlhr8Gw2cqHYozEFqX1pKfCSuzWrA3neg5Rc
	rbPIqv2YEvJ77V3IOuIc5UVeIC4eFMp9Mv3KHRHSZygoiIEnJm0hANUyfQVj83s=
X-Gm-Gg: ASbGncsbUSIiiepDOF3z9KaC0q4/2tcAf+kHZtgNeB8Z0vpVoDIX6WkH9HU4D5nSkVI
	HwxHcFNp9quWJDn8n/ekR3RBPa71m0qBkGPnzPdrq8NP/sE4taQ/daITV/GviGQek+6fa5vQ2mD
	1dCvXUwyvyjHKukhI1Ir/lNdB1EPrr8stMf4R5xCao+pHRIrSO6Axc+xwryvsY644xfL7SFbvt/
	R/gWaO+8TJ1JljAlu0vdBst3rC/ETBwxLXCyke29qefnYkTV63I1yu+WAxKRta/w894qvUfcNk+
	q2UD9+xVm6SLnhbHWGKONSdMNXHjmLUxT1nzVcciHWZv0A==
X-Google-Smtp-Source: AGHT+IFgIwrgNHbVWIfOS8wlE/K8hEnuiijOz2FqOk4D9ubjD5R9e1uJnQ3MqzPGB+lQKV5DJWgtJA==
X-Received: by 2002:a05:600c:5010:b0:441:bf4e:89c8 with SMTP id 5b1f17b1804b1-441c48b02e1mr112757135e9.3.1746540871314;
        Tue, 06 May 2025 07:14:31 -0700 (PDT)
Date: Tue, 6 May 2025 16:14:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3 04/11] vpci/header: Emulate extended capability list
 for dom0
Message-ID: <aBoZRicr20a4eCNV@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-5-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:18:56PM +0800, Jiqian Chen wrote:
> Add a new function to emulate extended capability list for dom0,
> and call it in init_header(). So that it will be easy to hide a
> extended capability whose initialization fails.
> 
> As for the extended capability list of domU, just move the logic
> into above function and keep hiding it for domU.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v2->v3 changes:
> * In vpci_init_ext_capability_list(), when domain is domU, directly return after adding a handler(hiding all extended capability for domU).
> * In vpci_init_ext_capability_list(), change condition to be "while ( pos >= 0x100U && ttl-- )" instead of "while ( pos && ttl-- )".
> * Add new function vpci_hw_write32, and pass it to extended capability handler for dom0.
> 
> v1->v2 changes:
> new patch
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/header.c | 36 ++++++++++++++++++++++++++++--------
>  xen/drivers/vpci/vpci.c   |  6 ++++++
>  xen/include/xen/vpci.h    |  2 ++
>  3 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index c98cd211d9d7..ee94ad8e5037 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -817,6 +817,31 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>                                    PCI_STATUS_RSVDZ_MASK);
>  }
>  
> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
> +{
> +    unsigned int pos = PCI_CFG_SPACE_SIZE, ttl = 480;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +        /* Extended capabilities read as zero, write ignore for guest */
> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                 pos, 4, (void *)0);
> +
> +    while ( pos >= PCI_CFG_SPACE_SIZE && ttl-- )
> +    {
> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
> +        int rc;

I'm thinking it might be helpful to avoid setting the handler for the
last capability on the list, or simply for devices that have no
extended capabilities at all:

if ( PCI_EXT_CAP_NEXT(header) >= PCI_CFG_SPACE_SIZE )
{
    int rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
                               pos, 4, (void *)(uintptr_t)header);

    if ( rc )
        return rc;
}

Otherwise on systems with a lot of devices it can be quite wasteful to
set a handler to just return the next capability as 0.

Thanks, Roger.


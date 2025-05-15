Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844ADAB8C70
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 18:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985789.1371649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFbT8-0001Ex-Vx; Thu, 15 May 2025 16:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985789.1371649; Thu, 15 May 2025 16:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFbT8-0001Ad-ST; Thu, 15 May 2025 16:30:02 +0000
Received: by outflank-mailman (input) for mailman id 985789;
 Thu, 15 May 2025 16:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFbT7-0000yf-70
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 16:30:01 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d89c68e1-31a9-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 18:30:00 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6000f2f217dso1103979a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 09:30:00 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d27192dsm12479566b.71.2025.05.15.09.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 09:29:59 -0700 (PDT)
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
X-Inumbo-ID: d89c68e1-31a9-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747326600; x=1747931400; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQojJnZ/ObWeMzCKGcC9gHfHHtjUiLkOYNoJimNKpXI=;
        b=ddzs2FXUnzzJUglD2zy8bsdcrqhuGRFw6zDOa9t8kwpyOTgdzKoHBVExRo1VK5w5Yf
         gFtF1aBVJ7OVywvUx0pPdegaN2muPRGzLn5QxyTX56HdkhoMMYrrbxg+yeAPfM+BSY8f
         Mi656scdeixRmaPdEdVNAuJ1+YJMc54MUCF74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747326600; x=1747931400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQojJnZ/ObWeMzCKGcC9gHfHHtjUiLkOYNoJimNKpXI=;
        b=I0cqcgR0RnMEtpH9yt1hW6Wn2fSq7iB9yG/kXKYHPvVtQWMPgW60uy4wSw05mrye0a
         K0PrN3gPFmiNGugR0lJ7sxXe9+SgKe23TAN4Sh4ND6iXtUdZHNm5m9hKflMCoQvm+YMS
         UB4/akX/5eetmG8uYR832OgX+yYKAZBf+ggr9ULnSXrJsUAySjW3pMYbkTzyMf0uRpqh
         l1BPB/kSzalkk0Tb1oTGZ8VbbY6Hfyp9kMt40dLrtXqTv0MQX9Ono5cIStH81kCrWvI7
         xs65Yy8u2kNe6A1GGrfmGqNHzmNScJTzLnwjw+m6wB1LlyjZYm6RvKy8DhX0b6vn/6YQ
         Xlwg==
X-Gm-Message-State: AOJu0YwEQwQw0QDXWyt9aF+PQVYrBt7h27bQ5uzNRXt0jTEpsv+SznDX
	SZcyw3kWa9yfN7ZDHycEnYYHvh1hfC9OCX8lJpR4+ok8WI+q8MCWorFpUymYkN0RL55U9zWng3s
	Q7h1S
X-Gm-Gg: ASbGncv/Jig0+bfDVLdLcebTLRUtfN3pL8YRFDoIZCXibkcWkH1Xai5gB66bA9yjscV
	m6qeLxb0SgGXZW1h4krg3ykfkqWIIlcnCnBcaFb8VGOjC7zESF7nyLR9AVMToXID87hjThGQQV2
	QzmloNBMXAp8t+ixWRWYuBhk+Mfve0WihIfYU6olBjSjiSBh9n6czGIlf6VQ1eZRftNc+XtTyUf
	iM1lv9tfhqmktpYFdIXhwQtEectvsgAUpk17cZOCRxCZEI2YmdlXa5y7S4jvPGVnUWWYx9N8758
	n9w0HbEwZfmCzpC6wl4nGYmAZp5/ZXOcOKi6BwiuXDFCJQG5fmJvVSfMwR1GK6WKR54=
X-Google-Smtp-Source: AGHT+IFKqIoLrdcbAWLckgeD5/v9eFY1cp7VHhr9m0K/M7erqe/eawOBo+F5rhw33tYxcnMDS01XXA==
X-Received: by 2002:a17:907:72c3:b0:ad2:48f4:5968 with SMTP id a640c23a62f3a-ad52d517091mr45880666b.25.1747326599572;
        Thu, 15 May 2025 09:29:59 -0700 (PDT)
Date: Thu, 15 May 2025 18:29:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v4 02/10] vpci/header: Emulate legacy capability list for
 dom0
Message-ID: <aCYWhmUBa_AyYh6N@macbook.lan>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509090542.2199676-3-Jiqian.Chen@amd.com>

On Fri, May 09, 2025 at 05:05:34PM +0800, Jiqian Chen wrote:
> Current logic of emulating legacy capability list is only for domU.
> So, expand it to emulate for dom0 too. Then it will be easy to hide
> a capability whose initialization fails in a function.
> 
> And restrict adding PCI_STATUS register only for domU since dom0
> has no limitation to access that register.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v3->v4 changes:
> * Also pass supported_caps to pci_find_next_cap_ttl() for dom0 since the n is zero when dom0,
>   and add a comment to explain it.
> * Restrict adding PCI_STATUS register only for domU since dom0 has no limitation to access that register.
> * For dom0 register handler, set vpci_hw_write8 to it instead of NULL.
> 
> v2->v3 changes:
> * Not to add handler of PCI_CAP_LIST_ID when domain is dom0.
> 
> v1->v2 changes:
> new patch.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/header.c | 53 ++++++++++++++++++++++++---------------
>  xen/drivers/vpci/vpci.c   |  6 +++++
>  xen/include/xen/vpci.h    |  2 ++
>  3 files changed, 41 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 3e9b44454b43..a06c518c506c 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -749,9 +749,9 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>  {
>      int rc;
>      bool mask_cap_list = false;
> +    bool is_hwdom = is_hardware_domain(pdev->domain);
>  
> -    if ( !is_hardware_domain(pdev->domain) &&
> -         pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
> +    if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
>      {
>          /* Only expose capabilities to the guest that vPCI can handle. */
>          unsigned int next, ttl = 48;
> @@ -759,12 +759,18 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>              PCI_CAP_ID_MSI,
>              PCI_CAP_ID_MSIX,
>          };
> +        /*
> +         * For dom0, we should expose all capabilities instead of a fixed
> +         * capabilities array, so setting n to 0 here is to get the next
> +         * capability position directly in pci_find_next_cap_ttl.
> +         */
> +        const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(supported_caps);
>  
>          next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
> -                                     supported_caps,
> -                                     ARRAY_SIZE(supported_caps), &ttl);
> +                                     supported_caps, n, &ttl);
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +        rc = vpci_add_register(pdev->vpci, vpci_read_val,
> +                               is_hwdom ? vpci_hw_write8 : NULL,
>                                 PCI_CAPABILITY_LIST, 1,
>                                 (void *)(uintptr_t)next);
>          if ( rc )
> @@ -772,7 +778,7 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>  
>          next &= ~3;
>  
> -        if ( !next )
> +        if ( !next && !is_hwdom )
>              /*
>               * If we don't have any supported capabilities to expose to the
>               * guest, mask the PCI_STATUS_CAP_LIST bit in the status
> @@ -786,15 +792,18 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>  
>              next = pci_find_next_cap_ttl(pdev->sbdf,
>                                           pos + PCI_CAP_LIST_NEXT,
> -                                         supported_caps,
> -                                         ARRAY_SIZE(supported_caps), &ttl);
> +                                         supported_caps, n, &ttl);
>  
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
> -                                   pos + PCI_CAP_LIST_ID, 1, NULL);
> -            if ( rc )
> -                return rc;
> +            if ( !is_hwdom )
> +            {
> +                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
> +                                       pos + PCI_CAP_LIST_ID, 1, NULL);
> +                if ( rc )
> +                    return rc;
> +            }
>  
> -            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val,
> +                                   is_hwdom ? vpci_hw_write8 : NULL,
>                                     pos + PCI_CAP_LIST_NEXT, 1,
>                                     (void *)(uintptr_t)next);
>              if ( rc )
> @@ -805,13 +814,17 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>      }
>  
>      /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
> -    return vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
> -                                  PCI_STATUS, 2, NULL,
> -                                  PCI_STATUS_RO_MASK &
> -                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
> -                                  PCI_STATUS_RW1C_MASK,
> -                                  mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
> -                                  PCI_STATUS_RSVDZ_MASK);
> +    return is_hwdom ? 0 : vpci_add_register_mask(pdev->vpci, vpci_hw_read16,
> +                                                 vpci_hw_write16, PCI_STATUS,
> +                                                 2, NULL,
> +                                                 PCI_STATUS_RO_MASK &
> +                                                    ~(mask_cap_list ?
> +                                                        PCI_STATUS_CAP_LIST :
> +                                                        0),
> +                                                 PCI_STATUS_RW1C_MASK,
> +                                                 mask_cap_list ?
> +                                                    PCI_STATUS_CAP_LIST : 0,
> +                                                 PCI_STATUS_RSVDZ_MASK);

Wow, that's a bit too much indentation for my taste.  Do you think you
could do:

/* Return early for the hw domain, no masking of PCI_STATUS. */
if ( is_hwdom )
    return 0;
...

So that you don't have to touch the current return chunk?

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0305FAAF6E5
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 11:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979127.1365826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxic-0006jo-G5; Thu, 08 May 2025 09:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979127.1365826; Thu, 08 May 2025 09:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxic-0006iM-Cj; Thu, 08 May 2025 09:39:06 +0000
Received: by outflank-mailman (input) for mailman id 979127;
 Thu, 08 May 2025 09:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=326h=XY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCxib-0006iA-8C
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 09:39:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4705909d-2bf0-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 11:39:03 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-441d1ed82dbso6954085e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 02:39:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a0b1e8e8d8sm7486647f8f.33.2025.05.08.02.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 02:39:02 -0700 (PDT)
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
X-Inumbo-ID: 4705909d-2bf0-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746697143; x=1747301943; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k7zPBllM2SlFbl2BIom7VfF5dqUW8z6qXYYDQj57i9s=;
        b=rNEdZoPT2kvxwd96/sWQc7/OIWJgPVhXlu+c26uxnrIBFDoRH+Jyd2mlhEmf5xxynv
         DyEekBNY3uBLeEQ6nfkqRpMxa4kJ6AizKCODODWTXjCn1AMogUBvjkfbllXkqCC+U08L
         B+b/emfp+bNnIvCB9AvORV8cgfZCGN3VNyKLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746697143; x=1747301943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7zPBllM2SlFbl2BIom7VfF5dqUW8z6qXYYDQj57i9s=;
        b=T2BzPHCzL31aqkgQi0i5TuKnYpqmRya3mMbsKtOM3OV8J4FWBKw019IA7u34jdOvL9
         5df5faNZLtnKQamdxuXXBkFSQ2W09jU7F4+YpEDlMm67WV2pkekhRTGCyISSJd66rN+1
         iovca6HdM2LH+HjevREPCOkU7A9PNJpbhbwg/18A+hivtJ/yh+fn/SEO46jq6rXmi2hT
         xR4An67HZMirSIrtlaLxLoeytJDKIgCZWVkFAMQ0C3M+5h2V9972GOjgZ/C5iTSC08T6
         0Fg9kQAb+lK2M7nCn5pTwP5LQuKX93HdKN5toLcjf4VPfqH+xYo00McGhMHiO4CMdlFV
         A9DQ==
X-Gm-Message-State: AOJu0YyTRHXjqhFIq61pb7y1tYVkcsxFXAGW322LoNB9cuE5Ad5P2sk3
	SpKjlfLZfBe3no0bKaEOtYa6X9KbKGa2i2Ih91QyVGHtiQMvhApFAxBSS0bb1RDgo0EOicSXlOO
	T
X-Gm-Gg: ASbGncvPoFeUHy5z8bQHzoTeCeI1XBnFrxQuzW7BJlcdVd5zXLH6irWajBKKhuu/f3A
	5etvsaaq8jbQ4u6tKrPgRhKkaY0CmNqEUHetGsmYkRyiYXHCmazEaHXm8MohuNN2Ly3F6x3BMhZ
	xmRyYdWK6LTd+Puli4tCzOrVJGCuZBryWPhXT9DpUKCt2ymYj2Q4k3I3BSZxmNg8s/Rjml2A7Za
	WEOi7D0ceintxQeff6Poxa7uCkluXUK1GOnB9xKCCvxAO+09QWX6uW0icFePl0ZuNjTuoLvkMAH
	vl9XGYBQUtjGtwzF/Nz/QwuMs6QziFI3P2YtS5gOc9GdHw==
X-Google-Smtp-Source: AGHT+IHrHUEPwakUdEDcvfpfbIomDrlQykf5nQAxJOzRyZKSrLx9LFFFH9Jws5LMqDDx9nZZ8rvA1g==
X-Received: by 2002:a05:600c:a44:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-441d44c3395mr60715665e9.10.1746697142749;
        Thu, 08 May 2025 02:39:02 -0700 (PDT)
Date: Thu, 8 May 2025 11:39:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3 09/11] vpci/rebar: Remove registers when init_rebar()
 fails
Message-ID: <aBx7teQ9ZoI0s4Jt@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-10-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-10-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:19:01PM +0800, Jiqian Chen wrote:
> When init_rebar() fails, the previous new changes will hide Rebar
> capability, it can't rely on vpci_deassign_device() to remove all
> Rebar related registers anymore, those registers must be removed
> fini_rebar().
> 
> To do that, call vpci_remove_registers() to remove all possible
> registered registers.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v2->v3 changes:
> * Use fini_rebar() to remove all register instead of in the failure path of init_rebar();
> 
> v1->v2 changes:
> * Called vpci_remove_registers() to remove all possible registered registers instead of using a array to record all registered register.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/rebar.c | 35 ++++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> index 026f8f7972d9..325090afb0f8 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -49,6 +49,26 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>      bar->guest_addr = bar->addr;
>  }
>  
> +static void fini_rebar(struct pci_dev *pdev)
> +{
> +    uint32_t ctrl;
> +    unsigned int nbars;
> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> +                                                        PCI_EXT_CAP_ID_REBAR);
> +
> +    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )

Maybe add an ASSERT_UNREACHABLE() here?  I don't think we are expected
to get into the cleanup function for the capability if it's not
present, or if the owner of the device is not the hardware domain.

> +        return;
> +
> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> +    /*
> +     * Remove all possible registered registers except header.
> +     * Header register will be removed in mask function.
> +     */
> +    vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
> +                          PCI_REBAR_CTRL(nbars - 1));
> +}
> +
>  static int cf_check init_rebar(struct pci_dev *pdev)
>  {
>      uint32_t ctrl;
> @@ -80,7 +100,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>          {
>              printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
>                     pdev->domain, &pdev->sbdf, index);
> -            continue;
> +            return -EINVAL;

-E2BIG might be better here.  In general I try to avoid using EINVAL,
as it's a catch all that makes differentiating error later on harder.

>          }
>  
>          bar = &pdev->vpci->header.bars[index];
> @@ -88,7 +108,7 @@ static int cf_check init_rebar(struct pci_dev *pdev)
>          {
>              printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
>                     pdev->domain, &pdev->sbdf, index);
> -            continue;
> +            return -EINVAL;

Maybe -EDOM here?  -ENXIO or EIO might also be appropriate.

Overall looks good.

Thanks, Roger.


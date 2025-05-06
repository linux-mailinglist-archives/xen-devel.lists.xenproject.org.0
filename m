Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B105EAAC6F1
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977283.1364316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIgv-0005JS-FI; Tue, 06 May 2025 13:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977283.1364316; Tue, 06 May 2025 13:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIgv-0005GX-C4; Tue, 06 May 2025 13:50:37 +0000
Received: by outflank-mailman (input) for mailman id 977283;
 Tue, 06 May 2025 13:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCIgu-0005GR-4N
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:50:36 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15186536-2a81-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 15:50:34 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so32132155e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 06:50:34 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b89ee3a9sm168847455e9.23.2025.05.06.06.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 06:50:33 -0700 (PDT)
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
X-Inumbo-ID: 15186536-2a81-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746539434; x=1747144234; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URghD3Lcc9QwR0tT7L5eE8ySaBWMCuH5eIYpXHjjpAY=;
        b=kXb/DHfhSm19AL/pptzpD4Uz/qItCL73YbcJH80S+eBN43P7+NjZbGXNcAgG53BfDP
         2IZ5vlY3DyYKbyPpQyZhDSLr1PyezmKfBBuzCkwU69jpTZfbBvWgyIa3f/PwszpBflL1
         /pK4CtPJSfiSgfP311f6GMRIxrIIumQwUZmRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539434; x=1747144234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URghD3Lcc9QwR0tT7L5eE8ySaBWMCuH5eIYpXHjjpAY=;
        b=w+Wg7plPcqn3HHWNsLUvIIdJJMdDpbsvFn+augmoAzCKlmqIR1whNajCMxsF0fp69V
         8v5OiNYpza2E1Y0CNiRkz7FHb6pOoXOn+1gChkXV0onvcYL779dVYt/s2d3olh8FCq/5
         TCNxYXLA4LDkyLodLCsaxEku5DJb8tUPPamt8Cx+rmP4V+RICdmiUgBr619PRGa1C6Al
         IiFeqiXyn+WeV2ur2cMrF3aUhjekI9MFRraOYolMm9JCZsNKOfjKhYQb1+d0XKIBtXe5
         hzrG7oQLeg9msQnzHTPfAzhP+sBi3Vy5c3jdHCCz+BMvEW/IKOphIqM25Icwbc4BY2TW
         lT/g==
X-Gm-Message-State: AOJu0YwgKsHaJrfkobv5vfsi+SnVdQmDpJs2uTxiUqsnp44FInViJPQU
	RHciQOtdFRt3QCsSvUQqHc5P++yLioAQEUTFjc9yIESbNseMj7waFvS8OvZgYNjNsr18meAgXrM
	y
X-Gm-Gg: ASbGncsUtii7Hlr9M98YohxsANrohqQZYSEqPMRim9E+z1WCQkAH6nNBs0DIL9rVRn+
	gtOfqoZXeRKUl8/pD0+uvBuBtKqe4Jq7bkMN49xuZBKy/E53EL8wTFbGjFXTbrxGDedQW2xVl1h
	pNpsjrdGP5rQrKpDQ8UP6DuwXxQGmLmGBLxcUOAMEzK7Hg5ycNGxRkpDHDu29dgJVkD7ab4ArJh
	jUo/SEeb1XsqHaf8RwuQ64tv9jMKU/0Cb9BeLP6DqpWvL2s3gIIrR+Y2lPTUIyLHA/D5Myl3BjO
	YEczp5FAQrHZTqphvGs4HV1fH64J8ayzh/rXKj9a+o3upw==
X-Google-Smtp-Source: AGHT+IHxMso9dfraSBaoaPB3rplF38ppFwTOVeU3CMXWsYFTE0owFnuT9DNeXuJznLc+OM1Y49lkNQ==
X-Received: by 2002:a05:600c:a4c:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-441d04f45b7mr31464525e9.4.1746539433783;
        Tue, 06 May 2025 06:50:33 -0700 (PDT)
Date: Tue, 6 May 2025 15:50:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Message-ID: <aBoTqCf5y_LXzZdb@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250421061903.1542652-4-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:18:55PM +0800, Jiqian Chen wrote:
> Current logic of emulating legacy capability list is only for domU.
> So, expand it to emulate for dom0 too. Then it will be easy to hide
> a capability whose initialization fails in a function.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Sorry, one nit I've noticed while looking at the next patch.

> @@ -786,13 +787,15 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>  
>              next = pci_find_next_cap_ttl(pdev->sbdf,
>                                           pos + PCI_CAP_LIST_NEXT,
> -                                         supported_caps,
> -                                         ARRAY_SIZE(supported_caps), &ttl);
> +                                         caps, n, &ttl);
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
>              rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,

For the hardware domain the write handler should be vpci_hw_write8
instead of NULL.

Thanks, Roger.


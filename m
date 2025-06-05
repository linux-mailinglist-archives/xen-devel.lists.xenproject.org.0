Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81295ACF320
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007064.1386345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCbh-0003oN-FH; Thu, 05 Jun 2025 15:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007064.1386345; Thu, 05 Jun 2025 15:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCbh-0003lj-Cg; Thu, 05 Jun 2025 15:34:17 +0000
Received: by outflank-mailman (input) for mailman id 1007064;
 Thu, 05 Jun 2025 15:34:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNCbf-0003l7-6l
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:34:15 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88939383-4222-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 17:34:13 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4f78ebec8so680608f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:34:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451fb18a855sm22796605e9.18.2025.06.05.08.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:34:12 -0700 (PDT)
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
X-Inumbo-ID: 88939383-4222-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749137653; x=1749742453; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SsXot+elbz3CRhKpGH4GF+wH47QOk45FPC17mvak5Mo=;
        b=p4wpgcwdQpD1NXt7jdFMK4eyaY4jLbWHqTjFDWN6zJ64MnmJg/K4Vp1SDW9t07etwC
         bplrgw5/bWhUqqqGQSqkX0bmCI01jSM3lG6xMGZky1AXBLn4yCqAjE7MQXStIs8z2hlL
         8WiMUuRDv98Yd6TkAklWAzwGlYHEad5yeoTCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137653; x=1749742453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsXot+elbz3CRhKpGH4GF+wH47QOk45FPC17mvak5Mo=;
        b=HcTGAHPt9f+pbcpUALnew6J72u9FufqX57gFZOlaNAWBN/YfHjvO5/OrKLsk5fzWVa
         Nwob146J029iS2yAts+xeRuvX1WJ0ZB79OJN9C/lTCfUkEpwgbIJCEzP6igXpWF0Pd/L
         TIcOOACm1SvWRApFhKzYlcvs7cpvxZdvTVfsDBNFlBGOCzTSoOKuoA6EfiSsLfjPcMWh
         OXNKY5DSkq2BegE9B8Mchq1l64q+INIytT7t2xKjIkXksBf5ojVNVGJq3yWxYZccDyqx
         n41Z92wzMiq7nYZVc5ZejVP+7CPF54l2EduhZPHwTWIFjgcHsz1LHnwFOL6QkcbkScT/
         A1UQ==
X-Gm-Message-State: AOJu0YwqA+XEVQGcBgf3Pk4mCUoD0UmyR51i/OD8b4gfEhL7TQUeIZf3
	PVUnFFJnrpq7gzhVVUSgCsk4ez8O8kuvMMmk1D1wBTCUZu3M3wKKQdUKsabq0BxQ3Nc=
X-Gm-Gg: ASbGncsywFJlA3jptLwR/5QL9syisdkTumTG8cUUZLt35O9isK7Lu3tD+C8OY57qPS0
	ZPHHn+vpwETNY6XUQoOiwbvCkuGqc7Mv9dbilH9VP/hEcjJ9UyWDN4gPucWCxOxIE5IsY2Ro0kE
	PRIJzBTJANruZT66duukzs4cAQ5vhjNEGz8dYIkHcBj9Y0NBR7x+m5baJLt9J3LNldaYWS27AIL
	QsTTNfRBIOGjVwhwQnS8NCBwh8E3X85gjSLmcJ33dk6hvXgEWju6QKsRNzmWFA/lkN7iW41x1o5
	D2A7B3H3ebuCkxzXEvbLp7P0MKClO6M5tYgepR2idOesYM3gq5bcavYMMmJ4vJ7MF2XSsVD0hN1
	dEaIYnwEbkIgyOxUXN2btAYAnB3xjqw==
X-Google-Smtp-Source: AGHT+IFbZFdT3E0iSjhbuaJj6tq2MkrhlE3Knr/sDMnCH9CVThq5jQvtCdTJHZ42GJnnG2Y6BDb/eg==
X-Received: by 2002:a05:6000:4313:b0:3a4:ddde:13e4 with SMTP id ffacd0b85a97d-3a51d98c667mr5863094f8f.58.1749137653081;
        Thu, 05 Jun 2025 08:34:13 -0700 (PDT)
Date: Thu, 5 Jun 2025 17:34:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v5 10/10] vpci/msix: Free MSIX resources when init_msix()
 fails
Message-ID: <aEG482WJWGu_ZHQ6@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-11-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526094559.140423-11-Jiqian.Chen@amd.com>

On Mon, May 26, 2025 at 05:45:59PM +0800, Jiqian Chen wrote:
> When init_msix() fails, current logic return fail and free MSIX-related
> resources in vpci_deassign_device(). But the previous new changes will
> hide MSIX capability and return success, it can't reach
> vpci_deassign_device() to remove resources if hiding success, so those
> resources must be removed in cleanup function of MSIX.
> 
> To do that, implement cleanup function for MSIX.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>



> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v4->v5 changes:
> * Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix" since cleanup hook is changed to be int.
> * Add a read-only register for MSIX Control Register in the end of cleanup_msix().
> 
> v3->v4 changes:
> * Change function name from fini_msix() to cleanup_msix().
> * Change to use XFREE to free vpci->msix.
> * In cleanup function, change the sequence of check and remove action according to init_msix().
> 
> v2->v3 changes:
> * Remove unnecessary clean operations in fini_msix().
> 
> v1->v2 changes:
> new patch.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msix.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 674815ead025..cf79320d3b6f 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -655,6 +655,33 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +static int cf_check cleanup_msix(struct pci_dev *pdev)
> +{
> +    int rc;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msix_pos = pdev->msix_pos;
> +
> +    if ( !msix_pos )
> +        return 0;
> +
> +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
> +    if ( rc )
> +        return rc;
> +
> +    if ( !vpci->msix )
> +        return 0;

You cannot short-circuit here, as it then prevents adding the dummy
handlers done in the last return.

> +
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> +        if ( vpci->msix->table[i] )
> +            iounmap(vpci->msix->table[i]);
> +
> +    list_del(&vpci->msix->next);
> +    XFREE(vpci->msix);
> +
> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, NULL,
> +                             msix_control_reg(msix_pos), 2, NULL);

The above needs to be added even if !vpci->msix.

Thanks, Roger.


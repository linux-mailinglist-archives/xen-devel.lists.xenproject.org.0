Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A712ACF2C4
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007025.1386295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCJ7-0006qF-0a; Thu, 05 Jun 2025 15:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007025.1386295; Thu, 05 Jun 2025 15:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCJ6-0006oL-UF; Thu, 05 Jun 2025 15:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1007025;
 Thu, 05 Jun 2025 15:15:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNCJ5-0006oF-Hn
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:15:03 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9b0cd6f-421f-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 17:15:01 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4f78ebec8so661143f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:15:01 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451fb220385sm21590475e9.28.2025.06.05.08.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:15:00 -0700 (PDT)
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
X-Inumbo-ID: d9b0cd6f-421f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749136501; x=1749741301; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BzShc25RIK93H1a1luCRVsTdWpcCisBN+loG66/M3m4=;
        b=IMFy7hPtsRpSNVZlvsG1c/oDpDaOuKJTTDX48RmzxFDUbp3fw/sidCmvtrDJN6Ru++
         9RjaZ+9nWHus/0K8FFaG4cEnsYD3C+pEgr+14Qzc2GrKnJdy5r+H12hb1bFcxtFcSpFu
         VIkFyX67uaCx5wsq0NHqfVWeeBkyEFfskp/a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749136501; x=1749741301;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BzShc25RIK93H1a1luCRVsTdWpcCisBN+loG66/M3m4=;
        b=ZRUTt08bGuOqaASQzTBqvPD4XDj4lSWBMeNjBhQ+DS+vY8CLl/MQaeWsvyHIWm7jLB
         4IC1ilFurw4ePlFXwqgyAVSXecxXJYX++TA6FvEMysOljWPbh3x7bPwig0UVmv/A5Zll
         SJ1JDp4WfdTo/wnIsgf+BO0EUlu4E3UYA0BkYi1k8mikDxMmC4QyVD9UZwED4Rqfe/Zj
         Stzfbb5XtT/5F0J1crK/UGGaJuxI6wfAecNotnENJ5Qx6FYng7OhO7DFfhHIM18IzkUK
         K/rGiVGCZ51gmQvNgXNJjUF3VF5kZdLcbdVBalyZPrDxyJZ0tE3GpjQ3epS1xLONG4Je
         8+zw==
X-Gm-Message-State: AOJu0YyBe4bwFgLKCcLKjJ6L0dmk6Ey7iB0UfppUa87tPeNk6eg5SGe0
	uaI3jVklU39NK1f+SDdRZuwKP/DYAaIUbmca+u3BnpVl3T27XLNop0mfNAD9x0WKOxw=
X-Gm-Gg: ASbGncuqvsklZ1MlDhVBufEvqDYksTqpvxPbp8fIBBb1UdfgljpfEruvurIq4O4UaDT
	0LABbCEn5NtkoGoQLknpspWPQHm+WgR/RbNAouNApxG5y0hRGUnrts9lVC77UIIUMqn5MSNQbRq
	PaIF//zBaIDk62wYSsWpfdjqEzKmSUCdRSPEegjqwqSLm63XLFYE4LDbEnCxueRJZx4tiA+76A7
	hS3TsAtWyeGpPpgm6DPSAYT6V16rBc/MScWR+uH8+hdu9FvVKCEADci/IWa7VsBxE7jwDb6iPLk
	UcjCH3EZrUOU87C3wnH5xtO8nV+Mce5Liajel1iMHkdkDwbfum9EIdZr3uk9Bl5Z3Kp9f5/mmaY
	kdsujj5MSMr99vcx2SOT9Hg1L9kaf8A==
X-Google-Smtp-Source: AGHT+IErPVrCdYMpgqeNmLE4IGMHQfw+R9SN/p6x04xatxuA8rwvp4FP6wNiHEAWK+HW62TI4TvIaA==
X-Received: by 2002:a05:6000:250f:b0:3a4:edad:2a59 with SMTP id ffacd0b85a97d-3a51d8f6a3bmr6905314f8f.1.1749136500728;
        Thu, 05 Jun 2025 08:15:00 -0700 (PDT)
Date: Thu, 5 Jun 2025 17:14:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v5 08/10] vpci/rebar: Free Rebar resources when
 init_rebar() fails
Message-ID: <aEG0cx6Yyy7oUhwh@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-9-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526094559.140423-9-Jiqian.Chen@amd.com>

On Mon, May 26, 2025 at 05:45:57PM +0800, Jiqian Chen wrote:
> When init_rebar() fails, current logic return fail and free Rebar-related
> resources in vpci_deassign_device(). But the previous new changes will
> hide Rebar capability and return success, it can't reach
> vpci_deassign_device() to remove resources if hiding success, so those
> resources must be removed in cleanup function of Rebar.
> 
> To do that, implement cleanup function for Rebar.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

LGTM, just one nit about a bounds check.

> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v4->v5 changes:
> * Change definition "static void cleanup_rebar" to "static int cf_check cleanup_rebar" since cleanup hook is changed to be int.
> 
> v3->v4 changes:
> * Change function name from fini_rebar() to cleanup_rebar().
> * Change the error number to be E2BIG and ENXIO in init_rebar().
> 
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
> index 9cafd80ca2c9..4b1892fab3d6 100644
> --- a/xen/drivers/vpci/rebar.c
> +++ b/xen/drivers/vpci/rebar.c
> @@ -49,6 +49,26 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>      bar->guest_addr = bar->addr;
>  }
>  
> +static int cf_check cleanup_rebar(struct pci_dev *pdev)
> +{
> +    uint32_t ctrl;
> +    unsigned int nbars;
> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> +                                                        PCI_EXT_CAP_ID_REBAR);
> +
> +    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )

I think you could check rebar_offset < PCI_CFG_SPACE_SIZE to be more
accurate?

Thanks, Roger.


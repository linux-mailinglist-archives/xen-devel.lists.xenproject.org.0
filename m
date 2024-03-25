Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73411889B8E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 11:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697697.1088733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rohzC-0004Uu-9E; Mon, 25 Mar 2024 10:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697697.1088733; Mon, 25 Mar 2024 10:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rohzC-0004S8-60; Mon, 25 Mar 2024 10:55:26 +0000
Received: by outflank-mailman (input) for mailman id 697697;
 Mon, 25 Mar 2024 10:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMIF=K7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rohzA-0004S2-Nr
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 10:55:24 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d8c225a-ea96-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 11:55:22 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41489d4ffccso3528055e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 03:55:22 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b004146750314csm8161736wms.3.2024.03.25.03.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:55:21 -0700 (PDT)
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
X-Inumbo-ID: 2d8c225a-ea96-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711364122; x=1711968922; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fG8ab83+epcOhpN60/FO5lsPTNoc4E38TF6qkSiKQEA=;
        b=HV52vrwxvZqxR1Zsx6X2rNfNOzQhYTGVL6ej3M1QMiE27mhoQ+FfnEcX1M4RHbPt+L
         d4f3BUAdwrIZr50JUXqvDDOiwgVg7aaaZw7DNiTmW4DSQZSpB+iKHxpWNBPoYBvc66PE
         9VQYmFbYyRHPRwrTuCDPlNEjSGGS7iR2iw4VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364122; x=1711968922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG8ab83+epcOhpN60/FO5lsPTNoc4E38TF6qkSiKQEA=;
        b=wzfUiiqip3F2bGm8mYS3CqDmk1f30zoUZcjQUH/olmAVDNYedkQRF43HKSe1oL6rWq
         GT4jO4I0/3yAmMynsv8O15M0xoGMoWP8pAm11wi4FdB8/wGmM94KsM9S+5lJKWIwTo+X
         u2Le+Y+qXPdr+Ij0Ldse4bdeiBRUdqqu1pNvIkxNtQ5UTyB9UAo7qBKhRPzMl3j9HFhs
         ZzRAPcAJcrDL5NuUH0ClGSNbPBXPGKdb8pDO63xvYv6ZbG05y8pW5OMhY/u5kTz9ni0Q
         q+fssW/1pMjAM46NtituDY8XQwS+pOniNH2pjB8W3FLVgDx6qU5hvEChOW8ahny7DXqp
         UMYw==
X-Gm-Message-State: AOJu0Yw015SMGSDGzIHN1IiQvK//nQCPdcf3aFyjcSwbcy4I4XX+TcLV
	Z9ncaka1wFcLpv0dtm78n3JIuRqf3v2gC+DVS/a9h+AJoKZBot5N2CG1V3HiE+0=
X-Google-Smtp-Source: AGHT+IG5LARGj0Z6NpWTCBgcWxqmtLB7RQuz+YRFvBKA+FdDo/xyJwi9LO4oxFS4CCrqUVk1s4KLdw==
X-Received: by 2002:a05:600c:198c:b0:414:3b1:82ed with SMTP id t12-20020a05600c198c00b0041403b182edmr4852238wmq.23.1711364122121;
        Mon, 25 Mar 2024 03:55:22 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:55:20 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: Re: [PATCH v7 06/14] tools: add support for cache coloring
 configuration
Message-ID: <9784c247-592b-460a-b6d4-3ab4cdf87b77@perard>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-7-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315105902.160047-7-carlo.nonato@minervasys.tech>

On Fri, Mar 15, 2024 at 11:58:54AM +0100, Carlo Nonato wrote:
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 5546335973..79f206f616 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -726,6 +726,15 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>              /* A new domain now exists */
>              *domid = local_domid;
>  
> +            ret = xc_domain_set_llc_colors(ctx->xch, local_domid,
> +                                           b_info->llc_colors,
> +                                           b_info->num_llc_colors);
> +            if (ret < 0 && errno != EOPNOTSUPP) {

Wait, this additional check on EOPNOTSUPP, does that mean we ignore
"llc_colors" configure by the admin of the VM if the system doesn't
support it? Shouldn't we also report an error in this case? At least if
`num_llc_colors > 0`.

Thanks,

-- 
Anthony PERARD


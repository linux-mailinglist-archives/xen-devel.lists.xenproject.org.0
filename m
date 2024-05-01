Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C768B8B84
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 15:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715320.1116862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ATK-0004TR-6A; Wed, 01 May 2024 13:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715320.1116862; Wed, 01 May 2024 13:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ATK-0004Rv-2c; Wed, 01 May 2024 13:58:10 +0000
Received: by outflank-mailman (input) for mailman id 715320;
 Wed, 01 May 2024 13:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAI4=ME=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s2ATI-0004Rp-Po
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 13:58:08 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d67ef559-07c2-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 15:58:07 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a55b93f5540so930400366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 06:58:07 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t8-20020a170906a10800b00a4e253c8735sm16455948ejy.52.2024.05.01.06.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 06:58:06 -0700 (PDT)
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
X-Inumbo-ID: d67ef559-07c2-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714571887; x=1715176687; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUIicldlVO0xadZzH9Mvl0lxsvG1olhmR5vt5CaN7Q8=;
        b=Tr6gWOIRes/PtO5vgoXJQMjFT45nprGufxcmRZAqwrQVy8ZuvtW9vOBfoQiwJ/FmRL
         2BOIKq+CJ4qzqi3eK+/kmXm8rcSN/twfnE1tdr6iVYVPLouksMnSmaVWdQnX+qsQIuSK
         QRJudQRWYP2WOUrzggPwIvIv1Fb0xvP8Gr4C4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714571887; x=1715176687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUIicldlVO0xadZzH9Mvl0lxsvG1olhmR5vt5CaN7Q8=;
        b=YHh99nhp0tksckO9OVAs6kPhmnhDrepc6z01FXetAa2uId6SichAn2qyrV1VVUzRae
         P4hqtyS0QN9h8vJEvhRwQ/UFgc1SLi5vGmYS+Q5f2PbCF+6j/kl38Li2bKPo7UbUdYky
         cfGeDK0GarmgD96cXeDGh4RIdzyScMWEhYS/xAE1TvBFtGxGnzueA+mBSIF803D1KKQ/
         OkIJmKUUKtA811n/UUrtFSL0+JqlFoYzDHuZv/FqQxnBgRPh+oOYYHH0/4c+PGCGBGZq
         7wMkeuCH9giFCMWQRwPw8bM0llNJnvHJdc0zdzpSdNvbLkRotdS8eSYJcp5GqXZd/ipN
         CgMQ==
X-Gm-Message-State: AOJu0Yyh9x8ozRkT3j+WhD0tTzU+5EBxvEny8X6iH2BIbk/IhrXxAvjE
	nq6hFay30X0HXgBck44i1cSMBQORxY/c9OC1HHqWn0+X8Q3HCiXbQ0jSkledPheHUCZI5ttbIk7
	P
X-Google-Smtp-Source: AGHT+IFVvWK+ZoBVDDXTaL9t7iSGqxcwwq2EcxwXkhTVqSaccOukO48NCYGmP27jv28x2mRIHiACww==
X-Received: by 2002:a17:906:f8c9:b0:a55:b3e2:718f with SMTP id lh9-20020a170906f8c900b00a55b3e2718fmr1889820ejb.23.1714571887128;
        Wed, 01 May 2024 06:58:07 -0700 (PDT)
Date: Wed, 1 May 2024 14:58:05 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Henry Wang <xin.wang2@amd.com>
Cc: xen-devel@lists.xenproject.org, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 05/15] tools/libs/light: Increase nr_spi to 160
Message-ID: <334eb040-234f-4492-9006-9faadfe28c59@perard>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-6-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424033449.168398-6-xin.wang2@amd.com>

On Wed, Apr 24, 2024 at 11:34:39AM +0800, Henry Wang wrote:
> Increase number of spi to 160 i.e. gic_number_lines() for Xilinx ZynqMP - 32.
> This was done to allocate and assign IRQs to a running domain.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>  tools/libs/light/libxl_arm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index dd5c9f4917..50dbd0f2a9 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -181,7 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  
>      LOG(DEBUG, "Configure the domain");
>  
> -    config->arch.nr_spis = nr_spis;
> +    /* gic_number_lines() is 192 for Xilinx ZynqMP. min nr_spis = 192 - 32. */
> +    config->arch.nr_spis = MAX(nr_spis, 160);

Is there a way that that Xen or libxl could find out what the minimum
number of SPI needs to be? Are we going to have to increase that minimum
number every time a new platform comes along?

It doesn't appear that libxl is using that `nr_spis` value and it is
probably just given to Xen. So my guess is that Xen could simply take
care of the minimum value, gic_number_lines() seems to be a Xen
function.

Thanks,

-- 
Anthony PERARD


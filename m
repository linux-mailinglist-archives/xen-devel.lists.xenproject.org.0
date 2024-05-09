Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449738C0C2D
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 09:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719107.1121696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4yct-0005Xb-I9; Thu, 09 May 2024 07:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719107.1121696; Thu, 09 May 2024 07:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4yct-0005Ve-En; Thu, 09 May 2024 07:55:39 +0000
Received: by outflank-mailman (input) for mailman id 719107;
 Thu, 09 May 2024 07:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Rdn=MM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4ycr-0005VU-V4
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 07:55:37 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 853647db-0dd9-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 09:55:36 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so6157095e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 00:55:36 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88110ff8sm50555485e9.38.2024.05.09.00.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 00:55:35 -0700 (PDT)
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
X-Inumbo-ID: 853647db-0dd9-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715241336; x=1715846136; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GK4WIT53jOeN92OklH7WM88IbyAPFWX3LSqQzOen3ms=;
        b=PUOwdVqSPIcqquBsYd63tShDzyeIsTN1kkNGvALY5KAxfYY6u37DXJ4WEF6/3KiWYz
         6D38knZumWvK66WmmQ8OLUQrw66ft2HVTs7NeNSHsnpigLHa3EZ6HUlxZrLanKV89H/m
         RW9XiDT1xc9IrIi45S1s/FmqF6DIRI27PGubk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715241336; x=1715846136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK4WIT53jOeN92OklH7WM88IbyAPFWX3LSqQzOen3ms=;
        b=IFzJ5qi1Q5xMLw2nKo1PmZlZ4x4LzDswCCm5lYOnLUCwTqdI4Ik8YwgDhliYAgT+/x
         RDK9jGrv1xT9rahX12+WtoLamOBaGRjNLqEzm+dQnm9FfXYkVVeejubQxd2ZnJzBJaBK
         7RV2n2Eaz5qSBDeuzWBUTnVumTUbY2NPX4TH27JkOJNifony1chnghJ4o+bvlUfAOPdw
         G/a0lFrpmmAiuQLQ5VR2WTQwxg39YVhhzbRf/SZ+Qo+KCdabEzAur7RiEzbjUQYdchYE
         pNmaZkWRJ/SIcYO8yNwlU/Q7r9SmyHYwcEcqZLyGua2uN45gnXaHxyBorg5CAhuC3k7J
         ZQIg==
X-Gm-Message-State: AOJu0Yy/ZtpUSmWv3omSsCmGK4yTX+/ohGvLGgQBu/zlK8L/XIMIp8Ih
	VhHHRuXpJ/TpnGStlDMJENM+KPx7K/mvUWZYw2E12cpMwGssx2ZeoAkcG7RSRaU=
X-Google-Smtp-Source: AGHT+IFHFSgC9nPYF7uyKYTij2oDA1KnFJ/pye2r/J/WlFTqEAI8yfyz7Zi4WXZBuafsLDBgngXPUg==
X-Received: by 2002:a05:600c:1548:b0:41b:edf4:4071 with SMTP id 5b1f17b1804b1-41f71accb44mr42967215e9.35.1715241336086;
        Thu, 09 May 2024 00:55:36 -0700 (PDT)
Date: Thu, 9 May 2024 09:55:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Message-ID: <ZjyBd7Yn5Od3qPF9@macbook>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240423082532.776623-4-luca.fancellu@arm.com>

On Tue, Apr 23, 2024 at 09:25:28AM +0100, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> We are doing foreign memory mapping for static shared memory, and
> there is a great possibility that it could be super mapped.
> But today, p2m_put_l3_page could not handle superpages.
> 
> This commits implements a new function p2m_put_superpage to handle superpages,
> specifically for helping put extra references for foreign superpages.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v1:
>  - patch from https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-9-Penny.Zheng@arm.com/
> ---
>  xen/arch/arm/mmu/p2m.c | 58 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 41fcca011cf4..479a80fbd4cf 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -753,17 +753,9 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
>      return rc;
>  }
>  
> -/*
> - * Put any references on the single 4K page referenced by pte.
> - * TODO: Handle superpages, for now we only take special references for leaf
> - * pages (specifically foreign ones, which can't be super mapped today).
> - */
> -static void p2m_put_l3_page(const lpae_t pte)
> +/* Put any references on the single 4K page referenced by mfn. */
> +static void p2m_put_l3_page(mfn_t mfn, unsigned type)
                                          ^ p2m_type_t?

Roger.


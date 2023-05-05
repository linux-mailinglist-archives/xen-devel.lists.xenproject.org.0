Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227FA6F7CE1
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 08:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530225.825696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puon9-0003e0-BK; Fri, 05 May 2023 06:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530225.825696; Fri, 05 May 2023 06:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puon9-0003b8-8A; Fri, 05 May 2023 06:19:43 +0000
Received: by outflank-mailman (input) for mailman id 530225;
 Fri, 05 May 2023 06:19:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psjd=A2=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1puon8-0003b2-2p
 for xen-devel@lists.xen.org; Fri, 05 May 2023 06:19:42 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfddd581-eb0c-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 08:19:39 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64115eef620so17409889b3a.1
 for <xen-devel@lists.xen.org>; Thu, 04 May 2023 23:19:38 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 x3-20020a17090a530300b0024bb36e6f56sm4246058pjh.16.2023.05.04.23.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 23:19:36 -0700 (PDT)
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
X-Inumbo-ID: cfddd581-eb0c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683267577; x=1685859577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IhIxM6lGctKPZ0F4zj+ieY/NuAoHjD/llTiAiBzpgD4=;
        b=ENw0Ibe1GKhNMaBt5lpUTsl73D2uA6Mt5GHElRwdD7t1vn5sOz63TFt6LuUvTVvSRr
         RNPKxN0sSsgXZyZlZ5Af6I5+9YQlZFMVtDBa8y2RlY+m9oY9D2CB6iEGYnyxJue71Ebe
         jhIaDXePlaJhp007drvlVLIg7YroOxTsZfRdX9beoSZ6q8NBkbK+Ttvw7Hb9zkEG532G
         JU96QRickeXpswwKUAfugqXyoB9F18S6bbROrHBR+MAqUvhKLVm2p3x6p9qS6d2ACpCF
         eIUaieQFbcBIeuDl1C1ZvfI43YuMnCI3sP5W8a3zexCzN0XDCZcDZdfPalTnWWjXtVl2
         Ac+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683267577; x=1685859577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhIxM6lGctKPZ0F4zj+ieY/NuAoHjD/llTiAiBzpgD4=;
        b=hmsWK94zNCydFEQ0U94gPTbClxX0OJ/SQ3QySpsA7XYPypjoTx9sftPiH7Equvigrd
         xIUflsWmUblU3FUSxU0frbisy7wX86lhO4GY7YtRvge8+TmBOEVRRzgd9ZvejN3i7DOc
         Cdwk5Esy4IsYiHEgWoFzftwy/6K7FTIBka8dvnw3iiOkbHQFPqQYcUhOd1PdnDpMfVKF
         eihxeCVylUIDeB7jnobpGdWKzBrlmp1g0uCWs6wxbJo3euByLx5v/Q2FSbvyU4QQqcRy
         /MW6CuSgexDrs+CirKblLjRYnklzupWQFyx+f4yXReaKhWl/Fe774wXyq29AetAnB0us
         2l8w==
X-Gm-Message-State: AC+VfDxt2li63SwIujH91ZxFNyxy9ypLLbvmZ53Wct0+ZMls+HI3yHqH
	3eJy4gSVauc/aX3cHT0v1f8kgQ==
X-Google-Smtp-Source: ACHHUZ7cdJ6d3QPoYAfskqtSPYVFeVoAqdh36Km+QYP02oUcudO5EtXRgvhgZ1XZ4ZBkMDLqNrapbA==
X-Received: by 2002:a17:90a:9f87:b0:24e:201e:dcbd with SMTP id o7-20020a17090a9f8700b0024e201edcbdmr692274pjp.21.1683267577176;
        Thu, 04 May 2023 23:19:37 -0700 (PDT)
Date: Fri, 5 May 2023 11:49:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org,
	stratos-dev@op-lists.linaro.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
Message-ID: <20230505061934.jm3bwjgsl5hf5rns@vireshk-i7>
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
 <25fb2b71-b663-b712-01cd-5c75aa4ccf9b@gmail.com>
 <20230404234228.vghxrrj6auy7zw4c@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404234228.vghxrrj6auy7zw4c@vireshk-i7>

On 05-04-23, 05:12, Viresh Kumar wrote:
> On 04-04-23, 21:16, Oleksandr Tyshchenko wrote:
> > ok, probably makes sense
> 
> While testing both foreign and grant mappings I stumbled upon another
> related problem. How do I control the creation of iommu node from
> guest configuration file, irrespective of the domain backend is
> running at ? This is what we have right now:
> 
> - always create iommu nodes if backend-dom != 0
> - always create iommu nodes if forced_grant == 1
> 
> what I need to cover is
> - don't create iommu nodes irrespective of the domain
> 
> This is required if you want to test both foreign and grant memory
> allocations, with different guests kernels. i.e. one guest kernel for
> device with grant mappings and another guest for device with foreign
> mappings. There is no way, that I know of, to disable the creation of
> iommu nodes. Of course we would want to use the same images for kernel
> and other stuff, so this needs to be controlled from guest
> configuration file.

Any input on this please ?

-- 
viresh


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD285B11979
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 10:02:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057455.1425358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDNT-0007JH-Bv; Fri, 25 Jul 2025 08:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057455.1425358; Fri, 25 Jul 2025 08:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDNT-0007GP-8V; Fri, 25 Jul 2025 08:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1057455;
 Fri, 25 Jul 2025 08:02:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfLl=2G=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ufDNR-0007GJ-Ul
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 08:02:01 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a25e5717-692d-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 10:01:56 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4561607166aso13203625e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 01:01:56 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45870532b5asm44134535e9.5.2025.07.25.01.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 01:01:55 -0700 (PDT)
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
X-Inumbo-ID: a25e5717-692d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753430516; x=1754035316; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bsU0uV8S499nW6NHyphQVPQOCSJe4NGHf38Fa6QRWpA=;
        b=jiJdFcsVw7jAQGIt8QURSySC/TH1CGPsu/20n00GtUJ7phR03nX2yJ8TdX5epTgYNF
         gyzIP5i0qRRypTwZNSJsGDijYMjHch6r6FJJ/bOSpZxmjinywmt3caMC6T0zIkfZV683
         Z50VzS7NSeo84nRzt9c2AkMJPFDciBGF+1wRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753430516; x=1754035316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsU0uV8S499nW6NHyphQVPQOCSJe4NGHf38Fa6QRWpA=;
        b=dfV+KlPFwdt6dXRgxiKOPK20cfQm6ZIIxBoGvq+s1ZZVNGb6ujghA8U3tTZdyn6Fsq
         laOClsK4tCEquvaGPeeaYmSz07Ixf6KKFz4JhsCrzkHv4ktCx0QHJIDXs3oEH5hESn+/
         zHPi4LBvGEq3rcFOf2lU9vQWmuG36t0B7fx7zu/B10ha8irUCqTvulgDO0ASd0a/AxqC
         n+wEV7IkGv5hg8hrb3zEM8kG0kRNEMfzx6KVCZyN814Hd+zsADcCXFRnLhQTr3+zY/hL
         QNUUmguJ0kw1Be26GPeg0Nx4Q0a4c69k8cnkgvi3Zwmcxjm4+uw3Up/k4Al5umU4s8a3
         VfGg==
X-Gm-Message-State: AOJu0YyBOhtszVyw3bWNUxw/urNePszl2cl+uBadH91W4fqrxqQuXdZS
	THccPfudU+8mBHeBe+kVXl9M6S6Pb9OSOUBFB+lloCCk0gFRNsw6a2sO1EskDam/KdM=
X-Gm-Gg: ASbGncsXy0uxyIbRTLtQKSlPY1FBPC0LL/sJbdbGO0fvKrLIg8uUf7g5oSn+jR1OktB
	IGQN8dJOgv281Lxm1I08pqUyKi684TVHopg8bS6K4Id9ckkq/+jFUO9sWd8Ra0f+8ehz/0M1YIu
	LHJQnM2gLVS6Jo0W1dV6IpKRejFxRnAM4wT+A+p6AChdvS+lSzivUv62A/6/N+2uZhTjX2zSK2j
	fbKKLbb7feyXwcuh9aRHH4wL0n2S5bVQXe17kLJRqJmigEZkA2/HtEZV9ybTrjm+b+p0LJH3kmT
	VlqmPzpLwCy1bac1XqtRANkAHRtBqZTPB7g4M277BDiAxz4S1ERqJ+8iUKMWblOihtb/dgudiUu
	n2TyWpyrAaZIePA3Nzj342ysjljhJ6eWT5zeqfrgx4OAjvasms4aW55BZLjNoq48SQpnPE/cY35
	nA
X-Google-Smtp-Source: AGHT+IGWYsF2H0xPQCVa+spoVesspsu7YniTx1S2q42Tp0jrrVFtlG1ub65YSZAS3n7XwHkQv4FqTw==
X-Received: by 2002:a05:600c:1c03:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-45876662f99mr5400165e9.28.1753430516143;
        Fri, 25 Jul 2025 01:01:56 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:01:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] iommu: restrict scratch page quarantining to x86
Message-ID: <aIM58gJm6oWQwyKT@macbook.local>
References: <20250724174351.3969-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724174351.3969-1-stewart.hildebrand@amd.com>

On Thu, Jul 24, 2025 at 01:43:48PM -0400, Stewart Hildebrand wrote:
> All IOMMU_QUARANTINE_* options are exposed on Arm since 163c6b589879
> ("xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option"). However,
> only NONE and BASIC are implemented in any Arm iommu driver since
> 63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv3") and
> ca8f6ffeb6e3 ("xen/arm: smmuv2: Add PCI devices support for SMMUv2").
> SCRATCH_PAGE is not yet implemented in any Arm iommu driver. Restrict
> scratch page quarantining to x86 for now.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Cc'ing Arm maintainers to request an Arm ack.
> ---
>  xen/drivers/passthrough/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 78edd805365e..11aece5f7bda 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -90,4 +90,5 @@ choice
>  		bool "basic"
>  	config IOMMU_QUARANTINE_SCRATCH_PAGE
>  		bool "scratch page"
> +		depends on X86

Since this is tied to specific IOMMU implementations, could you please
tie it to AMD_IOMMU and INTEL_IOMMU instead of X86?

depends on AMD_IOMMU || INTEL_IOMMU

Should do it I think?

Thanks, Roger.


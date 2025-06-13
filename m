Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F37AD949F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 20:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014836.1392918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ9Md-00069j-FI; Fri, 13 Jun 2025 18:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014836.1392918; Fri, 13 Jun 2025 18:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ9Md-00067a-Bt; Fri, 13 Jun 2025 18:42:55 +0000
Received: by outflank-mailman (input) for mailman id 1014836;
 Fri, 13 Jun 2025 18:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R50U=Y4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uQ9Mb-00067U-VP
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 18:42:53 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36248c5a-4886-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 20:42:52 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so1728123f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 11:42:52 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5689e5f3dsm3134358f8f.0.2025.06.13.11.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 11:42:50 -0700 (PDT)
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
X-Inumbo-ID: 36248c5a-4886-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749840171; x=1750444971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1z6HXF0Dny22KZLHcBuUDGdrZzhobEewsiDAS8gCAFo=;
        b=E/UqxWFkXWiS2OVIL63+8gLLQsQIT7xsLwOtW8dQ9LeElUSvBcXErC4t3g49lJa127
         4qcpkjSrT/ZyOpXrCvNlDexImbvwXY82J0g0RAaFMu6yyTr/d4jFHbMMJT+JiFmqCNdN
         GYn3kXOXbyFkrVZY7PiMtP4nAp/tsHYYTqkYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840171; x=1750444971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z6HXF0Dny22KZLHcBuUDGdrZzhobEewsiDAS8gCAFo=;
        b=odFHoLXO96SLJf/oRIpFSEmL3NQuTeJ183f5LGolTq5TLAFOFpmF4InGmHMdtEyaOU
         9zjYcRoLE7XYiS3zG/EMpyl43uUCgbHR7HSn7Cuks6f7p9o4981Y8A1LTkPdOuZduonx
         L1BVTChP1LUQSaWQkODLOpGNP+tvOwPqrM7yf0xCLgSaoyd5Cazurb0Uyo0zPgXEVDxJ
         cEj/1sEHH8ALaBZLISdI64daaIp16vnWvNlu3FqF6TnALXu6hhRGPXKO4jJzQwcpo6in
         eEpuxVSPOtXL1vmnHTIQs1y4LaR4520dCineOcr6IViz3+qw+WCdwbM7aFdu8300NXvd
         AYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Y1//3axuMfIS+36R1y3RBBIPQ6h3cbceGQsVIsWIGrqv6AaVzEiV3FBXHLbfcMZh5Yx3oX457V8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRuUpg7aUUbQ9T5y1YLd35RDxNNTvJG2XIwPxoLmQbeVKdCuAF
	wke6rap5KJJ88lwaFUWytcFXYaemACx3GEDOfwuSZKb4Mk0l9uuw42pjhCLKsh5j6uM=
X-Gm-Gg: ASbGncuwctQ15ypU/ajamngUuIUPMO2+e8CN/44pDEHzdJcibG4QCWiWq0ZzlPwPiIi
	orGxA9kI6OP08d3ZIRNEVkn1wowA1Y84v3e6EfT/jHkZ7/+dY66LDmPP/T3Eys+6S+MQvglXPBj
	u19R0uplBg39lW3xfExR2x5igLNnJTy3D0e7FoMAoOfFwbndp1Uq59x80FDgjTa7p/2xMVmNm+J
	8Ej2h6n5s26bDtBvM5CQbgFQrAZGZoBG1yq4wWOvpxZ1kYbGg/CSkNZGMEOlWQ1iepDwA2lOTkU
	ogHaUB02tJUesA479s5RpdZiN1DtPdb7L1K2tb+zEYBBZd7k8JNeaytDvH+IygMbFbyFKJlDzek
	=
X-Google-Smtp-Source: AGHT+IHFReEu1NzflyvBpF34FTgjNx9fyNxF08wuaqakwb7MNUHvmxH3+Toz/h4c1QhPCslaR7BaGQ==
X-Received: by 2002:a05:6000:230a:b0:3a4:f7e7:3630 with SMTP id ffacd0b85a97d-3a572e66e95mr837391f8f.15.1749840171318;
        Fri, 13 Jun 2025 11:42:51 -0700 (PDT)
Message-ID: <3fa9b5c6-da3c-44a6-b920-f3fb7379ea36@citrix.com>
Date: Fri, 13 Jun 2025 19:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen/riscv: rework asm/mm.h and asm/page.h includes
 to match other architectures
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1749829230.git.oleksii.kurochko@gmail.com>
 <42696025e262f50ee7d26b252bfe3d3c0a9c77e6.1749829230.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <42696025e262f50ee7d26b252bfe3d3c0a9c77e6.1749829230.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 4:56 pm, Oleksii Kurochko wrote:
> To align with other architectures where <asm/page.h> is included from <asm/mm.h>
> (and not the other way around), the following changes are made:
> - Since <asm/mm.h> is no longer included in <asm/page.h>:
>   - Move the definitions of paddr_to_pte() and pte_to_paddr() to <asm/mm.h>,
>     as paddr_to_pfn() and pte_to_paddr() are already defined there.
>   - Move _vmap_to_mfn() to <asm/mm.h> because mfn_from_pte() is defined there and
>     open-code it inside macros vmap_to_mfn().
> - Drop the inclusion of <xen/domain_page.h> from <asm/page.h> to resolve a compilation error:
>     ./include/xen/domain_page.h:63:12: error: implicit declaration of function '__mfn_to_virt'; did you mean 'mfn_to_nid'? [-Werror=implicit-function-declaration]
>        63 |     return __mfn_to_virt(mfn_x(mfn));
>   This happens because __mfn_to_virt() is defined in <asm/mm.h>, but due to
>   the current include chain:
>     <xen/domain.h>
>       <asm/domain.h>
>         <xen/mm.h>
>           <asm/mm.h>
>             <asm/page.h>
>               <xen/domain_page.h>
>                 static inline void *map_domain_page_global(mfn_t mfn)
> 		{
> 		    return __mfn_to_virt(mfn_x(mfn));
>                 }
>             ...
>           ...
>           #define __mfn_to_virt() ...
>
>   This leads to a circular dependency and the build error above.
>
>   As a result, since <xen/domain_page.h> is no longer included in
>   <asm/page.h>, the flush_page_to_ram() definition cannot remain there.
>   It is now moved to riscv/mm.c.
>
> Including <asm/page.h> from <asm/mm.h> does not cause issues with the
> declaration/definition of clear_page() when <xen/mm.h> is included, and
> also prevents build errors such as:
>   common/domain.c: In function 'alloc_domain_struct':
>   common/domain.c:797:5: error: implicit declaration of function 'clear_page';did you mean 'steal_page'? [-Werror=implicit-function-declaration]
>   797 |     clear_page(d);
>       |     ^~~~~~~~~~
>       |     steal_page
> caused by using clear_page() in common/domain.c.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This does want further cleaning, but is a step in the right direction.

~Andrew


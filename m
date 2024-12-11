Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3979ECF74
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 16:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854865.1267955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOP7-0002yn-7b; Wed, 11 Dec 2024 15:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854865.1267955; Wed, 11 Dec 2024 15:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOP7-0002x6-4l; Wed, 11 Dec 2024 15:13:33 +0000
Received: by outflank-mailman (input) for mailman id 854865;
 Wed, 11 Dec 2024 15:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLOP5-0002wt-GH
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 15:13:31 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7acaa78d-b7d2-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 16:13:30 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so672012066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 07:13:30 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa665119a06sm676932866b.121.2024.12.11.07.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 07:13:29 -0800 (PST)
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
X-Inumbo-ID: 7acaa78d-b7d2-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733930010; x=1734534810; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EtsoRGoluwCrd6QQv0luq5gTndqCcJ0mFLAtuWD2QBA=;
        b=Ghj5cVxMiBHiDllLmthYM+4ILXMfs20ThjSbcbzWjlU6OOOUz9RTl5AjeBl9NFul0U
         0WIHXi/2Fn4Pi/cnZWhp0kn9u6xjRHHb0zAOESrSMN7m+Sk4gD8SnJ7jCW8tDGx6tNBq
         6B3hZ5FsUFXGfCEq02zlWXEQ3Zup6eDPJcW5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733930010; x=1734534810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtsoRGoluwCrd6QQv0luq5gTndqCcJ0mFLAtuWD2QBA=;
        b=gQrb1UxQK0EU7y5ood1RnmPfionjcd7G+wa9jkOCJS4NivrkTQsoN1MQh1cynWugiZ
         4sJbP/OYO8THNJz6jXEqC+mKOghGuCG33oylpedHy9l8CYisbk5JpCz3HzcyTkOfvbvp
         8tgEpwp5QNKCtPVANsV/G5XTGSk8O/VQDDAYtRQdxFpNiIzd/bcRIt/eLfECgfn2dl74
         /Z6c21D9+x4bTNNSLO0gxbOygLeLXqS+zn/oBIhwzy8TZX10NOq+jjlAo4KY6/0bENPC
         qUTRezjfklboeGArVd7JGDbz8DWd9Y5EluH3NNAidFmlFzMngVncHdoYrhYhc4si8Qrx
         8T+w==
X-Gm-Message-State: AOJu0YxqdPFmg0srdAZ4ERUZI3bN08WaJ8OerTK+yxqiFKkFYtFB9MOY
	IphBmaBB709ymQi9X3xesPSXWJEURd2TkhXqZTKkTD3PoQjxZLhY0OFOX21DT5Y=
X-Gm-Gg: ASbGncvJzXf2Cep/z0NkyCIp3x9zhTUeVXUrJohkn1aXY16kZkU05F4yojBswYYJneO
	Ztc60f6Ql5LlSIHs64O9Ppt6wCOZF1jSJy3H0mlvz/2xGLM37C8pne71rxR+M1eEryh56Cuz8r7
	AiUTA5x8goNTRSywqxAjvtwTI9IJBTCHSqXnKDHgc9hcvXphItLE9yOjB4HclnfqXK2xQn8PX20
	vK4kiVvTn5ec1oq45U5yuImBjWkZVNWyHJT5v9eDXPS+hNQ6L1vO5uDW3H8ewc=
X-Google-Smtp-Source: AGHT+IHw3qgKcLGUuGabAwNcjvuX0WaiNQo5BUfZysGB9zKeK87cUOeVj4XZs7tMtjkySAPtZfDSEw==
X-Received: by 2002:a17:906:3287:b0:aa6:4494:e354 with SMTP id a640c23a62f3a-aa6b1373e90mr276536766b.42.1733930009832;
        Wed, 11 Dec 2024 07:13:29 -0800 (PST)
Date: Wed, 11 Dec 2024 16:13:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 08/35] x86/domain: introduce domain_has_vuart()
Message-ID: <Z1msGHspF2_bi3fF@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-8-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-8-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:38PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce domain_has_vuart() for x86 port to be used in the console driver.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/include/asm/domain.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index b79d6badd71c4d96279555df62fad75fe817a2b6..c1d0d1f47324e8cc678a4c76c43f86820a89e7b3 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -506,6 +506,9 @@ struct arch_domain
>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>  #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
>  
> +/* NB: same symbol as in Arm port */
> +#define domain_has_vuart(d) false

Don't you need to consume d in the macro, ie:

#define domain_has_vuart(d) ((void)(d), false)

Thanks, Roger.


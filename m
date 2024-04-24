Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223138B06E8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 12:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711301.1111164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZW8-0008Sq-Jc; Wed, 24 Apr 2024 10:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711301.1111164; Wed, 24 Apr 2024 10:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZW8-0008Qv-FL; Wed, 24 Apr 2024 10:06:20 +0000
Received: by outflank-mailman (input) for mailman id 711301;
 Wed, 24 Apr 2024 10:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmhA=L5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzZW6-00086f-6m
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 10:06:18 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a11b2f6-0222-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 12:06:17 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7906782388aso243752185a.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 03:06:17 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 i8-20020a0cf388000000b0069b7bc51271sm5909720qvk.123.2024.04.24.03.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 03:06:15 -0700 (PDT)
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
X-Inumbo-ID: 4a11b2f6-0222-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713953176; x=1714557976; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Ph9G6cwvSsyBwn1keNYh8ywxHd2TZyv1Xlev5He0Zc=;
        b=OoDZgrl3D/3Z37Q+qvZ8KcBx+oi8V/eu08ubKnC9g+Hu1jFEGWyk+s73A8b2z2u5bD
         5sUISCH70Jcpq/XgWV6zuiDMdfkBiODT3JbI9oi82OUHquChB1PPfxOSIrajFvJtnT9e
         KwKYJc/E0JdTgdi2vbkqZJ5npw0ObKTWe/dSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713953176; x=1714557976;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ph9G6cwvSsyBwn1keNYh8ywxHd2TZyv1Xlev5He0Zc=;
        b=NorCILdyfYzNxaQ10nFNX5YTl28fTXMp2gOqYJVSkOoAPw9+hcXKdH9cKK3WaCuV5Q
         b5KFbZxRf3GMQpsZ/d6t1jMyPOHFTOk9TSmv+QW7UwrjP3s1jV96WJ7GeGluTqVeXcuf
         6p/LMKL1UprXZtKGyZ8PfU2KSGInFNwgs8ERPUhQ4fXXK4YBXas66YNd5+GdOBkc0NsU
         ll57jONBbxCC9LPJ9mlgzvzXL0WT4nj7kfCGraPuxAK9gUCeyPqcECN6vGFwSONLrEjZ
         sYwDSwDBDqWY93R44s5D5aysmDNEtMuApnBdD29GszG8mDRPdtvNKYJm1Akp0+ddv0T8
         +qiA==
X-Gm-Message-State: AOJu0Yx3qfkIoLz3olUJpKEr1XdaN/qPfHXc6EurNfdJZMcirqqXrB39
	SFELGyk50lQAo7nYTj1dXRv2GCYkIY7FPAInxtMUFvluXzGYWEPn2CaxWN9U1R4=
X-Google-Smtp-Source: AGHT+IFv3Y31v3wUlWVz2DymdTFgcmE+HdyroWncqkASpxtkuzd3F66o1ccVg3lNsud2DQftbRwb8A==
X-Received: by 2002:a05:6214:b87:b0:6a0:88d1:dc92 with SMTP id fe7-20020a0562140b8700b006a088d1dc92mr1829664qvb.13.1713953176012;
        Wed, 24 Apr 2024 03:06:16 -0700 (PDT)
Date: Wed, 24 Apr 2024 12:06:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 4/4] x86/shadow: correct shadow_vcpu_init()'s comment
Message-ID: <ZijZldtvQ_e1h6ys@macbook>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <fea51839-4405-4330-8493-c544b9edf035@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fea51839-4405-4330-8493-c544b9edf035@suse.com>

On Tue, Apr 23, 2024 at 04:33:09PM +0200, Jan Beulich wrote:
> As of the commit referenced below the update_paging_modes() hook is per-
> domain and hence also set (already) during domain construction.
> 
> Fixes: d0816a9085b5 ("x86/paging: move update_paging_modes() hook")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -99,11 +99,12 @@ int shadow_domain_init(struct domain *d)
>      return 0;
>  }
>  
> -/* Setup the shadow-specfic parts of a vcpu struct. Note: The most important
> - * job is to initialize the update_paging_modes() function pointer, which is
> - * used to initialized the rest of resources. Therefore, it really does not
> - * matter to have v->arch.paging.mode pointing to any mode, as long as it can
> - * be compiled.
> +/*
> + * Setup the shadow-specific parts of a vcpu struct. Note: The
> + * update_paging_modes() function pointer, which is used to initialize other
> + * resources, was already set during domain creation. Therefore it really does
> + * not matter to have v->arch.paging.mode pointing to any (legitimate) mode,
> + * as long as it can be compiled.

Do you need to keep the last sentence?  If update_paging_modes is
already set at domain create, the 'Therefore it really does...'
doesn't seem to make much sense anymore, as it's no longer
shadow_vcpu_init() that sets it.

Possibly with that dropped:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


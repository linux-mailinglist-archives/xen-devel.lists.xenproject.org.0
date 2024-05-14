Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28008C4EA5
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721330.1124674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ofp-0002hb-E1; Tue, 14 May 2024 09:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721330.1124674; Tue, 14 May 2024 09:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ofp-0002ep-B4; Tue, 14 May 2024 09:42:17 +0000
Received: by outflank-mailman (input) for mailman id 721330;
 Tue, 14 May 2024 09:42:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6ofn-0002ef-9l
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:42:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e9414d9-11d6-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 11:42:14 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-34e0d8b737eso3737291f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:42:14 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a77easm13156662f8f.53.2024.05.14.02.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 02:42:13 -0700 (PDT)
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
X-Inumbo-ID: 3e9414d9-11d6-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715679734; x=1716284534; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vY59CoxrIbE4fN3ZkuMSxQYJSIbg908uYli81yCD2HI=;
        b=jjmnaIJ88nw+UbqFftW/W4Lj/oS2eqVmDH0Z+cNHOF+xwMYAsFvZ6l14lRHy5yEZeA
         lOAp6k8IL0qZHUELR8fkpCZt/963bD2e9z3e1p7M1q8JE96V3k3Z060Q/mJCeB+wQOrd
         HFuIR0P543cRl86d+QsPTgumVHZtW2a5WDZrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715679734; x=1716284534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vY59CoxrIbE4fN3ZkuMSxQYJSIbg908uYli81yCD2HI=;
        b=LbYeI0eJJNqhsvEgWpM19EtaW81SyZkdXCP02BPZrb4DcUpp8G76BgeBYTcAHXxfjd
         Kn60vpxt002UdAAQX1ed7dghrBUc7Nwc2K52SSJ7iA6exDx+nytw/3vrHC1BS1p9MtfD
         7HTf/x/w2/stG26van/whzSuTQhVatKHv0XA042iNfrTtie3xLUpMeSA+mQZocjiUY9q
         iV3SRNG3IBsdQtUEcJQJC1oPaVHkAFmmgFu+u93hO19c10q8FSBxjfSvTl5BWyr3DaeL
         PtzBSj19WSC9R6cJmXIX8v28k3xPZT84a7DGt8DyV5w7xKWixT+UT1mSLcHQBm53/l04
         AOoA==
X-Gm-Message-State: AOJu0YzKXHF3PfQEvQR2koMWMWdzyV2CUSjbYrXgSYgAyWR0tg5vxdjw
	NNZN8VW1D0yb7beNZnfJwySvAjARm46rq2itvXR2ike1p/dQ4ds0jIoevTlIOtA=
X-Google-Smtp-Source: AGHT+IH2/sXJvM+TaMc2oyky8D1AusD1bZZL2kd7W1S/+CVZMrMNhlkJsucRzxw/38zixWOIWszkFw==
X-Received: by 2002:adf:f78a:0:b0:34d:b3a0:5614 with SMTP id ffacd0b85a97d-3504989e643mr9414973f8f.8.1715679733811;
        Tue, 14 May 2024 02:42:13 -0700 (PDT)
Date: Tue, 14 May 2024 11:42:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH V3 (resend) 08/19] xen/x86: Add build assertion for
 fixmap entries
Message-ID: <ZkMx9O5MtR_eTr1g@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-9-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-9-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:35PM +0000, Elias El Yandouzi wrote:
> The early fixed addresses must all fit into the static L1 table.
> Introduce a build assertion to this end.
> 
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
> 
>      Changes in v2:
>          * New patch
> 
> diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
> index a7ac365fc6..904bee0480 100644
> --- a/xen/arch/x86/include/asm/fixmap.h
> +++ b/xen/arch/x86/include/asm/fixmap.h
> @@ -77,6 +77,11 @@ enum fixed_addresses {
>  #define FIXADDR_SIZE  (__end_of_fixed_addresses << PAGE_SHIFT)
>  #define FIXADDR_START (FIXADDR_TOP - FIXADDR_SIZE)
>  
> +static inline void fixaddr_build_assertion(void)
> +{
> +    BUILD_BUG_ON(FIX_PMAP_END > L1_PAGETABLE_ENTRIES - 1);
> +}

Just introduce the BUILD_BUG_ON somewhere else, no need for a new
function just for this.

Adding the BUILD_BUG_ON() to pmap_map() would be perfectly fine.

Thanks, Roger.


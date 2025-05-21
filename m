Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DFDABED18
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 09:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991579.1375430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdvQ-0007sc-EF; Wed, 21 May 2025 07:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991579.1375430; Wed, 21 May 2025 07:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdvQ-0007pr-BD; Wed, 21 May 2025 07:31:40 +0000
Received: by outflank-mailman (input) for mailman id 991579;
 Wed, 21 May 2025 07:31:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHdvO-0007pl-JW
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 07:31:38 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a02f6289-3615-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 09:31:35 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-601fb2b7884so4432403a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 00:31:36 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4382d7sm850841566b.117.2025.05.21.00.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 00:31:34 -0700 (PDT)
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
X-Inumbo-ID: a02f6289-3615-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747812696; x=1748417496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JmlJMmB9hmskFmXM43qBGD194jQ0zMmOFRlp1/Eji0I=;
        b=SCHk6lUSWA745wkXFYu56u+pee2emPliUa500OyezRoVhHWUDgG672Kpt6rlAM5zTg
         Uw5D0YRQq1xWtvYROSDC6Z6e7mp/mFiXtPpCkpgAxkuWxxb4togjvn0NC8J3a58pNOwl
         lF7rx8CxxqwxTP64ldUU6LELWzyl0ZQ6OG+/ixzMl+8FbnGnRaB4dY3AEvUDSoj91pZz
         GwlTScNTp/HdAqNWrVnHe96VQGG/O5oto+yulhgg3+J+JkRSqvv8RLFm0lfRyysFcafi
         1u7Yr2r69zsqlJfZYOwe5r+70FCKd2tPSJBK0WMDNrLzIqrLOJ7F95xulYqQCYo4wmg6
         uOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747812696; x=1748417496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmlJMmB9hmskFmXM43qBGD194jQ0zMmOFRlp1/Eji0I=;
        b=FFu8Z6JV9fLfAgm+o4P3QWjjZhHUCjcLezxg2NbCSdBryKeHwvhQaU8jupXzXp3VUU
         ye0nivVYzxZsN7nLCvxQCU2Eiub6yvBb0+LLovs3C9Wj8v4t/l6JFbA3Myo89Z28mpGa
         dWXbbK03Ha/kwwNIJ2Lzs+cMXMpzhlYK7O3ZPgkcSrBThn12e+zgzM4jK6cazoi/sgb6
         IZj3vz14TfBwziY1KcbC3pgh2PjZryoYdHOKBXg05Imtx3SAROp/n2/LlOfcEGqGp/nO
         KGLq6Rv5G3dd5bVLYjuJcKmL674u523dLIPKueOXanMr+W/Y5QM5BViIBB+bkYZG45MQ
         hK+A==
X-Forwarded-Encrypted: i=1; AJvYcCVkwKjzwTZcY2M/8fPJVyb99DZTWoDc+jb7fx04popz0hBFex11MS/rTn3xpfL4dvRysxqtZaP5C4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUY7dt80C7skdqIsXuvhN5bdkcCqv0aknrjP/WrkvQNLEzzBkK
	3G9EbuLwuUF/XQ2i5gaSPlOO0o56WHnvdy0sXAaeG5RJ8F0J4T+M+HYZWl5yPTsR+g==
X-Gm-Gg: ASbGnctg9QiuswCTMHUg2SJfoEZXbkJBxym6m2y73yVX/gldEM6rpOUEMd2miSVnTYp
	yotUWusi16jcCQfFLOqiov9Bij6rnU2Zb6jQcLwKgTccBKZGPKuGqCkDiZ9i8087rheSf/q1do5
	Te3S8fw1URh+r8P65u+dZqejmMJFeWHogfjui4M1QmOrGwiuw+2hNZTOVv4OS98YlM+caivaA//
	ndh/DV2F8fdw6FMvn5qCXTRx6ouFKsnkISLlkZEbeKZO/R0FdvabafnrxXcgim9Zv8dLbr3F1aw
	gF6Opoh4G+aTVGRC/wYKstoxBNyqbMTY/Dfj2uNlKtqHAUCUFxWSdMhifkOqUA==
X-Google-Smtp-Source: AGHT+IHRrFX4PcoDI2sl45JkPnjIpvyscpxQRg9K+LOh9SPbPt6UGSK55tPG1qerUK8HUUmQy0pmzw==
X-Received: by 2002:a17:907:944a:b0:ad2:4ed5:ca4b with SMTP id a640c23a62f3a-ad537036e7amr1525198066b.61.1747812695477;
        Wed, 21 May 2025 00:31:35 -0700 (PDT)
Message-ID: <54945bd5-333e-4ffd-8ff1-bb89d22c7ef4@suse.com>
Date: Wed, 21 May 2025 09:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] xen/domain: introduce CONFIG_MAX_DOMID
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250521000024.2944685-1-dmukhin@ford.com>
 <20250521000024.2944685-4-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250521000024.2944685-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 02:00, dmkhn@proton.me wrote:
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -331,10 +331,9 @@ static int ffa_domain_init(struct domain *d)
>       * reserved for the hypervisor and we only support secure endpoints using
>       * FF-A IDs with BIT 15 set to 1 so make sure those are not used by Xen.
>       */
> -    BUILD_BUG_ON(DOMID_FIRST_RESERVED >= UINT16_MAX);

Why's this being moved to common code? It certainly may have a purpose here
(which I'm simply unaware of); I don't see what purpose it has in common
code.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -576,4 +576,11 @@ config BUDDY_ALLOCATOR_SIZE
>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>  	  working alongside the colored one.
>  
> +config MAX_DOMID
> +	int "Maximum number of user domains"
> +	range 1 32752
> +	default 32752
> +	help
> +	  Specifies the maximum number of domains a user can create.

My prior comment remains: The description and help needs to be accurate, in
order to not cause any confusion. In a true dom0less environment I'm not
sure the "user" can create any domains (post boot, that is). And when there
is Dom0 (or late hwdom), the number specified already isn't the number of
domains one can create (again, post boot, which is how I understand "user
domains"). If someone picked 1 as the value here, it's unclear to me how
late hwdom or dom0less would work in the first place.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -36,7 +36,7 @@
>  
>  /*
>   * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> - * If it is specified as an invalid value (0 or >= DOMID_FIRST_RESERVED),
> + * If it is specified as an invalid value (0 or >= CONFIG_MAX_DOMID),

In the public interface I question the relevance of any implementation
details of the hypervisor.

Jan


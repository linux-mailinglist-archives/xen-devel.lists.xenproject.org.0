Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313D5B0ED63
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 10:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053562.1422363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUyu-0002xv-N5; Wed, 23 Jul 2025 08:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053562.1422363; Wed, 23 Jul 2025 08:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUyu-0002uo-KN; Wed, 23 Jul 2025 08:37:44 +0000
Received: by outflank-mailman (input) for mailman id 1053562;
 Wed, 23 Jul 2025 08:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueUys-0002ui-HW
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 08:37:42 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c00930a-67a0-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 10:37:41 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45629702e52so29519415e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 01:37:41 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458693e2797sm15476405e9.26.2025.07.23.01.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 01:37:40 -0700 (PDT)
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
X-Inumbo-ID: 4c00930a-67a0-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753259861; x=1753864661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Oc5kOWFqHtTYM7hjgHEDEH0ih12jQyenk16eXQ1q74=;
        b=klKVDD5a/GEh/wjABvqKdjAEyDgnpeKkQjgOJGOk1lMarVeveXkfY130X3ZzC+glVO
         7BlfpZ/I5Hc6tqIE5PjVUMk+qp546ZDjUfpPsZrhdlgOWNNSVzjLtmOkebixKTQ+lBAT
         vT1F2SPshPqHPF7NyFAwtvI6HP5OsMdCvIJuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259861; x=1753864661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Oc5kOWFqHtTYM7hjgHEDEH0ih12jQyenk16eXQ1q74=;
        b=qj7puJN+MpoFMwcBVfJdJJKu5Y1qbXhqLM82fgtBN4B2+V5ItY0ATrlGx645TA18I6
         UrPvmnagq7pm/LRHZI2nQMJWYPjPS4FtkFb6pk30bwEde9lz7aeCEpJqQtfMVZ5D3KIT
         4WZYEUpjdYRJzQZr6J+qDD1HLrwgh9Y07y2AV2arZtFrCldk3WlDBF7nKSlRKP79EmQg
         I8T4Fqm058W0vrJO4vwldAxg6QItQZD4mH5JR26iYApPj3gin8MponIAC1py0clSz6xc
         1a1KRVtV6qD/q1prdGGAFYOlvuG6G+zFXhO4kkHHOxEFyBoq3f51q8a6Yw2sU91ijV+L
         RvSg==
X-Forwarded-Encrypted: i=1; AJvYcCXEEafaBwxB9B21KLWxsGNFLNiOrqM+jVSeCj29EHGFkUK2H3bkMSLvJLDZJTXPdOpal2WgXKXW29c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE8D060i62tM8dc+djqfX1jIkNm5N2SMZEHnj+/PIKv2KAn2U5
	jYHulV38Vn5+WUoLz8PocB7RU4+iuUr+yKv+7RTJiGjglTzHp62AOdXtIYCmt0F/fvE=
X-Gm-Gg: ASbGncuuMq24w9MnNRb1vgaGp+SiMOMc1WHfvtDEJ6ipfHK0C/D1LQtaJzbxChaA+4M
	GDW0g8UCokMJ9XhkaxKViERVfyD2pFMzRK9ynk+9e9orUZTIb3tfrTwmeso3ve+vVJFN2pi6qz7
	MoNQLj1Tk/+TcGnNz9/2/dl+oi0MvrDtx2nvyyFeFIWj2qHaEutipZ1P0O+rjXDMoo9zaKiDh+A
	3PL37ooJ/+W/ERhyE0mxN+QUQSQfoRwYavAZHj3KL2gN75jeR3/cg7BzLll/D/s7XVbEO/7m3z1
	ZBC1VeNgT9rgZ+vqfP8Qd+3yZEsJwXCxC6fJM9VKDvSXoag2vkHF1f77Yu6s5rClaYSgO1qoBwQ
	1ke1W+Qt8vBlMZ4Oo6tjrJD5klsTYE1894TfvJe9HQO5BfZ7yG7YoLErhWMAhWo1U960M
X-Google-Smtp-Source: AGHT+IFD+VOcd0mF7Ig0Ufwj/OOUus1YShzjLc6WazlSMBQhC8KBS+MojaS9ugrWdbItkcLh/R9BKg==
X-Received: by 2002:a05:600c:630f:b0:456:1d06:f38b with SMTP id 5b1f17b1804b1-4586a7f22cfmr10664505e9.8.1753259861113;
        Wed, 23 Jul 2025 01:37:41 -0700 (PDT)
Message-ID: <5e5f020e-d630-44bf-a406-9db5b31c544b@citrix.com>
Date: Wed, 23 Jul 2025 09:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 6/8] xen/arm64: constify is_32/64bit_domain() macro
 for CONFIG_ARM64_AARCH32=n
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <20250723075835.3993182-7-grygorii_strashko@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250723075835.3993182-7-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2025 8:58 am, Grygorii Strashko wrote:
> diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include/asm/arm64/domain.h
> index 18402ae3ca0d..a014ab9967ac 100644
> --- a/xen/arch/arm/include/asm/arm64/domain.h
> +++ b/xen/arch/arm/include/asm/arm64/domain.h
> @@ -12,14 +12,22 @@ struct kernel_info;
>   *
>   * @d: pointer to the domain structure
>   */
> +#if defined(CONFIG_ARM64_AARCH32)
>  #define is_32bit_domain(d) ((d)->arch.type == DOMAIN_32BIT)
> +#else
> +#define is_32bit_domain(d) (false)
> +#endif /* CONFIG_ARM64_AARCH32 */

There's no need to make two separate definitions.  Use IS_ENABLED(). 
(This also fixes the evaluation of d problem you've introduced.)

IS_ENABLED(CONFIG_ARM64_AARCH32) && (d)->arch.type == DOMAIN_32BIT

>  
>  /*
>   * Returns true if guest execution state is AArch64
>   *
>   * @d: pointer to the domain structure
>   */
> +#if defined(CONFIG_ARM64_AARCH32)
>  #define is_64bit_domain(d) ((d)->arch.type == DOMAIN_64BIT)
> +#else
> +#define is_64bit_domain(d) (true)
> +#endif /* CONFIG_ARM64_AARCH32 */

!IS_ENABLED(CONFIG_ARM64_AARCH32) || (d)->arch.type == DOMAIN_64BIT

~Andrew


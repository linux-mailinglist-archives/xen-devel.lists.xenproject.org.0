Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E9830789
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 15:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668481.1040732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ6Wr-0005ZP-WB; Wed, 17 Jan 2024 14:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668481.1040732; Wed, 17 Jan 2024 14:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ6Wr-0005Wr-TI; Wed, 17 Jan 2024 14:04:29 +0000
Received: by outflank-mailman (input) for mailman id 668481;
 Wed, 17 Jan 2024 14:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3JKZ=I3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rQ6Wq-0005Wl-RP
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 14:04:28 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51f46b48-b541-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 15:04:24 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cd8b64a52dso68836461fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 06:04:24 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n17-20020a0568080a1100b003bc144dc4f5sm1951829oij.1.2024.01.17.06.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 06:04:23 -0800 (PST)
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
X-Inumbo-ID: 51f46b48-b541-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705500264; x=1706105064; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2aemawLA3iCvzglpFZnEamU6EC3TRHK9yCISUSoUoBo=;
        b=A9uAIOZh5djxhdzduMbNFUhnUeDbDxpzRM62zx8NabBcxh+BEAcjKaWQsXXDcAYyln
         KCbKtRONKuKPX6cSTCfBn13+1+KHneY75GRs5kyq9HYt22PVlSGdEurBDG2gQIPyd8Sr
         xsAoC+N+yZmNOPU7K+TY93hKsYmMMEued+Bp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705500264; x=1706105064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2aemawLA3iCvzglpFZnEamU6EC3TRHK9yCISUSoUoBo=;
        b=P/GyHAIdz3de+HJUVaug3+EqdKHQ0zauwcn/89aQgrqhrKKX+rCkQMKZuX24MTCiPd
         /8t9Nf5UIYE1Bt8B1/slUl2+YaLHrhlEvzVEsIj3c4dd2LvjNoFa0mW9P+0MDygwrghE
         gujQqHW98cqCIMfwtRKgny0r5sgu/V7CkR53BNy62z8ZTa2T/1trVzcFdB9zLYP2V6Ux
         35Vu5+zDbt3VxnwqfgkXCI5gsaaw/H/DWw+njzDM9MXtcEnJezf59Vjafzv5hVPNlShU
         TuoQlKDqpxA3K58bxEywaAxfmZ0MfmTTOrTTEnYuStd8HSPqli+b7DOIvSirpXw8H4r/
         9tmw==
X-Gm-Message-State: AOJu0YwcoDtQ7yZJRSf+c3kf2wcbl1QkVbaUmQuZ93HPQDoSr1E3J+M5
	qclX2/GsXf87cgDAbu1NReGn1qPHoAVgqQ==
X-Google-Smtp-Source: AGHT+IFQsdMNxqv3jAZi0ECngE1NbS+4/X3M89Vy7vPOFe9a5K4RL25qVpXkQ7VmFexo308Z+nk/5A==
X-Received: by 2002:a2e:9094:0:b0:2cd:360:136b with SMTP id l20-20020a2e9094000000b002cd0360136bmr3983189ljg.91.1705500264279;
        Wed, 17 Jan 2024 06:04:24 -0800 (PST)
Message-ID: <6cc50e9d-ac06-4f1d-9d8b-dc233e0e658c@citrix.com>
Date: Wed, 17 Jan 2024 14:04:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MTRR: avoid several indirect calls
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <f5c8e38c-66cb-4f21-b66b-056061e37383@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f5c8e38c-66cb-4f21-b66b-056061e37383@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2024 9:32 am, Jan Beulich wrote:
> The use of (supposedly) vendor-specific hooks is a relic from the days
> when Xen was still possible to build as 32-bit binary. There's no
> expectation that a new need for such an abstraction would arise. Convert
> mttr_if to a mere boolean and all prior calls through it to direct ones,
> thus allowing to eliminate 6 ENDBR from .text.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Strictly speaking mtrr_if could go apparently away as well, for
> effectively mirroring cpu_has_mtrr now (once mtrr_bp_init() has run).
> Replacing the variable uses would be further code churn, though.

There's loads more cleanup I'd like to do, but that doesn't invalidate
this as an improvement.

Bloat-o-meter reports:

    add/remove: 7/8 grow/shrink: 1/14 up/down: 1354/-1803 (-449)

for this change, which definitely welcome.  That said ...

> --- a/xen/arch/x86/cpu/mtrr/generic.c
> +++ b/xen/arch/x86/cpu/mtrr/generic.c
> @@ -586,21 +586,9 @@ int cf_check generic_validate_add_page(
>  }
>  
>  
> -static int cf_check generic_have_wrcomb(void)
> +bool mtrr_have_wrcomb(void)
>  {
>  	unsigned long config;
>  	rdmsrl(MSR_MTRRcap, config);
>  	return (config & (1ULL << 10));
>  }

... I do have half a mind to fix this as a followon.  We really don't
want to be re-reading the caps MSR for every call to mtrr_add_page().

~Andrew


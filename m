Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E79ABEEA4
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 10:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991632.1375479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHfDr-0003Gh-AK; Wed, 21 May 2025 08:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991632.1375479; Wed, 21 May 2025 08:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHfDr-0003EA-7a; Wed, 21 May 2025 08:54:47 +0000
Received: by outflank-mailman (input) for mailman id 991632;
 Wed, 21 May 2025 08:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHfDp-0003E3-Qu
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 08:54:45 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dc54cb5-3621-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 10:54:44 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6020ff8d35dso3137451a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 01:54:44 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e6366sm8677401a12.44.2025.05.21.01.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 01:54:43 -0700 (PDT)
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
X-Inumbo-ID: 3dc54cb5-3621-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747817684; x=1748422484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTcNcN/mn4vwLSDJHVvJ6D89I9AaCHM3ByCAn3FkYMk=;
        b=TEc8N+sbBVXflUQOqn/+ygxvPNB7SUhqQ1rUfZLI2WW8olWLT3VgrQ7U38h3GAGE4B
         cclEW+Lulsz9jYy2kYRdYLRffXiReBClPcg2yJRwx6bzGeVhZTp49wBVeI6VhbcPxsfF
         pS8luvl/ZRifmK5nKDLKsHbZyU5207CZupCuBrlVGDRRG/TeF6v/NLN8uXVa8MRPq3Fj
         EKh3hNrtTIlli3gc6yaCFpM3sWujJZmfBR3wtDecF7qmGiYiGtjvDFYfUVIgyGzUxjWF
         AW1AmD3CjkwJxP8+uEnncNC6ajjiWn1Tck+eCqsxmZ7+VN8Z1qZKhZ2ms5qjphM0YXB5
         +mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817684; x=1748422484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTcNcN/mn4vwLSDJHVvJ6D89I9AaCHM3ByCAn3FkYMk=;
        b=FIvKMNfwVFv91enozg/ieWEa3UU6MAafF8rh9nhnkiSpyEWlp9llDRScOz5TfzA2EX
         6g7bOAMlU2bdttLiLzz5RuJAyjspSitD4z4FijICTRYgNOOVmhhIc+B/GjqjSTN/Tv1t
         f5oSOjKGfHRBmIsIS9R+SXEKgTk1f9LogtmGYK75ZyJMALi67JidjCngWkOikvfKyrfN
         x5ahZY56KmSpN6Jck1TWovIGooDuybuOTaIrSBNvCcBsnMKXVv5bRpq2k3TjY+R3/mSj
         i5lS7w7J79etebU0O5IrtHinm9zZxlJ/x7lq14+M8jlV29IGMdmRcGV3NFVU/MbKNwDX
         hhhA==
X-Forwarded-Encrypted: i=1; AJvYcCXSO8C0oMJpzkYxEzA626QalP2Efe410ROZWzH+crSUpRz39/xOa5XJgy+53MHpxzwiVMn8NYi6g9M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yydz8fK/hLuWIBdDjwdd/ZbWe4irGs0JFMvzFCAK0fNHdhwwdat
	S/kEsbRmaNuiseyrK2W/X+qWqqbrU44tiua/ub4Klt7hy8LpgpogPmOdvAV11cnBFw==
X-Gm-Gg: ASbGncuZJFR0D1l8WgmA+/l8hELmPFaDdIpXYAzLKHQwUk/M5mU3tG1h21qVlJKvWkH
	ylCBAPu+jyaNYg1BB1I3h5MBtUAQB06ljSh49vPYpCoqT4NMfPQkoBqGmvMnM1pxY5k2zRZazG4
	dLl/H+91xl6sHJ2zjXUa+LeMIsrJocBdNO77oBoeHHvDRUHuL5q+Aa3dO2cpyNfdnVmFviGALmu
	NdBAGqrkmGhVk2GdvFY10GnBSAsq6JAZFgSb2txpGSbOmmS2ED3ParSUVxY6bWZiY4SCjQXTwcC
	eE+UcBQRoDkza+AaUF2wepW39fP/42rmkvi9+MwlRkLjXNUNEoqxFe6luvnNSDdg6rGJgcd9
X-Google-Smtp-Source: AGHT+IFEiyRbsFlJms7UqQ35HbVJNfGRON+KwNo949Pe5+OL5LqoqOuTfsywH8U+f40mCtHvtqvozQ==
X-Received: by 2002:a05:6402:4307:b0:602:a0:1f2c with SMTP id 4fb4d7f45d1cf-60200a02e14mr6226619a12.9.1747817684230;
        Wed, 21 May 2025 01:54:44 -0700 (PDT)
Message-ID: <b57229cf-cdf9-46ea-89d4-4cce4b1bf0df@suse.com>
Date: Wed, 21 May 2025 10:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/12] common/hyperlaunch: introduce the domain builder
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>,
 xen-devel@lists.xenproject.org
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-3-agarciav@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250429123629.20839-3-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 14:36, Alejandro Vallejo wrote:
> @@ -1284,9 +1285,14 @@ void asmlinkage __init noreturn __start_xen(void)
>                 bi->nr_modules);
>      }
>  
> -    /* Dom0 kernel is always first */
> -    bi->mods[0].type = BOOTMOD_KERNEL;
> -    bi->domains[0].kernel = &bi->mods[0];
> +    if ( builder_init(bi) == FDT_KIND_NONE )

With this, can ...

> +    {
> +        /* Find first unknown boot module to use as dom0 kernel */
> +        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);

... i ever be anything else than 0? If not, perhaps keeping the call here is
still fine (kind of for doc purposes), but an assertion may then want adding.

> +        bi->mods[i].type = BOOTMOD_KERNEL;
> +        bi->domains[0].kernel = &bi->mods[i];
> +        bi->hyperlaunch_enabled = false;

Is this necessary, when the field is supposed to be starting out clear?

> --- /dev/null
> +++ b/xen/common/domain-builder/Makefile
> @@ -0,0 +1,2 @@
> +obj-y += fdt.init.o
> +obj-y += core.init.o

Any reason for these not both adding to obj-bin-y, like we do elsewhere for
*.init.o?

Also please sort object lists alphabetically.

> --- /dev/null
> +++ b/xen/include/xen/domain-builder.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_DOMAIN_BUILDER_H__
> +#define __XEN_DOMAIN_BUILDER_H__
> +
> +struct boot_info;
> +
> +/* Return status of builder_init(). Shows which boot mechanism was detected */
> +enum fdt_kind
> +{
> +    /* FDT not found. Skipped builder. */
> +    FDT_KIND_NONE,
> +    /* Found an FDT that wasn't hyperlaunch. */
> +    FDT_KIND_UNKNOWN,
> +};
> +
> +/*
> + * Initialises `bi` if it detects a compatible FDT. Otherwise returns
> + * FDT_KIND_NONE and leaves initialisation up to the caller.
> + */
> +#if IS_ENABLED(CONFIG_DOMAIN_BUILDER)

For the pre-processor it wants to be the simpler #ifdef.

Jan


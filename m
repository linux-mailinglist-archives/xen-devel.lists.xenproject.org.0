Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48444924035
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 16:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752506.1160725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOeHT-000461-A9; Tue, 02 Jul 2024 14:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752506.1160725; Tue, 02 Jul 2024 14:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOeHT-000443-6w; Tue, 02 Jul 2024 14:14:51 +0000
Received: by outflank-mailman (input) for mailman id 752506;
 Tue, 02 Jul 2024 14:14:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOeHR-00043v-TP
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 14:14:49 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7018ffc4-387d-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 16:14:47 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ed5ac077f5so51182301fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 07:14:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6a31f5dfsm6618314a12.23.2024.07.02.07.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 07:14:46 -0700 (PDT)
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
X-Inumbo-ID: 7018ffc4-387d-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719929687; x=1720534487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r+UJLD5ndf6sP6FlphP9ppBld82PXJa+rDdTT6dNg18=;
        b=QoZeSxoSZ0LrvJuO84AzH/yXcQtenmhaT/ssbdt2wLUIBeDgnbVOmvNmHmK9E08Q/5
         +b8OU94sPyHsR7xDz9F273WlqXYFlCTPqL5aNyEi/BcgLGMf1wj+0MrK39qhn1sescPb
         brf4dre1jmXC7n8tk++Re84dNuZ+wEoJoQh56n/4zeyT17M2fb65R6PJIwQDQkmNQelP
         kJVBCw37QX32GFYG4EpPxR3YPjssG2yxson7w3L1MUtb5C7OQlBtqnxfZoEuioWXkPlf
         VVpNLvn9dKkFLH1U1Pl9PXvxPSpa4xP2OqaQp5o0GOLDYh/LBwJZSaOmAUL5stXuyPxA
         iM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719929687; x=1720534487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+UJLD5ndf6sP6FlphP9ppBld82PXJa+rDdTT6dNg18=;
        b=AUDK7l6p3MKPXwgLPxvW81DNFBVhMxGK8NZg86fFcwGSqTLoEB7nHzwocU5JH/DYyf
         5N6OFDSdf7mf3bIw4Tf8UTzJUJVA653NNAN6ZUbQcJuwUXq9C3XLTsS9p4vlq7Rns5Ku
         cIKd7AIpaq2zEZ6PNfmDmgygFPJ1JoNf+yd7eBQrZptM959IatyGGepZNee/imfN7OE4
         uCGoc2lwSkl3BzKs63Ik4ZoY/awhR/qSZH1Pj1lke8XR9LQZCksYD6Ohuwi8x+HCLGiy
         ItCoN6+vJz18GQzpIqONepXZ7F+kvD01d8TgtSXp7TQyUkod7x8D8KbwPywlSHmhaimu
         GJnw==
X-Forwarded-Encrypted: i=1; AJvYcCUbDNEuEqncYsTzkjw5pcuPxMVsBQQy/Z/tPJIQS3lVobjlnx4JJSdhswZ/v8Eokq796Diztq0Kg9x9EJfeN3Igta0QEMNew4/70lzrWo4=
X-Gm-Message-State: AOJu0Yzn74KeRZqmJccHa0UPdhmFTJGb06Rh1QGedmRGsKtyx2EZN/2B
	J7FTxLZHoI5rnTknNWXFJqvkPomcjGYvmgpRrINUXD3pRYJCmbTF4FIZ0Mecag==
X-Google-Smtp-Source: AGHT+IEyj41OQ9cMD40hd9Xec8lwsR1QvVpygObFL6tXFfSfCa7hmJyL4wUDxJphod8/oTynEHP72w==
X-Received: by 2002:a2e:b889:0:b0:2ec:1042:fb04 with SMTP id 38308e7fff4ca-2ee5e6cd745mr59871621fa.35.1719929686959;
        Tue, 02 Jul 2024 07:14:46 -0700 (PDT)
Message-ID: <643ada7e-b265-4283-9c52-f6cf6239fe26@suse.com>
Date: Tue, 2 Jul 2024 16:14:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen: Fix XEN_EXTRAVERSION after 4.19-rc1
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240702134310.1307657-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240702134310.1307657-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 15:43, Andrew Cooper wrote:
> EXTRAVERSION needs a . separator for numbers.

Not exactly. It needs the 0 dropped, if we follow what we've done in the
past. Then ...

>  Currently, the banner reports:
> 
>   __  __            _  _    _  ___   ___
>   \ \/ /___ _ __   | || |  / |/ _ \ / _ \    _ __ ___
>    \  // _ \ '_ \  | || |_ | | (_) | | | |__| '__/ __|
>    /  \  __/ | | | |__   _|| |\__, | |_| |__| | | (__
>   /_/\_\___|_| |_|    |_|(_)_|  /_/ \___/   |_|  \___|
> 
> and xl reports:
> 
>   # xl info xen_version
>   4.190-rc
> 
> Fixes: 4a73eb4c205d ("Update Xen version to 4.19-rc")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> For 4.19.  This is a minor mistake when creating Xen-4.19-rc1.
> ---
>  xen/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 58ce6e468eab..037c49f83d39 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>  # All other places this is stored (eg. compile.h) should be autogenerated.
>  export XEN_VERSION       = 4
>  export XEN_SUBVERSION    = 19
> -export XEN_EXTRAVERSION ?= 0-rc$(XEN_VENDORVERSION)
> +export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)
>  export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>  -include xen-version
>  
> 
> base-commit: 08daa72cdcb660c2f0aef52ee76a3704e2dd1b5b



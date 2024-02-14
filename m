Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27966854405
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 09:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680255.1058262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raAde-0008UX-7j; Wed, 14 Feb 2024 08:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680255.1058262; Wed, 14 Feb 2024 08:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raAde-0008SD-49; Wed, 14 Feb 2024 08:29:06 +0000
Received: by outflank-mailman (input) for mailman id 680255;
 Wed, 14 Feb 2024 08:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raAdc-0008Qq-PA
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 08:29:04 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b44bafc-cb13-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 09:29:02 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4108cbd92b9so29435425e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 00:29:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hi25-20020a05600c535900b0040fd3121c4asm1185044wmb.46.2024.02.14.00.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 00:29:01 -0800 (PST)
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
X-Inumbo-ID: 1b44bafc-cb13-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707899341; x=1708504141; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ra+BUjoqFbebrpixPvBYqShNEgsG4wCfyFJmG/mPNRg=;
        b=EKyT6PrJEkeoNjyk1/S2xZmuffY/pjPPjGi0Jrubpxym9ft8shRUnYEjUzJJLkXsyW
         0S6h6O7upTq39Lna2Hwx720MPOEUkxSfLPY7y2WVBWCVw7vivMyoWTh1eQJQA5ajY6D5
         U8hhmCILpxGPQqVEl/8VN86Ntf/xUgTE4spLpQG+w2wLOgwalzAE5Ze1i04uTK/jgAxP
         L7Xtac/hI9Hki93XJZbCD7w44XBW3LGO0GRxCmHp+HQ60RaSz/O7HeaIt26yzEd8iDEV
         OQ4w+jBj8zIXP9axZ5VkThMLx0TeW30AkrWhrGN0Qf0BlVVU1KAwUWkWYajUh5V98f1g
         RH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707899341; x=1708504141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ra+BUjoqFbebrpixPvBYqShNEgsG4wCfyFJmG/mPNRg=;
        b=M0GnM931cjlPMBKnXletJyxuxRncxhknIbVZjY6mt2bzMVF5w8ypzpF6FbrsuGqSm0
         KLKEcWiKlYNOF6GWZ2LheH7XYWiRBh2xR/IRN4v8/c1bcp/n8sbmVgRnwSbf32E9Li4r
         KPhaTk5NBGXeiDF5v/C3RyuOjPb+EbmG8ThU+VZvw6WIgifKQ0ppiDwrAUun6ZJG6oZo
         V0xbhOuly5VBA4B8ubCGAoYePmBhdvH0b//kUyJKiyXNg0vK4iShBYcD8MO04k6bqC74
         SIueVl9iajoBxF13C0zVMTm/rvjGu8HPyhAW+ErK2Npqyw8BK2LhWzauCgF50R5kjn6u
         ctQA==
X-Forwarded-Encrypted: i=1; AJvYcCXDqIpKLYg8d/3VrP0r3biwTrzMpiBfskZJ7UixodSoAwngP6rtl1jkjQ+rv43LB6DOkRZwB/ZZsa8tK4lLZtdIAyAPmMS4EUW3lnB69jM=
X-Gm-Message-State: AOJu0YyXhTPg671g8tPBjlNfAs53DLriFEFoDwNPDVhB8+w/NgLGiePi
	2H8+UEdSJ81GJ7jfnLRJhaEaPJb6yNgqhDTyRModCcvxlWthKDx9ss7ckFwfaw==
X-Google-Smtp-Source: AGHT+IFnno1UBPaJ4K7EleUo7t/e7wRRvzlM5+EbOUYbN8t5h5oU32x4QhbgKqGPgBefKm8EP8CI5Q==
X-Received: by 2002:a05:600c:4689:b0:411:a5f9:26f5 with SMTP id p9-20020a05600c468900b00411a5f926f5mr1582618wmo.38.1707899341390;
        Wed, 14 Feb 2024 00:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJ4SQgpx3agcDB8YWuq6GEl7AdHDReF0n0qBwHNbuRt/lv62Uce3BV8WQzihlMvdj2GHJ+PMkwlpTF6rcpaZfoLImEC6m4fHXLIXvJpxIluUJBIyQzazeFvxMVo46iJ9RKUWx2JT96EyyYaxRyN/e8RCqpwuFPluUA3IfU1As7DKIdyG881WTHslo2L37hx8P6JqPSbddpENOmm21zdGEL1poeZEfjdMMANOXe07ByKs686XnrYM6asYoa6kQDIYYZUycQy648nKKf7frv/3G19UEOANw6yEodX02ykvviZ71tsnM7
Message-ID: <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com>
Date: Wed, 14 Feb 2024 09:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 roberto.bagnara@bugseng.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrannd.marquis@arm.com, roger.pau@citrix.com,
 federico.serafini@bugseng.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-2-stefano.stabellini@amd.com>
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
In-Reply-To: <20240213223334.3693410-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2024 23:33, Stefano Stabellini wrote:
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  docs/misra/rules.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index c185366966..931158b354 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
>         headers (xen/include/public/) are allowed to retain longer
>         identifiers for backward compatibility.
>  
> +   * - `Rule 5.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
> +     - Required
> +     - Identifiers shall be distinct from macro names
> +     - Clashes between function-like macros and non-callable entities
> +       are allowed. The pattern #define x x is also allowed.

Just for me to know what exactly is covered (hence also a question
to Roberto as to [to be] implemented Eclair behavior): Even when
the above would be sufficient (and imo better) people frequently
write

#define a(x, y) b(x, y)

which, transformed to the specific case here, would then be

#define a(x, y) a(x, y)

I'd assume such ought to also be covered, but that's not clear
from the spelling above.

Jan


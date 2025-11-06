Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F38C3A182
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 11:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156675.1485694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwvv-0001Mw-Va; Thu, 06 Nov 2025 10:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156675.1485694; Thu, 06 Nov 2025 10:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwvv-0001K8-Sk; Thu, 06 Nov 2025 10:09:35 +0000
Received: by outflank-mailman (input) for mailman id 1156675;
 Thu, 06 Nov 2025 10:09:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGwvu-0001K2-QN
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 10:09:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b08a1bf0-baf8-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 11:09:32 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso106671766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 02:09:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b728937d880sm183890866b.26.2025.11.06.02.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 02:09:31 -0800 (PST)
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
X-Inumbo-ID: b08a1bf0-baf8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762423772; x=1763028572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=127p3U/4hov97C/SybP0XPQyeMPeKbvNc1aPkJZ+QUA=;
        b=ZDxYfcOg/j9Bv8o/nXNp0nURKbHTpIbOYqyoxc7YjYSyP3/RgbQg5npnQ4V2Bn/iNY
         yofw9Q48zQYXigYjVF7gUoHwWQZKJNafNJy3QoyJ0EFTQqD7xxLLiRI1XF78UHkqOvS2
         QWhP06vrFjlZMGWWsn638tACeXCaYiD37cZlDA5MTGLvHLwt0Z6/y7mjyX9SPFKsvjfN
         oHK53Y5bzKUI+oEBGYhJS0HnDcC4faXg6XVoC956BpaYx+cVMYLOuZlfZDeOeofgUITf
         ffaYbLQkCA1iqFYX2E2CS+AJsZj9UhZbDguqzRyYo/cY6p0gdoCGtcygJjZC31wGqYJU
         7Hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423772; x=1763028572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=127p3U/4hov97C/SybP0XPQyeMPeKbvNc1aPkJZ+QUA=;
        b=ft86t0TezZVVQ61pVDuyNe63/wsp2ryJ5EzKR3R8hTDkrzYgbN9lb+iKpj8cRMdnIJ
         eXGlmu4g8Bp5zWuuGa/9Qm4arHiM5T7Arl5ahxOY6geLcDgBDq7A2CNNAziJJvj0KJuy
         77tTH9GppwW0imfiasSSmGM/FLgXOyS12uiySpWsZ2QR5WFm6qKb93Y4mLHtaSlHhAFQ
         gxTbVi2cOXRDWw7oT84181YdNy0+IhYpfI8ONcZXpIdLZMD9AZEqrr9JbnhRxOtEZ2+z
         RRooB2kJKIGnlOhkKo8f/ZHPmtY0b369pFFEvAeuLq3izKxTQTOvTgjlpkTljZUkWjes
         OYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhpYsMqo7syAkaP9J2evd6SNv8Jn2HfiAE6fwSWAqdtJcinTSChiiB7bRgLk4NRGC5HSRsbpXxx9w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNuNQvlFELC/v2yHH3SuuyZcwNxOUrlNzgtL+WaYYZt1iNhRjO
	MAHF78l79iw1BblrEZAX3+IbUe9GvdtGowPwl+Py7aY24IYsJpGz7OkK0ujrkzcXXA==
X-Gm-Gg: ASbGncs02JyqF3bucXVsHCRpMvo+it+1s3C1AVSutTp+YXdedp1OeGlBZu5fnW150Ph
	57/9H9hLFXmYoc66G67XOdDIodAjWEwmY5br1U14M7kgZ4SUIbv7No3Njm0/GlUS5p/vSn4Bflc
	FYFP+9TUOH28TNttOOA9kVSuK5Xn5nj+9q7v+PUSk7GCzfF9ZTMRr15PJ49De09pyS8vqo+/f61
	Nuv+FxGTjS/lzrIkGSVN0xF7a7D4Eh8CZo/YhPwNo011PC2AKtwSI2eC6liCxMFE5BXH+q2duLL
	1pb6xNZqLYdxvaaaID/yzAXWjk9lxIpJMvLkSdgHsccqtTLSB8a0RmRZhtCMHXnCPnG4SZom/SN
	6aOpyBzvYsu7CYIvkQj8xDoGl/D/lqHExifbsmuElcoFkw2A10fFREtAnAA0gnD2dC7yO97SSsh
	5LXUmHkG3j8w2t3qq7U07xR9tdxxib6nrzhT9QWN2f0IT4w5l3GBXKE15V3fBd
X-Google-Smtp-Source: AGHT+IG0itRJdZ3NUS9r6OwFNb4MZ5S9WMv5lE8FVaL17wn0mUmCPFsTEaFLvj6YHLVpJXZ5g/1EIg==
X-Received: by 2002:a17:907:1c0a:b0:b3f:f66b:268a with SMTP id a640c23a62f3a-b726529ee53mr624594366b.19.1762423771933;
        Thu, 06 Nov 2025 02:09:31 -0800 (PST)
Message-ID: <9598b2e2-7df8-40c5-82cb-c097121af763@suse.com>
Date: Thu, 6 Nov 2025 11:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.11.2025 12:56, Oleksii Moisieiev wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -29,6 +29,7 @@
>  #include <xen/xvmalloc.h>
>  
>  #include <asm/current.h>
> +#include <asm/firmware/sci.h>
>  #include <asm/irq.h>
>  #include <asm/page.h>
>  #include <asm/p2m.h>

Does this build at all on non-Arm?

> @@ -827,7 +828,32 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_test_assign_device:
>      case XEN_DOMCTL_deassign_device:
>      case XEN_DOMCTL_get_device_group:
> +        int ret1;
> +        
> +        /*
> +         * Add chained handling of assigned DT devices to support
> +         * access-controller functionality through SCI framework, so
> +         * DT device assign request can be passed to FW for processing and
> +         * enabling VM access to requested device.
> +         * The access-controller DT device processing is chained before IOMMU
> +         * processing preserving return code and expected to be executed for
> +         * any DT device regardless if DT device is protected by IOMMU or
> +         * not (or IOMMU is disabled).
> +         */
> +        ret1 = sci_do_domctl(op, d, u_domctl);

Why would this not be the initializer of the new variable? (I also don't think
that we've decided to permit variable declarations at other than the top of
scopes or within e.g. a for() loop control construct.)

>          ret = iommu_do_domctl(op, d, u_domctl);
> +        if ( ret < 0 )
> +            return ret;

Why would you invoke both in all cases? If sci_do_domctl() handled the request,
there isn't any point in also invoking iommu_do_domctl(), is there? Or else is
there maybe some crucial aspect missing from the description (or not explicit
enough there for a non-SCI person like me)?

Also this doesn't look to fit the description saying "The SCI access-controller
DT device processing is chained after IOMMU processing ..."

> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -379,6 +379,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>              break;
>          }
>  
> +        if ( !dt_device_is_protected(dev) )
> +        {
> +            ret = 0;
> +            break;
> +        }
> +
>          ret = iommu_assign_dt_device(d, dev);
>  
>          if ( ret )

How are DT and PCI different in this regard?

Jan


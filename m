Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FB885B934
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 11:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683378.1062860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNVa-0002jZ-Ep; Tue, 20 Feb 2024 10:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683378.1062860; Tue, 20 Feb 2024 10:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNVa-0002ht-Bg; Tue, 20 Feb 2024 10:37:54 +0000
Received: by outflank-mailman (input) for mailman id 683378;
 Tue, 20 Feb 2024 10:37:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcNVY-0002hn-Sj
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 10:37:52 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 190fa229-cfdc-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 11:37:51 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412698ac6f9so8473265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 02:37:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fs14-20020a05600c3f8e00b00411a595d56bsm14037286wmb.14.2024.02.20.02.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 02:37:50 -0800 (PST)
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
X-Inumbo-ID: 190fa229-cfdc-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708425471; x=1709030271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6015tbHyN3AB4j82IiQ32hpH7Mru6U9Dq/uVwr4WFAI=;
        b=ClfA8PykBHXP7Z7AqjH0HHDbGLo6Mhl6ffyXIpJYdZWy21rHhB6Xv+eRVTLAEpOIRa
         udbdIvNqK13swXMAmBlc9E6LdyRn+PPrD41tFrcltb0yv6s+poLkhPxh405PzJqVM0gC
         K45r9PaU79gpiPtHyME8+hbVAPTJiY/yGAOfhqaOp/6Hmg41Y5XHqmbPl3txZ1nLkoWL
         zdDN0CW/lCvoR25ZCryj+A58+6lJPxYSg/wxkorZnIsDjXzYavTpvXZUVfMrkjbK44L2
         a/uZQfhwV93FuY2wdVv48fkqT6guWHsOzgin5itqqSoI3Z0HbhHryrXb1evz3V++s7Oe
         MbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708425471; x=1709030271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6015tbHyN3AB4j82IiQ32hpH7Mru6U9Dq/uVwr4WFAI=;
        b=Uib8ih7PViuoNCqNPQLQ9pEbSsVih/ww5O+2kzWFKbYRYo31WlFhp380lVHsXablL2
         wse2++/Bidc6c+lioD7zRINHKMC5MWLQ4jUEU9tJ4hBasHVa2+t12+tF7Z9KrIMWLcWE
         Q73PrsknowpT0ch8R6bRYwCl4s6q7fKzsUUVvh8+bgbdAgVapzIy7kn89oG2LYm9N8Li
         0ItDwXwrw3i9K/aCVFTPU/gOxl8ESDd6aumNZjIXTYOZQwqB85VJvAG7yA4FX0zYBmC9
         2RzbzltyJvPJZfNIfDtDyRyLPSV64Ay4pLZmsU00/WoW9ZH6E8CEti803uq3gM8K410n
         X+7A==
X-Forwarded-Encrypted: i=1; AJvYcCVlRZx6ke5o3Wioe8zq5QSuu7M6Qe9om2GkoxV/MbFvTt+ScnOzfgS1TZfO56bK6ORcXS+dz1Pho4NHkZfFYgI9QLVq2hMuor2bXI+3gjo=
X-Gm-Message-State: AOJu0Ywos8497vCDE5JnJntWLVxjelfUlRsn71KJMe/OEB5jMYWXhcNK
	xjvmEEGQf0Rwpr/4pZ/G5j8YR9mC8zbYlpq5jzckwPz1G6PQEpUBy63da9zlZw==
X-Google-Smtp-Source: AGHT+IG8VCj6Q5ze/WUvaTpnbNapcrqoS+4gjGEYB7cL3AUIDz7jOn4wRaRCZsnmWfgPEAav3Tg2ng==
X-Received: by 2002:a05:600c:4f43:b0:411:e86d:85a3 with SMTP id m3-20020a05600c4f4300b00411e86d85a3mr16253163wmq.16.1708425471215;
        Tue, 20 Feb 2024 02:37:51 -0800 (PST)
Message-ID: <3fdbe1b6-59d0-4a33-8e7e-fb3f31a94fbf@suse.com>
Date: Tue, 20 Feb 2024 11:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 10/27] x86/pv: Map L4 page table for shim
 domain
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-11-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-11-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> The root page table is allocated from the domheap and isn't
> mapped by default. Map it on demand to build pv shim domain.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

The patch looks correct as is, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Still I would have wished that ...

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -991,8 +991,12 @@ do {                                                    \
>       * !CONFIG_VIDEO case so the logic here can be simplified.
>       */
>      if ( pv_shim )
> +    {
> +        l4start = map_domain_page(l4start_mfn);
>          pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
>                            vphysmap_start, si);
> +        UNMAP_DOMAIN_PAGE(l4start);
> +    }

... the function wide "l4start" wasn't clobbered like this.

In fact I think this patch needs either folding into the earlier one,
or moving ahead: The respective UNMAP_DOMAIN_PAGE() added there breaks
the use of l4start here. Yet then why not simply move that
UNMAP_DOMAIN_PAGE() below here, eliminating the need for this patch.

Jan


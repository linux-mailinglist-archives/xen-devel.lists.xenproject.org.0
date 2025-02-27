Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4444A477B8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 09:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897930.1306553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnZD0-0008EG-JM; Thu, 27 Feb 2025 08:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897930.1306553; Thu, 27 Feb 2025 08:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnZD0-0008CM-FK; Thu, 27 Feb 2025 08:25:30 +0000
Received: by outflank-mailman (input) for mailman id 897930;
 Thu, 27 Feb 2025 08:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnZCz-0008CG-JA
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 08:25:29 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66ae8dd6-f4e4-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 09:25:28 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43b5859d1f1so3050875e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 00:25:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba532b0dsm45860015e9.13.2025.02.27.00.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 00:25:27 -0800 (PST)
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
X-Inumbo-ID: 66ae8dd6-f4e4-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740644728; x=1741249528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SxeMMwjttD0rqEP0+gpMZnJ67JFYvwYCgF+8EXEQrlo=;
        b=fY4uO4VHZC7zq1zsN4mr6AwHg7DjZtVQiQpQ5iUa5TOg1xoJS2PkKWHr11w12x9qH0
         9TQos6R3X/PSFcvmPFmKkAGV1av/As6uH7JuAnA6w+EyZZDe7QcNLfqhbLOnj6ndR0H9
         8KHOZX8W9j8+Ys+2yWI69UfC/4aUo7Z6dasiMMhrsjSzU97mtlq7prwELgkbET0OC5Xb
         UNO8JI5dGoPNptpUZCXTH3OeqhJe/hqKmTfz9WXMKwE5fFsBKazkoOmYntT4q37o+nXr
         obhIZO0pftDmUyxbgFgd4corTK9f+CocHxWUN34qAEx4/P/QJOOrEdis+j2X0Oox6G4P
         PuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740644728; x=1741249528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxeMMwjttD0rqEP0+gpMZnJ67JFYvwYCgF+8EXEQrlo=;
        b=UNlFhyZq9ZMwAOxjuis7OKz0CMFBDhtzGMo5HdHp/Zd/KwP4PeeAzwhCvokuVSiFUE
         ZQzcup5wRMuEfx9tH1Hr0BF62pI9qtn4GDKHP6qf56WUY3awI2E84UIPSJBhP1yEsExR
         Zp80kYKhqInkduJsTlUioN1tdM881QwBUIWm5Dox3cQmEzem9OA6xxEnj8AUymHoXc2i
         mH5Xi4Y7Enet8WbVDuq0oo5dkiTUKrZ2J+TOX8QNnR8XLpuz8HHME682VEsldnaV/27U
         vPhOmPtH/pmqZFiTjWHm6J0vPh5n/nc84mhhUx9XLWSpeaLGZ35BgIFaI++xrtb4NGz7
         6Ypw==
X-Forwarded-Encrypted: i=1; AJvYcCX9PKC/2iN50BmC/N8T7evnJicYvFd5siIhlmMuxi06yX8ekTAHPTBpnHNVyX+DiuSZj5gDUhnvjaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaoD+QbIsanWBAaJzUmRat2TD1J27ENv9a4+RKVmCSVvcn9Lam
	hmhOdK9b49Zv5ElLmxhTw1h9jM5CRPr/f392noLv4rZ1WvMZ700Q4qtLYeKfPQ==
X-Gm-Gg: ASbGnctKZqA1n1hsWX3Laq2BWpU0s0IMYSSxBc3ILZPy1UdkDRWt/Dmz+DkFQixClGQ
	VR7BWcQ0AaQlMPBp6JhJA98JdTeSwffdI5hPNKgV4rOedylb4zgQPUUDmgoOHa153WHnNJOA3B3
	BTrn+6LsiAVJ2wGoj9HTDxg1YpqsLaLe5bHgfcxbBE62+PPk23FPpFcRhwV551pO1zoKK+WWhjX
	DcX+c3nUs5Gl5AAQOoafz+7fke47UP2IkLzxXF1boQRsloQ5Jrtoc2rir/dmgkoHV3RxNsKP1ku
	61LxZkmI2Jxbklx0l8Z9LiUxVkpUIGjp46ijKtrguNeVMOpoynmIIuX4ElzH4t6SiJERhPd7pKd
	51SzJioGRsdY=
X-Google-Smtp-Source: AGHT+IHTWSzHNwqqUaS+mdoWC5wuP/WNoPTaZwYwQw++QRE46cJjLVU8WMQP1dBUNgvpEiJFHramFA==
X-Received: by 2002:a05:600c:4588:b0:439:9377:fa21 with SMTP id 5b1f17b1804b1-43ab0f6de1cmr86954065e9.19.1740644728214;
        Thu, 27 Feb 2025 00:25:28 -0800 (PST)
Message-ID: <6819b451-9868-4c66-a52d-da5c91d58c7c@suse.com>
Date: Thu, 27 Feb 2025 09:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/libxl: Skip missing PCI GSIs
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250226201022.42447-1-jason.andryuk@amd.com>
 <20250226201022.42447-3-jason.andryuk@amd.com>
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
In-Reply-To: <20250226201022.42447-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 21:10, Jason Andryuk wrote:
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -901,7 +901,10 @@ int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
>      int pirq = -1, gsi, r;
>  
>      gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
> -    if (gsi < 0) {
> +    if (gsi == -1 && errno == ENOENT) {
> +        LOGD(DEBUG, domid, "xc_pcidev_get_gsi no gsi");
> +        return 0;
> +    } else if (gsi < 0) {
>          return ERROR_FAIL;
>      }
>  
> @@ -925,7 +928,10 @@ int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
>      int pirq = -1, gsi, r;
>  
>      gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
> -    if (gsi < 0) {
> +    if (gsi == -1 && errno == ENOENT) {
> +        LOGD(DEBUG, domid, "xc_pcidev_get_gsi no gsi");
> +        return 0;
> +    } else if (gsi < 0) {
>          return ERROR_FAIL;
>      }
>  

Why the special-casing of the value -1?

Jan


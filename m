Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9A8A945D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:47:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708092.1106688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMUL-0006k2-Kx; Thu, 18 Apr 2024 07:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708092.1106688; Thu, 18 Apr 2024 07:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMUL-0006iT-Hm; Thu, 18 Apr 2024 07:47:21 +0000
Received: by outflank-mailman (input) for mailman id 708092;
 Thu, 18 Apr 2024 07:47:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxMUK-0006iL-37
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:47:20 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e12f3039-fd57-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:47:17 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-418bbc690e1so4779785e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:47:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b00418ef96472asm336004wmq.0.2024.04.18.00.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 00:47:17 -0700 (PDT)
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
X-Inumbo-ID: e12f3039-fd57-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713426437; x=1714031237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDvkxOWu6iaqPvLNsHPt1daX2aWYf6HoPzOB4rJqaKo=;
        b=LNXl6qBhpRDAZz1d1Us1caesYH8dAuFX//2tPEGC/Xl2CXZzaVtbsoiAbJp1yfSxFr
         3RM+0uUZrIY8fuJg5k4zRAJdqXSD0fSiG/ImjjyXUWf8o9IHkr+6V3sA/s2TJ0uE5EJM
         55cDP2D3mqkS7RZ7B2EI98paMbb4Vud+r3UK4/uhDnfbOBeA3oEJj/EoJVEYxita/YYP
         cE2A218KAeBFXzc+o22FJBVVQgw1D0AqFOtzLegHM/QW3RQY0liL7cDy7ZARlz84G0Rw
         I5VL+3TTDF6kWywERzioN3wa1Qk+8zvktrpyYHEDxMGLAeQKDEJOEkZW2kRKaj81CDuL
         wTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713426437; x=1714031237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDvkxOWu6iaqPvLNsHPt1daX2aWYf6HoPzOB4rJqaKo=;
        b=i2QJJ9dGrxrYBK2osnrKaq+bYr49TxZ7AEifa32fX9Ye+egCvRjZ0x/j1S+z5jmyxy
         5rT15/bJ9RRnoqPYXP3OhcZnVaGIOi/VnvMXo5DpalYiWPTE6wsM/1cMgnOJY4VkMWvK
         8JTVLXkDveuZ9aM7tXJV20MajUjMCkWpebvTunycEPqYWA86+s6jBzUwuySeLee7uYdo
         9InL+I93BymyH4r9Xe8X1JZdPidihUDLI0ZviZIZUuqtN3l3cnP5MiNWMzjGYFu4/56j
         XyvJhdVzH6SRf3PjgeVbfiSl9brukQZ4Iqh5to0YfO85f+Qs5M6km3dAfWUuE6kkfwiK
         IjJg==
X-Forwarded-Encrypted: i=1; AJvYcCXPIOlROA1YGpFEOTIyfWc6jwGdCxieU7Wukn/HwxwOCGPD7ozHwRaMZ+OVVuBPHfy9qrJd51khF+3gcQZIq223i+F1myUQdqgYJZWDlWY=
X-Gm-Message-State: AOJu0YyhN05oFTLDQHXXkkJMd4wBeHN6YVeI10v8hkuTSlOxf3oj2YZf
	eTyBUGMZU9Wzv0fP/gO1vQO+dVYiDbVTIMnOllsblTKP0sH5Pin+CYEFDoxgiTsENLCw2CpAm+w
	=
X-Google-Smtp-Source: AGHT+IHpu6lbBwnCWqOJKGoMrrMTHk/llIbpS5axaRI4Xq0YikDGvTan73IdClDRc8IIYO5SPHP5Qw==
X-Received: by 2002:a05:600c:1d03:b0:418:bbd5:e7f8 with SMTP id l3-20020a05600c1d0300b00418bbd5e7f8mr1257094wms.16.1713426437331;
        Thu, 18 Apr 2024 00:47:17 -0700 (PDT)
Message-ID: <62f3ba42-4bdb-4861-b374-d817c3961219@suse.com>
Date: Thu, 18 Apr 2024 09:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] gzip: drop unused define checks
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
 <20240417143716.27189-2-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240417143716.27189-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 16:37, Daniel P. Smith wrote:
> Dropping the define checks for PKZIP_BUG_WORKAROUND and NOMEMCPY define as they
> never are set.

You don't mention or otherwise touch DEBUG uses, yet ...

> --- a/xen/common/gzip/inflate.c
> +++ b/xen/common/gzip/inflate.c
> @@ -661,7 +661,6 @@ static int __init inflate_codes(
>                  /* do the copy */
>                  do {
>                      n -= (e = (e = WSIZE - ((d &= WSIZE-1) > w ? d : w)) > n ? n : e);
> -#if !defined(NOMEMCPY) && !defined(DEBUG)

... you also don't replace this by "#ifndef DEBUG", but outright delete
the line.

Jan


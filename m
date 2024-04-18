Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA88A9D32
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 16:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708430.1107350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSqX-0004Dr-2b; Thu, 18 Apr 2024 14:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708430.1107350; Thu, 18 Apr 2024 14:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSqW-0004Aj-VK; Thu, 18 Apr 2024 14:34:40 +0000
Received: by outflank-mailman (input) for mailman id 708430;
 Thu, 18 Apr 2024 14:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxSqV-0003jT-N8
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 14:34:39 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8964151-fd90-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 16:34:37 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-418dc00a31dso7692145e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 07:34:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b00418d5b16fa2sm3685384wmb.30.2024.04.18.07.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 07:34:37 -0700 (PDT)
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
X-Inumbo-ID: c8964151-fd90-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713450877; x=1714055677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4l78n5SwQl64u9x4vssBGuH6t3QSXDqNtea6v2Cm+E=;
        b=H5CFPQvPzkE+p9u2jXX76leQua3G5TpI5BPl/dzcyOQEVDKL/Q1ZXv/GjMOi9xMwem
         biQMRxE5BhXvdKsJ6VRj4gVh6wfyJSXa2UBxUtWY1pYdr4oqQThXMK4WZOBObtelwyZT
         DlQcsgkPh2TKo97tTn4UdK/kKbB+pNJAqa06depwJ2XEmiQna1z42KY3nmsX7a+y8sTD
         CnswP1xZeRy1Aw23u3fixlIbi2SRhnQD9r8kDEiPxDvFXz29JN9waIQ9NtDKKG0RAG55
         RlWn8K3Pc11EMei9vl2S8cKaTvnz/leyQVcFKkmnWB2GpAN3Bdc+tJRwehV8BeNmrYIe
         xKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450877; x=1714055677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4l78n5SwQl64u9x4vssBGuH6t3QSXDqNtea6v2Cm+E=;
        b=GOQAtuq3NUwSmn6hC9e1baOx9lglCDx7kE6sR4t1l0sud7LEX8YfrTzKfNHt6uIa73
         FjKaYqTh79wAhlZJ6+EJ0tKAMSme7A9AHa0mtHwMrrn94R0cSYGGeCCYBbTK+utOKG0o
         L8kUucosyZecnSsvVJ9C0U6o3kaAprW1xvmj/ytk6fueR/3gvURsZ1TNnu0O/LFoH2nE
         362jrlJJNLGkvSglXCAOLoHcY/qaC3kreLF+xJOw3zRxMfaDqsmxB7VxTsrWLnUSt81o
         9loSrMLyuDeqKv5O1lD3HMr6wDEKWP47rEkx45r3481UXT38e4kQcEdq30Z1fPw6DfW0
         DOEA==
X-Forwarded-Encrypted: i=1; AJvYcCXhtk8M09Zf2ORNxQh5F8juqvPTGHfIN5RK/Wn/kIuxDmB3Tm3AjIs1mDOpko4qHs+kAwojRfZquUiDySER7DEesS4PN8NWSQJn5vKhcX4=
X-Gm-Message-State: AOJu0Yyf5aZplKCJ5PeBJI0ogfr0LJzXHNknLPfBnHnY4kbbeGP+4Ixx
	4NO++F4OapD9YXbSBEXk6WqjPPtR9BwCiKPcie8l8O7Fbw9XwjCfrV8I8Co/2A==
X-Google-Smtp-Source: AGHT+IGjdnSthA5Yq5XlM4tCqa7vsGgS4edgcfNITGXvuRRDNmySxFnc58A538uthhtBKmXl8tlSkw==
X-Received: by 2002:a05:600c:4e54:b0:417:f58a:57e with SMTP id e20-20020a05600c4e5400b00417f58a057emr2526144wmq.0.1713450877324;
        Thu, 18 Apr 2024 07:34:37 -0700 (PDT)
Message-ID: <acf7cab4-c1b6-42e3-a541-06ac4b09a104@suse.com>
Date: Thu, 18 Apr 2024 16:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] tools/lsevtchn: Use evtchn port upper bound for
 evtchn enumeration
Content-Language: en-US
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1712840924.git.matthew.barnes@cloud.com>
 <bc201c67ef728ebaf678eac4d97e6800a95e8081.1712840924.git.matthew.barnes@cloud.com>
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
In-Reply-To: <bc201c67ef728ebaf678eac4d97e6800a95e8081.1712840924.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2024 17:24, Matthew Barnes wrote:
> --- a/tools/xcutils/lsevtchn.c
> +++ b/tools/xcutils/lsevtchn.c
> @@ -11,6 +11,7 @@ int main(int argc, char **argv)
>      xc_interface *xch;
>      int domid, port, rc;
>      xc_evtchn_status_t status;
> +    xc_domaininfo_t info;
>  
>      domid = (argc > 1) ? strtol(argv[1], NULL, 10) : 0;
>  
> @@ -18,13 +19,16 @@ int main(int argc, char **argv)
>      if ( !xch )
>          errx(1, "failed to open control interface");
>  
> -    for ( port = 0; ; port++ )
> +    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
> +        errx(1, "failed to fetch domain info");

This being backed by a domctl will make things fail when run on a DomU,
which aiui is supposed to be a valid environment to run lsevtchn in
(to obtain information just for the local domain). Imo instead of trying
to figure out the highest valid port number (which at least in principle
may even be dynamic, and hence the value returned by be stale by the
time it is being used), the loop below needs to continue until receiving
a specific indicator (special error code most likely).

Jan

> +    for ( port = 0; port <= info.highest_evtchn_port; port++ )
>      {
>          status.dom = domid;
>          status.port = port;
>          rc = xc_evtchn_status(xch, &status);
>          if ( rc < 0 )
> -            break;
> +            continue;
>  
>          if ( status.status == EVTCHNSTAT_closed )
>              continue;



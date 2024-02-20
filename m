Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5A685B98E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 11:51:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683401.1062900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNix-00081I-98; Tue, 20 Feb 2024 10:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683401.1062900; Tue, 20 Feb 2024 10:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcNix-0007zH-64; Tue, 20 Feb 2024 10:51:43 +0000
Received: by outflank-mailman (input) for mailman id 683401;
 Tue, 20 Feb 2024 10:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcNiv-0007yc-Ip
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 10:51:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06c0d0c9-cfde-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 11:51:40 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4125cf71eecso20302215e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 02:51:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f2-20020adfe902000000b0033cf24700e5sm12988432wrm.39.2024.02.20.02.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 02:51:39 -0800 (PST)
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
X-Inumbo-ID: 06c0d0c9-cfde-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708426299; x=1709031099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7UqccP2mQ1b+ZJFBfNd4qO5pYXo5mGjE9XWtCnkcxxs=;
        b=OxE757AX+xPX6ADrwW9NvIaaUkMeZgh9g6VtQqkXyIJK2r7ENafG59H9v6iG5aBX5X
         dkbuZvICDBHg0WeIOrc8+QRJnvedpnsEbyJucIbyALBGg0cnhyitsQoiw3oNT5LSqvNG
         VuDDUQKsiKID7Ja02cwSN/mptlMXfcGYJNfHAxU/fNO1vLP3/4gqbtmg31IWu8+nDwAI
         dSkpzPNfnJDkoyjZ+5ZXtV3h+gpBr4f8p1pVWL9RdLOt66lnW27UIT0Nfi4pz841rLfc
         PuUWmJ4jDolOjCsfI8PIljcqy7LQmxbbNkgOWKchJf0M31RH2iY29z3I7a9eDg0vgPVH
         jmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708426299; x=1709031099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7UqccP2mQ1b+ZJFBfNd4qO5pYXo5mGjE9XWtCnkcxxs=;
        b=dg/7Y1jZPvZnDU+8kLJpCW8rLoyY/nWCEoh2bX2rY6ql/7hHN/UCb7/9xBg88HDvzy
         NbG8WYUP9UOkittfzvwR/L1vh86HoAUBUgV8QxYsJgqPM8uUkHXxW1Jwvdrc5rYl7Et3
         TP/4lKpw6XvRry5ycPCdrD4FeIW9MxLlCOpMrL7cCWleeqZDZJE6Ah99NEYDyl0oASH4
         BOSfSTsTXPFlljsqtm4vLHZMNLj3pA/clVbB3315oxuLyEsbg0P1O4LoyPGL/TE7ifHg
         Ua3ABUZ3frwpgskYK+kNfJS854Kw43RWzF3+RRHgxgqR4hjQ1EYY9u04Sk6+jlrlq3pg
         XefQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHstE2hTmb8UJGs1BOllBtFJihCfFZ1u9gUKYkC6ijb/Cdq/QToyO2PkLHHW555TQwK+om7CvLEjvhGiCyYK1mF1dEbzQ46jTHZQHRgdA=
X-Gm-Message-State: AOJu0YxHaoqYQNlFkj1ZlYc+u+hA3Ee43CSmutD+RWR5iZKhyxM6Qiu2
	TRP+FOvwFnqBRcXMxhXmuG8Gy64RoHyEJfq6K2yHgrmrLUakyAHbjMjoENaJyA==
X-Google-Smtp-Source: AGHT+IGJz2eK1iykqgvFOIHk+kqHGI4VZX5H1+joMZevFUUJHDk1Y+RP36Q6qtE2FJFpRxyHWRkGJA==
X-Received: by 2002:adf:f052:0:b0:33d:4cf7:5e65 with SMTP id t18-20020adff052000000b0033d4cf75e65mr3613771wro.16.1708426299441;
        Tue, 20 Feb 2024 02:51:39 -0800 (PST)
Message-ID: <d6f3993e-5e96-4e3d-9334-9b44152f9f81@suse.com>
Date: Tue, 20 Feb 2024 11:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 12/27] x86/mapcache: Initialise the mapcache
 for the idle domain
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Wei Wang <wawei@amazon.de>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-13-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-13-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -750,9 +750,16 @@ int arch_domain_create(struct domain *d,
>  
>      spin_lock_init(&d->arch.e820_lock);
>  
> +    if ( (rc = mapcache_domain_init(d)) != 0)
> +    {
> +        free_perdomain_mappings(d);
> +        return rc;
> +    }
> +
>      /* Minimal initialisation for the idle domain. */
>      if ( unlikely(is_idle_domain(d)) )
>      {
> +        struct page_info *pg = d->arch.perdomain_l3_pg;
>          static const struct arch_csw idle_csw = {
>              .from = paravirt_ctxt_switch_from,
>              .to   = paravirt_ctxt_switch_to,
> @@ -763,6 +770,9 @@ int arch_domain_create(struct domain *d,
>  
>          d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
>  
> +        idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
> +            l4e_from_page(pg, __PAGE_HYPERVISOR_RW);
> +
>          return 0;
>      }

Why not add another call to mapcache_domain_init() right here, allowing
a more specific panic() to be invoked in case of failure (compared to
the BUG_ON() upon failure of creation of the idle domain as a whole)?
Then the other mapcache_domain_init() call doesn't need moving a 2nd
time in close succession.

Jan


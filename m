Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J71AJqP+GkVwgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:22:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E74BCD8E
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299725.1574272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsJ5-000572-Uz; Mon, 04 May 2026 12:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299725.1574272; Mon, 04 May 2026 12:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsJ5-00054Y-S2; Mon, 04 May 2026 12:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1299725;
 Mon, 04 May 2026 12:21:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wJsJ4-00054S-7H
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:21:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsJ3-00AA5l-JJ
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:21:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f88f5b-bab6-0a2a0a5309dd-0a2a4504d154-14
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:21:49 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f88f5d-1dec-0a2a45040019-d1558034c0ad-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:21:49 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso35344395e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 05:21:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb69698sm484713845e9.1.2026.05.04.05.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 05:21:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777897309; x=1778502109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PxU+OSxiodLlJNzcCPRbI/gsNDodvvuMMev8AecihVI=;
        b=cOLp35oxFsQK8PRpbA8wYil6ZcHWUNqmVjNcvNRwyZ5bUDhZvRavJStRhI7HGGL8bR
         iKmEMeDSVSjheG9feFfmU9IEnaM6EDQOFwTWugHcJMQz3V07tOjVTFIJEOVlFJGhQ5BJ
         vuxSQI1Y/x6ASCf/awfTWW87hcFbJ3lyE4dPtz+hrsoZ/+4zOJpZw+pDSHQ+71DFT3t2
         wm2zO/X9EQ2so9KPdkUKTJKL3O6L0dk6mfNN3ax94clQmGNvWrXQrw0T3JFncKOn0Y+P
         cQfALiNJ0dkQVQYgvRd30LB7CUPi9sRfLa4Hv2ntB5B8JUr1r4PzZyoDGbMBxuVKJmJJ
         jCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777897309; x=1778502109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxU+OSxiodLlJNzcCPRbI/gsNDodvvuMMev8AecihVI=;
        b=raBCaKNb0HzfiUMaMlzspMjAd1Td5zuGsk4vq/Cmki78CIh+RaOJB/jzpqJAxnL8m6
         4t5fh6NbshJEwZmYqwOvLEKYtZfs5l80g6bMxyG0G9W9KpxHiu1KEWddltb/TSdylHPe
         oe7Ol08iC5xiYrLAjvOaBYUKOvoaHwUS3YnNGfz2TiTPack1+EFIN8VRDYPZ3+5yb30a
         CpirZ8Qmk/bejbtSWfZqTh/bOezLhWWBMHMH5icoc2JZ4Ro3gQFRP0HRwaIrnRXCFkIb
         t755/z0ZmnMeomY0nSmPwWXLHzEWcHlMoqc1KphT0UUBNiIbcYtmWwCb9J3iahMzLjxt
         GIFA==
X-Forwarded-Encrypted: i=1; AFNElJ/Th+YjK2tP9rGHqfwUjsE+5lxDFNdoaFsbG1dvVp3tdlaZZ7PzL7S+pEjsSGCTdkuvibyxVp5FeCw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqOfsnp8jIxDX27DxWM2YlUDcCSCpvVxZReX/52D5ZWikjPS4c
	37Z0sN/6IpM/FuvNlDj/7hLP5V+DY0fjmp7QxBQE6JsW3qzWovuQQ1X2QiLDn+guaQ==
X-Gm-Gg: AeBDievrBwH5YsrfPIzUjAupe/auh+zTPBEJfajsHrlNi7YDBO/o5QmHQiuJCKe8SFP
	aB4agT1hGWT2Z2cnFyPYH9Kx7t520iLHLytIozJs8+tyMskryK9EkOV5Fr09TLeoPIchbp64K5w
	UtFXaVurg4Uys9WrLY3uC9rSFUXaUxA46ZJ9cV9Q7qtnBUS06a4loxR0VviJgTXl6m/5ur3AKjb
	F0QuIGBREJB35B4b/LYjHiEhD1oFk2/2cKVh2vvSEGCUu/65yArESdYrge5e9WxrVHPQDXY1g6B
	ek8tPSuxqJeMlEehWoRgoHTVHo+Hdcu17Ktz/oufbKPuyaYslPNwx+5A8G/YVJk6G5oPmEVbGQI
	oE0gSt5z6HPvWerqqKE+nfnErzLDvQ/rzBxfIMRxvulVXtfPkZXFZ5xGmA9rnExgVwS5lT2I77U
	7/qUxDE4/V1VUyxFX/ehFBOjGMIAi3mAFvuOuxEAsTqrTr3stk9nCgHXYwYd0YlezxpaGKajkfT
	wSAE6wiGNpaeMJ6YPhJVqdRmA==
X-Received: by 2002:a05:600c:4f91:b0:489:1ba8:5be9 with SMTP id 5b1f17b1804b1-48a98676b26mr146849365e9.29.1777897308629;
        Mon, 04 May 2026 05:21:48 -0700 (PDT)
Message-ID: <5daeb8f7-cf0f-4ea7-a686-93df36b43a30@suse.com>
Date: Mon, 4 May 2026 14:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1777296786.git.oleksii.kurochko@gmail.com>
 <7c91e1a705e1046be4af1c5671a8d91cf3557013.1777296786.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7c91e1a705e1046be4af1c5671a8d91cf3557013.1777296786.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1777897309-291763FF-8F5BC056/10/73395122804
X-purgate-type: spam
X-purgate-size: 2577
X-Rspamd-Queue-Id: 513E74BCD8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 27.04.2026 17:34, Oleksii Kurochko wrote:
> As domain type is part of common code now there is no any reason
> to have architecture-specific set_domain_type() functions so
> it is dropped.
> 
> Change the guard around access of kinfo->type to CONFIG_HAS_DOMAIN_TYPE
> for consistency. Also, drop and add some parentheses to be aligned
> with the similar if() below.
> 
> x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
> x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. Since x86_32 Xen no
> longer builds, the fallback is currently only relevant for arm32.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

In principle:
Acked-by: Jan Beulich <jbeulich@suse.com>

However, still a few remarks:

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -13,6 +13,19 @@ struct guest_area {
>      void *map;
>  };
>  
> +#ifdef CONFIG_HAS_DOMAIN_TYPE
> +enum __packed domain_type {
> +    DOMAIN_32BIT,
> +    DOMAIN_64BIT,
> +};
> +#define is_32bit_domain(d) ((d)->type == DOMAIN_32BIT)
> +#define is_64bit_domain(d) ((d)->type == DOMAIN_64BIT)
> +#elif !defined(CONFIG_64BIT)
> +/* At the moment on 32-bit-only platforms all domains are 32-bit. */
> +#define is_32bit_domain(d) (true)
> +#define is_64bit_domain(d) (false)

I think it would be nice if the excess parentheses were dropped from here.

> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -7,6 +7,7 @@
>  #include <xen/device_tree.h>
>  #include <xen/fdt-kernel.h>
>  #include <xen/mm.h>
> +#include <xen/sched.h>
>  #include <xen/types.h>
>  
>  struct domain;
> @@ -69,6 +70,14 @@ static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
>      return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
>  }
>  
> +static inline void set_domain_type(struct domain *d, struct kernel_info *kinfo)

Pointer-to-const for the 2nd parameter?

> +{
> +#ifdef CONFIG_HAS_DOMAIN_TYPE
> +    /* Type must be set before allocate memory */

This comment would be more prominent if it lived outside of the #ifdef,
perhaps (read on) ahead of the function. I wonder though why it's only
a comment, and not e.g. an assertion. If an assertion was possible to
add, the comment would want to live next to it. Without an assertion
putting it ahead of the function may be better.

Depending on how far to go, changes could be made while committing, or a
proper v5 may want submitting.

Jan


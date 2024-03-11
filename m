Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80F5878601
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 18:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691552.1077623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjj7x-0002S2-92; Mon, 11 Mar 2024 17:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691552.1077623; Mon, 11 Mar 2024 17:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjj7x-0002Pz-6K; Mon, 11 Mar 2024 17:07:53 +0000
Received: by outflank-mailman (input) for mailman id 691552;
 Mon, 11 Mar 2024 17:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjj7w-0002Pq-2E
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 17:07:52 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3be83b4-dfc9-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 18:07:49 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso603539066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 10:07:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bn23-20020a170906c0d700b00a462e4d7216sm820484ejb.76.2024.03.11.10.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 10:07:49 -0700 (PDT)
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
X-Inumbo-ID: e3be83b4-dfc9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710176869; x=1710781669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Z3XRah5GvuTNyDs90MKA8ijOhgInolYoRz7oKLKBqE=;
        b=cnuYRIDs/J5N0Q/0m1OhevI9ewEXGriW6ZKkOF+Ntwr3fwl42xXS0sPc+ConAHr9Jj
         QkLe+C5gjga9OXCmf1MFEcaz+e03GkKLRXZwbdrRThIhAq8sxMPBM831gVMVAnSmwDNN
         eorChIcUwQt3Cu+reCKynjMm/jLDwrilBF/TM4mcFyrmy1opJ/p37dTZTxJFST2nb/Dm
         nXgHH67nDWGIfBNW8D1OkJzGZ/vHV/gxN27planjpEUTA+7e4xKUwt8Rf4LViObCtREy
         5dbsfpwtD5bCzB6BP02qqQkGbbfhfrSMuw76y7TjRLCtukyNUb9QtSg1kwVhRJL/+LtW
         +B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710176869; x=1710781669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z3XRah5GvuTNyDs90MKA8ijOhgInolYoRz7oKLKBqE=;
        b=OOZLnU5JNEM6KCZZPfCD1R7QQrVQpOgxSzQpntEKhRIiluZTKdu1G/IhZnLlrh167K
         msIjp03HMAtUxoUZi0VC0EbnfuVOCm8/ot1Br0ZuMLcttwaAB11wSAwkRgdio7g2htdi
         fO6GU9H4pTtokpHPkv3GpQ9iFoCaJI8EPwUmYtd1bsoXqPGA8YvFpIblxOahCz7RYZZE
         6P0x2Jde2SQAeEUSbZK33YhtyNQV6SmdeIL5piuGhdGvKN+CF8Pl+uHJxpxLL60/WgBC
         ODqYzX4RgUo95ysTzoIQEBWc9Ld7It0ACXxS4wJHbhs4wFSn0waZ2yhSVU/2L9plZp0d
         BC5w==
X-Forwarded-Encrypted: i=1; AJvYcCWupmbUZ8dcYBeSjjknaOfMG++OziEocCyRgjGo8L6KTQWjG40o+g+34g35gOoBPTaaTATVZiZAsSbIR/tXDmGmB0VZIndw4UTAS2ePi3E=
X-Gm-Message-State: AOJu0Yz1pMUCYV5WmPWHBOV7EzinH2SmLalTboj7NDwxFwPLJc7WWoCE
	tK5fXl46G/zVUOKGYQUdHk7O3ZSbQl6BO2wcE1TO7KMIA+99uMqzoBEoyjpSng==
X-Google-Smtp-Source: AGHT+IHF7CR9TPeZenlhRyg9jAdD1UVkXbjx0RMMgXIqaeTJT8V47cHhjX+Oajq8Viub2w2bFb+DBA==
X-Received: by 2002:a17:907:c78f:b0:a44:e34a:792f with SMTP id tz15-20020a170907c78f00b00a44e34a792fmr5677425ejc.15.1710176869382;
        Mon, 11 Mar 2024 10:07:49 -0700 (PDT)
Message-ID: <1cb8bca3-58b6-4a8d-ac46-8338ea5807e7@suse.com>
Date: Mon, 11 Mar 2024 18:07:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
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
In-Reply-To: <20240308015435.4044339-6-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm afraid the title doesn't really say what the patch actually means
to achieve.

On 08.03.2024 02:54, Henry Wang wrote:
> Previous commits enable the toolstack to get the domain memory map,
> therefore instead of hardcoding the guest magic pages region, use
> the XEN_DOMCTL_get_mem_map domctl to get the start address of the
> guest magic pages region. Add the (XEN)MEMF_force_heap_alloc memory
> flags to force populate_physmap() to allocate page from domheap
> instead of using 1:1 or static allocated pages to map the magic pages.

A patch description wants to be (largely) self-contained. "Previous
commits" shouldn't be mentioned; recall that the sequence in which
patches go in is unknown to you up front. (In fact the terms "commit"
or "patch" should be avoided altogether when describing what a patch
does. The only valid use I can think of is when referring to commits
already in the tree, and then typically by quoting their hash and
title.)

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -41,6 +41,11 @@
>  #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>  /* Flag to indicate the node specified is virtual node */
>  #define XENMEMF_vnode  (1<<18)
> +/*
> + * Flag to force populate physmap to use pages from domheap instead of 1:1
> + * or static allocation.
> + */
> +#define XENMEMF_force_heap_alloc  (1<<19)
>  #endif

If this is for populate_physmap only, then other sub-ops need to reject
its use.

I have to admit I'm a little wary of allocating another flag here and ...

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -205,6 +205,8 @@ struct npfec {
>  #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
>  #define _MEMF_no_scrub    8
>  #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
> +#define _MEMF_force_heap_alloc 9
> +#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
>  #define _MEMF_node        16
>  #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
>  #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)

... here - we don't have that many left. Since other sub-ops aren't
intended to support this flag, did you consider adding another (perhaps
even arch-specific) sub-op instead?

Jan


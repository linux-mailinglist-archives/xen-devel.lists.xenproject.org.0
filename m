Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514ECB11837
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057140.1425044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBfT-00064W-UU; Fri, 25 Jul 2025 06:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057140.1425044; Fri, 25 Jul 2025 06:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufBfT-00062U-R2; Fri, 25 Jul 2025 06:12:31 +0000
Received: by outflank-mailman (input) for mailman id 1057140;
 Fri, 25 Jul 2025 06:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ufBfS-00062O-P0
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:12:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57e3bab6-691e-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 08:12:29 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so12087675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 23:12:29 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ab:e91f:46e4:60d0:c444?
 (p200300cab711f2abe91f46e460d0c444.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ab:e91f:46e4:60d0:c444])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054c819sm40838915e9.13.2025.07.24.23.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 23:12:28 -0700 (PDT)
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
X-Inumbo-ID: 57e3bab6-691e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753423949; x=1754028749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YdUvyZbWoHk53KagpjyeWDvuZ4f1ut44ttOivQqNMp8=;
        b=A5KZvTIfqsbiU4xWW20IDeKDfduLjMbFMOF97JNVxIyEAeSKaEDnJsz9EbzfXFx8xl
         ssU8gfwKS3nIyqMM9mu8L8ON2l49i6+ipX0DFcdHvprr7o0AR7gnWVLopZt6Rm/0W8wO
         KdT1YAIx/M15CbDlVPO27bm1I+TSvCxwyBhFmL8MMxN7anfrI6HKx/ebHcsRW4KqiQV+
         HYABfAdcaiZG8nTr3cUu/VOpeRiDOv/F3OXJIwpwi3HZqzltQhhKktWfqJUW7Ffg2eR/
         yVa6PZ9WhOe4plH1iy3mPHK8pvZmm6pzO87R2ex7cV97tR6g3J1bfs4By9U/02t5UnJY
         VFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753423949; x=1754028749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdUvyZbWoHk53KagpjyeWDvuZ4f1ut44ttOivQqNMp8=;
        b=FRQ0iPFONKpuFDxDxV4YuoXs9VnBGbalHiZzxeWlz+h9KgBy52znAXEOsD+8bs1dk0
         BtGWK85kN4blIlJ6gFRvtHcWci8OnpKokaY1stSWmWA7kwezpIf3ujLbMr7mwNRkf36f
         CT3VvOQ+RG6JXCI7w/ZXCzylVj3NOxC26pY2BU+KypMasOtlifG5MKWJLwClUOz5urj5
         CL2xZ5wYUJTU7fwTAsnYQzBDWnHFBPPPhVWOzk8nWoZcEyKVzsH2n7jZDq0dBRvIpFFS
         uX7mYJhw7jfk/iqh50x7rtORlmshgySxVq6fJNwR8XkGDbelPYcmIdiZ7gzHocQnRs0s
         MF6g==
X-Forwarded-Encrypted: i=1; AJvYcCUKvKlgluJ+xUI/btockmtMlEbXJtBKQWkQOaMsoh8lOmDToTDMDtjnU4i2dYBRs85Ia/AJDxupwNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyl+XhzXYqw9mwIix7SSGc1LoiFWkbvZ+ey+MGvIKGnjy77OY/2
	hf7s1KbW93RA9RgTiswVMmIEctAE1K4iiYud4+puxSYiVf7oM7nQOZlbajuk8SMWGw==
X-Gm-Gg: ASbGncumAJ2ZIhPNZMKLthFpdYkNEOlbLCC85/zS9kYd+z3xPj/lXvWLgHICqUTO05L
	fl3eajprM3BBUyA7sfubhFsbY2gX1UzuJ14XpO57AnBxCjP2wrintPD+hDXWC/gGW/3Yw1nKmyQ
	32xoVCMCE5XxkviZ6kCqKffaiD9WN2jouivFcpr4sOiCQBq8zEmco2jt/unnodcoHgMIRAJ2CzS
	AMo50iBMPGktQTxmLz4+72CfEpWJf8mW6mIEivzipd+JlUnSMACWncePB/72ncAhKdI/f1qFJbN
	+o7c7KKUsPldSfsT26L+0hUDvwQirmup0FSr8+6IhLytFf8PIP1Z/JzuL729dK6kapb8y6QGuRv
	8amKMDf7CJ6GV62LM72WvjAZ/hLOwvXG3yAJKteV1qLRLv2CdHDllXSb2NFEmpCnIYZwrSPfdwY
	srKaiC0biVtq0fK/6fPg236j1QzOuHT1nM43j+Dynp7vuWcSRIrikK77qr
X-Google-Smtp-Source: AGHT+IF/qEFjGwWdzY0KSe9OwklLVMabPwskznLl1oy5IjkM82NajikxZol9sX5emgg/1mpwbeJzYw==
X-Received: by 2002:a05:600c:3514:b0:456:27a4:50ad with SMTP id 5b1f17b1804b1-4587667a7b4mr3086095e9.33.1753423948751;
        Thu, 24 Jul 2025 23:12:28 -0700 (PDT)
Message-ID: <692bd177-7748-42af-8ce9-438a2264d41e@suse.com>
Date: Fri, 25 Jul 2025 08:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/cache-col: Fix freeing of colouring information
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250724162306.2978741-1-andrew.cooper3@citrix.com>
 <20250724162306.2978741-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250724162306.2978741-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 18:23, Andrew Cooper wrote:
> domain_destroy() is the wrong position to be freeing colouring information.
> 
> The comment in context identifies how domain_destroy() can be called multiple
> times on the same domain, leading to a double free of d->llc_colors as it's
> the wrong side of the atomic_cmpxchg() to be made safe.
> 
> Furthermore, by freeing d->llc_colors but leaving d->num_llc_colors nonzero,
> alloc_color_heap_page() can in principle use after free.
> 
> Make domain_llc_coloring_free() idempotent, zeroing d->num_llc_colors and
> NULL-ing d->llc_colors after freeing, and call it from domain_teardown().

And this pulling earlier is safe because e.g. free_color_heap_page() ->
page_to_llc_color() -> mfn_to_color() don't use the domain's colors array.
That's not a given (and could be different if e.g. per-domain stats were
maintained), so may want mentioning.

> Fixes: 6985aa5e0c3c ("xen: extend domctl interface for cache coloring")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



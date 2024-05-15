Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05A28C69AB
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722500.1126520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GYE-0004li-Oj; Wed, 15 May 2024 15:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722500.1126520; Wed, 15 May 2024 15:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GYE-0004ip-M1; Wed, 15 May 2024 15:28:18 +0000
Received: by outflank-mailman (input) for mailman id 722500;
 Wed, 15 May 2024 15:28:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7GYC-0004fG-Gv
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:28:16 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfd47dbb-12cf-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 17:28:15 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so7758449e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:28:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574f5a5b029sm1393481a12.7.2024.05.15.08.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 08:28:15 -0700 (PDT)
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
X-Inumbo-ID: bfd47dbb-12cf-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715786895; x=1716391695; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrPsDs9ut17QqTfzK4d9EG7k8uvHNySSnR9FioeK9Dc=;
        b=OCPJy9BfH9OrW8WIlKVNuIw96uMTnxCj2ErBxFoQqkXZ++w7NiCMgS0LTwiHQ+uQON
         1wAkiIvu4bTf68WcKJI7znSwbPquxz832uQ9m7/LCkWo7QXz//TYvLR83fGTE+JaLcLQ
         g8Y2cOwA4wSjbi8IjEv+wVPESiJBFktca7cZhjUoBUuRJIgZ7B7c4HOzS/fO5hQYhc8d
         gcApV8Z0EcNDEcAsN3gO7UhCJzqVE2uJXQLcRX3Oi936A1B5R8+a/Tbgpp6G0dysPvdO
         tbpdyP3g3YVYCgfdcNYDhtE+iBPQm8csmED+IAVUrW4QW4Qq8WYXkHDsNhufgUqdvnBE
         ON1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715786895; x=1716391695;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrPsDs9ut17QqTfzK4d9EG7k8uvHNySSnR9FioeK9Dc=;
        b=lIHArr+sWwpLqKgJzLctOQd6qQLQ19ZgJwJoEJDiOsNdfSg/fpTU1TJVO8GB2GZmuQ
         6wJzKToZ8iSAIo1KiA4KsPYTMAK74BOJYyxUIrQnG2W+A3kJ2PJaa3HW6fNrXMsEvP/L
         +Cqngnq3iCFLNlnIzxCBkX1ydSWRJjFWpsJeZ01UC90lEvEGMzrI749rAVsckwy356Lz
         RZg0VZvATFI6rOmKzkUS3kBN6YHNrLlANviKFpM1U9N3JADNnTuHbeA/6ME5973WvUsa
         EZA1D4N+ULTFrAaReDr6zyfVZwhdjBoV3IOe2lO3UY+etSmG9FT0XcASV0z5go72xoVH
         V2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVN9oF/SlcPhSKD7nZZ2GrlTkUJrvDhfN+g8CZTaWMCB+6PhtmK2pCes/pNqhOu2l0joBhlgG8qxTYnAB9KkmZZik+oGPm0XDIcyQnd7M=
X-Gm-Message-State: AOJu0YyRrpY/cneo9QoC1Hg+Gyj3EhJznMwSw48AywnaNKIOdT8ulNa5
	3wgsc4fy/sz3/SSRxv9GyON9Gh8swkMicijUM19SDReN0c/Nch4VHaAKRnxmfQ==
X-Google-Smtp-Source: AGHT+IFKiO+Cpn8yXFaH5r/w0HgP53s3M2i0tnrgGY3i9D3/MguqmeomJHxMRdb6x9WgA4PlQhGG1A==
X-Received: by 2002:a05:6512:4889:b0:519:5e81:276d with SMTP id 2adb3069b0e04-5220fb776fcmr9789497e87.31.1715786895341;
        Wed, 15 May 2024 08:28:15 -0700 (PDT)
Message-ID: <5edd6d8a-f014-4e80-b7d9-d4748d44e671@suse.com>
Date: Wed, 15 May 2024 17:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 12/19] x86/setup: vmap heap nodes when they
 are outside the direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-13-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-13-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When we do not have a direct map, archs_mfn_in_direct_map() will always
> return false, thus init_node_heap() will allocate xenheap pages from an
> existing node for the metadata of a new node. This means that the
> metadata of a new node is in a different node, slowing down heap
> allocation.
> 
> Since we now have early vmap, vmap the metadata locally in the new node.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
> 
>     Changes in v2:
>         * vmap_contig_pages() was renamed to vmap_contig()
>         * Fix indentation and coding style
> 
>     Changes from Hongyan's version:
>         * arch_mfn_in_direct_map() was renamed to
>           arch_mfns_in_direct_map()
>         * Use vmap_contig_pages() rather than __vmap(...).
>         * Add missing include (xen/vmap.h) so it compiles on Arm
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index dfb2c05322..3c0909f333 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c

Just one thing on top of what Roger has said: This being the only file
that is touched, why "x86/setup:" as the subject prefix. It'll misguide
people to assume x86 code is what is (mainly) being touched, unless they
actually look into and scroll through the patch.

Jan


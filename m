Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B15BE2E3E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 12:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144435.1477836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9LUg-0007RJ-5M; Thu, 16 Oct 2025 10:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144435.1477836; Thu, 16 Oct 2025 10:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9LUg-0007OE-2R; Thu, 16 Oct 2025 10:46:02 +0000
Received: by outflank-mailman (input) for mailman id 1144435;
 Thu, 16 Oct 2025 10:46:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9LUe-0007O8-KG
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 10:46:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d585639-aa7d-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 12:45:59 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46fc5e54cceso4082345e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 03:45:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711441f975sm19633515e9.4.2025.10.16.03.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 03:45:58 -0700 (PDT)
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
X-Inumbo-ID: 4d585639-aa7d-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760611559; x=1761216359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ezA4vhVD+QEaG3n8w3z+Qdh3yEMFfAZncF04cGzhJPM=;
        b=b6eDBHk6zAmENYukdTmHJwn9uGZcjsFrxDXZYMeqroNPdiE1cRnaj8hpj1/Fu3s7c7
         Yvgjb0Bcz5Elw4lVzIEWM1FrPDd47c/n+TkjTCnovZAnBXXB8XmB1cwE0mtJK1IP2IYr
         bI7sEujJmuTC/0D66Rb8zUKgVumSdCxAmK8K16I7sfEKgf7BOtrpaNWyldIgwL6WY/ar
         EIRbBDhJCF0mlrQ32d0MjPReEWrXEXEJS1mLXzzY+yeY2PQ0IsAwAd/frUHHShQQ7nyl
         GDqMnaxnMj3xl0chwZEfUBDOa4Nl8ynxhuHVfgd+lZoL7CvXGhF5EfIglY9CSGVSigvQ
         QU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760611559; x=1761216359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezA4vhVD+QEaG3n8w3z+Qdh3yEMFfAZncF04cGzhJPM=;
        b=REyUV2/0TEWWLp/BvrzB0ETPOHY1WHZY0fngEc+8EXZcKsW9dEWTBHsCWRZiUzAQjm
         ZB5TSOuvw80zB4sX7OU7n8skQBPOdGlrYMbQxwNP2NpTvMOotCABSGY3C7okLvalefNd
         jCGCLj3EitJxUbmSdbnP/Hj+7XQ2FyRdVqmf9POZkCKh8Y41XE+Dy/l7FCGfQ5zzJte9
         G+0QDl6JuOlEPmrYt943jU0fWTjg4csgZGVkDXbXZgJ6GuGWECIea1OOTjwBFaPMF9sq
         sdJPQhBHhGNqM3eaZZcJzpGbN8ATUzqmDj9GnuTQ6QaNLr+TRtLzsKlk4ee3mCguFrMK
         zt9A==
X-Forwarded-Encrypted: i=1; AJvYcCXHdLq34jO7TOS5EsANhnCmjLsAKT4DtS+F/8tXIY+qPykHmR/9PxZ/t3iM4iHXAdoVwN8ornJoQeQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNj1HQ9itAiyFVh0tAMQRCKhjiPweGLz4j4dneXWxCJZNaDAoE
	QoiBmL+uI/guZwzJwFtwI8c8rc7M8vhjcL9rER8fb3GXHUrkjy/vk2p0N85b7/Gl6w==
X-Gm-Gg: ASbGnctjwZkrlBPFUYag+Rc6o6FKgLyyus8Z9ndfHVhO1H8w+EBvY/0Xkq8oTyBaOch
	HfQLBZnFpjzO57NQOY2xXKsnjnlujxmsrZLCdvKdUc2yHrKm2hTGnrc8+uYl82tYaKVe34aifQQ
	w8ifvw+nzmnjAeUkchu/z4Jph0LSA8sZ2F4r60vG7wVZqX0byk/2zopj7Hn8+Spjt78euZqrOHF
	VqKWQMvFVefOszGoUhFt9k5wfQJeE8tcobB3PJkaakQ/EkRHIK+4iMGdXDz8/z3tsgdQH/hNNFe
	Gc+6I0npwbh6swlHF3bOhMAi6epWwl7twqtylyiCvWYo/zP+dxBqaweuC+HIgFdsD+cnG39H0gx
	peRCunqpDJk+sOzCGA1we8B0XbbYYdqm4q/FYlFi5knyrNaip0XqlANIy9vTcTMuee/7fuEzl28
	cAdSHMq0bsIO1Wxl+bx/bx5YZWJoHrfFd/EHk6WfY5nq9ZWdAPZtgBEg0Jcx6m
X-Google-Smtp-Source: AGHT+IE2WuH12rI+WM5SiSXR6TkNCXd8vvTHsk+sYi8R4zJx9fbAqQkFpvSrmYrWeK44dXG4JZtzyA==
X-Received: by 2002:a05:600c:4f08:b0:46e:3dcb:35b0 with SMTP id 5b1f17b1804b1-46fa9a94553mr242597655e9.2.1760611558927;
        Thu, 16 Oct 2025 03:45:58 -0700 (PDT)
Message-ID: <5c8777cb-86c4-4600-83e2-e48700b2daab@suse.com>
Date: Thu, 16 Oct 2025 12:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/8] libxl: Convert libxl__json_parse() to use
 json-c
To: Anthony PERARD <anthony@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250929120756.46075-1-anthony@xenproject.org>
 <20250929120756.46075-3-anthony@xenproject.org>
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
In-Reply-To: <20250929120756.46075-3-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.09.2025 14:07, Anthony PERARD wrote:
> --- a/tools/libs/light/libxl_json.c
> +++ b/tools/libs/light/libxl_json.c
> @@ -16,7 +16,25 @@
>  
>  #include <math.h>
>  
> +#ifdef HAVE_LIBJSONC
> +#include <json-c/json.h>
> +#define USE_LIBJSONC_PARSER
> +#endif
> +
> +#ifdef HAVE_LIBYAJL
> +#  ifndef USE_LIBJSONC_PARSER
> +#    define USE_LIBYAJL_PARSER
> +#  endif
> +#endif
> +
> +
> +#ifdef USE_LIBJSONC_PARSER
> +#include <json-c/json_visit.h>
> +#endif

The version of json-c one of my systems is using also doesn't have this header.

Plus (uses originating from other patches in this series)
json_object_object_add() returns void there. Plus of course any number of further
issues I'm going to see. The checking configure.ac is doing right now looks to be
insufficient overall.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0384BAD3697
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 14:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010733.1388902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyEN-0005U9-Cz; Tue, 10 Jun 2025 12:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010733.1388902; Tue, 10 Jun 2025 12:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyEN-0005Sc-8r; Tue, 10 Jun 2025 12:37:31 +0000
Received: by outflank-mailman (input) for mailman id 1010733;
 Tue, 10 Jun 2025 12:37:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOyEL-0005SW-N3
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 12:37:29 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa76f58f-45f7-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 14:37:27 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so4416782f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 05:37:27 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324641c2sm12339184f8f.93.2025.06.10.05.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 05:37:25 -0700 (PDT)
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
X-Inumbo-ID: aa76f58f-45f7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749559046; x=1750163846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mrCuqKhFUgUTqPRFOhuZ8VovxipnNe4BanDZ77aEmcw=;
        b=FmlDEg/IYHfimvi/psmf0aAw4v6BI2agiEG5X4izu14gzortDAA419fxYLONPri8Sw
         OPY48yzHxwjgKOwytVACXpOg8BeFVeuyP3KBaYEIxAoztcrRubE5zHeyBOMaErzk0laO
         Q7/UrBLDo0kLHQSZB0tw5G2qPixagRBtwdTEMbAQy0Qwp1m4JPKqjXAWMDbqTSfsE2Cj
         R5yboZG9dLo9KIlr2SqYgWc8cWEm3EP1F3mzDB2u0FCaYkl/kkO56GgENDSaYaUglojE
         tkZy/0cdQjScIDcwenZ6MKMQSInitubCBwaZTw4Ae9W34vOzThX9FzMt0GZT1ze0Bhta
         rurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559046; x=1750163846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrCuqKhFUgUTqPRFOhuZ8VovxipnNe4BanDZ77aEmcw=;
        b=hqZenDiwU+10HvqvqpAXWmH/xC/Wl0Y8vrUq8e7akmvg1WvOoqDIcPUzFBgaDxdpug
         44kNlkgBy1HLjh9rPQTFe9lAFBG4VlJeFRw973iwYtzle2Z9mMzgbLJToxh6h7FONkNy
         6X9q/iXeTAZYWOiMQVLoQpLreNsGcrpSS5ZIy4Uitj4HCTdxmmCUHAdj3WRQIQNTr4m3
         rYtqLIQyThI/4OSrzeWZg3gp0M+H6Nik+tnRNtVNQEq3Teftgvn6EKp0fL56cgQ0d1aG
         GfxQea9mV8bBaTVwtu1+VF8FLQyZxWjujwKRZt45nbMcTqZilnpLVEhPOi9jsTLxAg+u
         Bs1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW459kA/DbmBEvLr/g08BC6fer2fdrgPOaLyfnRWxxYnzDTvP0nHLQtbm1ldl4wJ0fhpQtB81LHt+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5eezrfGGq3cFkzZcRYyP6dTCVP6h2zsE0c3k30y9P3Vnei9gU
	4DQYoegRWivG8O3yBUBO8K9uda0NwJs5PUf1DungwoP+k1Fr0sDAM6mqAbjFfQiHBA==
X-Gm-Gg: ASbGncs7Sj6xXoSEIsTHzMauoZuM7Zl8SufYcxYtUe1X0uFmo4AtTlMuQaXVwZzsUuq
	YSA9K/W8wX6qa5Ji+4YNsvqFkT/ycg4Yrdiufu8EA+Ki8wFYEmUz9sEhrgBvpP739rvGreD8zyu
	ygFgGG7kfBwS5zQ6Nn5b3I+F4PIUOIQu7VzTQuP5cmij4egGMJbF/GFm3QgPh66Z9Ucm5yIbMua
	/2fzC2ad53OOyNNj9LerOVqHv8HCC9NjXT55w4aBM9WRIFUuqQk5AS0lH/wCrDSvZnTaQg6HSfN
	4Zh5CBJkW/CUQwEVvqVcrVEW2DlxxxxVVA/yr9lU+/tr3aareYC7xQ/4Fek8WSjmkpEVcNx4XOU
	zjOPaw4pSV0Smghf6iz2xce/9EH/3CYJ9/ZJ7BL0DwWOrgrTUPS/HkSNJfq3nV1fcEKmDhZbDYm
	XJ15ve+4VYKyPeUCvg6zh+
X-Google-Smtp-Source: AGHT+IHk1TIXnL7iSxQs9uuEX6kzC/QDR4bvlxG3KNz3Bd1K40HQZuNkV5CbZSMamNKGbG//OYwnwg==
X-Received: by 2002:adf:eb87:0:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3a5513f5298mr2293811f8f.14.1749559046345;
        Tue, 10 Jun 2025 05:37:26 -0700 (PDT)
Message-ID: <c81087de-25bd-4264-81f5-cccd0b0ae6de@suse.com>
Date: Tue, 10 Jun 2025 14:37:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] xen/page_alloc: Remove `claim` from
 domain_set_outstanding_pages()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-3-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250314172502.53498-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 18:24, Alejandro Vallejo wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -523,7 +523,7 @@ out:
>  int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
>  {
>      int ret = -ENOMEM;
> -    unsigned long claim, avail_pages;
> +    unsigned long avail_pages;
>  
>      /*
>       * take the domain's page_alloc_lock, else all d->tot_page adjustments
> @@ -549,28 +549,21 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
>          goto out;
>      }
>  
> -    /* disallow a claim not exceeding domain_tot_pages() or above max_pages */
> -    if ( (pages <= domain_tot_pages(d)) || (pages > d->max_pages) )
> +    /* Don't claim past max_pages */
> +    if ( (domain_tot_pages(d) + pages) > d->max_pages )

In addition to what Roger has said, how can such a behavioral change come without
any caller-side adjustment?

Jan


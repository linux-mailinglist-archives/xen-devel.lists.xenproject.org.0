Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51878B3563D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 09:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094037.1449382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoal-0005kL-SL; Tue, 26 Aug 2025 07:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094037.1449382; Tue, 26 Aug 2025 07:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoal-0005im-PX; Tue, 26 Aug 2025 07:59:43 +0000
Received: by outflank-mailman (input) for mailman id 1094037;
 Tue, 26 Aug 2025 07:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqoak-0005ig-Fg
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 07:59:42 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e8d74fe-8252-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 09:59:41 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6188b72b7caso7102516a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 00:59:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c314b5b26sm6405627a12.25.2025.08.26.00.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 00:59:40 -0700 (PDT)
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
X-Inumbo-ID: 9e8d74fe-8252-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756195180; x=1756799980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sPhvepvvfes2P+n+k+Sr5TxiYh1foypcPFHBfDbbOK0=;
        b=XvW041/glFntKa45TR1Ae0GhNf99EVfAnFn2wCCxXNvxua3SrOcFPOk+GhbBJrucKy
         m8McanlXX4dyvXkxoGIx3mV2NuXy4d5zEJwpd6inMLlYK+FVUlCR5Ah1iaRVudwe9cR/
         M3f3CV+MUbNeHu4bU7CokTAwrgEnDikyIrbFlQzAydPi95zVsEmVGcOAo7lrLaHtoPo0
         jXyi4tzq596w9dNx6r4PfGzHQv9s8MhEMf/y0cQP5qRDRU2wLYm8mPA4EeiC4rRQT9TZ
         Fh+b+/ef4zZLBqfkGG8K0JlkU+JiG0NkdTESsMP5oFXQrFWa8h99avsZuMfHcflFUNQx
         BdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756195180; x=1756799980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPhvepvvfes2P+n+k+Sr5TxiYh1foypcPFHBfDbbOK0=;
        b=LLSj1XLmP51xFy/X5e6Xnx09DJFbkVf5A2iqZ+KEAAKgY56Cwn2UCt0HHlPaKnNZKl
         ShUeL1Panw/fjzrE9bzqYOvZXIEJKEw326Gj7/Eq/89kAGgSPnGA6j/O2tXUViuDaoEa
         VujdW0dmiipzDfeBYyyJ/Je54PnkzDG+tsVQKQdmbiAe+HnEK14WVd+trwwHcJwQdvyZ
         sI67Jwgpc/f4vxhjzriwTcYQXMUfY4vSzzRUfF0by4tTsfxWZBPItjS+h6aoi2v8VLqW
         sz+paCGaMIe16oVpqdNQ88uH92Pnj6KseQLoISCvN4N0gcAlCG6tw2P/QDlDMJXD4e77
         9E8g==
X-Forwarded-Encrypted: i=1; AJvYcCXngz6I8+s6FwsZmmyCOfBRgyQJp6onP7gjphFVLJ/y+u8VrA2y/ojsCFJ2wYvH1G5WQz6BefX0sUQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPO3HLWndINiTIms1A72esJQ+mSbKtoVvAARWYKmJ5Rd11GIlP
	zQvxbkiVtpxM/ZhChWN1/Y3SfazA6yb/GSCz7xw3OGenll7Pd0Cy/+RKpw8GW8PGoQ==
X-Gm-Gg: ASbGncuAjjbcCJfPgVxmZ944fXmv+8DfYmecuKcOjYNwKJfNolsSPvX3sHsQn69EbT6
	f2/5WQkb/XctXiKGICc170trQ7klU9s0aMremED4sBEiZKA2r8qAWh7bUmMH2ekMi/j2hSHP+Gp
	2/V7cfXmkDuK/HkNcSJ/0QawqtxzSCB3YYMj8lU5f4D9lJfEAoFCyocT8hc/Fj/DRnZwofBwWTe
	jwj8nhYjyz/v3G6Gg1DUH6XD1/MyjMkUV7UfM1QXQ+ytPvf3CPtMsOsFXaxH3wmunVPgPwTv8nt
	XpWVGfpwl4i+4aktkpfVf+IFLAcxay3CvKWYDK7MJsRlS/kEc6Q4GXeAZKYXpVoTu7kfuVEFUZ6
	6IJg1LAtqjQMAEJg9ZgsPOW4JfWY8gzVMHT0rwENDo4thl8vNNQkpCvgENZCxw0CZAlsneFAkHz
	lkizbW5bQFtbCH5acQhg==
X-Google-Smtp-Source: AGHT+IESVikUcKoRJOc4GPF9ZnGsAg3kfe0FTCJNReQpHWHQNMTT2o7ZzTExy6x1Nx/G5a31wOkfWA==
X-Received: by 2002:a05:6402:208a:b0:61a:8103:7fe2 with SMTP id 4fb4d7f45d1cf-61c1b487cd7mr11747968a12.12.1756195180249;
        Tue, 26 Aug 2025 00:59:40 -0700 (PDT)
Message-ID: <abb80220-6029-4c51-8a43-78bc8bddf179@suse.com>
Date: Tue, 26 Aug 2025 09:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] xen/page_alloc: Simplify domain_adjust_tot_pages
 for future changes
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
 <5f417fea5ca8e4da0d4b9679103c3eff4bc92900.1755341947.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <5f417fea5ca8e4da0d4b9679103c3eff4bc92900.1755341947.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2025 13:19, Bernhard Kaindl wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -510,8 +510,14 @@ static unsigned long avail_heap_pages(
>      return free_pages;
>  }
>  
> +/*
> + * Update the total number of pages and outstanding claims of a domain.
> + * - When pages were freed, we do not increase outstanding claims.
> + */

If already you add such a comment, please have it be complete: There's
also an update to the global "outstanding_claims" in here.

>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>  {
> +    unsigned long adjustment;
> +
>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>      d->tot_pages += pages;
>  
> @@ -519,23 +525,22 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>       * can test d->outstanding_pages race-free because it can only change
>       * if d->page_alloc_lock and heap_lock are both held, see also
>       * domain_set_outstanding_pages below
> +     *
> +     * If the domain has no outstanding claims (or we freed pages instead),
> +     * we don't update outstanding claims and skip the claims adjustment.
>       */
>      if ( !d->outstanding_pages || pages <= 0 )
>          goto out;
>  
>      spin_lock(&heap_lock);
>      BUG_ON(outstanding_claims < d->outstanding_pages);
> -    if ( d->outstanding_pages < pages )
> -    {
> -        /* `pages` exceeds the domain's outstanding count. Zero it out. */
> -        outstanding_claims -= d->outstanding_pages;
> -        d->outstanding_pages = 0;
> -    }
> -    else
> -    {
> -        outstanding_claims -= pages;
> -        d->outstanding_pages -= pages;
> -    }
> +    /*
> +     * Reduce claims by outstanding claims or pages (whichever is smaller):
> +     * If allocated > outstanding, reduce the claims only by outstanding pages.
> +     */
> +    adjustment = min(d->outstanding_pages, (unsigned int)pages);

This would be all fine if there wasn't the cast. It's only a latent problem,
yes, but I think we still would better avoid introducing such. Imo this wants
to be

    adjustment = min_t(unsigned long, d->outstanding_pages, pages);

or the equivalent

    adjustment = min(d->outstanding_pages + 0UL, pages + 0UL);

(personally I'd prefer the latter despite its odd look, for not involving
any casts).

Jan


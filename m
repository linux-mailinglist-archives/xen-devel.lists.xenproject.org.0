Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E788BCE48
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 14:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717618.1120004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xjY-0007wl-IE; Mon, 06 May 2024 12:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717618.1120004; Mon, 06 May 2024 12:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xjY-0007tv-Et; Mon, 06 May 2024 12:46:20 +0000
Received: by outflank-mailman (input) for mailman id 717618;
 Mon, 06 May 2024 12:46:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3xjW-0007tp-Hh
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 12:46:18 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1697a2b-0ba6-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 14:46:17 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34da35cd01cso1760877f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 05:46:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5d588c000000b0034cfb79220asm10719760wrf.116.2024.05.06.05.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 05:46:16 -0700 (PDT)
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
X-Inumbo-ID: a1697a2b-0ba6-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714999577; x=1715604377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghM6KZl18bBETFhHKssHmHIUmInwONy1mb9Y8rJH74Q=;
        b=MkHsBn3mAJnQsLAL/Z6W91ols+ZPcIsGhFCgPnU7WMgQJAhHlvxLcFKTePEbYPgsjf
         O/K3SMPsuNKzIfqmiuUTfjBlb+FW1RiLD5OKvoKZLqxz6KyXV3gu3+BuC+dZRb+6bhG5
         7lWbaD4aQaIUVfxAt831nELOCoLJAybgAosM/P4Y7zXRwO/2QISDx8Fs5MIRznEpkA1Z
         ccjksq7vPitlWBoeyZCx9ak6IMesAL9+uT3lB5TNw3XRpLaFD8RqUiBQIJhtiPTUy22W
         z/LUqOvlvl7mUosRksoPJWmTbQ94DygywWPgsUcBmrnHfsytDiURV6Sn2UszFVouVhBB
         cIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714999577; x=1715604377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghM6KZl18bBETFhHKssHmHIUmInwONy1mb9Y8rJH74Q=;
        b=GAuNeeJgQzeXn5Bhk/bpE+mUPs7JOUCi9lb5Wkr/lPhbwKTvXojID8CoSaLXa/q5XM
         hxUqfwNnZvqIH7kOjZ63dBMplwzMB2pcbzftXXf4xHCY80IA73sSznbssQz9gj6lRUzE
         v7WZgyiZGMoprEGdpnBSKb7Vf3LFmwD3nkm7NKEUoz91jKkO2g5WTXrhY5vYCCWbRo0q
         v04f66s12d/VNBkOMxyMxZodsP4hvtWaDSifkKvmeWlVtay8f8+iyPGp6+HOugeNTMJQ
         Qjp04LhA12+Jv51iP7tg6G8CTTPBNjHQbgRRS4QWUfbOOVTDrekDF8Uy8ifLMmLA73gO
         fgFA==
X-Forwarded-Encrypted: i=1; AJvYcCUy/5yLuenzhjM8+Da91xeIdZuf7gnpHh41qSn+3/Cyp8BymXW0gvaBSud44TAADsyfqDZn4cbdHJ0Bp2b998oC+pOZ1FhuVsG2MwGCnbY=
X-Gm-Message-State: AOJu0YzQFc5H3TfmGb+WP5ODJoKKCIC/7KjZA8jDNuxtiRlxuJKrxzF5
	3TuwmRjq5AC4ExFrka/Ew9wPd+9hU3geSDvQWmWkaUPrjiS2w7IoV/UXCaZlXQ==
X-Google-Smtp-Source: AGHT+IFgqd6doj7PUBIKYw8MzPQahd+NuX1yuzvoYqBfoTOWBHTMg6LJYi9m88B6ZPQuGNCwvFvMMg==
X-Received: by 2002:adf:e8d0:0:b0:34d:a650:46f8 with SMTP id k16-20020adfe8d0000000b0034da65046f8mr9789135wrn.9.1714999576812;
        Mon, 06 May 2024 05:46:16 -0700 (PDT)
Message-ID: <5c16f53f-3bb0-49d6-b174-b0e8c6ceff4c@suse.com>
Date: Mon, 6 May 2024 14:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/13] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-10-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240502165533.319988-10-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 18:55, Carlo Nonato wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -270,6 +270,20 @@ and not running softirqs. Reduce this if softirqs are not being run frequently
>  enough. Setting this to a high value may cause boot failure, particularly if
>  the NMI watchdog is also enabled.
>  
> +### buddy-alloc-size (arm64)

I'd like to ask for consistency in the command line doc additions: Either
"(arm64)" here and then also in patch 1, or (less desirable) nowhere.

> @@ -1481,6 +1487,14 @@ static void free_heap_pages(
>              pg[i].count_info |= PGC_need_scrub;
>              poison_one_page(&pg[i]);
>          }
> +
> +        if ( pg->count_info & PGC_colored )
> +        {
> +            /* Colored pages can be 0-order only, so ignore it */
> +            free_color_heap_page(pg, need_scrub);
> +            spin_unlock(&heap_lock);
> +            return;
> +        }

Why "ignore it"? You pass the page to free_color_heap_page() after all.
(later) Oh, you may mean to ignore "order". Yet besides this not really
becoming clear from the wording, I think that this constraint could do
with asserting here.

> @@ -1945,6 +1959,156 @@ static unsigned long avail_heap_pages(
>      return free_pages;
>  }
>  
> +/*************************
> + * COLORED SIDE-ALLOCATOR
> + *
> + * Pages are grouped by LLC color in lists which are globally referred to as the
> + * color heap. Lists are populated in end_boot_allocator().
> + * After initialization there will be N lists where N is the number of
> + * available colors on the platform.
> + */
> +static struct page_list_head *__ro_after_init _color_heap;
> +#define color_heap(color) (&_color_heap[color])
> +
> +static unsigned long *__ro_after_init free_colored_pages;
> +
> +/* Memory required for buddy allocator to work with colored one */
> +#ifdef CONFIG_LLC_COLORING
> +static unsigned long __initdata buddy_alloc_size =
> +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);

I think it would be quite nice if this and ...

> +size_param("buddy-alloc-size", buddy_alloc_size);
> +
> +#define domain_num_llc_colors(d) (d)->num_llc_colors
> +#define domain_llc_color(d, i)   (d)->llc_colors[i]
> +#else
> +static unsigned long __initdata buddy_alloc_size;

... this were folded. Which I think would be possible if the Kconfig
addition went like this:

config BUDDY_ALLOCATOR_SIZE
	int "Buddy allocator reserved memory size (MiB)" if LLC_COLORING
	default "0" if !LLC_COLORING
	default "64"

> +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> +                                               const struct domain *d)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned int i, color = 0;
> +    unsigned long max = 0;
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    bool need_scrub;
> +
> +    if ( memflags & ~(MEMF_no_owner | MEMF_no_refcount | MEMF_no_scrub |
> +                      MEMF_no_tlbflush) )
> +        return NULL;
> +
> +    spin_lock(&heap_lock);
> +
> +    for ( i = 0; i < domain_num_llc_colors(d); i++ )
> +    {
> +        unsigned long free = free_colored_pages[domain_llc_color(d, i)];
> +
> +        if ( free > max )
> +        {
> +            color = domain_llc_color(d, i);
> +            pg = page_list_first(color_heap(color));
> +            max = free;
> +        }
> +    }
> +
> +    if ( !pg )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }
> +
> +    need_scrub = pg->count_info & (PGC_need_scrub);

Nit: No need for parentheses here.

Jan


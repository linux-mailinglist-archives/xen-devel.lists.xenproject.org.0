Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB779DB6AD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 12:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845372.1260798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcvN-0006IS-4E; Thu, 28 Nov 2024 11:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845372.1260798; Thu, 28 Nov 2024 11:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcvN-0006Gt-1E; Thu, 28 Nov 2024 11:43:09 +0000
Received: by outflank-mailman (input) for mailman id 845372;
 Thu, 28 Nov 2024 11:43:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGcvL-0006Gn-AI
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 11:43:07 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecdd17cb-ad7d-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 12:43:03 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4349fd77b33so6381175e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 03:43:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0f70ea8sm19914785e9.40.2024.11.28.03.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 03:43:02 -0800 (PST)
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
X-Inumbo-ID: ecdd17cb-ad7d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVjZGQxN2NiLWFkN2QtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzk0MTgzLjA1NTg0NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732794182; x=1733398982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A9TQ4H0U+9hFDYGWbaqKbsdyF2vOOrh/xU7po1U90SM=;
        b=OEN2aqtLe2c54gUYmu6VZi2rbbaK3kjALCwipM+CY5B27KP5zSF470yqegU0NNhcuf
         p/tv6Yrb8gP+vifqbRzdB0d7g14ZmFggua/9wkpoQradkiWUdzriH/d9MRh08e7nPGZB
         e3iRRb+EJkLvRakyNVmaoS9uyQZSTBfy8hQeBmxH2EA6iQb3N6HynfeMR5xVjWJEvdnB
         MJwRMFZHNlX5Oty4CDKpSrnrnu0ovWs8DMFXAXxTQrGsmWejemX4KEhY7dqe5iv5DmON
         wArTivaHqxAuOEofh4+iDV2NCEXlY3j14RQB8eatVE1iG7OSNtc2nI0XR55JIACI6pwc
         3dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732794182; x=1733398982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9TQ4H0U+9hFDYGWbaqKbsdyF2vOOrh/xU7po1U90SM=;
        b=MdgSep6NfafLCN1bSWzgTRKHryXUVEipwvM69+cGcglODOX503jOjyg1MYq4RDCXxg
         H/Xx7Bu7D0kZWMPITYyAKS9VFWRCk3xL0LMZkaCQW9ABPOI2iy27ptpBJWA+9vlcZfyw
         l3q6hoXtVKQr0L4KT8wSm6uJzkC2VB1qP6cwNaVSfmBFy/fe8AAUp3t58dRHvGlaS6WL
         WSYCCTftDNtGmV+Ay48LHxfD2WK3GzvKwyRenTrtE0KrmDU6Wdof/0lYGP83TZ0BLjjU
         xJZXrA+UQGsdk7q+2JudT6LMUYI0FrzjO37pWvylUFQ/du1APGRBG5NUXq8MwxNu0KxM
         u0lw==
X-Forwarded-Encrypted: i=1; AJvYcCWMxcxQIHLIj7DuMoXEGR44jQINBJuQW42o8nTVGvmzbtb/mJ8NOzaIDn+q1TU1jlYnZDbu7lDQsv8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVe1h4vHTPn+qA+aewtV57GRU9kZL5+TDeVsZcHvjX+SjssuVf
	Kij/MZyqZr5XYJeYT1A++Tfvfny42WgQiyMS6/urgDE6jAdzeITf5d73EGsG8A==
X-Gm-Gg: ASbGncsZH9wDjFe+AezLDXowD+pj4YhkFyjR72Nd7ZkhzfCxX6pnKmQs9dOoVSNxG2j
	BInj5dSiYbq6TAv9DInRxVhxM9fOj+YGSwJorvsUzzeMrwmHLHGBC1WF3jsA3wqi3sA4k0oO8i5
	cyRHXBJI52pY1SWLbUtN8U4qmwbVIFh7QvC+n27FHRkyW0BVeh5n+6QKUuJFVfJ1B0VLU26G6jn
	9sAjV/R/kyt064TX6JWLbH34btpmcN1wYMYXTOFtW6rzzc/CSCBLnQkVNx6PFIqCRq+OT/Co/5E
	259Cikf456JW45JPx2jeNizXrIasaojw93I=
X-Google-Smtp-Source: AGHT+IGxU1VCUqoFxkkkwdXm+ZeCx44CNeF+tdKxPn8OZY/wHyPPO4SVSbwD4Hi7Ct5QR0KKTW3l3A==
X-Received: by 2002:a05:600c:4fc9:b0:434:a71f:f804 with SMTP id 5b1f17b1804b1-434a9dbbd30mr71612385e9.3.1732794182413;
        Thu, 28 Nov 2024 03:43:02 -0800 (PST)
Message-ID: <5f876671-4624-4ec6-957e-d4a7802fb46a@suse.com>
Date: Thu, 28 Nov 2024 12:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/12] xen: add cache coloring allocator for domains
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-10-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20241119141329.44221-10-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 15:13, Carlo Nonato wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -270,6 +270,20 @@ and not running softirqs. Reduce this if softirqs are not being run frequently
>  enough. Setting this to a high value may cause boot failure, particularly if
>  the NMI watchdog is also enabled.
>  
> +### buddy-alloc-size (arm64)
> +> `= <size>`
> +
> +> Default: `64M`
> +
> +Amount of memory reserved for the buddy allocator when colored allocator is
> +active. This option is available only when `CONFIG_LLC_COLORING` is enabled.
> +The colored allocator is meant as an alternative to the buddy allocator,
> +because its allocation policy is by definition incompatible with the generic
> +one. Since the Xen heap systems is not colored yet, we need to support the
> +coexistence of the two allocators for now. This parameter, which is optional
> +and for expert only, it's used to set the amount of memory reserved to the
> +buddy allocator.

Every time I see this, and I further see the title of patch 12, I'm confused,
expecting that what's being said here needs adjusting (or even undoing) there.
The issue is that patch 12's title says just "Xen" when, if I'm not mistaken,
it really only means the Xen image.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -537,4 +537,12 @@ config LLC_COLORS_ORDER
>  	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
>  	  more than what's needed in the general case.
>  
> +config BUDDY_ALLOCATOR_SIZE
> +	int "Buddy allocator reserved memory size (MiB)" if LLC_COLORING
> +	default "0" if !LLC_COLORING
> +	default "64"
> +	help
> +	  Amount of memory reserved for the buddy allocator to serve Xen heap,
> +	  working alongside the colored one.

As the description has nothing in this regard: Why again is it that this
can't simply have "depends on LLC_COLORING"? Even if it ends up with a
value of 0, in an LLC_COLORING=n (or LLC_COLORING entirely absent) .config
I'd find it at least irritating to see this setting to be there.

> @@ -1945,6 +1960,155 @@ static unsigned long avail_heap_pages(
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
> +static unsigned long __initdata buddy_alloc_size =
> +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> +size_param("buddy-alloc-size", buddy_alloc_size);
> +
> +#ifdef CONFIG_LLC_COLORING

According to the (updated) command line doc, this #ifdef needs to move up
so the command line option indeed is unrecognized when !LLC_COLORING.
Question then is whether the variable is actually needed. With the variable
also moved into the #ifdef, the need for BUDDY_ALLOCATOR_SIZE also goes
away when !LLC_COLORING (see the comment on the common/Kconfig change). Of
course you'll then need "#ifndef buddy_alloc_size" in
init_color_heap_pages(), around the respective if() there.

> +#define domain_num_llc_colors(d) ((d)->num_llc_colors)
> +#define domain_llc_color(d, i)   ((d)->llc_colors[i])
> +#else
> +#define domain_num_llc_colors(d) 0
> +#define domain_llc_color(d, i)   0
> +#endif
> +
> +static void free_color_heap_page(struct page_info *pg, bool need_scrub)
> +{
> +    unsigned int color;
> +
> +    color = page_to_llc_color(pg);
> +    free_colored_pages[color]++;
> +    /*
> +     * Head insertion allows re-using cache-hot pages in configurations without
> +     * sharing of colors.
> +     */
> +    page_list_add(pg, color_heap(color));
> +}

Iirc it was me who had asked to keep this and further functions outside of
#ifdef-s, for the compiler's DCE to take care of. However, with all that
Misra work that has been going on since then, I now wonder what Misra
thinks of this: When PGC_colored is 0, functions like the above are
unreachable, and any code or data the compiler doesn't manage to eliminate
would be dead. Imo if the code is to remain as is, correctness Misra-wise
may want mentioning in the description (this isn't the only place we have
such, so an overall position towards this is going to be needed).

> +static void __init init_color_heap_pages(struct page_info *pg,
> +                                         unsigned long nr_pages)
> +{
> +    unsigned int i;
> +    bool need_scrub = opt_bootscrub == BOOTSCRUB_IDLE;
> +
> +    if ( buddy_alloc_size >= PAGE_SIZE )
> +    {
> +        unsigned long buddy_pages = min(PFN_DOWN(buddy_alloc_size), nr_pages);
> +
> +        init_heap_pages(pg, buddy_pages);
> +        nr_pages -= buddy_pages;
> +        buddy_alloc_size -= buddy_pages << PAGE_SHIFT;
> +        pg += buddy_pages;
> +    }
> +
> +    if ( !_color_heap )
> +    {
> +        unsigned int max_nr_colors = get_max_nr_llc_colors();
> +
> +        _color_heap = xmalloc_array(struct page_list_head, max_nr_colors);
> +        free_colored_pages = xzalloc_array(unsigned long, max_nr_colors);

At this point, xvmalloc() and friends want using by all new code, unless
explicitly justified otherwise.

> +        if ( !_color_heap || !free_colored_pages )
> +            panic("Can't allocate colored heap. Buddy reserved size is too low");
> +
> +        for ( i = 0; i < max_nr_colors; i++ )
> +            INIT_PAGE_LIST_HEAD(color_heap(i));

While for this loop i being unsigned int is okay, I fear that ...

> +    }
> +
> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        pg[i].count_info = PGC_colored;
> +        free_color_heap_page(&pg[i], need_scrub);
> +    }

... for this loop it isn't.

Jan


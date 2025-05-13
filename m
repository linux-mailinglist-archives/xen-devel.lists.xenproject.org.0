Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF8AB5776
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982995.1369368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqr1-0001s8-Bz; Tue, 13 May 2025 14:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982995.1369368; Tue, 13 May 2025 14:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqr1-0001pB-8b; Tue, 13 May 2025 14:43:35 +0000
Received: by outflank-mailman (input) for mailman id 982995;
 Tue, 13 May 2025 14:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEqr0-0001p5-9Q
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:43:34 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4295bad-3008-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 16:43:32 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad4ce8cc3c1so202038166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 07:43:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad223d5c4aasm713612666b.22.2025.05.13.07.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 07:43:31 -0700 (PDT)
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
X-Inumbo-ID: a4295bad-3008-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747147411; x=1747752211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u/VH8Ia1VezyztnVWiiugzrPcq8yF4jPa0bRsEDNr5Q=;
        b=VHUsTFIohHkk2LT/dqSYwRRPv54/PJUfW6Sll603z5aTBsm/iINkVU0sePgb4cULxB
         bI36111uqzW1MaI5dyBWFgRSf1IB6Q121nOTgjzFP4yNuZ9iuRNH/O+fJl2gQUqunjh0
         p7ls7OtIQpkzW5vQMMZy1FMOVHun4gLKT8nuVciOeQiUUyT/b52OSm+gU9goxjLvddcW
         Oieo+XuVLaPO5NGmhH6YFn86yrx5CWS/Wma1b2MbieHY/7wxmaHcZZh7a8qAbnV1fJIW
         um9w1gfNRAL8dZoMPe0QOPy70mrxk0Vtgd/tnZagnTT5fr1BUDr1sWmWs35NXEjM3jPa
         /CoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147412; x=1747752212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/VH8Ia1VezyztnVWiiugzrPcq8yF4jPa0bRsEDNr5Q=;
        b=jR/Z76mdoIDAvORo6V1PlzlT0FSQIxDnqj50LjynTGgcc2/MtAo1SPPcXfT9Yr6WZY
         jMnXuT62d5oRZXml3z5EKjdD7wrFUOuQq6BFrznN+ljKoM15It7aQWb5FGfPLwgPhQCM
         qPLah0xujaRFEiuK/j6AgRjI0iZZZe+EycZ4LPymmDT6Y4SYNHyISHPfaGpykE/Weg1c
         pq7/dt75bz+JnF2wrnUxqH2d19Xbn5DYzk6dn3DSmw0EPRyZTUZiwVFJH/ocK/m3RvDE
         L2l7tb9PcUugLGuF5dD9Lv9noYQracKw3CBvLzcorXbDWLzliPQObpRu8nEUaD84MuHV
         f4fA==
X-Forwarded-Encrypted: i=1; AJvYcCWkFGlBnPWtX/4PxHVDPSQkvvjT7qsEV8gZfr1waJZZODbHJ7gO9IY27nvRblr2su7Ap/nXnnSuc9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx06kj4sIFhgO0IDdx8Nvx3fZrbQrm/GRzKBMA59sJpTirZSGDe
	98kSqNjWrTnQbZg9RDG7K/s59YwfTEGUA5tStuocWGhqNmnJkuYGJvw/3NF7yA==
X-Gm-Gg: ASbGnctaHT12XBhQwaCGoF2lrvOFPuANmG7ROdQZsB5Gk8aTtaJqoMHPBZLUsZZ6X1x
	FOGWU87F4YSKg1exm6dcfB2mAnXhEyyKAOw6aD6jQXJkvUDwfxA/pPLxW6pYkPtVZa2AlvhZI5X
	Lcu+oVsltj0te3rMQ2v4QsYgsHe+2oNJiG/EPnfiKyCI1Lu0bpq3ipsrVF9WBK2DEcjzfhD18NR
	SR239LIN8OQ5aDAdOumqM+qnQGtURl7/p+aPYDXeBO5GEc7J0AL8i9NtJkk1MA9UvnCowt6WMWk
	x2XANCxaWH4Jl7UZf4YP89EaDUEg5+0KLpEDPRtS8lvgOtwFLS9SV2E4ogfzBNM2XKIADGh9Wvs
	WRKDTv+OH3Eb/Hd79lkuWvMjY8SHzIK1bIeJe
X-Google-Smtp-Source: AGHT+IGr+Kj+nEGhUSeMcsjAoF4nrf2lRksH3WO1ySBoibUts3UJ5ksJRRD2X24weuq1aLJfsR9G4w==
X-Received: by 2002:a17:906:620a:b0:ad2:2d74:a1b with SMTP id a640c23a62f3a-ad22d74107dmr1282709266b.45.1747147411578;
        Tue, 13 May 2025 07:43:31 -0700 (PDT)
Message-ID: <3128bda3-d655-43ae-81a7-df61928a27aa@suse.com>
Date: Tue, 13 May 2025 16:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] public/sysctl: Clarify usage of pm_{px,cx}_stat
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250512144656.314925-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 16:46, Ross Lagerwall wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -215,23 +215,51 @@ typedef struct pm_px_val pm_px_val_t;
>  DEFINE_XEN_GUEST_HANDLE(pm_px_val_t);
>  
>  struct pm_px_stat {
> -    uint8_t total;        /* total Px states */
> -    uint8_t usable;       /* usable Px states */
> -    uint8_t last;         /* last Px state */
> -    uint8_t cur;          /* current Px state */
> -    XEN_GUEST_HANDLE_64(uint64) trans_pt;   /* Px transition table */
> +    /*
> +     * IN: Number of elements in pt, number of rows/columns in trans_pt
> +     *     (PMSTAT_get_pxstat)
> +     * OUT: total Px states (PMSTAT_get_max_px, PMSTAT_get_pxstat)
> +     */
> +    uint8_t total;

The part for this field ought to go in patch 1, as already indicated there.

> +    uint8_t usable;       /* OUT: usable Px states (PMSTAT_get_pxstat) */
> +    uint8_t last;         /* OUT: last Px state (PMSTAT_get_pxstat) */
> +    uint8_t cur;          /* OUT: current Px state (PMSTAT_get_pxstat) */
> +    /*
> +     * OUT: Px transition table. This should have total * total elements.
> +     *      This will not be copied if it is smaller than the hypervisor's
> +     *      Px transition table. (PMSTAT_get_pxstat)
> +     */
> +    XEN_GUEST_HANDLE_64(uint64) trans_pt;
> +    /* OUT: This should have total elements (PMSTAT_get_pxstat) */
>      XEN_GUEST_HANDLE_64(pm_px_val_t) pt;

As also indicated there, the same constraint as for trans_pt applies to this
output buffer, just that it's having only one dimension.

>  };
>  
>  struct pm_cx_stat {
> -    uint32_t nr;    /* entry nr in triggers & residencies, including C0 */
> -    uint32_t last;  /* last Cx state */
> -    uint64_aligned_t idle_time;                 /* idle time from boot */
> -    XEN_GUEST_HANDLE_64(uint64) triggers;    /* Cx trigger counts */
> -    XEN_GUEST_HANDLE_64(uint64) residencies; /* Cx residencies */
> -    uint32_t nr_pc;                          /* entry nr in pc[] */
> -    uint32_t nr_cc;                          /* entry nr in cc[] */
>      /*
> +     * IN:  Number of elements in triggers, residencies (PMSTAT_get_cxstat)
> +     * OUT: entry nr in triggers & residencies, including C0
> +     *      (PMSTAT_get_cxstat, PMSTAT_get_max_cx)
> +     */
> +    uint32_t nr;
> +    uint32_t last;  /* OUT: last Cx state (PMSTAT_get_cxstat) */
> +    /* OUT: idle time from boot (PMSTAT_get_cxstat)*/
> +    uint64_aligned_t idle_time;
> +    /* OUT: Cx trigger counts, nr elements (PMSTAT_get_cxstat) */
> +    XEN_GUEST_HANDLE_64(uint64) triggers;
> +    /* OUT: Cx residencies, nr elements (PMSTAT_get_cxstat) */
> +    XEN_GUEST_HANDLE_64(uint64) residencies;
> +    /*
> +     * IN: entry nr in pc[] (PMSTAT_get_cxstat)
> +     * OUT: Index of highest non-zero entry set in pc[] (PMSTAT_get_cxstat)
> +     */
> +    uint32_t nr_pc;
> +    /*
> +     * IN: entry nr in cc[] (PMSTAT_get_cxstat)
> +     * OUT: Index of highest non-zero entry set in cc[] (PMSTAT_get_cxstat)
> +     */

For both of these, it's not "highest non-zero" but, according to ...

> +    uint32_t nr_cc;
> +    /*
> +     * OUT: (PMSTAT_get_cxstat)
>       * These two arrays may (and generally will) have unused slots; slots not
>       * having a corresponding hardware register will not be written by the
>       * hypervisor. It is therefore up to the caller to put a suitable sentinel

... this comment, "highest written by hypervisor". They're also not "index of",
but "one higher than the index of" (i.e. counts, not indexes).

Jan


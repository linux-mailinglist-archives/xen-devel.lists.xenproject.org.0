Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOPDOY/1imn2OwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 10:08:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53627118928
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 10:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226148.1532683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpjiY-0005C1-LG; Tue, 10 Feb 2026 09:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226148.1532683; Tue, 10 Feb 2026 09:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpjiY-00058s-HA; Tue, 10 Feb 2026 09:07:34 +0000
Received: by outflank-mailman (input) for mailman id 1226148;
 Tue, 10 Feb 2026 09:07:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpjiW-00057T-Ng
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 09:07:32 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee44ae1a-065f-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 10:07:31 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4833115090dso5494695e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 01:07:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d835f6bsm41896715e9.14.2026.02.10.01.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 01:07:30 -0800 (PST)
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
X-Inumbo-ID: ee44ae1a-065f-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770714451; x=1771319251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hi4PYIoEZLxbtf5syjsh0e/Gt9eKXMZnwU7/KBvLkzk=;
        b=Fy8HFW4J0C6JBv8rCpu3gbwy652f6gISjfacJuuzpz/3yHsevv+wqQeX/8cWC/Sd2F
         +W3UlmRkQlOPIVtK508TiE9JAWpnnJF3Yvg9L/eFwcHOoc0Mmi2t6WBgbPQhF1TPSIl8
         nXz1lRgLWb3iDF/k9lvkzBrhFN0s70IQqz91hEpteckvX4eVRJoPuiMS27tSp4WFzRgk
         LAdd4+5hiOqLqQl9ilwUIrBkh+/zcuc0Ec314PAYn30fGfhAaw89Cwa4N3XkB0cuIzd4
         wmF4kNcVqwzWEdeoHbAceuSMSd6fIrKcJPwTGmHU0H08WgHSthssoPgtOSKFqMSB7I28
         JQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714451; x=1771319251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi4PYIoEZLxbtf5syjsh0e/Gt9eKXMZnwU7/KBvLkzk=;
        b=QjUSfDGAto6x+A0gppCOpDuupqVTvW5IwFVQZh9XDemhN6F1nr8l/Mpzdywuv70qK7
         VN8tN9oX0AlDJECgQu3Zn5T9dSWHwwK32N9PhvCDHyJWC041JxDZo55zDoGGcowM133e
         Cds3gmb+/JzmS2SzTNVMfwL2/54A6UIgrFSpB0ILYInyBW6JkTvwtzAKZm6kOM48K3zu
         Yg93hbKG04Wud4x/xThXgWBhzr+1rsC9NMzxFrLk+mgGomluYlAtaBCNxz8z2ko9kQIY
         0jcJCN3M/ptTVwyJn8pJ2/SxMSguqEsV/ntjZ5Gf2UQ+rY+AO3+eJHdghPtw1foVJ51P
         FQ0g==
X-Forwarded-Encrypted: i=1; AJvYcCXERlIG1qBrfKNq6ngQomLD0FSYcms/R08Efa/bbgO7BHqIYqCBHOzKOrNZEwFnyOyaTtdjpnYMAXA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2PoTfdUQUdrhjCQ5qnZUoLWR8EpxthaNbpDRd6noV49xmg+93
	ZURR+SNUiIh8aynFogepJoagVbY9Ed0bkXFcdkfGVYuXVJnAZZIgir+M+vVPPfzlGA==
X-Gm-Gg: AZuq6aK3OvwNeRIj857VJHA9xQfiLCWIJaOXXgJ0MkQYPiqU5G6av8FBDNzn1hBD2FB
	0KhqOIG5sE6zWIo4iSQ4gq5Y2orfr48azUzA6LUB82RiCn3EjFSaeVh5mUIB5B7T/OcFLFjXS5B
	LYNO4D/4p1VXFfDF5onoi9Yj1Dqs/psgSoQVhrh9lI3nXCYRUqkzEJcoVe7IEB2RO5yZCMrbysD
	isF0wb5Q1OycbKkTZuI+EZfgqZn1UCsLIUOUAX/lcedc9/R00+64f6sbLQuk7ZfkzoaechCNIkg
	O8CfaxSDvU/eznrcANoWRoEBP2GF3X05/vM1fOmZrN9vDTOd58HzZT5klU6l+1UKaEwbVR/XGtz
	JcaMziIzJ+Ql4+GDknFvvVR5sWzJtNnBdRt6HOL4lyz4xa2cEoHKhqxuemx0ZXsTxyxe7QHWlWY
	/hUBCX7Fc3rjYZBtB+1GwiaL1CH7g9gxesixXkJYLs6aXR/CJ9Ge24BkTdD/qDBOKhqtINhJkQb
	FAbLH/kEh7SPrw=
X-Received: by 2002:a05:600c:8116:b0:480:3b26:82c3 with SMTP id 5b1f17b1804b1-4832021b549mr173449835e9.20.1770714450688;
        Tue, 10 Feb 2026 01:07:30 -0800 (PST)
Message-ID: <704f8923-6adc-457d-bde9-b1821b82ea79@suse.com>
Date: Tue, 10 Feb 2026 10:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ioreq: Extend ioreq server to support multiple ioreq
 pages
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260209123025.2628513-1-julian.vetter@vates.tech>
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
In-Reply-To: <20260209123025.2628513-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 53627118928
X-Rspamd-Action: no action

On 09.02.2026 13:30, Julian Vetter wrote:
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -71,6 +71,38 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
>      return INVALID_GFN;
>  }
>  
> +static gfn_t hvm_alloc_ioreq_gfns(struct ioreq_server *s,
> +                                  unsigned int nr_pages)
> +{
> +    struct domain *d = s->target;
> +    unsigned long mask = d->arch.hvm.ioreq_gfn.mask;
> +    unsigned int i, run;
> +
> +    /* Find nr_pages consecutive set bits */
> +    for ( i = 0, run = 0; i < BITS_PER_LONG; i++ )
> +    {
> +        if ( test_bit(i, &mask) )
> +        {
> +            if ( ++run == nr_pages )
> +            {
> +                /* Found a run - clear all bits and return base GFN */
> +                unsigned int start = i - nr_pages + 1;
> +                for ( unsigned int j = start; j <= i; j++ )
> +                    clear_bit(j, &d->arch.hvm.ioreq_gfn.mask);
> +                return _gfn(d->arch.hvm.ioreq_gfn.base + start);
> +            }

We may want to gain a bitmap library function for this. Sadly
bitmap_find_free_region() is too special purpose for the needs here.
Otherwise I think ...

> +        }
> +        else
> +            run = 0;

... the construct as a whole would benefit from re-working into
if/else-if, as that'll reduce indentation by one level for the main
block of code.

Also, nit: Blank line please between declaration(s) and statement(s).

> @@ -121,52 +153,95 @@ static void hvm_free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
>      }
>  }
>  
> +static void hvm_free_ioreq_gfns(struct ioreq_server *s, gfn_t gfn,
> +                                unsigned int nr_pages)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < nr_pages; i++ )
> +        hvm_free_ioreq_gfn(s, _gfn(gfn_x(gfn) + i));
> +}
> +
>  static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
>  {
> -    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> +    unsigned int i, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
>  
> -    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> -        return;
> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
> +
> +        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> +            continue;
>  
> -    destroy_ring_for_helper(&iorp->va, iorp->page);
> -    iorp->page = NULL;
> +        destroy_ring_for_helper(&iorp->va, iorp->page);
> +        iorp->page = NULL;
>  
> -    hvm_free_ioreq_gfn(s, iorp->gfn);
> -    iorp->gfn = INVALID_GFN;
> +        hvm_free_ioreq_gfn(s, iorp->gfn);
> +        iorp->gfn = INVALID_GFN;
> +    }
>  }
>  
>  static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
>  {
>      struct domain *d = s->target;
> -    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> +    unsigned int i, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
> +    gfn_t base_gfn;
>      int rc;
>  
> -    if ( iorp->page )
> +    /* Check if already mapped */
> +    for ( i = 0; i < nr_pages; i++ )
>      {
> -        /*
> -         * If a page has already been allocated (which will happen on
> -         * demand if ioreq_server_get_frame() is called), then
> -         * mapping a guest frame is not permitted.
> -         */
> -        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> -            return -EPERM;
> +        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
>  
> -        return 0;
> +        if ( iorp->page )
> +        {
> +            /*
> +             * If a page has already been allocated (which will happen on
> +             * demand if ioreq_server_get_frame() is called), then
> +             * mapping a guest frame is not permitted.
> +             */
> +            if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> +                return -EPERM;
> +
> +            return 0;
> +        }

How can you simply return here when you found one page already mapped?
(This will likely solve itself when the data structure is changed; see
remark at the very bottom.)

> @@ -174,32 +249,43 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
>  static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
>  {
>      struct domain *d = s->target;
> -    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> +    unsigned int i, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
>  
> -    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> -        return;
> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
> +
> +        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> +            continue;
>  
> -    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
> -        domain_crash(d);
> -    clear_page(iorp->va);
> +        if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
> +            domain_crash(d);
> +        clear_page(iorp->va);
> +    }
>  }
>  
>  static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
>  {
>      struct domain *d = s->target;
> -    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> +    unsigned int i, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
>      int rc;
>  
> -    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> -        return 0;
> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
>  
> -    clear_page(iorp->va);
> +        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> +            continue;
>  
> -    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
> -    if ( rc == 0 )
> -        paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
> +        clear_page(iorp->va);
>  
> -    return rc;
> +        rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
> +        if ( rc )
> +            return rc;

No rolling back of what was successfully done before will want explaining
in a comment.

> @@ -260,84 +263,120 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
>  
>  static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>  {
> -    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
>      struct page_info *page;
> +    unsigned int i, j, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
>  
> -    if ( iorp->page )
> +    for ( i = 0; i < nr_pages; i++ )
>      {
> -        /*
> -         * If a guest frame has already been mapped (which may happen
> -         * on demand if ioreq_server_get_info() is called), then
> -         * allocating a page is not permitted.
> -         */
> -        if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
> -            return -EPERM;
> +        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
>  
> -        return 0;
> -    }
> +        if ( iorp->page )
> +        {
> +            /*
> +             * If a guest frame has already been mapped (which may happen
> +             * on demand if ioreq_server_get_info() is called), then
> +             * allocating a page is not permitted.
> +             */
> +            if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
> +                return -EPERM;
> +            continue;  /* Already allocated */
> +        }
>  
> -    page = alloc_domheap_page(s->target, MEMF_no_refcount);
> +        page = alloc_domheap_page(s->target, MEMF_no_refcount);
> +        if ( !page )
> +            goto fail;
>  
> -    if ( !page )
> -        return -ENOMEM;
> +        if ( !get_page_and_type(page, s->target, PGT_writable_page) )
> +        {
> +            /*
> +             * The domain can't possibly know about this page yet, so failure
> +             * here is a clear indication of something fishy going on.
> +             */
> +            put_page_alloc_ref(page);
> +            domain_crash(s->emulator);
> +            return -ENODATA;
> +        }
>  
> -    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
> -    {
> -        /*
> -         * The domain can't possibly know about this page yet, so failure
> -         * here is a clear indication of something fishy going on.
> -         */
> -        domain_crash(s->emulator);
> -        return -ENODATA;
> -    }
> +        /* Assign early so cleanup can find it */
> +        iorp->page = page;
>  
> -    iorp->va = __map_domain_page_global(page);
> -    if ( !iorp->va )
> -        goto fail;
> +        iorp->va = __map_domain_page_global(page);
> +        if ( !iorp->va )
> +            goto fail;
> +
> +        clear_page(iorp->va);
> +    }
>  
> -    iorp->page = page;
> -    clear_page(iorp->va);
>      return 0;
>  
> - fail:
> -    put_page_alloc_ref(page);
> -    put_page_and_type(page);
> +fail:
> +    /* Free all previously allocated pages */
> +    for ( j = 0; j <= i; j++ )
> +    {
> +        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[j];
> +        if ( iorp->page )
> +        {
> +            if ( iorp->va )
> +                  unmap_domain_page_global(iorp->va);

Nit: Indentation.

> +            iorp->va = NULL;

Perhaps best to introduce and use UNMAP_DOMAIN_PAGE_GLOBAL(), paralleling
UNMAP_DOMAIN_PAGE().

> +            put_page_alloc_ref(iorp->page);
> +            put_page_and_type(iorp->page);
> +            iorp->page = NULL;

Maybe also PUT_PAGE_AND_TYPE().

> @@ -29,6 +36,10 @@ struct ioreq_page {
>      void *va;
>  };
>  
> +struct ioreq_pages {
> +    struct ioreq_page page[NR_IOREQ_PAGES];
> +};
> +
>  struct ioreq_vcpu {
>      struct list_head list_entry;
>      struct vcpu      *vcpu;
> @@ -45,7 +56,7 @@ struct ioreq_server {
>      /* Lock to serialize toolstack modifications */
>      spinlock_t             lock;
>  
> -    struct ioreq_page      ioreq;
> +    struct ioreq_pages     ioreqs;
>      struct list_head       ioreq_vcpu_list;
>      struct ioreq_page      bufioreq;

You allocate contiguous GFNs and you will, as per what Andrew requested, also
allocate contiguous VA space. No need to inflate the structure like this then?

Having reached the bottom - how's qemu going to know that multiple pages are
in use?

Jan


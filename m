Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMWNMvWywmmRkwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:51:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE331862A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261006.1554149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w541w-0007RG-8k; Tue, 24 Mar 2026 15:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261006.1554149; Tue, 24 Mar 2026 15:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w541w-0007OD-5b; Tue, 24 Mar 2026 15:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1261006;
 Tue, 24 Mar 2026 15:50:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w541u-0007O7-DZ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:50:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w541t-002jyM-Pf
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:50:53 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b2cf-5cb7-0a2a0a5109dd-0a2a450b9050-32
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:50:53 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b2dd-ef63-0a2a450b0019-d1558036ec61-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:50:53 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-486507134e4so17974445e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 08:50:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647120a1sm40792140f8f.30.2026.03.24.08.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 08:50:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774367453; x=1774972253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6H+fWNvFjytn0KdbQL/2Do7fiGCzA00Gpa1KeCPYAWc=;
        b=bcCUlxLEtl0imRRRqpkJ0BH5oUpE9s4rZS7/brhD/TO5BWFXoTthqH3x49n4/Ibu/V
         egCn0Tqt31cTU1wF/cwXGs9jZzq3LPIoJPYUCIsH5MApAVfPJ/tXjQcHkgvuPjFEL+Pz
         h/dufNnmMKOWa2/A+FCEZDEGetFI9cjPQjbVD1cdNA2nqqzhx6PebEVObcSPOeaB0HFJ
         DCW5J/zSzDop7CrJyVkl6jmF3WTbxeCdMcP1iFh0gkIM0Sq3w+T+MUrhGQeu42JEGrvw
         LRFji0u1ZcqNAPng0YAijk7jt7/LD+SdykGFXss4icG9pZAK29BeveteC3KC1gDn+/m+
         WZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367453; x=1774972253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6H+fWNvFjytn0KdbQL/2Do7fiGCzA00Gpa1KeCPYAWc=;
        b=nKUGDyQLT/mqcvS4sDVQ49TuBDysgwcJ/heC0xM1sHNDi61U/51NtvmJrR9oXLR31F
         3qsG91Ezi2frpc5a40PBTlS6Psu+kM/a0NFCHxN/3ggIQIQnUyvOrTnRdg/rEb+d3n6x
         izJW3Zw8cRNYxzo8ODr2XzuGsuW4XdRYRKdbblB48oT5la+hObWM2t7N35oxViAYuiiW
         1ARJzYunMdlJY9WiDFld6IRsQnfiNbK9KI4WYok6mX0tYokxLZH5ijqQtAbay+HTtrXM
         99MPf83YsIejplk3/RNCl/+WzrVpRCZYxGIu3UrAzCV/1UCFOYOfVZYT6bLu9ofnvBEV
         6OWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHkfZHvyHuqfo0MfOn1zPDWhhOMHl0iWRoFwBTdyiIGZ+fnuWermdbL8pTbLWBWe6y+CIZl1c8bdU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywqu3FnAT6Cs1WsrHtdGLqsu4RA4KdSvDy1W7s+mBEXcfUV79pX
	EXJImPlOIb5mGHLC9252HKlVhe0wpDvvLYHT2/BFe91XodCdd2uz912KMsKPgRly3A==
X-Gm-Gg: ATEYQzyk9ASU5n3i9PGJeYLB+TVU3kY0x+nXc8ivTCqBBebigjyHJAOy5956Hwz3jW3
	8YGV7DYBh3n6UJO26ap2ojLSoj5igSQUQconBhf7f2dd9G2fAVTUjJz9zxYnMxMjN/2ydsxQolM
	yFRgXrxdMonx6B7DuYTGDkjSKEc2ecRlZBDqjv+fq8UNMFG54AXD4McHdVhqeqU7DClTMMjowIy
	+pWgH/BoK9pj8ypo2X4gBnOkzRDcwp+j7e5jYAacDvmuuVjK9y4Zz+Xyc2Gfry03RuUDSEHFuTj
	ttXfEJFGM+ROnQQtXYFdhSRlHDv7vPG5ITkucj9ak4/O9+qC0x4eYqdCP0E+9Qg1LMpIhBVo2mS
	Mpp07xv3MTR3opMXV7C/M3br3DTYJ35tzdJMEl8wlhjZ5VEPsvhf/cVVT5Cv0matyyNxKcsd+GS
	m/WUsRy9wR32BIlXzzCF6VhLXgRLsHOsb4+uqZlAeOmfVpdxfELOgsPFbEd6NR3QPHCMnoBTlXg
	Jku5rFt9LkB3io=
X-Received: by 2002:a05:600c:1394:b0:485:4388:348b with SMTP id 5b1f17b1804b1-48715f0389dmr4840375e9.0.1774367452933;
        Tue, 24 Mar 2026 08:50:52 -0700 (PDT)
Message-ID: <5553b84a-d34e-4008-ad65-a322555b5ebe@suse.com>
Date: Tue, 24 Mar 2026 16:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] x86/ioreq: Extend ioreq server to support multiple
 ioreq pages
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260316111653.178104-1-julian.vetter@vates.tech>
 <20260316111653.178104-4-julian.vetter@vates.tech>
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
In-Reply-To: <20260316111653.178104-4-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1774367453-98ABC112-0ECC46F3/0/0
X-purgate-type: clean
X-purgate-size: 6850
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2EEE331862A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.03.2026 12:17, Julian Vetter wrote:
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -163,6 +163,14 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
>      if ( d->is_dying )
>          return -EINVAL;
>  
> +    /*
> +     * The legacy GFN path supports only a single ioreq page. Guests requiring
> +     * more ioreq slots must use the resource mapping interface
> +     * (XENMEM_acquire_resource).
> +     */
> +    if ( !buf && nr_ioreq_pages(d) > 1 )
> +        return -EOPNOTSUPP;

Nit towards the comment: It's not guests using this themselves, but their
device models. This wants wording accurately.

> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -261,8 +261,9 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
>  static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>  {
>      struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> -    struct page_info *page;
> -    mfn_t mfn;
> +    unsigned int i, nr_pages = buf ? 1 : nr_ioreq_pages(s->target);
> +    mfn_t *mfns;
> +    int rc;
>  
>      if ( iorp->va )
>      {
> @@ -277,11 +278,20 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>          return 0;
>      }
>  
> +    mfns = xmalloc_array(mfn_t, nr_pages);
> +    if ( !mfns )
> +        return -ENOMEM;

It would be nice to avoid this allocation for guests requiring only a single
page, perhaps even for ones requiring only a few. (Ideally we'd avoid such a
runtime allocation altogether, as they hinder certification aiui.)

> +    for ( i = 0; i < nr_pages; i++ )
>      {
> -        page = alloc_domheap_page(s->target, MEMF_no_refcount);
> +        struct page_info *page = alloc_domheap_page(s->target,
> +                                                    MEMF_no_refcount);

To limit churn in this patch as much as possible, this scope reduction of
"page" may want to also move into the earlier, purely mechanical change.

>          if ( !page )
> -            return -ENOMEM;
> +        {
> +            rc = -ENOMEM;
> +            goto fail;
> +        }

This and ...

>          if ( !get_page_and_type(page, s->target, PGT_writable_page) )
>          {
> @@ -290,41 +300,60 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>               * here is a clear indication of something fishy going on.
>               */
>              domain_crash(s->emulator);
> -            return -ENODATA;
> +            rc = -ENODATA;
> +            goto fail;
>          }

... this error patch have different cleanup needs, yet they both simply
"goto fail".

> -        mfn = page_to_mfn(page);
> +        mfns[i] = page_to_mfn(page);
>      }
> -    iorp->va = vmap(&mfn, 1);
> +
> +    iorp->va = vmap(mfns, nr_pages);
>      if ( !iorp->va )
> +    {
> +        rc = -ENOMEM;
>          goto fail;
> +    }
> +
> +    xfree(mfns);
> +
> +    for ( i = 0; i < nr_pages; i++ )
> +        clear_page((char *)iorp->va + i * PAGE_SIZE);

As before - please prefer casts to void * when no particular type is needed.
Plus you don't need a cast here at all, do you?

I wonder though - might this not better be a single memset()? (Else we may
want to introduce clear_pages().)

> -    clear_page(iorp->va);
>      return 0;
>  
>   fail:
> -    put_page_alloc_ref(page);
> -    put_page_and_type(page);
> +    while ( i-- )
> +    {
> +        struct page_info *page = mfn_to_page(mfns[i]);
> +
> +        put_page_alloc_ref(page);
> +        put_page_and_type(page);
> +    }
> +    xfree(mfns);
>  
> -    return -ENOMEM;
> +    return rc;
>  }
>  
>  static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
>  {
>      struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
> -    struct page_info *page;
> +    unsigned int i, nr_pages;
>  
>      if ( !iorp->va )
>          return;
>  
> +    nr_pages = vmap_size(iorp->va);

Why would you need to query this? You should be able to calculate this the
same as ioreq_server_alloc_mfn() does, I suppose.

> +    for ( i = 0; i < nr_pages; i++ )
>      {
> -        page = vmap_to_page(iorp->va);
> -        vunmap(iorp->va);
> -        iorp->va = NULL;
> +        struct page_info *page = vmap_to_page(iorp->va + i * PAGE_SIZE);
>  
>          put_page_alloc_ref(page);
>          put_page_and_type(page);
>      }
> +
> +    vunmap(iorp->va);
> +    iorp->va = NULL;
>  }

This re-ordering isn't nice. At least iorp->va ought to be cleared before
the references on the pages are dropped. I fear, though, that even the
mapping needs dropping ahead of time: By (likely) freeing the pages, they
can be reused for another purpose. Speculative accesses through the
mapping would better be excluded as a possibile source of a security issue.

> @@ -337,12 +366,28 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
>  
>      FOR_EACH_IOREQ_SERVER(d, id, s)
>      {
> -        if ( (s->ioreq.va && vmap_to_page(s->ioreq.va) == page) ||
> -             (s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page) )
> +        if ( s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page )
>          {
>              found = true;
>              break;
>          }
> +
> +        if ( s->ioreq.va )
> +        {
> +            unsigned int i;
> +
> +            for ( i = 0; i < vmap_size(s->ioreq.va); i++ )
> +            {
> +                if ( vmap_to_page(s->ioreq.va + i * PAGE_SIZE) == page )
> +                {
> +                    found = true;
> +                    break;
> +                }
> +            }

This raises the question whether storing the array of MFNs permanently
wouldn't be better. This would then also eliminate other concerns voiced
above.

> @@ -818,26 +863,30 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
>      if ( rc )
>          goto out;
>  
> -    switch ( idx )
> +    if ( idx == XENMEM_resource_ioreq_server_frame_bufioreq )
>      {
> -    case XENMEM_resource_ioreq_server_frame_bufioreq:
>          rc = -ENOENT;
>          if ( !HANDLE_BUFIOREQ(s) )
>              goto out;
>  
>          *mfn = page_to_mfn(vmap_to_page(s->bufioreq.va));
>          rc = 0;
> -        break;
> +    }
> +    else if ( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) &&
> +              idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pages(d)) )
> +    {
> +        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
> +        if ( page_idx >= vmap_size(s->ioreq.va) )

This ought to be impossible, so may at best want to be an ASSERT().

Also, nit: Blank line please between declaration(s) and statement(s).

Jan


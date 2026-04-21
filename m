Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BZ+DNJF52mh6AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:39:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCBE438F80
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288739.1568973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7Za-0004WX-12; Tue, 21 Apr 2026 09:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288739.1568973; Tue, 21 Apr 2026 09:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7ZZ-0004Tn-UG; Tue, 21 Apr 2026 09:39:13 +0000
Received: by outflank-mailman (input) for mailman id 1288739;
 Tue, 21 Apr 2026 09:39:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF7ZY-0004Th-D3
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:39:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF7ZX-00DxJe-Ln
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:39:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e745b4-5cb7-0a2a0a5109dd-0a2a4509b10e-38
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:39:11 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e745bf-2497-0a2a45090019-d155802cc9ae-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:39:11 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so27910155e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 02:39:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8188sm375679595e9.2.2026.04.21.02.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 02:39:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1776764351; x=1777369151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iymUx3bK2XOF5YcXmLuE+OU4mZCLpR/LykXQYUzRXsM=;
        b=c9WDw6wBw0dKV/6tNEobF7AS1y8N85cjWnlwnzfBfnqHLnExBlG07PnLdC2B8O4ach
         RUSx3+kZMvvSWGd7EKjJBNDSwnxoRd7Sj24s2+dzHcsBpUO5fT/3JWZxIIdwjxNRVviN
         oHsQh7Tn6vqCepubQnbpeqImuCIgcqfMsP1ViBzN0EZLqbXcb6cAsL4a5hIPidm/WhZc
         gF1mwNhi478cj/gz+HEpgpDmZTwVhxi5J42pDkPg3VUet40ipW//PjSXKUPRq51eUAwD
         GzxwY5ZOulGKhMIT+UQjUcVr9g+wVTl97iYIKnp8lXO0gwCH3p7q4MR5He72nwIaQ2zL
         7jBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764351; x=1777369151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iymUx3bK2XOF5YcXmLuE+OU4mZCLpR/LykXQYUzRXsM=;
        b=MJhtyB9MnlZ36AheG26+diX6MlM5mKAFHOzfXsBfqZsCKzwLf/Y9GGUQEK7AfpdV5d
         LZjWui0n2p+W2VmG1tMxXQhlWFI7cYLd8Ulg9SDLJRD+8iI6KKwvuA8g3+138Nfmp1BP
         DzxaUeUIln/3JXGumv5Sgaz5u5Wiu4sGmH0aW5Vx/jsXqR9Z6GBYgw71invBiUCQugo3
         /3klKy7Yo90itKAzg35Q9bty29BbBQODaq7cIDJNffx/as47GDyX07dsK5B2EQ/dc+Y7
         9wbzZqKhVylOxdPMitE66uJTC9FUkQzVQOyEkMFg3LPt1lmvT1qU/cSe5Kn/Lht2F8/o
         YjOg==
X-Forwarded-Encrypted: i=1; AFNElJ9J4JfZdMr7Fq9auTEHgyXHQQmFlMNX4wRw+3amXK6paChH8aMgJjOPOANvwWoLIoHGbGxK+F+5ec4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOMzkRBXEkPUBRgVApfRhBm9hwWp1sgj+5nfaqMyBFN9vpYNX4
	4+PLP6uD8ct6hTdu/5rC18Mbcf9mEfGAFtbNvu2iBaZ5ePKB0g84esKcSA28FsKTqg==
X-Gm-Gg: AeBDiev99Iy4vVBbSHoT6ip6Dd/RL95GyADZTQ/GkcxQg6SgqvBNrfzaHzzcjcdNjcN
	BRt16kq2fJNC3SfWfU+XWlmzEgml4uv1YO7eZjOT9IV8ctI9Twwb6HVpRZ5QQEkopKAD/blTSr0
	ZLQIOlfwCzGo7ufoztnhYloF/tctE74TZ9jHaaKmZyAQs5o0EVc1KPqBTeQTEOGmDMBwCi8EeYc
	n0NcZ4Gypw0L0D9G5+OhvTZ1yYU9iTWumhGNfOwFPXhIa/FxnHCoriKFLQe8cs/RAWI3feMLZUU
	R4V4tS3SVeqQLfStsZ/96uRpTTpKG9StfhRka2A0ybLhdbgO3BxxljFvqvnH1MjeFfQc8GF6hQA
	Rh670jJmCYR4TkEPl95BXQGwQybFTsMX+IBVB/D72Y4aXM8nhwJhJUSMMqECorHeC4JwIwAbU0a
	5kb6/YPfP/maR0HGFOyhXg0hv5BDCQWK4d5quY2cy27WK9kL9aZC5kbC2JlcZ4TZpZ0AVz0RnWF
	ezZS+RhqV6ad8RB+Mc8zgEq/g==
X-Received: by 2002:a05:600c:8b84:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-488fb76e4aamr269663035e9.17.1776764350840;
        Tue, 21 Apr 2026 02:39:10 -0700 (PDT)
Message-ID: <d03f915e-8066-42dc-aac0-14ac6eb523f7@suse.com>
Date: Tue, 21 Apr 2026 11:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] xen/riscv: rework G-stage mode handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <94c914766171b732524d2d64c283e566595a4d22.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <94c914766171b732524d2d64c283e566595a4d22.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776764351-498B7A53-18EA1A27/0/0
X-purgate-type: clean
X-purgate-size: 3544
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8BCBE438F80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -45,12 +45,27 @@ struct p2m_pte_ctx {
>      unsigned int level;          /* Paging level at which the PTE resides. */
>  };
>  
> -static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
> -    .mode = HGATP_MODE_OFF,
> -    .paging_levels = 0,
> -    .name = "Bare",
> +/* Values should be sorted by ->mode in this array */
> +static const struct gstage_mode_desc modes[] = {

As before, I'm of the clear opinion that this is too generic an identifier
for use at file scope.

> @@ -331,8 +324,40 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
>      return 0;
>  }
>  
> -int p2m_init(struct domain *d)
> +static const struct gstage_mode_desc * find_gstage_mode(const char *mmu_type)

Nit (style): Stray blank after *.

>  {
> +    for ( unsigned int mode_idx = 0; mode_idx < ARRAY_SIZE(modes); mode_idx++ )

Can't the variable be just idx or even i? Would likely help readability
some.

> +    {
> +        if ( !strcasecmp(mmu_type, modes[mode_idx].name) )
> +        {
> +            if ( modes[mode_idx].mode == HGATP_MODE_OFF ||

Instead of this, start the loop at index 1, with ...

> +                 modes[mode_idx].mode > max_gstage_mode->mode )
> +                break;
> +
> +            return &modes[mode_idx];
> +        }
> +    }
> +
> +    ASSERT(modes[0].mode == HGATP_MODE_OFF);

... this moved up?

> +    dprintk(XENLOG_ERR, "Requested G-stage mode (%s) isn't supported\n",
> +            mmu_type);
> +
> +    /*
> +     * Return the Bare-mode sentinel. p2m_init() will reject it with
> +     * -EINVAL, producing the appropriate domain-creation failure.
> +     */
> +    return &modes[0];
> +}

Yet better return NULL on error?

> +int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
> +{
> +    /*
> +     * TODO: This static is a temporary constraint: all guests must use the
> +     * same MMU mode because p2m_gpa_bits is not yet per-domain.
> +     * Drop this once per-domain p2m_gpa_bits is introduced.
> +     */
> +    static const struct gstage_mode_desc *m = &modes[0];

It being temporary it may not matter much, but couldn't this be __ro_after_init?`
At least one domain needs creating during boot, so ...

> @@ -341,6 +366,27 @@ int p2m_init(struct domain *d)
>       */
>      p2m->domain = d;
>  
> +    if ( !config )
> +    {
> +        dprintk(XENLOG_ERR, "NULL config is passed\n");
> +        return -EINVAL;
> +    }
> +
> +    p2m->mode = find_gstage_mode(config->arch.gstage_mode);
> +
> +    if ( p2m->mode->mode == HGATP_MODE_OFF )
> +        return -EINVAL;
> +
> +    if ( m->mode == HGATP_MODE_OFF )
> +        m = p2m->mode;

... this path won't be taken post-init.

> --- a/xen/include/public/arch-riscv.h
> +++ b/xen/include/public/arch-riscv.h
> @@ -56,6 +56,11 @@ typedef struct vcpu_guest_context vcpu_guest_context_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  
>  struct xen_arch_domainconfig {
> +    /*
> +     * G-stage MMU mode for the guest (e.g. "sv39", "sv48", "sv57").
> +     * Must be set; an empty string is invalid.
> +     */
> +    char gstage_mode[8];
>  };

I have to say that I find it odd to use a string literal for this purpose.
Specifying the number of wanted address bits would feel more natural. Plus
the strings named aren't valid G-stage modes afaict - they lack the x4.

Jan


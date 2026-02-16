Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P2vJn8wk2mI2QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:58:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BD9144E30
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234231.1537542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs02t-0002fb-H3; Mon, 16 Feb 2026 14:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234231.1537542; Mon, 16 Feb 2026 14:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs02t-0002cS-Ck; Mon, 16 Feb 2026 14:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1234231;
 Mon, 16 Feb 2026 14:57:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs02r-0002cM-Gt
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 14:57:53 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddc568a8-0b47-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 15:57:52 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so26163945e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 06:57:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483709f8812sm154308085e9.0.2026.02.16.06.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 06:57:50 -0800 (PST)
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
X-Inumbo-ID: ddc568a8-0b47-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771253871; x=1771858671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+XBV7YwT88hxZ2vBNRNxhnT86u6Bydza1pu1GSB0NF8=;
        b=Q7JraaTH+iboHma5sMvCjo8qNrJTEOy4GYePzBFjNILfQLowr7iFd1blDFzq04Z25V
         ao+206iKoDZUHm0bDVBDb5LaY0o1cNKAi9IE1iOX557N/0SJvPR/BrMOoT/hgOj8/mkS
         Pk2oUjAzN2HizxEur6WFOnyySFqowS7zhIevbj0EPRbp79aK5YNifOF4VoBYCjHDfpR+
         VSUXvGOQhiOxflWF4okj7ojvcuYF7N0MKSIzKTCgLK+2CuJ8RLvDCwzjI1HLPT7aWcnr
         Vo9poj9iNTsip2Tt2RgYLEOHSDBfAF25LoFEAbTMl4wDUFuXTQfhE9vm76FgfSWoeiqD
         M1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253871; x=1771858671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XBV7YwT88hxZ2vBNRNxhnT86u6Bydza1pu1GSB0NF8=;
        b=XiUNei41xT3Ubsc9hJrlaYAax9WZC17AZ0pXB5+BplcdinzwpCD2HqxWlbWbV8nhR6
         f9JbZGcMCGwzxqXjpGYyym31Fv87xAGRKfX+NRKePBjXoAQqO3SLxBjjKXNyiDqKrKd/
         Zq/QL4bIHRZ7oKZJ1ZBTKwmyu9YBawzcRq2M8X3LZBdHpW/5FA+lYB61Q02prcuqmUbX
         z2rgl5HTPM1amPQFOAL0cjGvYC7NxZmRoZmtxiM6HNx8LVglWmNRUSKsWfwTb8KY2G1x
         Xi06AUyNFNZZzF3nstGg6mwvtRZEPQFkyn3Y/zBUrDoH7gvxwQRa723ZBIc6OmbN3vfJ
         iR0A==
X-Forwarded-Encrypted: i=1; AJvYcCWLrlHZk8I/J6dSmkDEC7OdM0yrhJl/FnRU4CZPSfo8r4VnMcyrrpHNiIKXO/Acy7wpYK0r1Hga4Xk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPrb3QJ2g3zQX0K5v7PBUwjVCO73c2XZE3xM4k+kUKIBSgUSqI
	xhR65oNiCU9smfK158BOq2hm8cDMRWDwd+29ROcpTROxb37zXqU1y1v8Ti9kSEfdPm1d/7t4UNx
	dZa0=
X-Gm-Gg: AZuq6aK3VznV/2TU29zCsIpP3GSQNU/Rv+0lqnoVCuL7Y+0E9Ye2aCg+FA5uvDfd0a0
	BuoHSc8PJnO3h9Q4f9Y3vOGpkKfwIhgB9DwlZKVO/UJQx4AjKExaY/4DQrI4z8AMa52ZQrxPP4B
	psGBtY3DCwugx5jkp26ubt/9BXKaA+1TTNw/4ELN+1j093Q1gDjRz7ts+9ECVAPdqLMD3pS8E5j
	oYa9GN+Er07PRwvaLAeA8cJYCcO6gM86YELN56yKP89u3Y+pTibhi8qjkQZbwuKHxEJwUQcIbxw
	b0ICoP25QKl2Mw346kVlF5MEvjbb6ooi1ll7t4Rz1XMB/bn1UsYoDEYkIDjdcDA3M5vvcvHn6bh
	8jYqPY+Zcnnkrm7no1maDFKhRj2MdbEwUUa9WfeLFEHQaosxLIKucwfMOpDJG2k2Dk0ErhJoRc/
	/DtzMxTAd4TXbCNbNQ6DBVtTPvQVDyCbNy5XD5voGeb5/BK/rjxT/Qy2TTML91E8Qe5mvjlpFDL
	y7KO3MS5MN/uoo=
X-Received: by 2002:a05:600c:3b07:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-48378dada5fmr155311305e9.17.1771253871054;
        Mon, 16 Feb 2026 06:57:51 -0800 (PST)
Message-ID: <1edea973-4ca1-491f-a9bf-9c2b09bbe615@suse.com>
Date: Mon, 16 Feb 2026 15:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: implement copy_to_guest_phys()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <cb50d76c627cb666317b23ae136ca43bfbfd04c5.1770821989.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cb50d76c627cb666317b23ae136ca43bfbfd04c5.1770821989.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C4BD9144E30
X-Rspamd-Action: no action

On 12.02.2026 17:21, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/guestcopy.c
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/domain_page.h>
> +#include <xen/page-size.h>
> +#include <xen/sched.h>
> +#include <xen/string.h>
> +
> +#include <asm/guest_access.h>
> +
> +#define COPY_from_guest     (0U << 0)
> +#define COPY_to_guest       (1U << 0)
> +#define COPY_ipa            (0U << 1)

Like already asked elsewhere - is "ipa" a term commonly in use on RISC-V?
To me it's Arm terminology, which you don't want to copy as is.

Also, don't you prefer to use BIT() everywhere else?

> +#define COPY_linear         (1U << 1)
> +
> +typedef union
> +{
> +    struct
> +    {
> +        struct vcpu *v;
> +    } gva;
> +
> +    struct
> +    {
> +        struct domain *d;
> +    } gpa;
> +} copy_info_t;
> +
> +#define GVA_INFO(vcpu) ((copy_info_t) { .gva = { vcpu } })
> +#define GPA_INFO(domain) ((copy_info_t) { .gpa = { domain } })
> +
> +static struct page_info *translate_get_page(copy_info_t info, uint64_t addr,

The caller has to pass in a domain here. I therefore recommend against
use of copy_info_t for this function. Or wait, this is misleading, as
the consuming part ...

> +                                            bool linear, bool write)
> +{
> +    p2m_type_t p2mt;
> +    struct page_info *page;
> +
> +    if ( linear )
> +        BUG_ON("unimplemeted\n");

... of "linear" is missing here.

In any event, this one please shorter as:

    BUG_ON(linear);

> +    page = get_page_from_gfn(info.gpa.d, paddr_to_pfn(addr), &p2mt, P2M_ALLOC);
> +
> +    if ( !page )
> +        return NULL;
> +
> +    if ( !p2m_is_ram(p2mt) )
> +    {
> +        put_page(page);
> +        return NULL;
> +    }
> +
> +    return page;
> +}

The "write" function parameter also is unused, but there's no BUG_ON() for
that one? Imo the p2m_is_ram() check isn't thorough enough (on the Arm
original): p2m_ram_ro shouldn't be allowed when "write" is true. As soon
as you gain p2m_ram_ro on RISC-V, things will need updating here as well.
Perhaps best to leave a note.

> +static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
> +                                copy_info_t info, unsigned int flags)

Why an "unsigned long" return value when ...

> +{
> +    unsigned int offset = PAGE_OFFSET(addr);
> +
> +    BUILD_BUG_ON((sizeof(addr)) < sizeof(vaddr_t));
> +    BUILD_BUG_ON((sizeof(addr)) < sizeof(paddr_t));
> +
> +    while ( len )
> +    {
> +        void *p;
> +        unsigned int size = min(len, (unsigned int)PAGE_SIZE - offset);
> +        struct page_info *page;
> +
> +        page = translate_get_page(info, addr, flags & COPY_linear,
> +                                  flags & COPY_to_guest);
> +        if ( page == NULL )
> +            return len;

... only an "unsigned int" (or 0 further down) is returned? Same
question for copy_to_guest_phys() below then.

> +        p = __map_domain_page(page);
> +        p += offset;
> +        if ( flags & COPY_to_guest )
> +        {
> +            /*
> +             * buf will be NULL when the caller request to zero the
> +             * guest memory.
> +             */
> +            if ( buf )
> +                memcpy(p, buf, size);
> +            else
> +                memset(p, 0, size);
> +        }
> +        else
> +            memcpy(buf, p, size);
> +
> +        unmap_domain_page(p - offset);
> +        put_page(page);
> +        len -= size;
> +        buf += size;
> +        addr += size;
> +
> +        /*
> +         * After the first iteration, guest virtual address is correctly
> +         * aligned to PAGE_SIZE.
> +         */
> +        offset = 0;
> +    }
> +
> +    return 0;
> +}
> +
> +unsigned long copy_to_guest_phys(struct domain *d,
> +                                 paddr_t gpa,
> +                                 void *buf,
> +                                 unsigned int len)

May I suggest to make good use of line length, just like how copy_guest()
does?

Jan


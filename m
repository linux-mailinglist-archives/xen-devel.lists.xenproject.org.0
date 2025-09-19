Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38536B8B753
	for <lists+xen-devel@lfdr.de>; Sat, 20 Sep 2025 00:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127115.1468235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzjMq-0005tt-1Q; Fri, 19 Sep 2025 22:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127115.1468235; Fri, 19 Sep 2025 22:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzjMp-0005sP-V2; Fri, 19 Sep 2025 22:14:11 +0000
Received: by outflank-mailman (input) for mailman id 1127115;
 Fri, 19 Sep 2025 22:14:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzjMo-0005sJ-Km
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 22:14:10 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6c59c62-95a5-11f0-9d14-b5c5bf9af7f9;
 Sat, 20 Sep 2025 00:14:09 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3f2ae6fadb4so445606f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Sep 2025 15:14:09 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b551518480asm3703933a12.28.2025.09.19.15.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 15:14:08 -0700 (PDT)
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
X-Inumbo-ID: f6c59c62-95a5-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758320048; x=1758924848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8f4zoi5bjYWcV0t8htaNaF+7Q44g0kcNscqk/LR0FhY=;
        b=BdEX2efAoyWy7L1q9dTmZdihHftyl6SN9/K5Z1FcMH19mZ3O5vwlxvrzvozJjZeaQW
         fBnYFqUXHP0Pvc5/Iq3Y5Bx8rcrwyWVEl9BF6lqA1eOzZ5CGogu1/XO5B15zK2SjJDyM
         eMfoggwOaQSO7i9JHmCh8tTwiYMJX6hrkdvXEX541bvPzJ5spL+jqhCC9o+72E/5L4/a
         xJfAPvucfWXSQ5JcX8dFM1jfYAovIhiqqjk9Iqj2QP5DxtAzwc7tWTvvruznuSzN6cBY
         m4L1VwsFGYwREaj6rPT9kOyeDzMg5JMaM2ZNye2IoqjaHs3KjpUxmZgwhpvXralh7erN
         7gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758320048; x=1758924848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8f4zoi5bjYWcV0t8htaNaF+7Q44g0kcNscqk/LR0FhY=;
        b=MOPsFOuBHNEeyOWnrUa17nvNOJfXAJMBJwYZ5b1PdNNks2RB6LmBIdnbO9iGOnXFh8
         GVZwtjp0aJMy9yBR53cfbYIOZEAfOh0CFuL8NAj+PuWQiQIFtSy0FFMiwA+BU/pH0YpJ
         zfrfl0PIhtexLeN58KwmuTcip8jt3dhypb+LqKxOo2oLFagXqm31fv+OfHnZ83u93wwG
         GAZAlgxfBhc7uiR0ISl06cuwq9JNmp1iCdxqweyAuDofF4FrVnUJwroY3DtlU4AxjssM
         LTMhqUw3M53qkdZZMJUzGDha63IsCjoQQFtNWxdc66zmhZv8U0MrzyzYYz5gWv3ozwMj
         W4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVIc5tA2YX1aYLCONrJPwpIaYILb4+C6jpUl+Zam8uNHIZN4MLMrIhJsWOm/F/sOfAApUJeDGVL/5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKczFq4i/mSeAcptwGFtm0yizO3FKR4YP9l9+0V5isNhYWuVlp
	y8/8V9pAZ63UVD1ZMHm7YwRr0BObRJ052q7WqQ3hbYdg4MykwSlrTPcOMRhCTZFzYw==
X-Gm-Gg: ASbGncsewQ3n2b4W/1yh+uIyJXNxItvh8d4erW30ImDcwxoYGvZa7ffjwQVt9YkiquR
	8qjIglJjwZhX3Uq7xxJB8iSP/FuSZCQQAY/NP2AsXU8+drQceLn+zO/1a9S1A0ukO+E1+AVUvzE
	OeHj/+gCwk7tkqI6aLKFMuKKMe12np+KqRuz8R28Cy5SnuApF683Y4yDhYyQu5xjDjye/PfuyIx
	OYXAxPJ0AFyc5rcjjKbc+EwWW7U9CD/ghcbFbAoUibTeXCflIgM2k/mX7hEARty+aKyA/wvo0NN
	6vvTotDEDC6KLP8JZV1vKc/DAUXDqV7aOXJARTOousXQ9gOGd31SL2Iq36sToCe6xAiM9GnIyQ5
	SkUYt1dxqJ3HIk0yYffdaHJXcaWQzIYIZ
X-Google-Smtp-Source: AGHT+IF882BimS8eh/HKXC0JYo7P1gFUQXLFf+gzEej7W7pLAjcbJGZR+IE9CUPXYafGsg6q3mYN7g==
X-Received: by 2002:a05:6000:2285:b0:3ea:a694:ae0a with SMTP id ffacd0b85a97d-3ee852a4b54mr3948866f8f.48.1758320048598;
        Fri, 19 Sep 2025 15:14:08 -0700 (PDT)
Message-ID: <eda37f82-5381-4900-aa75-3f4bfbc01440@suse.com>
Date: Sat, 20 Sep 2025 00:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/18] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <2b636ea03bf82cae50df87d525e3f58b68f16cb2.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2b636ea03bf82cae50df87d525e3f58b68f16cb2.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -3,6 +3,7 @@
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/macros.h>
> +#include <xen/domain_page.h>
>  #include <xen/mm.h>
>  #include <xen/paging.h>
>  #include <xen/rwlock.h>
> @@ -95,6 +96,70 @@ void __init gstage_mode_detect(void)
>      local_hfence_gvma_all();
>  }
>  
> +static void clear_and_clean_page(struct page_info *page, bool clean_dcache)
> +{
> +    clear_domain_page(page_to_mfn(page));
> +
> +    /*
> +     * If the IOMMU doesn't support coherent walks and the p2m tables are
> +     * shared between the CPU and IOMMU, it is necessary to clean the
> +     * d-cache.
> +     */
> +    if ( clean_dcache )
> +        clean_dcache_va_range(page, PAGE_SIZE);
> +}
> +
> +unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid)

pointer-to-const?

> +{
> +    return MASK_INSR(mfn_x(page_to_mfn(p2m->root)), HGATP_PPN) |
> +           MASK_INSR(gstage_mode, HGATP_MODE_MASK) |
> +           MASK_INSR(vmid, HGATP_VMID_MASK);
> +}
> +
> +static int p2m_alloc_root_table(struct p2m_domain *p2m)
> +{
> +    struct domain *d = p2m->domain;
> +    struct page_info *page;
> +    int rc;
> +
> +    /*
> +     * Return back P2M_ROOT_PAGES to assure the root table memory is also
> +     * accounted against the P2M pool of the domain.
> +     */
> +    if ( (rc = paging_ret_pages_to_domheap(d, P2M_ROOT_PAGES)) )
> +        return rc;

I read the "ret" in the name as "return" here. However, ...

> +    /*
> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
> +     * in Section 18.5.1, for the paged virtual-memory schemes  (Sv32x4,
> +     * Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB and must
> +     * be aligned to a 16-KiB boundary.
> +     */
> +    page = alloc_domheap_pages(d, P2M_ROOT_ORDER, MEMF_no_owner);
> +    if ( !page )
> +    {
> +        /*
> +         * If allocation of root table pages fails, the pages acquired above
> +         * must be returned to the freelist to maintain proper freelist
> +         * balance.
> +         */
> +        paging_ret_pages_to_freelist(d, P2M_ROOT_PAGES);

... "return" doesn't make sense here, so I wonder what the "ret" here means.

> @@ -55,6 +76,37 @@ int paging_freelist_adjust(struct domain *d, unsigned long pages,
>      return 0;
>  }
>  
> +int paging_ret_pages_to_freelist(struct domain *d, unsigned int nr_pages)
> +{
> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
> +
> +    for ( unsigned int i = 0; i < nr_pages; i++ )
> +    {
> +        int rc = paging_ret_page_to_freelist(d);
> +        if ( rc )

Nit (style): Blank line between declaration(s) and statement(s) please.

> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +int paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
> +{
> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
> +
> +    if ( ACCESS_ONCE(d->arch.paging.total_pages) < nr_pages )
> +        return false;
> +
> +    for ( unsigned int i = 0; i < nr_pages; i++ )
> +    {
> +        int rc = paging_ret_page_to_domheap(d);
> +        if ( rc )

Same here.

Jan


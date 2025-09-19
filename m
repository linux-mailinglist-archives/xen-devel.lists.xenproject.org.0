Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64766B8BA70
	for <lists+xen-devel@lfdr.de>; Sat, 20 Sep 2025 01:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127202.1468276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzkzD-0002tl-VC; Fri, 19 Sep 2025 23:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127202.1468276; Fri, 19 Sep 2025 23:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzkzD-0002s9-RH; Fri, 19 Sep 2025 23:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1127202;
 Fri, 19 Sep 2025 23:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzkzC-0002s3-PZ
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 23:57:54 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74202c78-95b4-11f0-9809-7dc792cee155;
 Sat, 20 Sep 2025 01:57:52 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso1549401f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Sep 2025 16:57:52 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff445dd7sm5899543a12.51.2025.09.19.16.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 16:57:51 -0700 (PDT)
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
X-Inumbo-ID: 74202c78-95b4-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758326272; x=1758931072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiB2bJ6ZPemHmzYyrQApJbHwhKc2xCBxAJQiY2SS/xo=;
        b=Lj3S7kBaofQEoyV8liIjzjXJNmmPdZnUdzT0qG16G8aQyxFD4sm2Ae9AumQAQlf/d4
         uJuesI05Ne0Fc2lxnHvc03pq6pZRuFhsiU6q+5C2qjnkuMWygxAlhJTQEmT84QjM6heU
         fLHWQVmPwcG6ULG37zMwYhJc+Wd07WiYZs2Zkzm698GD/TwK993u1VCsRZ/G5ICal8IA
         hXCH1tMBLLEIpArvKUZunxayR28el0EgUr0NZvwhtPAnHV/B56UI7OINfVRbISALzOgb
         NrS12a207Fdf3ScF9FMw2gwwJ6nacjWo7vuJis756WG25qyOoG8iuIUux4Vn2emZEB0Z
         w7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758326272; x=1758931072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiB2bJ6ZPemHmzYyrQApJbHwhKc2xCBxAJQiY2SS/xo=;
        b=IELzdSM1qwwJ2CE/dXqFjysKvvkcWfh1CE2r6umNEnokAktQxIhJIjWTLsc9Ok0K1m
         B4QKPmuE6ju5H8+faORkAHSfyji6rn/FzBqre3bj1/xx29Gk+CEeILrIuU1z62/rit+E
         z0PxTMxYWiHoS6sMV1nlUa4fuvOUhsXJ921leLW8wRWXS2MA8bO5sI0nOgdPO6Mm9DvM
         gnirhf35iK1bWLQwaiNgvOU165AHv4iOJYaZeT8+iSTgVY82mxFlAUbEWWwVj/9MABLQ
         Rn84tt6XA1SDzpacwEro4MGcyS27mm37YoGFQ9RArol5zKMHxojEqxBd6b5AmGULcx0l
         f5/w==
X-Forwarded-Encrypted: i=1; AJvYcCVmlV2YcNx2Pak803H9p3Ob6OEGeQNSmdL4wLqbSH7DK85BKAarsfH6LCU7LlNlwZi958Q+PJ9b+Gc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdMwEJiV1D7EE4uc83eQdoZva+EXWie80jICBCDgG0f5IB6600
	QlY5J0VcLpXc4/VJX6V0FAFW6nl5GgwDtaBkDoy8R03BG7eXoS254CiyUKKQD1g5Fw==
X-Gm-Gg: ASbGncv3OKgOyiRvY+WdT7yNpNMkVrpzJe5CBN9p/9YeSsiurN5lgwb0iVP/woBGYpy
	1tfyMdeXwq5X9OjyEixileGyyx7jkx2HQTsZAVtboAO7X5PP5NRrZ/9YMQiwxwZXFLUvriRjEDD
	6DWBVLYKRg3ZMDBIpXtER6nbzzmXNTs5J9Ge+3q4k6z30QTEdXwej+/APugCmPa30cmeggORS9W
	KEh3rKrm2kvWQGewcfWEQ8l4PTu3PTEkWLoub0z84J7617ZW4oV6m2gyxqk9FXIM5ee/iBnT1Bs
	+BAX9rWqgYxIPB4UKog9Diujm39we4i+km2MrCZCdPesDKTCYzBX6aCxB85FBpmJ8yWzTTQzr90
	Dw+9A45TwWvnr8B75AGtYjkEw9U6NJNlz
X-Google-Smtp-Source: AGHT+IEJNkokwtPxBj5TVhHUY/OMcYq7/YWudHlwS40V38kdY+UNtOgZxaE7b3PWe17U5E28fAWb5A==
X-Received: by 2002:a05:6000:248a:b0:3df:22a3:d240 with SMTP id ffacd0b85a97d-3edd43ac9ebmr7278197f8f.4.1758326271853;
        Fri, 19 Sep 2025 16:57:51 -0700 (PDT)
Message-ID: <de20c915-e05f-48a7-a2fd-51b4befca525@suse.com>
Date: Sat, 20 Sep 2025 01:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <18ed5517721254a56e992d9cd9bc1a64672eda8a.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18ed5517721254a56e992d9cd9bc1a64672eda8a.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> @@ -342,11 +354,147 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>      return P2M_TABLE_MAP_NONE;
>  }
>  
> +static void p2m_put_foreign_page(struct page_info *pg)
> +{
> +    /*
> +     * It’s safe to call put_page() here because arch_flush_tlb_mask()
> +     * will be invoked if the page is reallocated before the end of
> +     * this loop, which will trigger a flush of the guest TLBs.
> +     */
> +    put_page(pg);
> +}

What is "this loop" referring to in the comment? There's no loop here.

> +/* Put any references on the page referenced by pte. */
> +static void p2m_put_page(const pte_t pte, unsigned int level, p2m_type_t p2mt)
> +{
> +    mfn_t mfn = pte_get_mfn(pte);
> +
> +    ASSERT(pte_is_valid(pte));
> +
> +    /*
> +     * TODO: Currently we don't handle level 2 super-page, Xen is not
> +     * preemptible and therefore some work is needed to handle such
> +     * superpages, for which at some point Xen might end up freeing memory
> +     * and therefore for such a big mapping it could end up in a very long
> +     * operation.
> +     */
> +    switch ( level )
> +    {
> +    case 1:
> +        return p2m_put_2m_superpage(mfn, p2mt);
> +
> +    case 0:
> +        return p2m_put_4k_page(mfn, p2mt);
> +
> +    default:
> +        assert_failed("Unsupported level");

I don't think assert_failed() is supposed to be used directly. What's
wrong with using ASSERT_UNREACHABLE() here?

> --- a/xen/arch/riscv/paging.c
> +++ b/xen/arch/riscv/paging.c
> @@ -107,6 +107,14 @@ int paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
>      return 0;
>  }
>  
> +void paging_free_page(struct domain *d, struct page_info *pg)
> +{
> +    spin_lock(&d->arch.paging.lock);
> +    page_list_add_tail(pg, &d->arch.paging.freelist);
> +    ACCESS_ONCE(d->arch.paging.total_pages)++;

More a question to other REST maintainers than to you: Is this kind of
use of ACCESS_ONCE() okay? By the wording, one might assume a single
memory access, yet only x86 can actually carry out an increment (or
alike) of an item in memory in a single insn.

Jan


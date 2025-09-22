Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D84B9274E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 19:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127909.1468446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0kRx-0003LR-5o; Mon, 22 Sep 2025 17:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127909.1468446; Mon, 22 Sep 2025 17:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0kRx-0003KL-2K; Mon, 22 Sep 2025 17:35:41 +0000
Received: by outflank-mailman (input) for mailman id 1127909;
 Mon, 22 Sep 2025 17:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0kRv-0003KF-Po
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 17:35:39 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cd88cbc-97da-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 19:35:37 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so2306818f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 10:35:37 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3306064edb8sm13923125a91.7.2025.09.22.10.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 10:35:36 -0700 (PDT)
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
X-Inumbo-ID: 8cd88cbc-97da-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758562536; x=1759167336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=orYSQfBASql4iF0wCOgQN3xflN64DbRXmnfV23xwClI=;
        b=EA4lbsC5oxJEKWa7jiHtZ922Xm74AoLtMz3nxxr/njHOiPqK4jxDZjOA8D64DNbdFO
         5LS5sbdIM92WI67aNTZXsTrlzDbMiRIaRvw66qqulvXha9KAMY91rZZRmgpgPZqqWSYc
         ZyBx/3KM1Yg3aBOBvx9SVxK0C+KDJIFuVXclXPP6u4C/xzjMB4qY2BT0iqaeNOBXGRMv
         oGgDv/5Qs1xRJ/XCR3rcpBFOHzI0lDce8jua5JszxIp4z2HcSJQtrwYzFsGhbVn8u1Lf
         aH6uB4xQGHTnE6cJAXszgmt1dMAxGbnJRLlXaTApcgyL9+YnvG20d2aL1n1ckjxsFCYH
         cqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758562536; x=1759167336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orYSQfBASql4iF0wCOgQN3xflN64DbRXmnfV23xwClI=;
        b=V2vsdIQkDnSHveGomlsQuBV+sHxTmDelUfSXBa67Vfj/p2+THPIYBIleQzstBp7WYX
         1zW4pwQyV67tNo6qhOHc9UW6vzIq4XUdT4DecLZ/u5g8kWCrFgGsPMeh9Tro/FIPkVGS
         7f9WriiEo4Usd1GND8Xjf6EQyHgNqkmtjKN+IoHPBWLbLx61fuPbteASfFYqTINnON88
         wUhXLz6oOdToqt7RB2Z8lNX9WY8qd+M5i7X/o7xCi3U8/jTGWxIwCTptuZfZbxEqWN1Z
         /huQLr4/oLP9HyRW+l1qFbn8OOhFfJCSE56NOAVKBhMkj2xjxKc6qzT3B78qXbj5TJyX
         e/ug==
X-Forwarded-Encrypted: i=1; AJvYcCVARfVNjD6edoEK771xKiUX22sOpYSlAYJG+R8/i6btJ3DjD7bXan/OwsaDE6O4yRqcpeNfj9RCb/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbQ8zpwjl/RTtvEjz6zGIBko08IfpFTbXIh9oCnr4I886peYEb
	HFTohB2LvzcH3KHBbJWLM4OoA12hIlyMAXNpkKrO4sJgn9r+/JVFCpyCJBFu8Jq/Ww==
X-Gm-Gg: ASbGncsNuO8FyihC5a6Nj0WvrrrRt+aDBoKBE3kYayWA/uBqN6FRm3bm/kzQ0hG8zMI
	02ZIlvxshWljHwIBDx1VbIlHnYItK8RiI/Aw34gIlmZRY8EaB7oAW115AA0h+M+Vi8HgTmHyKpU
	OR0o+WDb2Xu4mf8TowmuAYPRRvsMQL7sVkJ8pLc2dRfkN/Li/EkLMwFKkDqziDCoOy3TuAW6IPQ
	HjMItDeFjqZHaJeNgVw+EZV9vlhcdCxM1DUcSgbeLmuz5exDQVrqs0Iqlooe9I0fHeSzDZSEWSh
	ticiE8uu0sED9O5nSMJIztohA3XjNKuVpBHVDR3a8eDVkhOEdFuYS9GCjdnC7JbLs5r2sO1+nI/
	LjEpNtQqzEsQf6hgYx/jxoP37COXo/8DZ
X-Google-Smtp-Source: AGHT+IFZsuSpeBMsF8HsNI5Y3qjYF6Bf4uBmhPbNXJdp0EqPsQEkJlNBfoQAh4aYgh/R9qec5tVTNQ==
X-Received: by 2002:a05:6000:4210:b0:3da:e7d7:f1e0 with SMTP id ffacd0b85a97d-3ee7e6c0f4dmr12477861f8f.27.1758562536504;
        Mon, 22 Sep 2025 10:35:36 -0700 (PDT)
Message-ID: <0cf7a47f-f852-479a-bfb2-2f723f66c72e@suse.com>
Date: Mon, 22 Sep 2025 19:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/18] xen/riscv: implement p2m_next_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <30a203de44b04a06613aa1f873a072a4594c5bb4.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <30a203de44b04a06613aa1f873a072a4594c5bb4.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> Implement the p2m_next_level() function, which enables traversal and dynamic
> allocation of intermediate levels (if necessary) in the RISC-V
> p2m (physical-to-machine) page table hierarchy.
> 
> To support this, the following helpers are introduced:
> - page_to_p2m_table(): Constructs non-leaf PTEs pointing to next-level page
>   tables with correct attributes.
> - p2m_alloc_page(): Allocates page table pages, supporting both hardware and
>   guest domains.
> - p2m_create_table(): Allocates and initializes a new page table page and
>   installs it into the hierarchy.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - make `page` argument of page_to_p2m_table pointer-to-const.
>  - Move p2m_next_level()'s local variable `ret` to the more narrow space where
>    it is really used.
>  - Drop stale ASSERT() in p2m_next_level().
>  - Stray blank after * in declaration of paging_alloc_page().

When you deal with comments like this, can you please make sure you
apply them to at least a patch as a whole, if not the entire series?
I notice ...

> --- a/xen/arch/riscv/include/asm/paging.h
> +++ b/xen/arch/riscv/include/asm/paging.h
> @@ -15,4 +15,6 @@ int paging_ret_pages_to_freelist(struct domain *d, unsigned int nr_pages);
>  
>  void paging_free_page(struct domain *d, struct page_info *pg);
>  
> +struct page_info * paging_alloc_page(struct domain *d);

... there's still a stray blank here. With this dropped:
Acked-by: Jan Beulich <jbeulich@suse.com>
I have one other question, though:

> +/*
> + * Allocate a new page table page with an extra metadata page and hook it
> + * in via the given entry.
> + */
> +static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
> +{
> +    struct page_info *page;
> +
> +    ASSERT(!pte_is_valid(*entry));

Isn't this going to get in the way of splitting superpages? The caller
will need to initialize *entry just for this assertion to not trigger.

Jan


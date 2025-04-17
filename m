Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11481A91FD0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957896.1350904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QLl-0007wR-36; Thu, 17 Apr 2025 14:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957896.1350904; Thu, 17 Apr 2025 14:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QLl-0007uz-0R; Thu, 17 Apr 2025 14:36:21 +0000
Received: by outflank-mailman (input) for mailman id 957896;
 Thu, 17 Apr 2025 14:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5QLj-0007uq-8M
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:36:19 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52b434bb-1b99-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 16:36:18 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so555471f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:36:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50eb03d2sm215025ad.142.2025.04.17.07.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:36:16 -0700 (PDT)
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
X-Inumbo-ID: 52b434bb-1b99-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744900577; x=1745505377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KZmTl63M8aRcZr04oKX+Qkaj8b6tyUndRWXOjit9maE=;
        b=S/J+1Y5wk1hb2XkmlWF9pVgXOU1SxuhoXkrvi+ComYiXLcRXQVPPeXQaKlmPOcURjI
         s5dFi/XmnSBYRVB/z+whU/iWClx5slH1KLxHIX+iapUInGIEebZ1lgvx9kPQnUqUn0w3
         odOiknLGeUN1PWtj05dIHXqnbJiSBp8Fpcd0PpSFwjSOv3BvXAgVtwP65w/RfT4R1ehL
         KQonYHsuRlJt61EVo5sEHojgz1Zd/tL1tXT21fxLhfUeQPGILN1ttChG7NXmVvwK+Pcr
         CNMGyUho/W79RqNU3e7uhasJsYnlK3BvgrK4YeQ3eAonio1delsqQQ6rTb6OOm1V/6Br
         wJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900577; x=1745505377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZmTl63M8aRcZr04oKX+Qkaj8b6tyUndRWXOjit9maE=;
        b=h3GylmPIUqshPWbUdY8VDE/mtluNk5RP7lYzh01efiAW/PWXibmY3nsv1TkwUkDPXy
         NStty2UVGlqWzIpG+tRicnBYgXvwxaMH7a4NE51pv63xJebnCdw1B2pVUllrlBVEiOZ/
         b+dLZ92ycWJspsjsmoWepxR4m/yzUHS/F1Xs/OiquNgTKIMD9CULwZVo1hY+Z9idU5PR
         npnpYuLeeCg+8N2OvIQ1Z/h6RQFiwVaDVDd6P/6X5UM0+p4GeI+/kvDdI5uV+NlaSE/d
         pdT9R3RXDTSLHagrMRDqWrMmDcu9hj90Bop/BI/tT+p2U+Ed1tRrIec5fBKGIZaFPnPc
         HWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrK6uMdxfb1zT/Smo+tfYe8ud1LmE4R1MEZ9HgINWoiH4yFbYhuXx3aco4Ej4rb8MDLnUIUoQZ3Nw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqTyL+ht6x4k/jjsOYwci1I/8LaIpICzgKAJD4j9awUFucXMXL
	rGMg2hiIuuv0PNWijkQ+zFoPCsPR32V6XhgTunthr3BEq7H96LKBtjk+w4CWRQ==
X-Gm-Gg: ASbGncvQMsf8eZeRDg3LtcPARiWctW0UQQU7lHitCtf1divO0C3CFf2cIdqNpf7VjUf
	OaRezfa2oO/wSUTTr3SojShythanX23HbSpU6hfohVWJIft9J2Ao2HigP0Pefi5JQqK2uaIcV80
	Mv+DxdcErs+ysjFyaCWGzvxKR+kRphFI/mqWYhyegInoFOpHdMFe3318nnBwioI2YihadKZEs1A
	xZNltO2kM8efpE5z7RBgns41IZ/w1uTgCJivmFpk76BNW6zflFDTcNLl8S4snyMYSalxMkIFj20
	6Pp3xk9ly7d9StQLelRrdA5lHhbUx01QKcc4bTHTsGq9zEwc51ReoMxVTTpVIdzqstX3nMcxk3b
	Q+nfHaNlhqGF1BgEMPSwqNam7IRXbiLu6LlDo
X-Google-Smtp-Source: AGHT+IGNeJ0gsJAITXwBNIBtxapCsJuzgyvzdU9p4i26HTCLcslQ2Ki/OsDN0336g2zL1s2H96xe9Q==
X-Received: by 2002:a5d:584a:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-39ee5b9f98cmr5695817f8f.43.1744900577506;
        Thu, 17 Apr 2025 07:36:17 -0700 (PDT)
Message-ID: <1e7ba51b-8943-4001-be2f-9181e7362223@suse.com>
Date: Thu, 17 Apr 2025 16:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] asm-generic: move some parts of Arm's
 domain_build.h to common
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <1c67078147c4a89e46f253f040bef5046fac9ca9.1744626032.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1c67078147c4a89e46f253f040bef5046fac9ca9.1744626032.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 17:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __XEN_FDT_DOMAIN_BUILD_H__
> +#define __XEN_FDT_DOMAIN_BUILD_H__
> +
> +#include <xen/bootfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/fdt-kernel.h>
> +#include <xen/types.h>
> +
> +#if __has_include(<asm/domain_build.h>)
> +#   include <asm/domain_build.h>
> +#endif

Why is this conditional include needed? There's ...

> +struct domain;
> +struct page_info;
> +struct membanks;
> +
> +typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
> +                                     unsigned int order, void *extra);
> +bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
> +                             alloc_domheap_mem_cb cb, void *extra);
> +
> +bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> +                          paddr_t tot_size);
> +void allocate_memory(struct domain *d, struct kernel_info *kinfo);
> +int construct_domain(struct domain *d, struct kernel_info *kinfo);
> +int make_chosen_node(const struct kernel_info *kinfo);
> +int make_cpus_node(const struct domain *d, void *fdt);
> +int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
> +                         int addrcells, int sizecells);
> +int make_memory_node(const struct kernel_info *kinfo, int addrcells,
> +                     int sizecells, const struct membanks *mem);
> +int make_timer_node(const struct kernel_info *kinfo);
> +
> +unsigned int get_allocation_size(paddr_t size);
> +
> +#endif /* __XEN_FDT_DOMAIN_BUILD_H__ */

... nothing here showing any dependency thereon.

Jan


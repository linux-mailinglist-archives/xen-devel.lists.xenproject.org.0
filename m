Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E618CA436C8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 09:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895457.1304086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmprC-0004ow-RC; Tue, 25 Feb 2025 07:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895457.1304086; Tue, 25 Feb 2025 07:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmprC-0004nR-O5; Tue, 25 Feb 2025 07:59:58 +0000
Received: by outflank-mailman (input) for mailman id 895457;
 Tue, 25 Feb 2025 07:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmprA-0004nL-TS
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 07:59:56 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f82ee7d-f34e-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 08:59:54 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4394a823036so49992075e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 23:59:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm131301785e9.22.2025.02.24.23.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 23:59:53 -0800 (PST)
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
X-Inumbo-ID: 7f82ee7d-f34e-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740470394; x=1741075194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=je30tdEyMQIOcEUgzSoWQOOgDMbohTXppRVMlyF/xE8=;
        b=gIgEAChtktbGiD3ojDoocal7x8bZ0TGl2/PZ979CYkUd9eBXKsgycORE1tzA44Tb70
         57FZJpIc+3sA0Sje36g722Kl3FQ6da52A+DDaA+otIuoVRzZbJc5jsnWPFz+AZuSjw1Y
         dnJMeyu6O8UZfVROkQKc5cN+gibUdAoogh3ydh9rrqQ/H1khrdpQc8aexDPYxkRp3RAa
         WAxpjLqKJyHIlrutpiw33Y12Kv3OC2eCN3wj07yHYHeGZGuqaQg7FlOTlMJN+6oRG/k/
         en6MAXo4kLnR3ecFbz4iC1daSMrU3cQwEJi4YA+DIFHrKHifGVbFdGqnstu2gkoX0lnK
         zJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470394; x=1741075194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=je30tdEyMQIOcEUgzSoWQOOgDMbohTXppRVMlyF/xE8=;
        b=GVhX1YfVzapv/vYptp+AtNscuFa30XU8w6GoFdfuxIqhP77On+qjp64/TQtaLwgI0b
         eHHZciMd90bmIcL8tx9PkcF8J1XsdmDskgnrYto06QT8pJUGfDDb63e65+vcXjHZPuBa
         L4ypLViD7w+bl7ir+REmzMo/W35q+QhK+jqoDDdk/2lCDFOgMgcJnVk9il3A9wUUZpHo
         xAvb2Zu1gweg8IpdMd6U8I60J3tOZ3xdz+dIqPQ+diu8Buvpl6RA+DefzowYqEOto/px
         qbe+oeuftTMzBduw40VVisHSPvw1PVj+A5bpT4QFCZBk7re6kI+Nh6cQzmbGFymRxXbU
         JxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjAxkwVCNfcD65XgRVvDO753PLIY3CIjyuCFGehGk5iGODkg9DH4ZZRPzQcdmSGYLQs1RnKDMrh7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu2oskugKqeYqgWWC5hSEC83ROOaO24OoDz0bFSz6/gTSDLzlw
	aAZjDrcuqc69EQovps2N+tMHxCrzu3EEpE+JicHfrtPjM4QUbFUqYN+5cSY96Q==
X-Gm-Gg: ASbGncvCUrQWg+Vy85NVFGRDYxNUtWXsZQgs9jqPS/6a1KeQYUuy6Dhq3SR6ChATn3f
	Kvr8RJQZOnzChJg+ziFIzRYyVG9GQzSRdS/e5htQ4LXZXamcNL5KrOgoTKCk3QyTfkDNhKASAan
	7IiJ066edP3M2ybF/xRwi+qlJ63W/XYTBmqoynJ+8wzLR3Xx9hKtIIZ7BFOd3hwi7YUlOGMm+nO
	oQpzRMefFTp7VUMxlb1vAimSf7EisMVbtT4iYJ4KsIQu7sBM7bim+DiVBDYSGuB7ve4eWddQ/zW
	2j4cc6Dnr4SQUZmxhHYhIT5+A2Rdidkcv41Qn0eozPXlILETY5vbTNS2MH5fyJ6ugl+q929Fd9h
	wkRGyzzyIWJ8=
X-Google-Smtp-Source: AGHT+IGjU+oeCRWieDYEZVzlHsqvTJknkBFPoSQZszIVrsxpxHIUecY9sRHEPYX6JiD6LkU+M5hqqg==
X-Received: by 2002:a05:600c:450d:b0:439:9a43:dd62 with SMTP id 5b1f17b1804b1-439aebb2d6fmr101684335e9.24.1740470394006;
        Mon, 24 Feb 2025 23:59:54 -0800 (PST)
Message-ID: <cb1c97db-dba4-4dd4-bf93-7042b6edd20e@suse.com>
Date: Tue, 25 Feb 2025 08:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v5 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739985805.git.oleksii.kurochko@gmail.com>
 <f474bdd1393d376111559fc5b7b01f035d52dd44.1739985805.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f474bdd1393d376111559fc5b7b01f035d52dd44.1739985805.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2025 18:44, Oleksii Kurochko wrote:
> When pt_update() is called with arguments (..., INVALID_MFN, ..., 0 or 1),
> it indicates that a mapping is being destroyed/modifyed.
> 
> In the case when modifying or destroying a mapping, it is necessary to
> search until a leaf node is found, instead of searching for a page table
> entry based on the precalculated `level` and `order`(look at pt_update()).
> This is because when `mfn` == INVALID_MFN, the `mask` (in pt_mapping_level())
> will take into account only `vfn`, which could accidentally return an
> incorrect level, leading to the discovery of an incorrect page table entry.
> 
> For example, if `vfn` is page table level 1 aligned, but it was mapped as
> page table level 0, then pt_mapping_level() will return `level` = 1, since
> only `vfn` (which is page table level 1 aligned) is taken into account when
> `mfn` == INVALID_MFN (look at pt_mapping_level()).
> 
> Fixes: c2f1ded524 ("xen/riscv: page table handling")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v5:
> - Rename *entry to *ptep in pt_update_entry().
> - Fix code style issue in the comment.
> - Move NULL check of pointer to `table` inside unmap_table and then drop
>   it in pt_update_entry().

Imo this last aspect wants mentioning in the description.

> @@ -422,17 +439,40 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
>  
>      while ( left )
>      {
> -        unsigned int order, level;
> -
> -        level = pt_mapping_level(vfn, mfn, left, flags);
> -        order = XEN_PT_LEVEL_ORDER(level);
> +        unsigned int order, level = CONFIG_PAGING_LEVELS;
>  
> -        ASSERT(left >= BIT(order, UL));
> +        /*
> +         * In the case when modifying or destroying a mapping, it is necessary
> +         * to search until a leaf node is found, instead of searching for
> +         * a page table entry based on the precalculated `level` and `order`
> +         * (look at pt_update()).
> +         * This is because when `mfn` == INVALID_MFN, the `mask`(in
> +         * pt_mapping_level()) will take into account only `vfn`, which could
> +         * accidentally return an incorrect level, leading to the discovery of
> +         * an incorrect page table entry.
> +         *
> +         * For example, if `vfn` is page table level 1 aligned, but it was
> +         * mapped as page table level 0, then pt_mapping_level() will return
> +         * `level` = 1, since only `vfn` (which is page table level 1 aligned)
> +         * is taken into account when `mfn` == INVALID_MFN
> +         * (look at pt_mapping_level()).
> +         *
> +         * To force searching until a leaf node is found is necessary to have
> +         * `level` == CONFIG_PAGING_LEVELS which is a default value for
> +         * `level`.

There looks to be an "it" missing before the 2nd "is". I'm also unconvinced the
part starting with "which" is really necessary.

Preferably with these small adjustments (I'd be happy to do so while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


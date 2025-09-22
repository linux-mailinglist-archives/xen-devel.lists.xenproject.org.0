Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F6B9328C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 22:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127995.1468506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0mka-0006mJ-4X; Mon, 22 Sep 2025 20:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127995.1468506; Mon, 22 Sep 2025 20:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0mka-0006kd-1L; Mon, 22 Sep 2025 20:03:04 +0000
Received: by outflank-mailman (input) for mailman id 1127995;
 Mon, 22 Sep 2025 20:03:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0mkZ-0006kX-5r
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 20:03:03 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24309acf-97ef-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 22:03:01 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so1813455f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 13:03:01 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698035d337sm137799115ad.139.2025.09.22.13.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 13:02:59 -0700 (PDT)
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
X-Inumbo-ID: 24309acf-97ef-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758571380; x=1759176180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atzPYGCgOqH/2Y8PzDOhEOycEOaBp1bZqsqy2w7npww=;
        b=O7lxIQ+sEQ52wKzoCXogEUBH4G1T3tI70+A+qK1al3IRDeBmNoIBJnu018bIOFGjnm
         n7/XjGQKqUdaVlMcOYqvWB1HpvUQet1y8Zb0XwKQ1LOPK2FVd/hoJza/rXZrA1NzDeiE
         kzmohiU7Za5zdfcSImlH6oQiLmkYf8xktFEAu56KuzL67vaa9GNY/Zj28i4chMInTrQQ
         Rtq+itzntCTSfZ1RexxmtDo0nF64mNz7pKymX6qLst38+jEqzzJWM1WM9cJVmHCgfDRf
         bDgMUbYcpb78vh4UPNE8bzM7QlVq634cAycYOHwfTbGfMjeSEB57qOvNcBE1eODNpIAe
         PXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758571380; x=1759176180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atzPYGCgOqH/2Y8PzDOhEOycEOaBp1bZqsqy2w7npww=;
        b=NEQjRU4wa10zvab2R7G7uHNjoNodONLrr01nefDCMEdL0heT2Mpzz63RzqOcTQ7cGR
         imRm+98m6c/4J0IyzfytnF8PMKmQO34HC6Yb56SwYZxZFhJlCLr+cPBqR6U7uguT7v1k
         hQ/w3qubC3qm7/dCsKJkHCbCg3NLw8UPGRSiyCcGAN8vGXTXqnXiXDfy72uEZcL/Kzt1
         8oH9u7nDCHLiinYtFDkbteZFwUF1Fc2+UcLnRLcyz60zBVl8yysMoBe/4Q7QFME4y76Y
         8Oqxn6ca1+ZApVblpS4b+fJxwkRDhYQ7XlheAOtY4tq+vjFpX3sUvKi6GbM+FucHqb3V
         brUA==
X-Forwarded-Encrypted: i=1; AJvYcCWwR8Wno0FK4dPrxX/pl12KDL/FJbq0M2VQiAY/1zlemj8NiM9Dl+vpwSut3n1evstTQ6Z1PjE4/HM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsIqt6Pr9miQtyhONRxMR2ZmunTYVmEtDeIcs9igUgH4RLE+nA
	yULsssPOxN+LgqyPB1phns+UC5MobsOboAzPDyHeTpoyrK15WMEt4G0g9F8DUCOC8A==
X-Gm-Gg: ASbGncvbNn/Vp6jxx/YAg2CMUSHPJP4EFDkY1RADTVlp20eOc2ReQ2M7f+h9l8Yeifd
	RA1/8WaugykaaM+CJQvoySb08OodItK0LGueEg6P6uXCqBgm+aT7bAlQB89yZsC7Er3uyWiW1X8
	ke+58PRHvlFZr0Xko0zGNz/yr8n/0ZdNGL8CH2OvVUIWdDJ/9kL+0ecSRri+5VX4ZOofTldaHT5
	uXconS4qnGUbIkFaySBq5Vy3jumP3xt2l5L4N48i6SOalBrqm0fkjJv2WJ6obL8YlJZcd8hbjqw
	ZFmKFLnGHn0XeHw+IEVRofrCtF160TP4yzHAl7R9tSdZfHJ2YdoPGXdldJNE8nA9ukApYO9eHSp
	57wRXZwjSN9y55f2PNA+wHHN/CWSMd9Z7
X-Google-Smtp-Source: AGHT+IEcqnZgMFha6jm/TEB+aotOlCXivnGvdvual/2HisH28kWM5IrwCsAzg3iTxLcGkkZHTBhPBQ==
X-Received: by 2002:a05:6000:2404:b0:3e8:68:3a91 with SMTP id ffacd0b85a97d-3ee87327ab7mr11233343f8f.60.1758571380362;
        Mon, 22 Sep 2025 13:03:00 -0700 (PDT)
Message-ID: <0fcec56c-50cd-4427-864a-3c750d66f813@suse.com>
Date: Mon, 22 Sep 2025 22:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/18] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <09317ebbd1f6fb7dda9454aa7e0b1ba3cbd0726c.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <09317ebbd1f6fb7dda9454aa7e0b1ba3cbd0726c.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> Implement the mfn_valid() macro to verify whether a given MFN is valid by
> checking that it falls within the range [start_page, max_page).
> These bounds are initialized based on the start and end addresses of RAM.
> 
> As part of this patch, start_page is introduced and initialized with the
> PFN of the first RAM page.
> Also, initialize pdx_group_valid() by calling set_pdx_range() when
> memory banks are being mapped.
> 
> Also, after providing a non-stub implementation of the mfn_valid() macro,
> the following compilation errors started to occur:
>   riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
>   /build/xen/common/page_alloc.c:1054: undefined reference to `page_is_offlinable'
>   riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1035: undefined reference to `page_is_offlinable'
>   riscv64-linux-gnu-ld: prelink.o: in function `reserve_offlined_page':
>   /build/xen/common/page_alloc.c:1151: undefined reference to `page_is_offlinable'
>   riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_is_offlinable' isn't defined
>   riscv64-linux-gnu-ld: final link failed: bad value
>   make[2]: *** [arch/riscv/Makefile:28: xen-syms] Error 1
> 
> To resolve these errors, the following functions have also been introduced,
> based on their Arm counterparts:
> - page_get_owner_and_reference() and its variant to safely acquire a
>   reference to a page and retrieve its owner.
> - Implement page_is_offlinable() to return false for RISC-V.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with two cosmetic adjustments:

> @@ -642,3 +648,30 @@ void put_page(struct page_info *page)
>              free_domheap_page(page);
>      }
>  }
> +
> +bool page_is_offlinable(mfn_t mfn)
> +{
> +    return false;
> +}

I think this wants to move elsewhere, or ...

> +struct domain *page_get_owner_and_reference(struct page_info *page)

... this wants to move up, such that the "get" and "put" logic are next
to each other.

> +{
> +    unsigned long x, y = page->count_info;
> +    struct domain *owner;
> +
> +    do {
> +        x = y;
> +        /*
> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
> +         * Count == -1: Reference count would wrap, which is invalid.
> +         */
> +        if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
> +            return NULL;
> +    }
> +    while ( (y = cmpxchg(&page->count_info, x, x + 1)) != x );

This again wants the figure brace placement corrected.

Jan


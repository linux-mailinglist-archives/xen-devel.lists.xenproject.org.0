Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475208FFC8B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 09:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736231.1142286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFTbS-0000ad-QP; Fri, 07 Jun 2024 07:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736231.1142286; Fri, 07 Jun 2024 07:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFTbS-0000YF-Na; Fri, 07 Jun 2024 07:01:34 +0000
Received: by outflank-mailman (input) for mailman id 736231;
 Fri, 07 Jun 2024 07:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sFTbQ-0000Y3-P1
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 07:01:32 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3383466-249b-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 09:01:28 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57a44c2ce80so1962046a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 00:01:28 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae0db916sm2269777a12.35.2024.06.07.00.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 00:01:27 -0700 (PDT)
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
X-Inumbo-ID: c3383466-249b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717743688; x=1718348488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2TnzugukcPNWIZEkDdBk97PVqyuzruiroUpyxHvT3XE=;
        b=ZQVG2eS5U2vpVuOK4GB8ln2hJODWvQkaU3SuaTFMj3D6uJEzKCu5iiOvFDvW4mkh/4
         6VXpDuzyKyTuw5RaGuHdK8oZVZ4PktaT8b3TIGgD4RO1uh++RZM5XZXOKo7GDR+/jNI9
         Ha21FqnxjjuwFMcIse7dDjvEV5mv7XY1eZr/cQ+OViURvufk21xMlzMUwCIBZedWMlZs
         ACSxtvZutEVPvdOsjWWXszSN2hRzAL1Z3yfqj/3WOQXGBgm6nx32TyMjWdNzyLMmpQuL
         1fBNWfDlOCddywF7CmQHZIAsOAgGgEYqFZDLpzQRVBvaV+qH/EPlytz89hVwGmCTq0qL
         ngQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717743688; x=1718348488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TnzugukcPNWIZEkDdBk97PVqyuzruiroUpyxHvT3XE=;
        b=vpFTH2+fmWBYXw+zbRiuAhK2ARxsdUm4vaLgXdIg4HG7sADDy6bcwa8AzdCyMbL/Eg
         ceDBxKNINXKK2mENBvmN4/7nFCk4enoIgqOM489Na3qwM23/xqdVS37XgP9fO0SmUp2i
         p4XxLUG3O6TtNaI3xR8FbXJUucqXsQVaWVRCc2dxFj/tddTkbUAEAIBGW+ZGLxdYYWH0
         OvSbpGjdd3nxUgtvR8hfGKjUfmZ3oRMeF6L3jsNVGZGcmRCHg1jcqJNWSKdF1HUespmi
         qMrO++2mV/Ydhoh6e8fv2tkSNITSvmkofMg1yljeyLnwV73BJ8qey8jXbnjw3wsYAJQi
         KxlA==
X-Forwarded-Encrypted: i=1; AJvYcCUV7WD6mRkKiLLz7TfWh+TiwnnsSxIT3S01EYEvZZtVKKkkZyxNL+qTglDmyJl7ONf7yQ8rDJUAYxRIcgsd2xYi7kuhqqdKqZugNCHXpEU=
X-Gm-Message-State: AOJu0Yy8gVn9Z71BtVaW5VmsxiuwoWz1jITUlIbDiCR5IQfzbR+xNGP3
	c33L68epOoAfuoyKwC5L+IXH2dXMF3EAD9nrNW/VSjIQXkB52F7dCbtzd+XfBA==
X-Google-Smtp-Source: AGHT+IGOt5/Cq1f6ttx1qaeWdzW59G9LMskWyRJa7pSs+IyWCbHGsugGZg17FtDfvRySXGsBPwXzKQ==
X-Received: by 2002:a50:8ad7:0:b0:57a:76d4:d890 with SMTP id 4fb4d7f45d1cf-57c509a64d3mr750227a12.41.1717743687996;
        Fri, 07 Jun 2024 00:01:27 -0700 (PDT)
Message-ID: <d2ce1c48-fd95-47f9-b821-8e01d5006e8e@suse.com>
Date: Fri, 7 Jun 2024 09:01:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2024 17:39, Marek Marczykowski-Górecki wrote:
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -522,9 +522,34 @@ extern struct rangeset *mmio_ro_ranges;
>  void memguard_guard_stack(void *p);
>  void memguard_unguard_stack(void *p);
>  
> +/*
> + * Add more precise r/o marking for a MMIO page. Range specified here
> + * will still be R/O, but the rest of the page (not marked as R/O via another
> + * call) will have writes passed through.
> + * The start address and the size must be aligned to MMIO_RO_SUBPAGE_GRAN.
> + *
> + * This API cannot be used for overlapping ranges, nor for pages already added
> + * to mmio_ro_ranges separately.
> + *
> + * Since there is currently no subpage_mmio_ro_remove(), relevant device should
> + * not be hot-unplugged.

Yet there are no guarantees whatsoever. I think we should refuse
hot-unplug attempts (not just here, but also e.g. for an EHCI
controller that we use the debug feature of), but doing so would
likely require coordination with Dom0. Nothing to be done right
here, of course.

> + * Return values:
> + *  - negative: error
> + *  - 0: success
> + */
> +#define MMIO_RO_SUBPAGE_GRAN 8
> +int subpage_mmio_ro_add(paddr_t start, size_t size);
> +#ifdef CONFIG_HVM
> +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla);
> +#endif

I'd suggest to omit the #ifdef here. The declaration alone doesn't
hurt, and the #ifdef harms readability (if only a bit).

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -150,6 +150,17 @@ bool __read_mostly machine_to_phys_mapping_valid;
>  
>  struct rangeset *__read_mostly mmio_ro_ranges;
>  
> +/* Handling sub-page read-only MMIO regions */
> +struct subpage_ro_range {
> +    struct list_head list;
> +    mfn_t mfn;
> +    void __iomem *mapped;
> +    DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
> +};
> +
> +static LIST_HEAD(subpage_ro_ranges);

With modifications all happen from __init code, this likely wants
to be LIST_HEAD_RO_AFTER_INIT() (which would need introducing, to
parallel LIST_HEAD_READ_MOSTLY()).

> +int __init subpage_mmio_ro_add(
> +    paddr_t start,
> +    size_t size)
> +{
> +    mfn_t mfn_start = maddr_to_mfn(start);
> +    paddr_t end = start + size - 1;
> +    mfn_t mfn_end = maddr_to_mfn(end);
> +    unsigned int offset_end = 0;
> +    int rc;
> +    bool subpage_start, subpage_end;
> +
> +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> +        size = ROUNDUP(size, MMIO_RO_SUBPAGE_GRAN);

I'm puzzled: You first check suitable alignment and then adjust size
to have suitable granularity. Either it is a mistake to call the
function with a bad size, or it is not. If it's a mistake, the
release build alternative to the assertion would be to return an
error. If it's not a mistake, the assertion ought to go away.

If the assertion is to stay, then I'll further question why the
other one doesn't also have release build safety fallback logic.

> +    if ( !size )
> +        return 0;
> +
> +    if ( mfn_eq(mfn_start, mfn_end) )
> +    {
> +        /* Both starting and ending parts handled at once */
> +        subpage_start = PAGE_OFFSET(start) || PAGE_OFFSET(end) != PAGE_SIZE - 1;
> +        subpage_end = false;
> +    }
> +    else
> +    {
> +        subpage_start = PAGE_OFFSET(start);
> +        subpage_end = PAGE_OFFSET(end) != PAGE_SIZE - 1;
> +    }

Since you calculate "end" before adjusting "size", the logic here
depends on there being the assertion further up.

Jan


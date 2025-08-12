Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED5B22D99
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 18:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078923.1439953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrtQ-0006zB-Jq; Tue, 12 Aug 2025 16:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078923.1439953; Tue, 12 Aug 2025 16:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrtQ-0006wJ-GU; Tue, 12 Aug 2025 16:30:32 +0000
Received: by outflank-mailman (input) for mailman id 1078923;
 Tue, 12 Aug 2025 16:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x9jM=2Y=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ulrtO-0006qJ-Gu
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 16:30:30 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8afa204-7799-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 18:30:29 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b78d337dd9so3633362f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 09:30:29 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b914e70596sm1709176f8f.61.2025.08.12.09.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 09:30:28 -0700 (PDT)
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
X-Inumbo-ID: a8afa204-7799-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755016229; x=1755621029; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qfyjV2aQwERkeLBqfx62psSD0uVXV64x/x82IAJFOc4=;
        b=ZU8aaYC9X48ROknTFR11JTnkWBW5800SDfentgi5X0SobtfcMdxJ8kpuhTUor5z0AP
         puEP8XkqkLb5yCVTTAwK0l5sNfUDkwxTH/3TAaLtDfWI2jYKMUropKcTd3ybXFqshYUk
         qCzKevhJxNf7rnHDLn6hBVaBYDwUdndwrYXKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755016229; x=1755621029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfyjV2aQwERkeLBqfx62psSD0uVXV64x/x82IAJFOc4=;
        b=wAlxnLEuf7aNP1W0DRlkwVoLO1PBFfXga7Y3xMZKSKIgqTIkWbMp9sPG5b+3emEADa
         LG5FzchqTUQ4QMHwVVHQI4a7BCYRR5kzoNnm/bQiHuqf+XEclZZpPgGN3y3ewc8iNZhT
         FCKo/rQGylwn//MGm0xbnsT/rBpiPvkJARiXM7ZlF6+Ahtv3qZaz+sRBcdhAEHLFfhUt
         KPupehO/U789AwBEANZcvDRHP4lH2sw8w9LGyN3dDaPpeDkEauQjuowSEK/sVbFOpwrU
         pvrZJLV9K9QyZ8hjZwM4KOV9WQe+nMJF1i0P/B/9n5GPyVNKaan4gV8sMCiB3pXQYamJ
         AEPA==
X-Gm-Message-State: AOJu0Yzn5DmRSa9N11r8NIvfMDnO7caI9fQEVZrDZB1BfN2m4EpWKgiZ
	HUBRJAM+TOkKULlVLDz0Nm3d0A1Qjc69xu3b6kuD1vv0lJjGvCP8/COhoTPUkTKSC2g=
X-Gm-Gg: ASbGncsdGJwn2chCxG9mn9Dl4N6kp60xKk80PaPTqNUQcnvGAS8QJ/SXKQ5FPve4ISm
	VormODRKJND87BsSH5SpBpJxj2+w1BHMzMVLYOR0UyT6X2bzsFZfohiYUl/ieToJvz4KfFwPDRX
	DzNpPIKh8+DIszZoV6B5JOat8x4Gt8Nw75C7ovXhRB1iwvaObY1qxwHzmHUh0bLxOkjhUnSXG2D
	bWFohDHqFIPvEK2zZQbXNDljXO9kEaefXaEx1VQ4nOKpk67k0KHv/O3ejbbW/QGZ3ibdbWlh/py
	6jz73qIb9Ft3eTAu8AQ0Un8AuWU4vIcZCLZGDHcQaxEJYz2qu7YfhdUSE4qaGt59wnJANf7FkKy
	aXpS36i4w4/Sp7iTHy8ys0hovi3ZTuzUsmOZsIPQSH/hN3SNMPVd4JhxEg2UeYqmb9g==
X-Google-Smtp-Source: AGHT+IEXlnArkuBKnMlzoaaU2IKYnyn8SKq8qb9OKFuI0pYh8ZJKzWNNaMF5DyC9mAoYzqszoeVE1Q==
X-Received: by 2002:a05:6000:2dc6:b0:3b7:7ceb:1428 with SMTP id ffacd0b85a97d-3b91724c308mr60675f8f.8.1755016228709;
        Tue, 12 Aug 2025 09:30:28 -0700 (PDT)
Date: Tue, 12 Aug 2025 18:30:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/mm: drop unmapping from marking-as-I/O in
 arch_init_memory()
Message-ID: <aJtsIxI4y-UspLKg@macbook.local>
References: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
 <5a862787-40d8-4c9f-bd89-01d866648120@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a862787-40d8-4c9f-bd89-01d866648120@suse.com>

On Mon, Aug 11, 2025 at 12:50:23PM +0200, Jan Beulich wrote:
> The unmapping part would have wanted to cover UNUSABLE regions as well,
> and it would now have been necessary for space outside the low 16Mb
> (wherever Xen is placed). However, with everything up to the next 2Mb
> boundary now properly backed by RAM, we don't need to unmap anything
> anymore: Space up to __2M_rwdata_end[] is properly reserved, whereas
> space past that mark (up to the next 2Mb boundary) is ordinary RAM.

Oh, I see, so this was done to unmap trailing space when the Xen image
region is mapped using 2M pages.

> While there, limit the scopes of involved variables.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: Drop unmapping code altogether.
> 
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -275,8 +275,6 @@ static void __init assign_io_page(struct
>  
>  void __init arch_init_memory(void)
>  {
> -    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
> -
>      /*
>       * Basic guest-accessible flags:
>       *   PRESENT, R/W, USER, A/D, AVAIL[0,1,2], AVAIL_HIGH, NX (if available).
> @@ -292,12 +290,17 @@ void __init arch_init_memory(void)
>       * case the low 1MB.
>       */
>      BUG_ON(pvh_boot && trampoline_phys != 0x1000);
> -    for ( i = 0; i < 0x100; i++ )
> +    for ( unsigned int i = 0; i < MB(1) >> PAGE_SHIFT; i++ )

I would use PFN_DOWN() rather than the shift, but that's just my
preference.

Thanks, Roger.


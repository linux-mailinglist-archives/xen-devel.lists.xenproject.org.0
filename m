Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70799829C50
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 15:17:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665520.1035716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZOG-0005Fh-1Q; Wed, 10 Jan 2024 14:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665520.1035716; Wed, 10 Jan 2024 14:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZOF-0005DW-Tm; Wed, 10 Jan 2024 14:17:07 +0000
Received: by outflank-mailman (input) for mailman id 665520;
 Wed, 10 Jan 2024 14:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixXT=IU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rNZOF-0005DQ-8w
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 14:17:07 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee51d69d-afc2-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 15:17:05 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e4582ed74so34308355e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 06:17:05 -0800 (PST)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bh21-20020a05600c3d1500b0040d987aae3esm2327487wmb.13.2024.01.10.06.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 06:17:01 -0800 (PST)
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
X-Inumbo-ID: ee51d69d-afc2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704896221; x=1705501021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mq39GSEMtRwZf848Jy4bfDCxzIoGwBU8CZ4wfqMzKes=;
        b=b27JFcS3jxzkM28wIBd7oTfknGJ4q+88Jlr3HCP1UlXlxA72Sriw8Gyqu6emBDiyKW
         v3JVb7L9uXpX19bz2/8bQCg4fBk5S7QG+QjYO7mPQPnbTHJPFAVwJmhWkfdLLGsXfJI/
         3VJhojrDPfIZjj6WBaghzZ3dbdInRjZskLI/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704896221; x=1705501021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mq39GSEMtRwZf848Jy4bfDCxzIoGwBU8CZ4wfqMzKes=;
        b=wlr0jqPWf7zhi7zRQbk2XewPTELWGsySs5s2QvUfNjx8XF4dgMhfmBfAJVysNvnnNQ
         EMB4vRRPoWDqMFkGy02sVBGmN2JWjkZwOjwp88EhRkEg+SczMwteSu9t/oOFCQIO8qaB
         ikUxHI0hZPO0tJNzgiE6H8UwXBt10s1kOY79JKNZRA4zLO4GIh37HqlCFvL5alaAqCkd
         RAaRZONrPsIe+/WKAZ3pk3DCKhDal32t/0eOokVy+Ny525dIHg+8yt1mXIQu61ifKvmy
         h06JrnZd8oIhW5w+37yls1i9jFM2VVaUUnvWRayaN453JJl92IJaDJVUrpAj5d4HPRk6
         aDkA==
X-Gm-Message-State: AOJu0YwsV+8tALxjYpeBeTwxUo/QbOwm4rlLZOuahdC37DtDuzcaHMC3
	q8t2HdstXu0DF/CoUuGDpjned3XIqBkvrp81Cg/bBVWCT1k=
X-Google-Smtp-Source: AGHT+IFtDHx0aTnOQa9NPFl2794md7PGZFAqh27MaMsMPJGM3MBRwzCxhcmh6JL2MgjmSBt3sg/szg==
X-Received: by 2002:a05:600c:4f45:b0:40e:4161:2273 with SMTP id m5-20020a05600c4f4500b0040e41612273mr315359wmq.157.1704896221388;
        Wed, 10 Jan 2024 06:17:01 -0800 (PST)
Message-ID: <495da94f-4eff-4098-9f65-b056251704b0@cloud.com>
Date: Wed, 10 Jan 2024 14:16:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] xen/x86: Add topology generator
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-7-alejandro.vallejo@cloud.com>
Content-Language: en-US
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <20240109153834.4192-7-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Review-to-self after running in Gitlab:

On 09/01/2024 15:38, Alejandro Vallejo wrote:
> +    p->basic.lppp = 0xff;
> +    if ( threads_per_pkg < 0xff )
> +        p->basic.lppp = threads_per_pkg;
> +
> +    switch ( p->x86_vendor )
> +    {
> +        case X86_VENDOR_INTEL:
> +            struct cpuid_cache_leaf *sl = p->cache.subleaf;
> +            for ( size_t i = 0; sl->type &&
> +                                i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
> +            {
> +                sl->cores_per_package = cores_per_pkg - 1;
> +                sl->threads_per_cache = threads_per_core - 1;
> +                if ( sl->type == 3 /* unified cache */ )
> +                    sl->threads_per_cache = threads_per_pkg - 1;
> +            }
> +            break;
> +
> +        case X86_VENDOR_AMD:
> +        case X86_VENDOR_HYGON:

Missing braces around the INTEL block due to the variable declarared
there. I'll include that in v2 after the rest of the review comments
come through.

Cheers,
Alejandro


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70D1231123
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 19:52:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Tle-0006hX-Uk; Tue, 28 Jul 2020 17:51:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qgq5=BH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0Tle-0006hS-3L
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 17:51:58 +0000
X-Inumbo-ID: 077d85ce-d0fb-11ea-a91f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 077d85ce-d0fb-11ea-a91f-12813bfff9fa;
 Tue, 28 Jul 2020 17:51:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE6A2AC50;
 Tue, 28 Jul 2020 17:52:07 +0000 (UTC)
Subject: Re: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Eslam Elnikety <elnikety@amazon.com>
References: <20200728083357.77999-1-elnikety@amazon.com>
 <a55fba45-a008-059e-ea8c-b7300e2e8b7d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <278f0f31-619b-a392-6627-e75e65d0d14f@suse.com>
Date: Tue, 28 Jul 2020 19:51:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a55fba45-a008-059e-ea8c-b7300e2e8b7d@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <pdurrant@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 11:26, Andrew Cooper wrote:
> Does this work?
> 
> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
> index ca94e8b453..638f6174de 100644
> --- a/xen/arch/x86/hvm/hpet.c
> +++ b/xen/arch/x86/hvm/hpet.c
> @@ -62,8 +62,7 @@
>   
>   #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n),
> HPET_TN_ROUTE)
>   
> -#define timer_int_route_cap(h, n) \
> -    MASK_EXTR(timer_config(h, n), HPET_TN_INT_ROUTE_CAP)
> +#define timer_int_route_cap(h, n) (h)->hpet.timers[(n)].route

Seeing that this is likely the route taken here, and hence to avoid
an extra round trip, two remarks: Here I see no need for the
parentheses inside the square brackets.

> diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
> index f0e0eaec83..a41fc443cc 100644
> --- a/xen/include/asm-x86/hvm/vpt.h
> +++ b/xen/include/asm-x86/hvm/vpt.h
> @@ -73,7 +73,13 @@ struct hpet_registers {
>       uint64_t isr;               /* interrupt status reg */
>       uint64_t mc64;              /* main counter */
>       struct {                    /* timers */
> -        uint64_t config;        /* configuration/cap */
> +        union {
> +            uint64_t config;    /* configuration/cap */
> +            struct {
> +                uint32_t _;
> +                uint32_t route;
> +            };
> +        };

So long as there are no static initializers for this construct
that would then suffer the old-gcc problem, this is of course a
fine arrangement to make.

Jan


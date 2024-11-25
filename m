Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC89D8E65
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 23:17:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843192.1258838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFhOR-0000qj-Mm; Mon, 25 Nov 2024 22:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843192.1258838; Mon, 25 Nov 2024 22:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFhOR-0000pF-J9; Mon, 25 Nov 2024 22:17:19 +0000
Received: by outflank-mailman (input) for mailman id 843192;
 Mon, 25 Nov 2024 22:17:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tFhOQ-0000p9-2u
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 22:17:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFhOP-0057hM-0S;
 Mon, 25 Nov 2024 22:17:17 +0000
Received: from [2a02:8012:3a1:0:29f6:ead8:34fc:5066]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFhOP-00Aqxq-0U;
 Mon, 25 Nov 2024 22:17:17 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Y1pk54JwOb+OSfEWcov/2hgqR880Ot+FzZRvqMDsQdg=; b=sb5XXg5gY4GAInN1+Zu05kmsL7
	L0MrEy8k/UCK3yIUrhOM1fW6WBbv6EQ+32Gwl70aTip5QvqjUSVoYJ7ciHBJsABrVVTXn9yqxdE9L
	MThsSLOB1ysrCNpQLBbmsCXlciQnx7YQ38t44FvpitDK1oGhKSb5OyimiJKGTzdougqE=;
Message-ID: <70389f10-5706-4fb4-a186-984a9fd52d76@xen.org>
Date: Mon, 25 Nov 2024 22:17:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] mm: allow page scrubbing routine(s) to be arch
 controlled
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Bobby Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <49b0a003-3fae-4908-ba63-a1c764293755@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <49b0a003-3fae-4908-ba63-a1c764293755@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/11/2024 14:32, Jan Beulich wrote:
> Especially when dealing with large amounts of memory, memset() may not
> be very efficient; this can be bad enough that even for debug builds a
> custom function is warranted. We additionally want to distinguish "hot"
> and "cold" cases (with, as initial heuristic, "hot" being for any
> allocations a domain does for itself, assuming that in all other cases
> the page wouldn't be accessed [again] soon). The goal is for accesses
> of "cold" pages to not disturb caches (albeit finding a good balance
> between this and the higher latency looks to be difficult).
> 
> Keep the default fallback to clear_page_*() in common code; this may
> want to be revisited down the road.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Re-base.
> v2: New.
> ---
> The choice between hot and cold in scrub_one_page()'s callers is
> certainly up for discussion / improvement.
> 
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -144,6 +144,12 @@ extern size_t dcache_line_bytes;
>   
>   #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
>   
> +#define clear_page_hot  clear_page
> +#define clear_page_cold clear_page
> +
> +#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
> +#define scrub_page_cold      scrub_page_hot

This block seems to be common between all the arch but x86. Should we 
add an header in asm generic?

The rest looks fine to me.

Cheers,

-- 
Julien Grall


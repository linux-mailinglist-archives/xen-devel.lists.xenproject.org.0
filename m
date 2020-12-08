Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6AD2D2D07
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 15:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47463.83969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmdug-0002Ge-Bn; Tue, 08 Dec 2020 14:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47463.83969; Tue, 08 Dec 2020 14:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmdug-0002GF-8J; Tue, 08 Dec 2020 14:24:22 +0000
Received: by outflank-mailman (input) for mailman id 47463;
 Tue, 08 Dec 2020 14:24:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmduf-0002GA-H7
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 14:24:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 062bee9b-b0f7-4573-a915-77641e17e771;
 Tue, 08 Dec 2020 14:24:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47D39AD7C;
 Tue,  8 Dec 2020 14:24:19 +0000 (UTC)
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
X-Inumbo-ID: 062bee9b-b0f7-4573-a915-77641e17e771
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607437459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNfUuYQESJJt5mAHm79BTbGPI882KZU9ZahFYdHxYr8=;
	b=OQwD1rkdyEGQDLNH1xNjTvZuvrt5/rnrAAWE5LsTsdwT9ATzYWPwGdcwirB0A4q8n7PguH
	Q2yWaVEJuiyzQFPJywiqsOymoFKvoaADRUfoj+0UvEeiYozerGDNEbOwKcRfyevy6dxwVJ
	+y7BVZS8Lm1Gp+4bvqy41MojJtHUNn4=
Subject: Re: [PATCH V3 16/23] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-17-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f1a2914-f894-0046-2911-9cccb5d94dbf@suse.com>
Date: Tue, 8 Dec 2020 15:24:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-17-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1134,12 +1134,8 @@ static int acquire_resource(
>      xen_pfn_t mfn_list[32];
>      int rc;
>  
> -    /*
> -     * FIXME: Until foreign pages inserted into the P2M are properly
> -     *        reference counted, it is unsafe to allow mapping of
> -     *        resource pages unless the caller is the hardware domain.
> -     */
> -    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) )
> +    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) &&
> +         !arch_acquire_resource_check() )
>          return -EACCES;

Looks like I didn't express myself clearly enough when replying
to v2, by saying "as both prior parts of the condition should be
needed only on the x86 side, and there (for PV) there's no p2m
involved in the refcounting". While one may debate whether the
hwdom check may remain here, the "translated" one definitely
should move into the x86 hook. This (I think) will the also make
apparent that ...

> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -382,6 +382,19 @@ struct p2m_domain {
>  #endif
>  #include <xen/p2m-common.h>
>  
> +static inline bool arch_acquire_resource_check(void)
> +{
> +    /*
> +     * The reference counting of foreign entries in set_foreign_p2m_entry()
> +     * is not supported on x86.
> +     *
> +     * FIXME: Until foreign pages inserted into the P2M are properly
> +     * reference counted, it is unsafe to allow mapping of
> +     * resource pages unless the caller is the hardware domain.
> +     */
> +    return false;
> +}

... the initial part of the comment is true only for translated
domains. The reference to hwdom in the latter part of the comment
(which merely gets moved here) is a good indication that the
hwdom check also wants moving here. In turn the check at the top
of p2m_add_foreign() should imo then also use this new function,
instead of effectively open-coding it (with a similar comment).
And x86's set_foreign_p2m_entry() may want to gain

    ASSERT(arch_acquire_resource_check(d));

perhaps alongside the same ASSERT() you add to the Arm variant.

Jan


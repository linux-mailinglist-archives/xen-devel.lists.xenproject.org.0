Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97173367B80
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115085.219407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZU8E-0007Wi-OX; Thu, 22 Apr 2021 07:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115085.219407; Thu, 22 Apr 2021 07:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZU8E-0007WJ-L1; Thu, 22 Apr 2021 07:52:14 +0000
Received: by outflank-mailman (input) for mailman id 115085;
 Thu, 22 Apr 2021 07:52:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wiI7=JT=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lZU8D-0007WE-0y
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:52:13 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4cf9117-f2ad-4d32-9d7a-9618c5c9fdfe;
 Thu, 22 Apr 2021 07:52:12 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lZU8A-000OFc-M4; Thu, 22 Apr 2021 07:52:10 +0000
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
X-Inumbo-ID: f4cf9117-f2ad-4d32-9d7a-9618c5c9fdfe
Date: Thu, 22 Apr 2021 08:52:10 +0100
From: Tim Deegan <tim@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 6/7] x86/shadow: Make _shadow_prealloc() compile at -Og
Message-ID: <YIErKtfduIUqTEaJ@deinos.phlegethon.org>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
 <20210419140132.16909-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210419140132.16909-7-andrew.cooper3@citrix.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 15:01 +0100 on 19 Apr (1618844491), Andrew Cooper wrote:
> When compiling at -Og:
> 
>   In file included from
>   /builds/xen-project/people/andyhhp/xen/xen/include/asm/domain.h:4:0,
>                    from /builds/xen-project/people/andyhhp/xen/xen/include/xen/domain.h:8,
>                    from /builds/xen-project/people/andyhhp/xen/xen/include/xen/sched.h:11,
>                    from /builds/xen-project/people/andyhhp/xen/xen/include/xen/ioreq.h:22,
>                    from common.c:23:
>   common.c: In function '_shadow_prealloc':
>   /builds/xen-project/people/andyhhp/xen/xen/include/xen/mm.h:252:55: error: 't' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>        return page != head->next ? pdx_to_page(page->list.prev) : NULL;
>                                                          ^
>   common.c:933:28: note: 't' was declared here
>        struct page_info *sp, *t;
>                               ^
> 
> I'm not certain the analysis is correct.  't' is a temporary variable, and is
> clearly initialised before use in foreach_pinned_shadow().  Either way,
> initialising it to NULL placates the compiler.

Yeah, this analysis seems wrong to me too - if nothing else, why does
it not complain about the identical code in shadow_blow_tables() below?

That said, since the non-debug build doesn't complain here, presumably it
will be able to elide this dead store.

Acked-by: Tim Deegan <tim@xen.org>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D61E814C
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:10:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jege6-0004qv-Et; Fri, 29 May 2020 15:10:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jege5-0004gj-6y
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:10:05 +0000
X-Inumbo-ID: 797f0466-a1be-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 797f0466-a1be-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 15:10:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BAFF2AC24;
 Fri, 29 May 2020 15:10:03 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] x86/mm: do not attempt to convert _PAGE_GNTTAB to
 a boolean
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200528144023.10814-1-roger.pau@citrix.com>
 <20200528144023.10814-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1fdfa7ca-ea1f-3c29-a953-24749dbc9f70@suse.com>
Date: Fri, 29 May 2020 17:10:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528144023.10814-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.2020 16:40, Roger Pau Monne wrote:
> Clang 10 complains with:
> 
> mm.c:1239:10: error: converting the result of '<<' to a boolean always evaluates to true
>       [-Werror,-Wtautological-constant-compare]
>     if ( _PAGE_GNTTAB && (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&

And taking the wording of the message exactly as it is, it is wrong
(if the shifted value is zero, or if all set bits get shifted out).
But the warning is bogus imo anyway - we have it like this for a
reason. I'd then wonder whether -Wtautological-constant-compare
actually does any good, or whether as an alternative we don't want
to disable it.

I further wonder whether they might not warn about the same in #if
down the road.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1236,7 +1236,8 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
>       * (Note that the undestroyable active grants are not a security hole in
>       * Xen. All active grants can safely be cleaned up when the domain dies.)
>       */
> -    if ( _PAGE_GNTTAB && (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
> +#if _PAGE_GNTTAB
> +    if ( (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
>           !l1e_owner->is_shutting_down && !l1e_owner->is_dying )

Us moving in general(?) away from #if / #ifdef to constructs including
the condition in a suitable form in a non-preprocessor expression, I
think we want a comment here clarifying that this shouldn't be
converted back to how it is right now. With that added, for the
immediate purpose:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


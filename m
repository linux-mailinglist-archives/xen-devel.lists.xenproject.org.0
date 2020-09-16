Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A9526BD9B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:02:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIRS8-0000A9-NH; Wed, 16 Sep 2020 07:02:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIRS7-0000A4-U0
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:02:03 +0000
X-Inumbo-ID: 64ab183d-b4cf-4a74-82a1-54134735574e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64ab183d-b4cf-4a74-82a1-54134735574e;
 Wed, 16 Sep 2020 07:02:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0100AEA3;
 Wed, 16 Sep 2020 07:02:17 +0000 (UTC)
Subject: Re: [PATCH] x86/mm: Simplify expression in set_gpfn_from_mfn()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200915175355.32361-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75d5ba85-ae3d-03f6-5d42-4ecf52c6ca08@suse.com>
Date: Wed, 16 Sep 2020 09:02:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915175355.32361-1-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.09.2020 19:53, Andrew Cooper wrote:
> Coverity points out that the "d &&" is redundant.

How can it know that ...

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1336,7 +1336,7 @@ void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn)
>      {
>          const struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn)));
>  
> -        if ( d && (d == dom_cow) )
> +        if ( d == dom_cow )

... dom_cow is not NULL (in which case the new expression is wrong
when d also is). I actually think Coverity has spotted the issue
when dom_cow is #define-d to NULL, in which case the original
expression degenerates to "d && !d".

If the purpose of the extra check is more obvious that way, we
could check dom_cow to be non-NULL (instead of d), but I'm afraid
this may not silence Coverity.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B288D05B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 22:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698233.1089748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpElB-00043z-BH; Tue, 26 Mar 2024 21:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698233.1089748; Tue, 26 Mar 2024 21:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpElB-00041m-8U; Tue, 26 Mar 2024 21:55:09 +0000
Received: by outflank-mailman (input) for mailman id 698233;
 Tue, 26 Mar 2024 21:55:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rpElA-00041g-6H
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 21:55:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpEl7-0006OF-6q; Tue, 26 Mar 2024 21:55:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpEl7-0003WD-0G; Tue, 26 Mar 2024 21:55:05 +0000
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
	bh=a2I+LiowI5Pxt3N7weEJEMDDFjutY0zx6MhCw1LuKew=; b=IltuEQaz0IJHZpi5DUvwh3SVw3
	2B7vrn8jq9k1tIxx0PKDp12l8j8pQk5v1sgrTU5hoDhFnsB7m2h1OepOAYGKyFS+a66/LrWoLDe6o
	eWwHpvT9DF2lOCsu2f+IIR18zj7i/31OwRB2f8jSKg6yqf3rVDheSYV5k+qxOJleJujc=;
Message-ID: <fbc17f7a-b07d-4508-902f-9fc021bc9a19@xen.org>
Date: Tue, 26 Mar 2024 21:55:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags
 macro
To: Jan Beulich <jbeulich@suse.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-9-carlo.nonato@minervasys.tech>
 <3f615066-a792-493f-ba33-7667a6557c23@xen.org>
 <9e0f7ff3-5457-41e4-a1e4-bf75804fb900@xen.org>
 <255be735-f9fe-4e39-a24e-2f6aff91acc5@suse.com>
 <CAG+AhRWMh2quv3SNPJQ61au=e6gtdXUO7j-XVYV6chDmktqkvA@mail.gmail.com>
 <3427132d-9458-4447-b667-d2ef3c1f0569@suse.com>
 <CAG+AhRXE7cMNnDNxZeF=o7wBXKUtwvMj6Y5oRy-UrpDyAfM5Cw@mail.gmail.com>
 <f7bde6a7-1e48-4074-b8f5-094fa0d6a593@suse.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <f7bde6a7-1e48-4074-b8f5-094fa0d6a593@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo & Jan,

On 26/03/2024 17:04, Jan Beulich wrote:
>>> No, we need to get to the root of the issue. Since osstest has hit it quite
>>> easily as it seems, I'm somewhat surprised you didn't hit it in your testing.
>>> In any event, as per my earlier reply, my present guess is that your change
>>> has merely uncovered a previously latent issue elsewhere.
>>
>> Ok, what about removing PGC_extra in free_heap_pages() before the
>> mark_page_free() call?
> 
> Question is: How would you justify such a change? IOW I'm not convinced
> (yet) this wants doing there.

Looking at the code, the flag is originally set in 
alloc_domheap_pages(). So I guess it would make sense to do it in 
free_domheap_pages().

For PGC_static, I don't think we can reach free_domheap_pages() with the 
flag set (the pages should live in a separate pool). So I believe there 
is nothing to do for them.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB22A2451A6
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 19:58:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k70QT-000775-UH; Sat, 15 Aug 2020 17:57:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zz9Y=BZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k70QS-00076z-JK
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 17:57:04 +0000
X-Inumbo-ID: acaf3d66-059e-49ed-9720-64a4006ea4e1
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acaf3d66-059e-49ed-9720-64a4006ea4e1;
 Sat, 15 Aug 2020 17:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
 bh=yXxMbw0BNXPg8swFjcxqu5NeMPSh7EeRFAtpvEyYS/c=; b=X1fEA+Sjx7oYUJB7NRAXhB3W0O
 MpPC/Y7eXMjn6VRvwW0W8WsMqnzRTDHjhWlj4XP7zJm3DN8dSxg+YsMrwq7x9t63st4mIoFaB7QSF
 8wj6aS4H6SvoeXTIfcIaqC5KoztLaobXAB3JWEv0/jfLVl+7hqrfjf7S1ihDX6KGplfs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k70QJ-0006vJ-MU; Sat, 15 Aug 2020 17:56:55 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k70QJ-0004Pn-Di; Sat, 15 Aug 2020 17:56:55 +0000
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
From: Julien Grall <julien@xen.org>
To: paul@xen.org, 'Oleksandr Tyshchenko' <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <001101d66a33$bba44670$32ecd350$@xen.org>
 <6c4f7698-a015-91c7-83ec-203f63d48900@xen.org>
Message-ID: <70241cb7-1b04-d3be-90d5-b075ee13ca8c@xen.org>
Date: Sat, 15 Aug 2020 18:56:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6c4f7698-a015-91c7-83ec-203f63d48900@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 04/08/2020 15:01, Julien Grall wrote:
> On 04/08/2020 08:49, Paul Durrant wrote:
>>> diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
>>> index 931404c..b5fc066 100644
>>> --- a/tools/libxc/xc_dom_arm.c
>>> +++ b/tools/libxc/xc_dom_arm.c
>>> @@ -26,11 +26,19 @@
>>>   #include "xg_private.h"
>>>   #include "xc_dom.h"
>>>
>>> -#define NR_MAGIC_PAGES 4
>>> +
>>>   #define CONSOLE_PFN_OFFSET 0
>>>   #define XENSTORE_PFN_OFFSET 1
>>>   #define MEMACCESS_PFN_OFFSET 2
>>>   #define VUART_PFN_OFFSET 3
>>> +#define IOREQ_SERVER_PFN_OFFSET 4
>>> +
>>> +#define NR_IOREQ_SERVER_PAGES 8
>>> +#define NR_MAGIC_PAGES (4 + NR_IOREQ_SERVER_PAGES)
>>> +
>>> +#define GUEST_MAGIC_BASE_PFN (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT)
>>> +
>>> +#define special_pfn(x)  (GUEST_MAGIC_BASE_PFN + (x))
>>
>> Why introduce 'magic pages' for Arm? It's quite a horrible hack that 
>> we have begun to do away with by adding resource mapping.
> 
> This would require us to mandate at least Linux 4.17 in a domain that 
> will run an IOREQ server. If we don't mandate this, the minimum version 
> would be 4.10 where DM OP was introduced.
> 
> Because of XSA-300, we could technically not safely run an IOREQ server 
> with existing Linux. So it is probably OK to enforce the use of the 
> acquire interface.
One more thing. We are using atomic operations on the IOREQ pages. As 
our implementation is based on LL/SC instructions so far, we have 
mitigation in place to prevent a domain DoS Xen. However, this relies on 
the page to be mapped in a single domain at the time.

AFAICT, with the legacy interface, the pages will be mapped in both the 
target and the emulator. So this would defeat the mitigation we have in 
place.

Because the legacy interface is relying on foreign mapping, the page has 
to be mapped in the target P2M. It might be possible to restrict the 
access for the target by setting the p2m bits r, w to 0. This would 
still allow the foreign mapping to work as we only check the p2m type 
during mapping.

Anyway, I think we agreed that we want to avoid to introduce the legacy 
interface. But I wanted to answer just for completeness and keep a 
record of potential pitfalls with the legacy interface on Arm.

> 
> Note that I haven't yet looked at the rest of the series. So I am not 
> sure if there is more work necessary to enable it.
> 
> Cheers,
> 

-- 
Julien Grall


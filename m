Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4318926DE67
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:39:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIv3p-0005DF-ND; Thu, 17 Sep 2020 14:38:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIv3n-0005DA-V0
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:38:55 +0000
X-Inumbo-ID: 91dda579-08b7-4ac9-8ce6-6d69c6a6f0b3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91dda579-08b7-4ac9-8ce6-6d69c6a6f0b3;
 Thu, 17 Sep 2020 14:38:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600353533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNwI+lrzZ74IH3DVgLgSdasSJi+XQG5JbMuDvL9xFWE=;
 b=GhNmGEBW0qYS9S9MeFSpu2/fWXkaYP3OuznBhR/98qemv4b1KBXgeFiWglX+JR71TJfv2T
 CLOJFcGQ9/KGHsXnDSlkRa+S2xw9089gDzmTPZSzQH+aYMxYy5gryA3swBhh80tzUKdbyp
 tnJvPj7RdpDvMJy9HYPcY1sOaP4MZLmLBxmg5t/vLvwGWGjPCybDguJZ8dHjcL6yeCS1Q5
 gt/wlmLg0muWidcnbTs9zMmynyiOQ3DM2XIVt3+QTsUzcMGJ1U857pSo0Lv/Ag4/cDiYPi
 8w8ZSdckGcxSMiCkockJklSwaQXRg+yUtoXCAuR2RyccJYhH5W138yBmP/1FUQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9069AAF31;
 Thu, 17 Sep 2020 14:39:27 +0000 (UTC)
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200910133514.82155-1-roger.pau@citrix.com>
 <e7230e70-3aae-61a2-3574-6eeae6e4e57a@suse.com>
 <20200917142849.GE19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83504437-58a9-d97c-dfc6-212b62d52ff9@suse.com>
Date: Thu, 17 Sep 2020 16:38:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917142849.GE19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.09.2020 16:28, Roger Pau Monné wrote:
> On Thu, Sep 17, 2020 at 04:12:23PM +0200, Jan Beulich wrote:
>> On 10.09.2020 15:35, Roger Pau Monne wrote:
>>> arch_init_memory will treat all the gaps on the physical memory map
>>> between RAM regions as MMIO and use share_xen_page_with_guest in order
>>> to assign them to dom_io. This has the side effect of setting the Xen
>>> heap flag on such pages, and thus is_special_page would then return
>>> true which is an issue in epte_get_entry_emt because such pages will
>>> be forced to use write-back cache attributes.
>>>
>>> Fix this by introducing a new helper to assign the MMIO regions to
>>> dom_io without setting the Xen heap flag on the pages, so that
>>> is_special_page will return false and the pages won't be forced to use
>>> write-back cache attributes.
>>>
>>> Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I'm sorry for noticing this only now, but there is a place where
>> we actually build on these pages being marked "special": In
>> xenmem_add_to_physmap_one() we have
>>
>>     if ( mfn_valid(prev_mfn) )
>>     {
>>         if ( is_special_page(mfn_to_page(prev_mfn)) )
>>             /* Special pages are simply unhooked from this phys slot. */
>>             rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
>>         else
>>             /* Normal domain memory is freed, to avoid leaking memory. */
>>             rc = guest_remove_page(d, gfn_x(gpfn));
>>     }
>>
>> As you'll notice MMIO pages not satisfying mfn_valid() will simply
>> bypass any updates here, but the subsequent guest_physmap_add_page()
>> will have the P2M entry updated anyway. MMIO pages which satisfy
>> mfn_valid(), however, would previously have been passed into
>> guest_physmap_remove_page() (which generally would succeed) while
>> now guest_remove_page() will (afaict) fail (get_page() there won't
>> succeed).
> 
> Would Xen even get to the get_page in guest_remove_page on that case?
> 
> There's a p2m_mmio_direct type check that will succeed for MMIO
> ranges, and that just clears the p2m entry and returns before doing
> any get_page.

Oh, I did overlook this indeed.

Jan


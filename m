Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E961D9C16
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 18:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4oa-0005Wh-1b; Tue, 19 May 2020 16:10:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jb4oY-0005Wc-M9
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 16:09:58 +0000
X-Inumbo-ID: 2f28f0aa-99eb-11ea-a945-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f28f0aa-99eb-11ea-a945-12813bfff9fa;
 Tue, 19 May 2020 16:09:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A56FDAB91;
 Tue, 19 May 2020 16:09:59 +0000 (UTC)
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <2783ddc5-9919-3c97-ba52-2f734e7d72d5@suse.com>
 <62d4999b-7db3-bac6-28ed-bb636347df38@citrix.com>
 <3088e420-a72a-1b2d-144f-115610488418@suse.com>
 <1750cbe5-ef48-6dc7-e372-cbc0a8cbc9cc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a5c33c0-9245-126b-123e-3980a9135190@suse.com>
Date: Tue, 19 May 2020 18:09:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1750cbe5-ef48-6dc7-e372-cbc0a8cbc9cc@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.2020 17:33, Andrew Cooper wrote:
> On 19/05/2020 15:48, Jan Beulich wrote:
>> On 19.05.2020 16:11, Andrew Cooper wrote:
>>> Given that shadow frames are limited to 44 bits anyway (and not yet
>>> levelled safely in the migration stream), my suggestion for fixing this
>>> was just to use one extra nibble for the extra 4 bits and call it done.
>> Would you remind(?) me of where this 44-bit restriction is coming
>> from?
> 
> From paging_max_paddr_bits(),
> 
> /* Shadowed superpages store GFNs in 32-bit page_info fields. */

Ah, that's an abuse of the backlink field. After some looking
around I first thought the up field could be used to store the
GFN instead, as it's supposedly used for single-page shadows
only. Then however I found

static inline int sh_type_has_up_pointer(struct domain *d, unsigned int t)
{
    /* Multi-page shadows don't have up-pointers */
    if ( t == SH_type_l1_32_shadow
         || t == SH_type_fl1_32_shadow
         || t == SH_type_l2_32_shadow )
        return 0;
    /* Pinnable shadows don't have up-pointers either */
    return !sh_type_is_pinnable(d, t);
}

It's unclear to me in which way SH_type_l1_32_shadow and
SH_type_l2_32_shadow are "multi-page" shadows; I'd rather have
expected all three SH_type_fl1_*_shadow to be. Tim?

In any event there would be 12 bits to reclaim from the up
pointer - it being a physical address, there'll not be more
than 52 significant bits.

Jan


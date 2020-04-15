Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB91A9E20
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:52:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOgaB-0002xP-6D; Wed, 15 Apr 2020 11:51:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOga9-0002xK-Ru
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:51:53 +0000
X-Inumbo-ID: 7f33591a-7f0f-11ea-8a3a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f33591a-7f0f-11ea-8a3a-12813bfff9fa;
 Wed, 15 Apr 2020 11:51:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 07FB5AF01;
 Wed, 15 Apr 2020 11:51:50 +0000 (UTC)
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
 <20200414100213.GH28601@Air-de-Roger>
 <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
 <20200414111911.GI28601@Air-de-Roger>
 <073512c9-6500-054c-c72c-1f468da6464c@suse.com>
 <20200414145337.GJ28601@Air-de-Roger>
 <fbc0dd00-6973-4003-ad34-591561b695c9@suse.com>
 <20200415114918.GK28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9af8eac3-4c0c-9440-6fe7-129bec3da774@suse.com>
Date: Wed, 15 Apr 2020 13:51:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415114918.GK28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 13:49, Roger Pau Monné wrote:
> On Tue, Apr 14, 2020 at 05:06:23PM +0200, Jan Beulich wrote:
>> On 14.04.2020 16:53, Roger Pau Monné wrote:
>>> On Tue, Apr 14, 2020 at 03:50:15PM +0200, Jan Beulich wrote:
>>>> On 14.04.2020 13:19, Roger Pau Monné wrote:
>>>>>>> I think this should work, but I would rather do it in a separate
>>>>>>> patch.
>>>>>>
>>>>>> Yes, just like the originally (wrongly, as you validly say) suggested
>>>>>> full removal of them, putting this in a separate patch would indeed
>>>>>> seem better.
>>>>>
>>>>> Would you like me to resend with the requested fix to
>>>>> paging_log_dirty_range (ie: drop the FLUSH_TLB and only call
>>>>> flush_mask for HAP guests running on AMD) then?
>>>>
>>>> Well, ideally I'd see that function also make use of the intended
>>>> new helper function, if at all possible (and suitable).
>>>
>>> Oh, OK. Just to make sure I understand what you are asking for, you
>>> would like me to resend introducing the new guest_flush_tlb_mask
>>> helper and use it in the flush_tlb_mask callers modified by this
>>> patch?
>>
>> Yes (and I now realize it may not make sense to split it off into a
>> separate change).
> 
> I could do a pre-patch that introduces guest_flush_tlb_mask as a
> simple wrapper around flush_tlb_mask and replace the callers that I
> modify in this patch. Then this patch would only introduce
> FLUSH_HVM_ASID_CORE and modify guest_flush_tlb_mask to use it when
> required.
> 
> It might make it more complicated to see which callers require the
> ASID flush, but if you think it's better I can arrange the patches in
> that way.

No, I think it's beteer to leave as a single patch. The idea with
splitting was that you'd (fully) take care of some of the sites
needing modification ahead of what is now patch 1. I.e. this would
have been a suitable approach only if some use sites could really
have the call dropped altogether.

Jan


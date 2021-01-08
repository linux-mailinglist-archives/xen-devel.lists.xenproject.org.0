Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6592EF084
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 11:17:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63285.112390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxopT-0002Ng-Lu; Fri, 08 Jan 2021 10:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63285.112390; Fri, 08 Jan 2021 10:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxopT-0002NG-IJ; Fri, 08 Jan 2021 10:17:11 +0000
Received: by outflank-mailman (input) for mailman id 63285;
 Fri, 08 Jan 2021 10:17:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kxopS-0002NB-9n
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 10:17:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxopR-0005ug-Kf; Fri, 08 Jan 2021 10:17:09 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxopR-0001uL-DM; Fri, 08 Jan 2021 10:17:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=agVGDTGTBDPv6VHfCzOEi8t69GHd1YIwrVzm3OOhYaQ=; b=ipaAKSQ9s9aXZrvAGMMFcaCNgZ
	slcP5775y3zetnCciUeEcy8Dq2oa7VMJZnVM2jaCi0HpnY5eEFPBE7GO9zvZ5kEJOLwQXpDlS1mr2
	uv9aLsfkWRycFEDON5yA8JB9BcMLcKaJxop5G5b5MbV3B6+WhQmk9qvAhfbKosvpRGK8=;
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
 <920f3df3-3343-3947-e318-da3b8dd8a56c@citrix.com>
 <ec21a8d6-744c-0f02-cedd-c35d36097a8a@suse.com>
 <25c6efe0-fb29-eb83-badf-70cd2dade0d7@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e991cf59-89fb-3d5f-98eb-21ba16b0910c@xen.org>
Date: Fri, 8 Jan 2021 10:17:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <25c6efe0-fb29-eb83-badf-70cd2dade0d7@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew and Jan,

On 04/01/2021 15:41, Andrew Cooper wrote:
> On 04/01/2021 15:22, Jan Beulich wrote:
>> On 04.01.2021 16:04, Andrew Cooper wrote:
>>> On 23/12/2020 15:13, Jan Beulich wrote:
>>>> This array can be large when many grant frames are permitted; avoid
>>>> allocating it when it's not going to be used anyway, by doing this only
>>>> in gnttab_populate_status_frames().
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v2: Defer allocation to when a domain actually switches to the v2 grant
>>>>      API.
>>> I see this as a backwards step.  It turns a build-time -ENOMEM into a
>>> runtime -ENOMEM, and if you recall from one of the XSAs, the Windows PV
>>> drivers will BUG() if set_version fails.  (Yes - this is dumb behaviour,
>>> but it is in the field now.)

During yesterday call, Paul pointed that this is a behavior from old 
Windows driver. New Windows PV driver will not use Grant Table v2.

However, AFAICT, there is already runtime -ENOMEM failure in set_version 
when trying to populate the status frame (see the call to 
gnttab_populate_status_frames()).

>> Well, if this was the only source of -ENOMEM (i.e. none was there
>> previously), I'd surely understand the concern. But there have been
>> memory allocations before on this path.
> 
> ... you're literally writing a patch saying "avoid large allocation at
> domain create time, and make it at runtime instead" and then trying to
> argue that it isn't a concern because there are other memory allocations.
> 
> It is very definitely a backwards step irrespective of the size of the
> allocation, even if the current behaviour isn't necessarily perfect.
> 
>>   In any event, this will
>> need settling between you and Julien, as it was him to request the
>> change.
> 
> Well - that's because gnttab v2 is disabled in general on ARM.

I didn't have Arm in mind when I originally requested Jan the change.

Instead, the request was based on the fact that most of the guests don't 
use of grant-table v2. To me this feels a waste of memory and if it can 
be avoid then it is best.

> 
> Conditionally avoiding the allocation because of opt_gnttab_max_version
> being 1 would be ok, because it doesn't introduce new runtime failures
> for guests.

Based on my answer above, I would not consider it as a new runtime 
failure -ENOMEM is already possible when switching from v1 to v2.

In fact, the allocation is going to be much smaller than the other 
allocations (we may be allocating multiple pages). So if we are 
concerned about this, then we should already be concerned about the 
existings one.

Anyway, the array itself is likely going to be small (I haven't computed 
the size) so I would be OK to not defer the allocation.

However, I would like to seek clarification on whether your end goal is 
to remove any -ENOMEM failure from set_version.

Cheers,

-- 
Julien Grall


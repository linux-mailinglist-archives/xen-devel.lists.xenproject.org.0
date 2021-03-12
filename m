Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B559338ECB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 14:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97118.184311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhrC-0002bI-8M; Fri, 12 Mar 2021 13:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97118.184311; Fri, 12 Mar 2021 13:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhrC-0002as-30; Fri, 12 Mar 2021 13:29:34 +0000
Received: by outflank-mailman (input) for mailman id 97118;
 Fri, 12 Mar 2021 13:29:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKhrA-0002am-1p
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:29:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3a5cac1-cb91-4ea6-8ac6-13c8bdad341a;
 Fri, 12 Mar 2021 13:29:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85E40B122;
 Fri, 12 Mar 2021 13:29:30 +0000 (UTC)
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
X-Inumbo-ID: d3a5cac1-cb91-4ea6-8ac6-13c8bdad341a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615555770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhoGIIjSO95RAjgWgleCpOhVsyBc0CR/e2p0QtDKmPA=;
	b=JPiNq8XW5PVgeKOMVWL5+eYOklBUw9Y2kcgjldC5oNlfrTOTftqEZDk4CZx3z2GkMLGdN4
	Ja5r80Mxpx5dROpstGm+VJ8B1TVF7dXh3u6TUQLSdqiDxTcgCB5JJaJ5KrPrhsGu70vJAW
	98x8U0/fhjUrquGJud6cEeu5LSWR0qo=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <1642726c-0134-fb90-164a-e49672f613ff@citrix.com>
 <81539e7d-6b3c-8261-6959-67ef1dc136bf@suse.com>
 <4722bb38-387a-7bd2-12fc-87dcbde48d4f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1167c6a5-4d76-8803-99a5-33121aa82b3a@suse.com>
Date: Fri, 12 Mar 2021 14:29:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4722bb38-387a-7bd2-12fc-87dcbde48d4f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.03.2021 14:25, Andrew Cooper wrote:
> On 12/03/2021 13:08, Jan Beulich wrote:
>> On 12.03.2021 12:32, Andrew Cooper wrote:
>>> On 10/03/2021 10:13, Jan Beulich wrote:
>>>> Sadly I was wrong to suggest dropping vaddrs' initializer during review
>>>> of v2 of the patch introducing this code. gcc 4.3 can't cope.
>>>>
>>>> Fixes: 52531c734ea1 ("xen/gnttab: Rework resource acquisition")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
>>>>      struct grant_table *gt = d->grant_table;
>>>>      unsigned int i, final_frame;
>>>>      mfn_t tmp;
>>>> -    void **vaddrs;
>>>> +    void **vaddrs = NULL;
>>>>      int rc = -EINVAL;
>>>>  
>>>>      if ( !nr_frames )
>>> in v1, there was a companion check.
>>>
>>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>>> index f937c1d350..2bb07f129f 100644
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4059,6 +4059,16 @@ int gnttab_acquire_resource(
>>>      if ( rc )
>>>          goto out;
>>>  
>>> +    /*
>>> +     * Some older toolchains can't spot that vaddrs is non-NULL on
>>> non-error
>>> +     * paths.  Leave some runtime safety.
>>> +     */
>>> +    if ( !vaddrs )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        goto out;
>>> +    }
>>> +
>>>      for ( i = 0; i < nr_frames; ++i )
>>>          mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
>> Oh, I didn't realize this. Will add, but did you really mean to
>> have the function return success in this case (on a release
>> build)? I'd be inclined to put it ahead of if "if ( rc )" and
>> set rc (to e.g. -ENODATA) in this case.
> 
> Oh - quite right.  Returning 0 here will hit the assertion/failsafe
> protecting against livelock.
> 
> I'd be tempted to chose -EINVAL because the only plausible way to get
> here is a bad id, and that path should have errored out earlier.

As you may have seen, I've chosen to stick to ENODATA. This error,
should it ever get raised, would better be easily distinguishable
from an ordinary -EINVAL.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D172FA4DA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69774.125057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WZ7-0003oN-A2; Mon, 18 Jan 2021 15:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69774.125057; Mon, 18 Jan 2021 15:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WZ7-0003nw-51; Mon, 18 Jan 2021 15:35:37 +0000
Received: by outflank-mailman (input) for mailman id 69774;
 Mon, 18 Jan 2021 15:35:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1WZ5-0003nm-7a
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:35:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 563a2749-4ee6-4363-bb7f-27eee2313182;
 Mon, 18 Jan 2021 15:35:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55CD3AC63;
 Mon, 18 Jan 2021 15:35:33 +0000 (UTC)
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
X-Inumbo-ID: 563a2749-4ee6-4363-bb7f-27eee2313182
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610984133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVI7VVvHYyVE7QzeNy/jdcAfgKXgNy41qppNapJ1++Y=;
	b=SuOAr0a9vuV0hpJDvdo3oNe3I9mIJIlKIVmPH3kNHr3W4LR/CzX+ooa1Cq2JhabqkMPHZw
	M2ZEUuUmO1J/u87JxZjaHfWG22ET9TFrjYzhL+dJ6YXUucQCiWakLrvWn7PLy4h1bKJBzQ
	r745q7qWwwxF6hhj6scMuUQOu5sTLxg=
Subject: Re: [PATCH] xen/decompress: make helper symbols static
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
 <b073d60c-9eb1-a161-8419-a0dfa11b4c91@citrix.com>
 <b9f6447d-2677-030c-31c3-ed741be62dcc@suse.com>
 <0290fc6d-a7a1-3f30-668d-2ef24fbc4802@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b8f2b6d-a2fc-12c9-90ef-04ac5e9cce30@suse.com>
Date: Mon, 18 Jan 2021 16:35:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0290fc6d-a7a1-3f30-668d-2ef24fbc4802@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.01.2021 16:31, Andrew Cooper wrote:
> On 18/01/2021 15:13, Jan Beulich wrote:
>> On 18.01.2021 12:58, Andrew Cooper wrote:
>>> but I really would
>>> like to see the STATIC and INIT defines disappear eventually.
>> I too would like to, but I don't see this happen in particular
>> for INIT and INITDATA, when we have two distinct environments
>> where this code gets built. Unless you envision the tool stack /
>> stubdom side of the build to gain
>>
>> #define __init
>> #define __initdata
>>
>> ?
> 
> I think that's fine.
> 
> One way or another, some header file somewhere needs to plumb this up
> for the differing environments.  I just don't see the need for an extra
> level of indirection.

I see. Maybe I can do so while I'm touching this code anyway.

>> As far as STATIC goes, being in the middle of the DomU side
>> work of this, I've found a need to sprinkle around quite a
>> few of them in zstd/decompress.c, again to silence similar
>> compiler diagnostics.
> 
> Do you mean you've had to add more STATIC's in?

Yes indeed. Plus #ifdef out some of the functions that aren't
used at all, i.e. where with static added the compiler would
still warn. Yet I didn't want to delete code there, in order
for future changes we might want to grab from Linux to apply
reasonably.

Jan


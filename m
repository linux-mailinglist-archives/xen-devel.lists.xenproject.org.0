Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181B62E1DA1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 15:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58412.102684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5ZM-00066H-Cd; Wed, 23 Dec 2020 14:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58412.102684; Wed, 23 Dec 2020 14:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5ZM-00065u-7w; Wed, 23 Dec 2020 14:56:52 +0000
Received: by outflank-mailman (input) for mailman id 58412;
 Wed, 23 Dec 2020 14:56:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks5ZL-00065p-2w
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 14:56:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ebba0d7-d406-4211-82c8-4c4502f169a3;
 Wed, 23 Dec 2020 14:56:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1915ACC6;
 Wed, 23 Dec 2020 14:56:48 +0000 (UTC)
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
X-Inumbo-ID: 1ebba0d7-d406-4211-82c8-4c4502f169a3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608735408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4oPqll/m8bI9dvpPkVuPNEcCRviO6wFYQo365cRdxFs=;
	b=LI3Ao4H7cTPz6rtaGVqwLryU0FNZdkUc2HXdhmsUeHCHVm67SltuZo/0yq2iMJKnn1wqJr
	aoHkd+MVjnvPfYwXo3oqnoW8+XHli7b3GCPUIkOhRRCR9eGX14k4pZjBrTtvUQ4KWR5x/1
	V0Gy3eSFzy4T2KKSVI7IIpsdLrfvOV8=
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <lengyelt@ainfosec.com>,
 Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com>
 <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com>
 <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
 <CABfawhkQcUD4f62zpg0cyrdQgG82XtpYRZZ_-50hjagooT530A@mail.gmail.com>
 <5862eb24-d894-455a-13ac-61af54f949e7@xen.org>
 <CABfawhkWQiOhLL8f3NzoWbeuag-f+YOOK0i_LJzZq5Yvoh=oHQ@mail.gmail.com>
 <fd384990-376e-40f4-f0b8-1a889b3a0c51@suse.com>
 <9ee6016a-d3b3-c847-4775-0e05c8578110@xen.org>
 <CABfawhkcHX+FSRRfYwUNd8DweW04=91sSg2PTWy7vjq_DXwMQg@mail.gmail.com>
 <d365ce00-bc3a-de7c-565a-c4cb61063e74@suse.com>
 <ed5fc3e2-42b1-477a-c424-05ddf7fd3bf4@xen.org>
 <3b339f30-57db-caf6-fd7e-84199f98546f@suse.com>
 <9c214bc1-61db-5b33-f610-40c2a59edb75@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce7d0e42-2066-0007-0f82-c55c63a952df@suse.com>
Date: Wed, 23 Dec 2020 15:56:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9c214bc1-61db-5b33-f610-40c2a59edb75@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 15:44, Julien Grall wrote:
> On 23/12/2020 13:41, Jan Beulich wrote:
>> On 23.12.2020 14:33, Julien Grall wrote:
>>> On 23/12/2020 13:12, Jan Beulich wrote:
>>>>  From the input by both of you I still can't
>>>> conclude whether this patch should remain as is in v4, or revert
>>>> back to its v2 version. Please can we get this settled so I can get
>>>> v4 out?
>>>
>>> I haven't had time to investigate the rest of the VM event code to find
>>> other cases where this may happen. I still think there is a bigger
>>> problem in the VM event code, but the maintainer disagrees here.
>>>
>>> At which point, I see limited reason to try to paper over in the common
>>> code. So I would rather ack/merge v2 rather than v3.
>>
>> Since I expect Tamas and/or the Bitdefender folks to be of the
>> opposite opinion, there's still no way out, at least if "rather
>> ack" implies a nak for v3.
> 
> The only way out here is for someone to justify why this patch is 
> sufficient for the VM event race.

I think this is too much you demand. Moving in the right direction
without arriving at the final destination is still a worthwhile
thing to do imo.

>> Personally, if this expectation of
>> mine is correct, I'd prefer to keep the accounting but make it
>> optional (as suggested in a post-commit-message remark).
>> That'll eliminate the overhead you appear to be concerned of,
>> but of course it'll further complicate the logic (albeit just
>> slightly).
> 
> I am more concerned about adding over complex code that would just 
> papering over a bigger problem. I also can't see use of it outside of 
> the VM event discussion.

I think it is a generally appropriate thing to do to wait for
callbacks to complete before tearing down their origin control
structure. There may be cases where code structure makes this
unnecessary, but I don't think this can be an expectation to
all the users of the functionality. Hence my suggestion to
possibly make this optional (driven directly or indirectly by
the user of the registration function).

Jan


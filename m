Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C3316A8A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 16:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83657.156245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rr9-00041o-U0; Wed, 10 Feb 2021 15:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83657.156245; Wed, 10 Feb 2021 15:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rr9-00041N-PW; Wed, 10 Feb 2021 15:56:43 +0000
Received: by outflank-mailman (input) for mailman id 83657;
 Wed, 10 Feb 2021 15:56:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9rr8-00041I-Q9
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 15:56:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e8a3170-d20d-4420-b319-9ae35a8bd557;
 Wed, 10 Feb 2021 15:56:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4F26AFED;
 Wed, 10 Feb 2021 15:56:40 +0000 (UTC)
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
X-Inumbo-ID: 7e8a3170-d20d-4420-b319-9ae35a8bd557
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612972600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3LmuoCGZFmMOdU5/rOompxGG8TBTh2cmu5JiDWGxtk=;
	b=dMimHsB759xBYyE9oJ35hx3m8fZ15oCHtOWqcX/fN/XE6AANyxLXqPYb4xaYbWkLt/voFd
	4vKAQluBSOy0gMo1z9J1mzDLvnx5FgO8htPN6TuTYhUPnI6GmzLw/2dxDjGmdzq3oy2S+c
	BT8rgVE9OkY7HxkX/Y/yWcfNlxgD7oY=
Subject: Re: [for-4.15][PATCH v2 3/5] xen/iommu: iommu_map: Don't crash the
 domain if it is dying
To: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, hongyxia@amazon.co.uk,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-4-julien@xen.org>
 <04f601d6ff22$1f52cf60$5df86e20$@xen.org>
 <CAJ=z9a18XxQLrUanxg_E7Vups7aRee93_vFhqxu1=yq+VdXH-w@mail.gmail.com>
 <6fb54306-20e6-516f-cdcf-c7d8dd430b96@suse.com>
 <04755ab0-94fe-f797-1cfd-cf8aa22ceba0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82fc1bcf-eff8-13bd-7679-5e8d0a17661f@suse.com>
Date: Wed, 10 Feb 2021 16:56:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <04755ab0-94fe-f797-1cfd-cf8aa22ceba0@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.02.2021 15:58, Julien Grall wrote:
> Hi Jan,
> 
> On 10/02/2021 14:14, Jan Beulich wrote:
>> On 09.02.2021 22:14, Julien Grall wrote:
>>> On Tue, 9 Feb 2021 at 20:28, Paul Durrant <xadimgnik@gmail.com> wrote:
>>>>> From: Julien Grall <julien@xen.org>
>>>>> Sent: 09 February 2021 15:28
>>>>>
>>>>> It is a bit pointless to crash a domain that is already dying. This will
>>>>> become more an annoyance with a follow-up change where page-table
>>>>> allocation will be forbidden when the domain is dying.
>>>>>
>>>>> Security wise, there is no change as the devices would still have access
>>>>> to the IOMMU page-tables even if the domain has crashed until Xen
>>>>> start to relinquish the resources.
>>>>>
>>>>> For x86, we rely on dom_iommu(d)->arch.mapping.lock to ensure
>>>>> d->is_dying is correctly observed (a follow-up patch will held it in the
>>>>> relinquish path).
>>
>> Am I to understand this to mean that at this point of the series
>> things aren't really correct yet in this regard? If so, wouldn't
>> it be better to re-order?
> 
> You asked this specific order... So are you saying you want me to use 
> the original ordering?

Well, it's been a while and I don't recall the specific reason
for the request. But then at least the spin_barrier() you mean
to rely on could / should be moved here?

>>>>> For Arm, there is still a small race possible. But there is so far no
>>>>> failure specific to a domain dying.
>>>>>
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> ---
>>>>>
>>>>> This was spotted when trying to destroy IOREQ servers while the domain
>>>>> is dying. The code will try to add the entry back in the P2M and
>>>>> therefore update the P2M (see arch_ioreq_server_disable() ->
>>>>> hvm_add_ioreq_gfn()).
>>>>>
>>>>> It should be possible to skip the mappin in hvm_add_ioreq_gfn(), however
>>>>> I didn't try a patch yet because checking d->is_dying can be racy (I
>>>>> can't find a proper lock).
>>
>> I understand the concern. I find it odd though that we permit
>> iommu_map() to do anything at all when the domain is already
>> dying. So irrespective of the remark below, how about bailing
>> from iommu_map() earlier when the domain is dying?
> 
> I felt this was potentially too racy to use it. But it should be fine if 
> keep the !d->is_dying below.

Why? As per later comments I didn't necessarily mean iommu_map()
literally - as indicated, the per-vendor functions ought to be
suitable to place the check, right after having taken the lock.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4F3226B5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 08:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88603.166696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lESZ5-0003YD-S9; Tue, 23 Feb 2021 07:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88603.166696; Tue, 23 Feb 2021 07:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lESZ5-0003Xo-P9; Tue, 23 Feb 2021 07:57:03 +0000
Received: by outflank-mailman (input) for mailman id 88603;
 Tue, 23 Feb 2021 07:57:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lESZ3-0003Xi-PW
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 07:57:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c111462b-dbd3-42be-b84f-691372253489;
 Tue, 23 Feb 2021 07:57:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53E9AAC6E;
 Tue, 23 Feb 2021 07:57:00 +0000 (UTC)
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
X-Inumbo-ID: c111462b-dbd3-42be-b84f-691372253489
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614067020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3clWBHAJhZAGn0wAyDOQs8az+Z/tr8dKyeXJxsN4p4g=;
	b=LzPF2GA/yV2b2UBz+AbM9psI2EiPXUptuHR7mX5J7+i/OGLwpbKVt4Rmzf+qBplGU8/wKO
	+G12kRs/O3iPiSSrC0W/WWRMQEBSH00I+12MXpbRB9oakr2eWpfp90P+D/vo9PHE3vJqm4
	5cBk8fk2q0gkTBrknl0zu9Fi/8H7/no=
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
 anthony.perard@citrix.com, andrew.cooper3@citrix.com,
 jun.nakajima@intel.com, kevin.tian@intel.com
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-3-git-send-email-boris.ostrovsky@oracle.com>
 <YC5GrgqwsR/eBwpy@Air-de-Roger>
 <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
 <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
Date: Tue, 23 Feb 2021 08:57:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 22:19, Boris Ostrovsky wrote:
> 
> On 2/22/21 6:08 AM, Roger Pau Monné wrote:
>> On Fri, Feb 19, 2021 at 09:56:32AM -0500, Boris Ostrovsky wrote:
>>> On 2/18/21 5:51 AM, Roger Pau Monné wrote:
>>>> On Wed, Jan 20, 2021 at 05:49:10PM -0500, Boris Ostrovsky wrote:
>>>>> When toolstack updates MSR policy, this MSR offset (which is the last
>>>>> index in the hypervisor MSR range) is used to indicate hypervisor
>>>>> behavior when guest accesses an MSR which is not explicitly emulated.
>>>> It's kind of weird to use an MSR to store this. I assume this is done
>>>> for migration reasons?
>>>
>>> Not really. It just seemed to me that MSR policy is the logical place to do that. Because it *is* a policy of how to deal with such accesses, isn't it?
>> I agree that using the msr_policy seems like the most suitable place
>> to convey this information between the toolstack and Xen. I wonder if
>> it would be fine to have fields in msr_policy that don't directly
>> translate into an MSR value?
> 
> 
> We have xen_msr_entry_t.flags that we can use when passing policy array back and forth. Then we can ignore xen_msr_entry_t.idx for that entry (although in earlier version of this series Jan preferred to use idx and leave flags alone).

Which, just to clarify, was not the least because of the flags
field being per-entry, i.e. per MSR, while here we want a global
indicator.

Jan


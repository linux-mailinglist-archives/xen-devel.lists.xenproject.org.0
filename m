Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8B2A60EA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18974.44136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFQj-00034d-35; Wed, 04 Nov 2020 09:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18974.44136; Wed, 04 Nov 2020 09:50:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFQi-00034E-Vh; Wed, 04 Nov 2020 09:50:12 +0000
Received: by outflank-mailman (input) for mailman id 18974;
 Wed, 04 Nov 2020 09:50:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kaFQi-000349-1a
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:50:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d866efe1-18f9-4ca1-8523-8d94695793a0;
 Wed, 04 Nov 2020 09:50:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFQe-0001IY-K4; Wed, 04 Nov 2020 09:50:08 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFQe-0002rr-BQ; Wed, 04 Nov 2020 09:50:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kaFQi-000349-1a
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:50:12 +0000
X-Inumbo-ID: d866efe1-18f9-4ca1-8523-8d94695793a0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d866efe1-18f9-4ca1-8523-8d94695793a0;
	Wed, 04 Nov 2020 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=94dmp262XI9nwNVy/C0eSWVi83JcLvwO9vi885Osw2w=; b=b/O5+zg3VtW7pyt2Gi+3dT+cop
	XPbteyiSUr6BPJB79lYKbYy/q54FH3czcc0w9+Lomr8nQYvvaLxGBm0FemHXV5DGFUXSet8kuN0wZ
	IOZUifIas8Bh3iO37Yy5heGpxDXmDOCE4nsl0oNDwCbXllqBA3sSwku6gxgRfnsfPw8k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFQe-0001IY-K4; Wed, 04 Nov 2020 09:50:08 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFQe-0002rr-BQ; Wed, 04 Nov 2020 09:50:08 +0000
Subject: Re: [PATCH v3 2/2] xen/evtchn: rework per event channel lock
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201016105839.14796-1-jgross@suse.com>
 <20201016105839.14796-3-jgross@suse.com>
 <0c5975b1-97ec-9bbb-0ed9-9055556215cd@suse.com>
 <0c39eb60-9843-9659-f7c5-4e2c3e697ee0@suse.com>
 <c77add99-f92e-126a-5a5e-81a2b5983aa0@suse.com>
 <07cc4218-7aa6-2276-32af-559c0db841b5@suse.com>
 <6cf9d927-5e8d-a705-0fac-38f81da07d7e@suse.com>
 <b5ff1e48-1245-5ea7-cf4a-3a198450aa49@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b0065652-5cae-c57e-dcac-d8948f04cda0@xen.org>
Date: Wed, 4 Nov 2020 09:50:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b5ff1e48-1245-5ea7-cf4a-3a198450aa49@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 02/11/2020 15:26, Jürgen Groß wrote:
> On 02.11.20 16:18, Jan Beulich wrote:
>> On 02.11.2020 14:59, Jürgen Groß wrote:
>>> On 02.11.20 14:52, Jan Beulich wrote:
>>>> On 02.11.2020 14:41, Jürgen Groß wrote:
>>>>> On 20.10.20 11:28, Jan Beulich wrote:
>>>>>> On 16.10.2020 12:58, Juergen Gross wrote:
>>>>>>> @@ -360,7 +352,7 @@ static long 
>>>>>>> evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
>>>>>>>         if ( rc )
>>>>>>>             goto out;
>>>>>>> -    flags = double_evtchn_lock(lchn, rchn);
>>>>>>> +    double_evtchn_lock(lchn, rchn);
>>>>>>
>>>>>> This introduces an unfortunate conflict with my conversion of
>>>>>> the per-domain event lock to an rw one: It acquires rd's lock
>>>>>> in read mode only, while the requirements here would not allow
>>>>>> doing so. (Same in evtchn_close() then.)
>>>>>
>>>>> Is it a problem to use write mode for those cases?
>>>>
>>>> "Problem" can have a wide range of meanings - it's not going to
>>>> be the end of the world, but I view any use of a write lock as
>>>> a problem when a read lock would suffice. This can still harm
>>>> parallelism.
>>>
>>> Both cases are very rare ones in the life time of an event channel. I
>>> don't think you'll ever be able to measure any performance impact from
>>> switching these case to a write lock for any well behaved guest.
>>
>> I agree as far as the lifetime of an individual port goes, but
>> we're talking about the per-domain lock here. (Perhaps my
>> choice of context in your patch wasn't the best one, as there
>> it is the per-channel lock of which two instances get acquired.
>> I'm sorry if this has lead to any confusion.)
> 
> Hmm, with the switch to an ordinary rwlock it should be fine to drop
> the requirement to hold the domain's event channel lock exclusively
> for taking the per-channel lock as a writer.

I don't think you can drop d->event_lock. It protects us against 
allocating new ports while evtchn_reset() is called.

Without it, you are going to re-open XSA-343.

Cheers,

-- 
Julien Grall


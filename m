Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648472F9AE4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69416.124199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PS9-0003Pq-2o; Mon, 18 Jan 2021 07:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69416.124199; Mon, 18 Jan 2021 07:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1PS8-0003PR-VY; Mon, 18 Jan 2021 07:59:56 +0000
Received: by outflank-mailman (input) for mailman id 69416;
 Mon, 18 Jan 2021 07:59:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1PS7-0003PM-Gq
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 07:59:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3d3f8c6-81a2-4275-9eca-c932dad413c9;
 Mon, 18 Jan 2021 07:59:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73060AB7A;
 Mon, 18 Jan 2021 07:59:53 +0000 (UTC)
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
X-Inumbo-ID: e3d3f8c6-81a2-4275-9eca-c932dad413c9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610956793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tdtds8PQS/OMj5K5aVjnufqaH2P5oVL/zKE02diqvkE=;
	b=qsRbJcoGGtyxS+v/7Lh1M9Q91A76ACI2eSKw0LoXSQhwPkOAdtFhYKV3FQ28FvKWApDTFb
	rIzCP10iwgtqCi0vqhkJfu6PIexc0x7sPzhJUg7f503WoXsPiQ77KweWsiH6fo1+G/I17C
	5vctGpchTj8IQ53tWoLe1W3Slj6TL7Y=
Subject: Re: [PATCH v3 5/8] xen/hypfs: add support for id-based dynamic
 directories
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-6-jgross@suse.com>
 <2894a231-9150-7c09-cc5c-7ef52087acf5@suse.com>
 <d4c408eb-08d8-42a8-0c0a-6580fce0e181@suse.com>
 <5e0ac85e-ecba-86ad-b350-ff30e3a40a68@suse.com>
 <bde3d3b1-a512-e1fe-cfd4-287fa0ea95cd@suse.com>
 <a515ead2-f732-ddcd-f29b-788b8997fd2a@suse.com>
 <18e4b437-6d25-cc3d-5521-11857f461beb@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a2cf474b-9d05-0d33-db9a-ed28718ad5fd@suse.com>
Date: Mon, 18 Jan 2021 08:59:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <18e4b437-6d25-cc3d-5521-11857f461beb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.01.2021 08:25, Jürgen Groß wrote:
> On 18.12.20 10:09, Jan Beulich wrote:
>> On 18.12.2020 09:57, Jürgen Groß wrote:
>>> On 17.12.20 13:14, Jan Beulich wrote:
>>>> On 17.12.2020 12:32, Jürgen Groß wrote:
>>>>> On 17.12.20 12:28, Jan Beulich wrote:
>>>>>> On 09.12.2020 17:09, Juergen Gross wrote:
>>>>>>> +static const struct hypfs_entry *hypfs_dyndir_enter(
>>>>>>> +    const struct hypfs_entry *entry)
>>>>>>> +{
>>>>>>> +    const struct hypfs_dyndir_id *data;
>>>>>>> +
>>>>>>> +    data = hypfs_get_dyndata();
>>>>>>> +
>>>>>>> +    /* Use template with original enter function. */
>>>>>>> +    return data->template->e.funcs->enter(&data->template->e);
>>>>>>> +}
>>>>>>
>>>>>> At the example of this (applies to other uses as well): I realize
>>>>>> hypfs_get_dyndata() asserts that the pointer is non-NULL, but
>>>>>> according to the bottom of ./CODING_STYLE this may not be enough
>>>>>> when considering the implications of a NULL deref in the context
>>>>>> of a PV guest. Even this living behind a sysctl doesn't really
>>>>>> help, both because via XSM not fully privileged domains can be
>>>>>> granted access, and because speculation may still occur all the
>>>>>> way into here. (I'll send a patch to address the latter aspect in
>>>>>> a few minutes.) While likely we have numerous existing examples
>>>>>> with similar problems, I guess in new code we'd better be as
>>>>>> defensive as possible.
>>>>>
>>>>> What do you suggest? BUG_ON()?
>>>>
>>>> Well, BUG_ON() would be a step in the right direction, converting
>>>> privilege escalation to DoS. The question is if we can't do better
>>>> here, gracefully failing in such a case (the usual pair of
>>>> ASSERT_UNREACHABLE() plus return/break/goto approach doesn't fit
>>>> here, at least not directly).
>>>>
>>>>> You are aware that this is nothing a user can influence, so it would
>>>>> be a clear coding error in the hypervisor?
>>>>
>>>> A user (or guest) can't arrange for there to be a NULL pointer,
>>>> but if there is one that can be run into here, this would still
>>>> require an XSA afaict.
>>>
>>> I still don't see how this could happen without a major coding bug,
>>> which IMO wouldn't go unnoticed during a really brief test (this is
>>> the reason for ASSERT() in hypfs_get_dyndata() after all).
>>
>> True. Yet the NULL derefs wouldn't go unnoticed either.
>>
>>> Its not as if the control flow would allow many different ways to reach
>>> any of the hypfs_get_dyndata() calls.
>>
>> I'm not convinced of this - this is a non-static function, and the
>> call patch 8 adds (just to take an example) is not very obvious to
>> have a guarantee that allocation did happen and was checked for
>> success. Yes, in principle cpupool_gran_write() isn't supposed to
>> be called in such a case, but it's the nature of bugs assumptions
>> get broken.
>>
>>> I can add security checks at the appropriate places, but I think this
>>> would be just dead code. OTOH if you are feeling strong here lets go
>>> with it.
>>
>> Going with it isn't the only possible route. The other is to drop
>> the ASSERT()s altogether. It simply seems to me that their addition
>> is a half-hearted attempt when considering what was added to
>> ./CODING_STYLE not all that long ago.
> 
> IMO The ASSERT()s are serving two purposes here: catching errors
> (which, as you stated already, might be catched later in any case),
> and documenting for the code reader that the condition they are
> testing should always be true and it a violation of it ought not to
> happen.
> 
> I can drop the ASSERT() calls, but I think they should be kept due
> to their documentation aspect.

Well, okay, I can see your point. Keep them in then, despite us
coming nowhere close to having similar NULL related asserts in
all similar places, I believe.

Jan


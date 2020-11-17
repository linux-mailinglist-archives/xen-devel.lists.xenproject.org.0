Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D12B67AA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 15:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29037.58232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf29s-0001uE-Im; Tue, 17 Nov 2020 14:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29037.58232; Tue, 17 Nov 2020 14:40:36 +0000
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
	id 1kf29s-0001ts-FE; Tue, 17 Nov 2020 14:40:36 +0000
Received: by outflank-mailman (input) for mailman id 29037;
 Tue, 17 Nov 2020 14:40:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kf29q-0001tn-I0
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:40:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d652301-9b6b-4e75-bf71-45e969c34aae;
 Tue, 17 Nov 2020 14:40:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FDFEAC2E;
 Tue, 17 Nov 2020 14:40:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kf29q-0001tn-I0
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:40:34 +0000
X-Inumbo-ID: 1d652301-9b6b-4e75-bf71-45e969c34aae
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1d652301-9b6b-4e75-bf71-45e969c34aae;
	Tue, 17 Nov 2020 14:40:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605624031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6HFszFh1G7iRnoFVT7oihr/NGDAnvmpT5ygMnzEOBt4=;
	b=NzNjnrwCZ7deUl5beX1zmvgKsNxEvU6QSRUAac9h4qnIxecopLIs9MQYcIXwJGHFCtOwle
	9XkkY3cgGxBe/4sZYrut8aDrnLLWtuKGmB1YR9CrQ6uCVA0manT1nOTllNtxSXVzE5E1M8
	DHJP7qSD+kTUyL9q8DyhNae+dDg1ZK0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0FDFEAC2E;
	Tue, 17 Nov 2020 14:40:31 +0000 (UTC)
Subject: Re: [PATCH 08/12] xen/hypfs: support dynamic hypfs nodes
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-9-jgross@suse.com>
 <d8653200-fbee-4e87-3e2d-7062879d7b4e@suse.com>
 <6fe809d5-09c1-28d3-61ec-10244b2d7d5f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e93c98cd-1cd2-1646-9db9-3ebd8bc3684c@suse.com>
Date: Tue, 17 Nov 2020 15:40:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <6fe809d5-09c1-28d3-61ec-10244b2d7d5f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.11.2020 15:29, Jürgen Groß wrote:
> On 17.11.20 13:37, Jan Beulich wrote:
>> On 26.10.2020 10:13, Juergen Gross wrote:
>>> --- a/xen/common/hypfs.c
>>> +++ b/xen/common/hypfs.c
>>> @@ -19,28 +19,29 @@
>>>   CHECK_hypfs_dirlistentry;
>>>   #endif
>>>   
>>> -#define DIRENTRY_NAME_OFF offsetof(struct xen_hypfs_dirlistentry, name)
>>> -#define DIRENTRY_SIZE(name_len) \
>>> -    (DIRENTRY_NAME_OFF +        \
>>> -     ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
>>> -
>>>   struct hypfs_funcs hypfs_dir_funcs = {
>>>       .read = hypfs_read_dir,
>>> +    .getsize = hypfs_getsize,
>>> +    .findentry = hypfs_dir_findentry,
>>>   };
>>>   struct hypfs_funcs hypfs_leaf_ro_funcs = {
>>>       .read = hypfs_read_leaf,
>>> +    .getsize = hypfs_getsize,
>>>   };
>>>   struct hypfs_funcs hypfs_leaf_wr_funcs = {
>>>       .read = hypfs_read_leaf,
>>>       .write = hypfs_write_leaf,
>>> +    .getsize = hypfs_getsize,
>>>   };
>>>   struct hypfs_funcs hypfs_bool_wr_funcs = {
>>>       .read = hypfs_read_leaf,
>>>       .write = hypfs_write_bool,
>>> +    .getsize = hypfs_getsize,
>>>   };
>>>   struct hypfs_funcs hypfs_custom_wr_funcs = {
>>>       .read = hypfs_read_leaf,
>>>       .write = hypfs_write_custom,
>>> +    .getsize = hypfs_getsize,
>>>   };
>>
>> With the increasing number of fields that may (deliberately or
>> by mistake) be NULL, should we gain some form of proactive
>> guarding against calls through such pointers?
> 
> Hmm, up to now I think such a bug would be detected rather fast.

Not sure: Are there any unavoidable uses of all affected code
paths?

> I can add some ASSERT()s for mandatory functions not being NULL when
> a node is added dynamically or during hypfs initialization for the
> static nodes.

I'm not sure ASSERT()s alone are enough. I'd definitely prefer
something which at least avoids the obvious x86 PV privilege
escalation attack in case a call through NULL has gone
unnoticed earlier on. E.g. rather than storing NULL in unused
entries, store a non-canonical pointer so that the effect will
"just" be a DoS.

>>> @@ -88,6 +93,23 @@ static void hypfs_unlock(void)
>>>       }
>>>   }
>>>   
>>> +void *hypfs_alloc_dyndata(unsigned long size, unsigned long align)
>>
>> Will callers really need to specify (high) alignment values? IOW ...
>>
>>> +{
>>> +    unsigned int cpu = smp_processor_id();
>>> +
>>> +    ASSERT(per_cpu(hypfs_locked, cpu) != hypfs_unlocked);
>>> +    ASSERT(per_cpu(hypfs_dyndata, cpu) == NULL);
>>> +
>>> +    per_cpu(hypfs_dyndata, cpu) = _xzalloc(size, align);
>>
>> ... is xzalloc_bytes() not suitable for use here?
> 
> Good question.
> 
> Up to now I think we could get away without specific alignment.
> 
> I can drop that parameter for now if you'd like that better.

I think control over alignment should be limited to those
special cases really needing it.

>>> @@ -275,22 +305,25 @@ int hypfs_read_leaf(const struct hypfs_entry *entry,
>>>   
>>>       l = container_of(entry, const struct hypfs_entry_leaf, e);
>>>   
>>> -    return copy_to_guest(uaddr, l->u.content, entry->size) ? -EFAULT: 0;
>>> +    return copy_to_guest(uaddr, l->u.content, entry->funcs->getsize(entry)) ?
>>> +                                              -EFAULT : 0;
>>
>> With the intended avoiding of locking, how is this ->getsize()
>> guaranteed to not ...
>>
>>> @@ -298,7 +331,7 @@ static int hypfs_read(const struct hypfs_entry *entry,
>>>           goto out;
>>>   
>>>       ret = -ENOBUFS;
>>> -    if ( ulen < entry->size + sizeof(e) )
>>> +    if ( ulen < size + sizeof(e) )
>>>           goto out;
>>
>> ... invalidate the checking done here? (A similar risk looks to
>> exist on the write path, albeit there we have at least the
>> ->max_size checks, where I hope that field isn't mean to become
>> dynamic as well.)
> 
> I think you are right. I should add the size value as a parameter to the
> read and write functions.

Except that a function like hypfs_read_leaf() shouldn't really
require its caller to pass in the size of the leaf's payload.

Jan


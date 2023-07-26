Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C62976320B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570236.891873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOapf-0002Wc-7d; Wed, 26 Jul 2023 09:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570236.891873; Wed, 26 Jul 2023 09:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOapf-0002U9-4D; Wed, 26 Jul 2023 09:29:23 +0000
Received: by outflank-mailman (input) for mailman id 570236;
 Wed, 26 Jul 2023 09:29:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qOapd-0002Tz-RN
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:29:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOapd-0005kg-3l; Wed, 26 Jul 2023 09:29:21 +0000
Received: from [15.248.2.150] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOapc-0002Wf-R2; Wed, 26 Jul 2023 09:29:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=84H0gbAZAv7krrCpVksJiF1SmJZa0HrIDPZK/lKzpOU=; b=rc+rSeBaSLKU1qIjXNKuxWsUZR
	5Z9+6i61lKzThpjwYoYCeJKCa0Q+DcJK+piIUfi/Wd9rfIa4xawh9FyglqI7c2U+QaomRlfJAaCG0
	23J3+RyqqkpNMXzW34uPc62xMCdWRJn7xtUtPNPYKgcRkgo9+FTkg+H6D8f1Cgatm750=;
Message-ID: <c86e0983-6b51-c5be-a666-20fd407b2537@xen.org>
Date: Wed, 26 Jul 2023 10:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/25] tools/xenstore: make hashtable key and value
 parameters const
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-9-jgross@suse.com>
 <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>
 <a6370aa2-ec6c-259f-3e24-bc1a74ead2a6@suse.com>
 <f0a115a6-843e-74ff-7f0f-28cf0545932e@xen.org>
 <3d2daedf-b2c0-5a26-a57d-4742f69f08b7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3d2daedf-b2c0-5a26-a57d-4742f69f08b7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/07/2023 09:44, Juergen Gross wrote:
> On 26.07.23 10:20, Julien Grall wrote:
>> To give a concrete example, with the current interface we are telling 
>> the user that what they store in the hashtable can be modified at some 
>> point. By adding 'const' for the value in hashtable_add(), we can 
>> mislead a user to think it is fine to store static string, yet this is 
>> not enforced all the way through. So one could mistakenly think that 
>> values returned hashtable_search() can be modified. And the compiler 
>> will not be here to help enforcing it because you cast-away the const.
> 
> Yes, like in the case of strstr().
> 
> It takes two const char * parameters and it is returning char *, even 
> with it
> pointing into the first parameter.

This is a pretty good example on how to not write an interface. :)

> 
>> Do you have any code in this series that requires the 'const' in 
>> hashtable_add()? If so, can you point me to the patch and I will have 
>> a look?
> 
> I had it when writing this patch, but this requirement is gone now. But 
> please
> note that this means to drop the const from db_write(), too.
> 
>> If not, then I will strongly argue that this should be dropped because 
>> dropping a const is always a recipe for disaster.
> 
> Depends IMO.
> 
> I believe it is better as I've done it,
> but in case you insist on it I 
> can drop
> the patch.

Well... I can always be swayed if there is a good argument to make it 
const. So far, you mention that hashtable doesn't modify the content but 
you don't really explain why waiving away the help from the compiler is 
ok. Therefore, to me it seems the downside is bigger than the benefit.

Also, I am not asking to drop the patch. The const on the key is ok. I 
am only requesting to remove the const on the value.

> 
> An alternative would be make hashtable_search() return a const and only 
> cast the
> const away where it is really needed (and probably with a prominent 
> comment at
> the related hashtable_add() place). I think this will hit 
> xenstored_domain.c use
> cases only.

Again, this still means we are casting away the const somewhere. This is 
the part I am against if there is no strong justification for it (i.e. 
there is no other way to do it).

Cheers,

-- 
Julien Grall


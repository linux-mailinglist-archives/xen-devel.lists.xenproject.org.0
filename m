Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF102D59D3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 12:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49145.86911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKa5-0002oQ-2X; Thu, 10 Dec 2020 11:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49145.86911; Thu, 10 Dec 2020 11:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKa4-0002o5-VX; Thu, 10 Dec 2020 11:57:56 +0000
Received: by outflank-mailman (input) for mailman id 49145;
 Thu, 10 Dec 2020 11:57:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knKa3-0002o0-Mk
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 11:57:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knKa1-0005eh-Nf; Thu, 10 Dec 2020 11:57:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knKa1-0001w6-Dr; Thu, 10 Dec 2020 11:57:53 +0000
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
	bh=vrBLsUjlzYoDlkXVsPb2wZLmKVxCUpiso65HZWimxZ8=; b=ueG75IqjVUNWvJZ9NnldyJFlVn
	2UO69DhkmXUjO575Tuxy2S/6bTVGFj4yreOSwALR7cnx+KOH8a3Ng0iwz0cfjHKKv4IT2rD6nJeed
	i+slXrJPLY4BarhMrRQpwj8TPuMmiAkDvqUvl8GGxaBbeslt4JUKwEMx4g5aNoCYEYGk=;
Subject: Re: [PATCH RFC 0/3] xen: add hypfs per-domain abi-features
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201209161618.309-1-jgross@suse.com>
 <a2270efd-19d4-5d5e-2e8b-4696ba9751ab@xen.org>
 <b2118f4d-07c5-abae-2b1b-ac8f45c02563@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8122851a-e674-4283-d82a-9cc99425d66c@xen.org>
Date: Thu, 10 Dec 2020 11:57:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <b2118f4d-07c5-abae-2b1b-ac8f45c02563@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/12/2020 07:49, Jürgen Groß wrote:
> On 09.12.20 17:24, Julien Grall wrote:
>> Hi,
>>
>> On 09/12/2020 16:16, Juergen Gross wrote:
>>> This small series is meant as an example how to add further dynamical
>>> directories to hypfs. It can be used to replace Paul's current approach
>>> to specify ABI-features via domain create flags and replace those by
>>> hypfs nodes.
>>
>> This can only work if all the ABI-features are not required at the 
>> time of creating the domain.
> 
> Yes. In case there is some further initialization needed this has to be
> done later depending on the setting.
We used to allocate vCPUs after the domain has been created. But this 
ended up in a can of worms because this requires a careful ordering of 
the hypercalls.

So I would rather like to avoid introducing similar operation again...

> 
>> Those features should also be set only once. Furthermore, HYPFS is so 
>> far meant to be optional.
> 
> "set once" isn't the point. They should not be able to change after the
> domain has been started, and that is covered.

That really depends on the flag. Imagine there are dependencies between 
flags or memory needs to be allocated.

> 
>>
>> So it feels to me Paul's approach is leaner and better for the 
>> ABI-features purpose.
> 
> Depends.
> 
> My approach doesn't need any tools side changes after first
> implementation when adding new abi-features. And it isn't expanding an
> unstable interface.
> 
> In the end this is the reason I marked this series as RFC. If using
> flags is preferred, fine.

I prefer the flag version. Let see what other thinks.

Cheers,

---
Julien Grall


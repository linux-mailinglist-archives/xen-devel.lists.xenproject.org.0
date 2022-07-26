Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C993581993
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 20:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375662.608120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGPAO-0004iH-DW; Tue, 26 Jul 2022 18:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375662.608120; Tue, 26 Jul 2022 18:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGPAO-0004gK-Ar; Tue, 26 Jul 2022 18:20:24 +0000
Received: by outflank-mailman (input) for mailman id 375662;
 Tue, 26 Jul 2022 18:20:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGPAM-0004gE-Fd
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 18:20:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGPAL-0006sM-8v; Tue, 26 Jul 2022 18:20:21 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.237.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGPAL-0007ym-1c; Tue, 26 Jul 2022 18:20:21 +0000
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
	bh=hhn8BvzTgZh6i8oaH+6cF0772+3Ozdc2gbiQ6dC18ok=; b=jRrG/pZYjfka0zV8zFLhd9l2kP
	wZXMVXoIxdYRrCKkcQt0NuKN8YGr6Uq8ii+JDIZYVqsLWfQuNWRZ+7WcQwfbbpnWgQBQ87vqy4fz8
	4U0WmzdXLMIZ+x3SDFEaPawTGDw9DEo2Am5iPXUE471MPyvKYBe/IDDWiglYuNeaW2zk=;
Message-ID: <d7989545-2e3c-2772-4a23-ec0bc92a7245@xen.org>
Date: Tue, 26 Jul 2022 19:20:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] page-alloc: fix initialization of cross-node regions
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "Xia, Hongyan" <hongyxia@amazon.com>
References: <473c82d9-0f81-b4f4-70a3-8dfc3beb2be2@suse.com>
 <CAJ=z9a2MsEzLwMStTY-1Nxy0y5QZA=CaUsF84q1e_pjqL2n3qw@mail.gmail.com>
 <5ea40e1c-6be4-ea82-accb-8bfc21cdf987@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5ea40e1c-6be4-ea82-accb-8bfc21cdf987@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/07/2022 17:18, Jan Beulich wrote:
> On 25.07.2022 18:05, Julien Grall wrote:
>> (Sorry for the formatting)
> 
> No issues seen.

Good to know. I sent it from my phone and the gmail app used to mangle 
e-mails.

> 
>> On Mon, 25 Jul 2022, 14:10 Jan Beulich, <jbeulich@suse.com> wrote:
>>
>>> Quite obviously to determine the split condition successive pages'
>>> attributes need to be evaluated, not always those of the initial page.
>>>
>>> Fixes: 72b02bc75b47 ("xen/heap: pass order to free_heap_pages() in heap
>>> init")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Part of the problem was already introduced in 24a53060bd37 ("xen/heap:
>>> Split init_heap_pages() in two"), but there it was still benign.
>>>
>>
>> Is this because range will never cross numa node? How about the fake NUMA
>> node?
> 
> No (afaict), because pages were still freed one by one (and hence node
> boundaries still wouldn't end up in the middle of a buddy).

So I agree that free_heap_pages() would be called with one page at the 
time. However, I think _init_heap_pages() would end up to be called with 
the full range.

So we would initialize the first node but not the others (if the range 
spans over multiple ones). Therefore, I think free_heap_pages() could 
dereference a NULL pointer.

Anyway, I would not expect anyone to only backport the patch to split 
_init_heap_pages() and... in any case you already committed it (which is 
fine given this is a major regression).

Cheers,

-- 
Julien Grall


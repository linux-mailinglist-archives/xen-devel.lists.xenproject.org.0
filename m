Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774BD6809AC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486727.754160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQb3-0001DC-Oc; Mon, 30 Jan 2023 09:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486727.754160; Mon, 30 Jan 2023 09:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQb3-0001BU-KH; Mon, 30 Jan 2023 09:37:05 +0000
Received: by outflank-mailman (input) for mailman id 486727;
 Mon, 30 Jan 2023 09:37:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMQb1-0001BM-RZ
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 09:37:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMQb1-0004PL-Hx; Mon, 30 Jan 2023 09:37:03 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMQb1-0000r0-BP; Mon, 30 Jan 2023 09:37:03 +0000
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
	bh=zlHs4sQPioNGt/jm0p8NQqKlLxy5Zf7TJ4QtHn0s63U=; b=S/TEn2pWoWiXHOuxArnurzZTnR
	GA2R8avJ4yEn0ZzaYkAGRJjq17O8LF/CJ05kxsykVBUwuE3ngdYBLXIa7CTayXz5AbF4Q9K+Ig73d
	7f0p+p/16/J4Cb+Ueo35mRI2qk/QfYqSUUeCODKK2aYwEbX/k8/NZxbCyoYrx6qotMUc=;
Message-ID: <c09e6d5e-8474-3c53-6d40-35a9e41863c7@xen.org>
Date: Mon, 30 Jan 2023 09:37:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3] xen/public: move xenstore related doc into 9pfs.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230130090937.31623-1-jgross@suse.com>
 <83ea4c36-4762-c06f-28bc-00deedb7efd3@xen.org>
 <65757a42-f55b-55e9-4853-4854ecabbfca@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <65757a42-f55b-55e9-4853-4854ecabbfca@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/01/2023 09:23, Juergen Gross wrote:
> On 30.01.23 10:18, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 30/01/2023 09:09, Juergen Gross wrote:
>>> The Xenstore related documentation is currently to be found in
>>> docs/misc/9pfs.pandoc, instead of the related header file
>>> xen/include/public/io/9pfs.h like for most other paravirtualized
>>> device protocols.
>>>
>>> There is a comment in the header pointing at the document, but the
>>> given file name is wrong. Additionally such headers are meant to be
>>> copied into consuming projects (Linux kernel, qemu, etc.), so pointing
>>> at a doc file in the Xen git repository isn't really helpful for the
>>> consumers of the header.
>>>
>>> This situation is far from ideal, which is already being proved by the
>>> fact that neither qemu nor the Linux kernel are implementing the
>>> device attach/detach protocol correctly. Additionally the documented
>>> Xenstore entries are not matching the reality, as the "tag" Xenstore
>>> entry is on the frontend side, not on the backend one.
>>>
>>> There is another bug in the connection sequence: the frontend needs to
>>> wait for the backend to have published its features before being able
>>> to allocate its rings and event-channels.
>>>
>>> Change that by moving the Xenstore related 9pfs documentation from
>>> docs/misc/9pfs.pandoc into xen/include/public/io/9pfs.h while fixing
>>> the wrong Xenstore entry detail and the connection sequence.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V2:
>>> - add reference to header in the pandoc document (Jan Beulich)
>>> V3:
>>> - fix flaw in the connection sequence
>>
>> Please don't do that in the same patch. This makes a lot more 
>> difficult to confirm the doc movement was correct.
> 
> You have to check it manually anyway, as the comment format is prefixing
> " * " to every line.
> 
> Its not as if the changes would be THAT complicated, and the commit message
> is quite clear WHAT is changed.

You are breaking two conventional rules [1]:
   1. Patch should only be doing one logical thing
   2. Don't mix code clean-up and code changes

While there are a couple of cases we are tolerating it, I think doing 
code clean-up and code movement at the same time should always be avoided.

> 
> I can do the split, of course, if you really need that (in this case I'd
> end up with 3 patches, one for the move, one for the "tag" entry, and one
> for the fix of the connection sequence).

That would be my preference because the simpler the patches are the 
easier they are to review.

Cheers,

[1] 
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Break_down_your_patches_appropriately

-- 
Julien Grall


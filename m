Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A742E1DBE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 16:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58428.102732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5kS-0007Sd-96; Wed, 23 Dec 2020 15:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58428.102732; Wed, 23 Dec 2020 15:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks5kS-0007SG-5b; Wed, 23 Dec 2020 15:08:20 +0000
Received: by outflank-mailman (input) for mailman id 58428;
 Wed, 23 Dec 2020 15:08:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ks5kQ-0007SB-JO
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 15:08:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks5kO-0000X3-JO; Wed, 23 Dec 2020 15:08:16 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks5kO-0002fb-BS; Wed, 23 Dec 2020 15:08:16 +0000
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
	bh=iGTyooH/uXRVYSjXj+Kacw5JiyS5fUAIh1te09HPLUI=; b=jbG7U1c6r5Pu9CCdW1zwDKlZmt
	bD4tVJZCpXz4io5Ze4P3oPLOVZlG1VNFI5a+u9R5MKipX2bD95DPSV1+eErEuKiMUSPs/9f65+pHq
	Vs9WoOWMdnV2IFt+bJ7xOOmXB/xqg6aUKy017Y9Zvu7vH3OUDi/kbdTDell9owc1sujk=;
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Jan Beulich <jbeulich@suse.com>
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
 <ce7d0e42-2066-0007-0f82-c55c63a952df@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9b50863c-4236-7202-6c03-555e58cbf9ec@xen.org>
Date: Wed, 23 Dec 2020 15:08:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ce7d0e42-2066-0007-0f82-c55c63a952df@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/12/2020 14:56, Jan Beulich wrote:
> On 23.12.2020 15:44, Julien Grall wrote:
>> On 23/12/2020 13:41, Jan Beulich wrote:
>>> On 23.12.2020 14:33, Julien Grall wrote:
>>>> On 23/12/2020 13:12, Jan Beulich wrote:
>>>>>   From the input by both of you I still can't
>>>>> conclude whether this patch should remain as is in v4, or revert
>>>>> back to its v2 version. Please can we get this settled so I can get
>>>>> v4 out?
>>>>
>>>> I haven't had time to investigate the rest of the VM event code to find
>>>> other cases where this may happen. I still think there is a bigger
>>>> problem in the VM event code, but the maintainer disagrees here.
>>>>
>>>> At which point, I see limited reason to try to paper over in the common
>>>> code. So I would rather ack/merge v2 rather than v3.
>>>
>>> Since I expect Tamas and/or the Bitdefender folks to be of the
>>> opposite opinion, there's still no way out, at least if "rather
>>> ack" implies a nak for v3.
>>
>> The only way out here is for someone to justify why this patch is
>> sufficient for the VM event race.
> 
> I think this is too much you demand.

I guess you didn't notice that I did most of the job by providing an 
analysis in my e-mail... I don't think it is too much demanding to read 
the analysis and say whether I am correct or not.

Do you really prefer to add code would get rot because unused?

> Moving in the right direction
> without arriving at the final destination is still a worthwhile
> thing to do imo.
> 
>>> Personally, if this expectation of
>>> mine is correct, I'd prefer to keep the accounting but make it
>>> optional (as suggested in a post-commit-message remark).
>>> That'll eliminate the overhead you appear to be concerned of,
>>> but of course it'll further complicate the logic (albeit just
>>> slightly).
>>
>> I am more concerned about adding over complex code that would just
>> papering over a bigger problem. I also can't see use of it outside of
>> the VM event discussion.
> 
> I think it is a generally appropriate thing to do to wait for
> callbacks to complete before tearing down their origin control
> structure. There may be cases where code structure makes this
> unnecessary, but I don't think this can be an expectation to
> all the users of the functionality. Hence my suggestion to
> possibly make this optional (driven directly or indirectly by
> the user of the registration function).

As you tend to say, we should not add code unless there is a user. So 
far the only possible user is dubbious. If you find another user, then 
we can discuss whether this patch makes sense.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717A61FD71
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 19:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439570.693602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os6n6-0003ae-Iz; Mon, 07 Nov 2022 18:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439570.693602; Mon, 07 Nov 2022 18:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os6n6-0003Xj-G0; Mon, 07 Nov 2022 18:24:12 +0000
Received: by outflank-mailman (input) for mailman id 439570;
 Mon, 07 Nov 2022 18:24:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1os6n5-0003Xd-Kp
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 18:24:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os6n5-00061X-BV; Mon, 07 Nov 2022 18:24:11 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os6n5-0003N3-4o; Mon, 07 Nov 2022 18:24:11 +0000
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
	bh=GjfLyWq2gROIyyNMG0suSFnhdt3Q6QfuNH1jlqrNBM0=; b=KsJKzhmYjYhorvSv2byFNtR3Cu
	uSVdjdJqohk+7jfZTxXxvRKfiqmuCOjQdH7Hq+6kK+hB/iHRWJHFvULIhZ0Ryt68hjw2SvHym3N3A
	BfAhI4jqIh0BhIhndTW2RKoIV5ZK8ZeBGqkRBFskwSu+S8zbXbCVKeGOA8ZWPUbNnww0=;
Message-ID: <7cf84a7c-9730-fb0e-a9d7-e92d09ecdd49@xen.org>
Date: Mon, 7 Nov 2022 18:24:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech>
 <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
 <CAG+AhRUT75hkaLZi0v0E_ozzyUY9QLHYGTamhXAoKfV2gZMwfg@mail.gmail.com>
 <9a996e9d-d9ce-f562-122d-1e661d25614c@xen.org>
 <CAG+AhRVPKDef_PTLEL7ybBd=YWHgxRNfwf87nbMApd6YUp7bgA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRVPKDef_PTLEL7ybBd=YWHgxRNfwf87nbMApd6YUp7bgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/11/2022 13:44, Carlo Nonato wrote:
> Hi Julien,

Hi Carlo,

> On Tue, Oct 25, 2022 at 1:15 PM Julien Grall <julien@xen.org> wrote:
>> On 25/10/2022 11:53, Carlo Nonato wrote:
>>> Hi Julien,
>>>
>>> On Fri, Oct 21, 2022 at 8:02 PM Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Carlo,
>>>>
>>>> On 26/08/2022 13:51, Carlo Nonato wrote:
>>>>> This commit adds array pointers to domains as well as to the hypercall
>>>>> and configuration structure employed in domain creation. The latter is used
>>>>> both by the toolstack and by Xen itself to pass configuration data to the
>>>>> domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to be
>>>>> able to access guest memory in the first case. This implies special care for
>>>>> the copy of the configuration data into the domain data, meaning that a
>>>>> discrimination variable for the two possible code paths (coming from Xen or
>>>>> from the toolstack) is needed.
>>>>
>>>> So this means that a toolstack could set from_guest. I know the
>>>> toolstack is trusted... However, we should try to limit when the trust
>>>> when this is possible.
>>>>
>>>> In this case, I would consider to modify the prototype of
>>>> domain_create() to pass internal information.
>>>
>>> Doing as you said isn't a bit too invasive? I should also change all the call
>>> sites of domain_create() and this means x86 too.
>>
>> Yes there will be a few calls to modify. But this is better than hacking
>> the hypercall interface to cater for internal use.
>>
>>> Isn't there an easier way to spot a guest address? Maybe just looking at the
>>> address value...
>>
>> HVM/Arm guest have a separate address space. So it is not possible to
>> differentiate between guest vs hypervisor address.
>>
>>> Or maybe adding an internal flag to the do_domctl() path.
>> IIUC, this flag would indicate whether the XEN_GUEST_HANDLE() is an
>> hypervisor or guest address. Is that correct?
>>
>> If so, I dislike it. I am not sure what the other maintainers think, but
>> personally updating domain_create() is my preferred way.
> 
> Sorry to bother you again on this topic, but I thought of a way to get rid of
> the "from_guest" field which I hope is simple enough to convince you.
> I can call copy_from_guest() *only* in domctl.c, overwriting the colors
> pointer with a new, Xen allocated, array.
> This lets me simplify the logic in domain_coloring_init() since all the arrays
> coming to it via the domainconfig struct are allocated in Xen memory only.
> It's still a bit of a hack since I'm using the XEN_GUEST_HANDLE as a normal
> Xen pointer, but it's by far less hacky than before and doesn't have the trust
> problem.

You don't have the trust problem but you are still mixing guest handle 
and xen pointer. I continue dislike this because this a gross hack that 
may save you some effort today but will be a nightmare to 
review/use/maintain (the developer will have to remember whether the 
field contain a guest address or xen address).

Cheers,

-- 
Julien Grall


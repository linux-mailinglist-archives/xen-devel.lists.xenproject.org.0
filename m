Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544BB634817
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 21:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447285.703331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZpo-0003v7-2j; Tue, 22 Nov 2022 20:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447285.703331; Tue, 22 Nov 2022 20:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZpn-0003sH-W6; Tue, 22 Nov 2022 20:25:35 +0000
Received: by outflank-mailman (input) for mailman id 447285;
 Tue, 22 Nov 2022 20:25:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxZpm-0003sB-4o
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 20:25:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZpk-0007tc-TL; Tue, 22 Nov 2022 20:25:32 +0000
Received: from [54.239.6.190] (helo=[192.168.0.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZpk-0003xV-NH; Tue, 22 Nov 2022 20:25:32 +0000
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
	bh=KWjCQs3wcmRoxZynxW2SWqy+EjFwluHlLuchgtYaUCQ=; b=jzErxt4tbmEkNqsJiIrVdAxP9h
	+K/jIj8XRJYXBga+pBAm+cnyKRU9uuQjs6eD+Pd5Bdw8lhcL4SSUz1se9MBM0ECt9owHKWhMUKF43
	d2dLJlzb1t1iwjXYpt6fBH6qWPLigQZBy0hGvTOo2fs6Zn2ddY1llozLjnr3q69QpYbA=;
Message-ID: <2645971b-8094-6108-f3dd-567e93d1f1e5@xen.org>
Date: Tue, 22 Nov 2022 21:25:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/9] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: marco.solieri@unimore.it, xen-devel@lists.xenproject.org,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-3-carlo.nonato@minervasys.tech>
 <CAG+AhRU8zrHaxrNQqyu-c4niB2DWXcQRmvsit_samXtDa2LpfQ@mail.gmail.com>
 <2e6c8d81-01d1-81a1-8fd4-4385e46befe4@suse.com>
 <CAG+AhRUEoJQGSw2qJmE1JFTuCMa_0sUR2+M2Zd8pkd+dgf2wPg@mail.gmail.com>
 <6c07cdfc-888a-45bb-2077-528a809a62f4@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6c07cdfc-888a-45bb-2077-528a809a62f4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 21/11/2022 16:40, Jan Beulich wrote:
> On 21.11.2022 17:23, Carlo Nonato wrote:
>> On Mon, Nov 21, 2022 at 4:14 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 21.11.2022 15:50, Carlo Nonato wrote:
>>>> I want to ask you some questions about this patch because in the previous
>>>> version me and Julien have discussed how cache colors should be passed in
>>>> domain creation. You should be able to read that discussion, anyway here is
>>>> a link to it
>>>>
>>>> https://marc.info/?l=xen-devel&m=166151802002263
>>>
>>> I've looked at the first few entries, without finding an answer to ...
>>>
>>>> In short, using struct xen_arch_domainconfig works fine only when domctl
>>>> hypercall is issued. That struct contains a XEN_GUEST_HANDLE so it
>>>> should point to guest memory and must not be used when creating a domain
>>>> from Xen itself (i.e. dom0 or dom0less domains). The easy way to go is then
>>>> changing the domain_create() signature to require also a color array and its
>>>> length to be passed in for these latter cases.
>>>> Are you ok with that? See below for more comments.
>>>
>>> ... my immediate question: Does supplying the colors necessarily need to
>>> done right at domain creation? Wouldn't it suffice to be done before first
>>> allocating memory to the new domain, i.e. via a separate domctl (and then
>>> for Xen-created domains via a separate Xen-internal function, which the
>>> new domctl handling would also call)? Or do colors also affect the
>>> allocation of struct domain itself (and pointers hanging off of it)?
>>
>> This would be really good. The only problem I can see is the p2m allocation
>> which is done during domain creation. With the current set of patches it
>> results in a "Failed to allocate P2M pages" since we want to have p2m tables
>> allocated with the same color of the domain and a null page is returned
>> because we have no colors.
> 
> Hmm, I see. It would seem to me that this p2m init really is happening
> too early. Ideally domain_create would merely mean creating a largely
> empty container, with stuff being populated subsequently as necessary.

The vGIC is not optional. So to me it sounds wrong to defer the decision 
to after the domain is created.

It is not clear to me how you would check that mandatory components have 
been properly initialized.

> But I guess this is too much of a re-work to be done in the context
> here, plus of course I may be overlooking something which actually
> makes it necessary for domain creation to be structured the way it is
> right now. (Imo the reason for the early minimal population of the p2m,
> added only quite recently, wasn't a good one, and the vGIC init would
> better be deferred. Yet once again I may lack details on why that's not
> possible.)

See above for the theoritical part. For the practice part, we need to 
know the vGIC version at domain creation because it impact the maximum 
of vCPU we can expose.

It is also not very clear where this could be initialized. Are you 
suggesting to add an extra mandatory hypercall? FAOD, I don't think 
p2m_set_allocation() would be the right place.

Cheers,

-- 
Julien Grall


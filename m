Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71AF30A240
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 07:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79539.144832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6T63-000603-Uk; Mon, 01 Feb 2021 06:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79539.144832; Mon, 01 Feb 2021 06:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6T63-0005zd-RH; Mon, 01 Feb 2021 06:54:03 +0000
Received: by outflank-mailman (input) for mailman id 79539;
 Mon, 01 Feb 2021 06:54:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=et9n=HD=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1l6T61-0005xz-Cs
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 06:54:02 +0000
Received: from mailrelay1-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.10]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23867401-90df-48a0-9d6a-be39100a004e;
 Mon, 01 Feb 2021 06:53:59 +0000 (UTC)
Received: from [192.168.101.129] (h87-96-135-119.cust.a3fiber.se
 [87.96.135.119])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 415b493c-645a-11eb-9242-d0431ea8a283;
 Mon, 01 Feb 2021 06:53:57 +0000 (UTC)
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
X-Inumbo-ID: 23867401-90df-48a0-9d6a-be39100a004e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:to:subject:from;
	bh=9iSWWxPn+xYNB147RqOz9EaHPk6vjfbCLBnxZjD6gxY=;
	b=NO2kyN3ctfG/AcWlHjGUfiwmZHJT/eKH0QMepwBmfz0vj7BlsmM+Nf8NJ8SweenlKgcQcB4n1Sn5z
	 OXzckIbZFVkxKpSQCJRNxuA890fBNHy6+xlkKU43LJbmT4o6PZdXa1/HO40f6IniZqiyN++EB1pR59
	 59hZNVBtNbUeJBvucod7UosLYUw72egYdfKBbNtte0FbVjVvapkBvgz1AfUatCQuZtf3cnyLV6FbnE
	 +BNwj/QH46vjNyl7/OpTskMfJ1poiPy4rTcsXeD4ID78HU0jcTEdHTa5b9gmwpDyYQhKJ6dlQtvSDC
	 oQSKIODi+wSVh3KlHr8gY/s8UyKhykA==
X-HalOne-Cookie: 6c6de1af18e8d22f82e1d197fec1ff80f8342d4c
X-HalOne-ID: 415b493c-645a-11eb-9242-d0431ea8a283
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
 <bfe8b2fe-57c4-79e2-f2e7-3e1cb9b7963b@suse.com>
 <98331cca73412d13d594015c046c64809a7d221c.camel@suse.com>
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Message-ID: <29598e84-e26c-793a-d531-02498d73e284@codiax.se>
Date: Mon, 1 Feb 2021 07:53:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <98331cca73412d13d594015c046c64809a7d221c.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 1/29/21 11:16 AM, Dario Faggioli wrote:
> On Fri, 2021-01-29 at 09:18 +0100, Jürgen Groß wrote:
>> On 29.01.21 09:08, Anders Törnqvist wrote:
>>>> So it using it has only downsides (and that's true in general, if
>>>> you
>>>> ask me, but particularly so if using NULL).
>>> Thanks for the feedback.
>>> I removed dom0_vcpus_pin. And, as you said, it seems to be
>>> unrelated to
>>> the problem we're discussing.
> Right. Don't put it back, and stay away from it, if you accept an
> advice. :-)
>
>>> The system still behaves the same.
>>>
> Yeah, that was expected.
>
>>> When the dom0_vcpus_pin is removed. xl vcpu-list looks like this:
>>>
>>> Name                                ID  VCPU   CPU State Time(s)
>>> Affinity (Hard / Soft)
>>> Domain-0                             0     0    0   r--      29.4
>>> all / all
>>> Domain-0                             0     1    1   r--      28.7
>>> all / all
>>> Domain-0                             0     2    2   r--      28.7
>>> all / all
>>> Domain-0                             0     3    3   r--      28.6
>>> all / all
>>> Domain-0                             0     4    4   r--      28.6
>>> all / all
>>> mydomu                              1     0    5   r--      21.6 5
>>> / all
>>>
> Right, and it makes sense for it to look like this.
>
>>>   From this listing (with "all" as hard affinity for dom0) one might
>>> read
>>> it like dom0 is not pinned with hard affinity to any specific pCPUs
>>> at
>>> all but mudomu is pinned to pCPU 5.
>>> Will the dom0_max_vcpus=5 in this case guarantee that dom0 only
>>> will run
>>> on pCPU 0-4 so that mydomu always will have pCPU 5 for itself only?
>> No.
>>
> Well, yes... if you use the NULL scheduler. Which is in use here. :-)
>
> Basically, the NULL scheduler _always_ assign one and only one vCPU to
> each pCPU. This happens at domain (well, at the vCPU) creation time.
> And it _never_ move a vCPU away from the pCPU to which it has assigned
> it.
>
> And it also _never_ change this vCPU-->pCPU assignment/relationship,
> unless some special event happens (such as, either the vCPU and/or the
> pCPU goes offline, is removed from the cpupool, you change the affinity
> [as I'll explain below], etc).
>
> This is the NULL scheduler's mission and only job, so it does that by
> default, _without_ any need for an affinity to be specified.
>
> So, how can affinity be useful in the NULL scheduler? Well, it's useful
> if you want to control and decide to what pCPU a certain vCPU should
> go.
>
> So, let's make an example. Let's say you are in this situation:
>
> Name                                ID  VCPU   CPU State Time(s) Affinity (Hard / Soft)
> Domain-0                             0     0    0   r--     29.4   all / all
> Domain-0                             0     1    1   r--     28.7   all / all
> Domain-0                             0     2    2   r--     28.7   all / all
> Domain-0                             0     3    3   r--     28.6   all / all
> Domain-0                             0     4    4   r--     28.6   all / all
>
> I.e., you have 6 CPUs, you have only dom0, dom0 has 5 vCPUs and you are
> not using dom0_vcpus_pin.
>
> The NULL scheduler has put d0v0 on pCPU 0. And d0v0 is the only vCPU
> that can run on pCPU 0, despite its affinities being "all"... because
> it's what the NULL scheduler does for you and it's the reason why one
> uses it! :-)
>
> Similarly, it has put d0v1 on pCPU 1, d0v2 on pCPU 2, d0v3 on pCPU 3
> and d0v4 on pCPU 4. And the "exclusivity guarantee" exaplained above
> for d0v0 and pCPU 0, applies to all these other vCPUs and pCPUs as
> well.
>
> With no affinity being specified, which vCPU is assigned to which pCPU
> is entirely under the NULL scheduler control. It has its heuristics
> inside, to try to do that in a smart way, but that's an
> internal/implementation detail and is not relevant here.
>
> If you now create a domU with 1 vCPU, that vCPU will be assigned to
> pCPU 5.
>
> Now, let's say that, for whatever reason, you absolutely want that d0v2
> to run on pCPU 5, instead of being assigned and run on pCPU 2 (which is
> what the NULL scheduler decided to pick for it). Well, what you do is
> use xl, set the affinity of d0v2 to pCPU 5, and you will get something
> like this as a result:
>
> Name                                ID  VCPU   CPU State Time(s) Affinity (Hard / Soft)
> Domain-0                             0     0    0   r--     29.4   all / all
> Domain-0                             0     1    1   r--     28.7   all / all
> Domain-0                             0     2    5   r--     28.7     5 / all
> Domain-0                             0     3    3   r--     28.6   all / all
> Domain-0                             0     4    4   r--     28.6   all / all
>
> So, affinity is indeed useful, even when using NULL, if you want to
> diverge from the default behavior and enact a certain policy, maybe due
> to the nature of your workload, the characteristics of your hardware,
> or whatever.
>
> It is not, however, necessary to set the affinity to:
>   - have a vCPU to always stay on one --and always the same one too--
>     pCPU;
>   - avoid that any other vCPU would ever run on that pCPU.
>
> That is guaranteed by the NULL scheduler itself. It just can't happen
> that it behaves otherwise, because the whole point of doing it was to
> make it simple (and fast :-)) *exactly* by avoiding to teach it how to
> do such things. It can't do it, because the code for doing it is not
> there... by design! :-D
>
> And, BTW, if you now create a domU with 1 vCPU, that vCPU will be
> assigned to pCPU  2.
Wow, what a great explanation. Thank you very much!
>> What if I would like mydomu to be th only domain that uses pCPU 2?
> Setup a cpupool with that pcpu assigned to it and put your domain into
> that cpupool.
>
> Yes, with any other scheduler that is not NULL, that's the proper way
> of doing it.
>
> Regards




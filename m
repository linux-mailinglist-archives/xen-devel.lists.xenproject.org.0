Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1394831EA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jan 2022 15:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252960.433910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4OEr-00039P-JW; Mon, 03 Jan 2022 14:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252960.433910; Mon, 03 Jan 2022 14:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4OEr-000378-GH; Mon, 03 Jan 2022 14:23:05 +0000
Received: by outflank-mailman (input) for mailman id 252960;
 Mon, 03 Jan 2022 14:23:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n4OEp-000372-Px
 for xen-devel@lists.xenproject.org; Mon, 03 Jan 2022 14:23:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n4OEp-0000gE-FP; Mon, 03 Jan 2022 14:23:03 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.24.212]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n4OEp-0003j9-8y; Mon, 03 Jan 2022 14:23:03 +0000
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
	bh=QfRi4vva9gk70m7kElnoFjHkuuX5ColTd6kOEOoK7Jk=; b=sajPUzmyTunoP3pAFMYOL507nR
	qs7A197YwDEldlB/NN+N/wDV/jAWDHqSesUQf7C4uxvfCsap1LiVFSDtTQmNk6jcQUXRSxHcaCUXn
	v9d/gG0JWToJ4QZqkd3nvY85+pNaYP1P8SK+YruJWc4dvY2QBgsFigGBGrW0uvtydtfg=;
Message-ID: <d5e8a800-5a28-ce9e-cf2a-82894aae2149@xen.org>
Date: Mon, 3 Jan 2022 14:23:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20211223190637.GA99855@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112231610270.2060010@ubuntu-linux-20-04-desktop>
 <437596a2-b375-fc79-a865-186f7eaf10a8@xen.org>
 <20211224135819.GA945512@EPUAKYIW015D>
 <4bb8ee4f-8e8b-5e85-0801-ae3df93dbabc@xen.org>
 <20211224164905.GA1016129@EPUAKYIW015D>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211224164905.GA1016129@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/12/2021 16:49, Oleksii Moisieiev wrote:
> On Fri, Dec 24, 2021 at 03:28:56PM +0100, Julien Grall wrote:
>> On 24/12/2021 14:59, Oleksii Moisieiev wrote:
>>> Hi Julien,
>>
>> Hello,
>>
>>> On Fri, Dec 24, 2021 at 02:29:13PM +0100, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 24/12/2021 01:16, Stefano Stabellini wrote:
>>>>>> One more question: As you probably seen - Jan had a complains about SCI
>>>>>> term. He said SCI is ambiguous with ACPI's System
>>>>>> Control Interrupt.
>>>>>
>>>>> I see his point. As a term I see "SCMI" often and sometimes "SCPI" but
>>>>> "SCI" is the first time I saw it with this patch series.
>>>>>
>>>>>
>>>>>> I think of using SC (as System Control) instead. What do you think
>>>>>> about it?
>>>>>
>>>>> Yeah, I am not great at naming things but maybe "ARM_SCI"?  "SC" alone
>>>>> doesn't give me enough context to guess what it is.
>>>>
>>>> I might be missing some context. Why are naming everything SCI rather than
>>>> SMCI?
>>>
>>> Because we're expecting other interfaces and transport to be
>>> implemented, such as for example:
>>> scmi_mailbox, scpi_smc, scpi_mailbox, ti_sci_smc etc.
>>
>> Oh, now that explain why there is a layer of indirection in Xen. It wasn't
>> very clear from the cover letter why it was present.
>>
> Please see below.
>>>
>>>>
>>>>>
>>>>> Or we could broaden the scope and call it "firmware_interface"?
>>>> How would this be used? Will it be a list of interface that will be exposed
>>>> to the guest?
>>>>
>>>
>>> The idea is to set mediator type for each Domain, so for example Xen can
>>> use scmi_mailbox to communicate with SCP, Dom0 and DomD are also using
>>> scmi_mailbox, but DomU using scmi_smc mediator because we have only 3
>>> mailboxes in system. This is not implemented yet, right now, we are
>>> introducing only scmi_smc support. In future, multiple mediator support
>>> can be added to Xen.
>>
>> Ok. So will there be only one interface at the time for a given domain. Is
>> that correct?
>>
> Correct. The idea is that we provice only one interface to the Domain,
> so different domains can use different protocols and transport

I think this is similar to TEE mediator. Specifying in the guest 
configuration the TEE protocol (e.g. OP-TEE) allows to sanity check what 
the guest wants match the host. However, I am not convinced there is a 
need to expose different protocols for domains running on the same platform.

> Those
> interfaces can be different than the interface Xen uses to connect to SCP.

I can understand how this looks appealing. However, it may not always be 
possible to convert the guest protocol to the host protocol. And even if 
it is possible, it is increasing the complexity and risk.

> This allows us to vary the configuration.
> So for example:
> Let's take system, that support only 2 mailboxes and communication with
> SCP can use only mailboxes as transport. We intent to use scmi protocol
> to manage HW. In this case we use 2 mailboxes for Xen-> SCP
> communication, and for Dom0 -> Xen.
> Domu can be configured to use
> scmi_smc, so the communication should be the following:
> DomU --smc--> Xen -mailbox--> SCP Firmware.
> Let's say we want to add DomainX with OS XXX, which using yyy protocol
> with zzz transport. Then we can configure DomX wuth yyy_zzz mediator, so
> the communication will be the following:
> DomX --yyy--> Xen -mailbox--> SCP Firmware

I am a bit confused with your example here. From my understanding, I 
would say 'smc' is the transport. But in your example above, you suggest 
this is the protocol. What did I miss?

> Where Xen knows how to convert message from yyy protocol to scmi protocol

As I wrote above, when possible, converting protocol could be complex 
and risky. So do you have a concrete use case for that?

That said, changing the transport (e.g. smc <-> mailbox) would make more 
sense to me.

> 
> I considered the alternative way, when we can configure domain with
> several mediators, so each Domain can be configured to use, for example,
> scmi_smc for power-domains and scpi_smc for clocks and resets. But I
> don't see real use-cases for this configuration.

Do you mean a platform using both or exposing both to the guest?

> 
> What do you think about that?
So I am a bit unsure how "firmware_interface" would be specified. IMO, 
the user should only specificy which interface the guest will use (e.g. 
SCMI via SMC) even if the host end up to use a different transport (e.g. 
SCMI via mailbox). IOW, the option would not tell how to convert it.

Is it what you had in mind?

Cheers,

-- 
Julien Grall


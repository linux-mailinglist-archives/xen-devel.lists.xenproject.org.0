Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBAD47EF8D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 15:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251397.432733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0lZ7-0003yc-3J; Fri, 24 Dec 2021 14:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251397.432733; Fri, 24 Dec 2021 14:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0lZ6-0003vG-VZ; Fri, 24 Dec 2021 14:29:00 +0000
Received: by outflank-mailman (input) for mailman id 251397;
 Fri, 24 Dec 2021 14:29:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n0lZ5-0003ux-Vd
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 14:28:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0lZ5-0003gf-JR; Fri, 24 Dec 2021 14:28:59 +0000
Received: from [54.239.6.184] (helo=[192.168.17.79])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0lZ5-0000Ja-B6; Fri, 24 Dec 2021 14:28:59 +0000
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
	bh=UAjw+1yNEGAwd8pzA7NLntXxLkOccHYYoGXCPTI86BA=; b=SAsORDJgJrlRm9hK7gjz9Mgkz9
	dtM5RdvuGXpGEXUrX46K7bVriZkoXbwtAnLz7tbC1BCFxb7ilMvY/4j4sW5MqwSx+zU+iKFygTxlU
	/LyVCmecbSd8ugPVt0UliFfm4sI4b4LFu5/QF8J37ll7ytl7xDHv7wQanT2tMzqOV7Xo=;
Message-ID: <4bb8ee4f-8e8b-5e85-0801-ae3df93dbabc@xen.org>
Date: Fri, 24 Dec 2021 15:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <alpine.DEB.2.22.394.2112171709140.2060010@ubuntu-linux-20-04-desktop>
 <20211220181215.GA1702335@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112201613210.2060010@ubuntu-linux-20-04-desktop>
 <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20211223190637.GA99855@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112231610270.2060010@ubuntu-linux-20-04-desktop>
 <437596a2-b375-fc79-a865-186f7eaf10a8@xen.org>
 <20211224135819.GA945512@EPUAKYIW015D>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211224135819.GA945512@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/12/2021 14:59, Oleksii Moisieiev wrote:
> Hi Julien,

Hello,

> On Fri, Dec 24, 2021 at 02:29:13PM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 24/12/2021 01:16, Stefano Stabellini wrote:
>>>> One more question: As you probably seen - Jan had a complains about SCI
>>>> term. He said SCI is ambiguous with ACPI's System
>>>> Control Interrupt.
>>>
>>> I see his point. As a term I see "SCMI" often and sometimes "SCPI" but
>>> "SCI" is the first time I saw it with this patch series.
>>>
>>>
>>>> I think of using SC (as System Control) instead. What do you think
>>>> about it?
>>>
>>> Yeah, I am not great at naming things but maybe "ARM_SCI"?  "SC" alone
>>> doesn't give me enough context to guess what it is.
>>
>> I might be missing some context. Why are naming everything SCI rather than
>> SMCI?
> 
> Because we're expecting other interfaces and transport to be
> implemented, such as for example:
> scmi_mailbox, scpi_smc, scpi_mailbox, ti_sci_smc etc.

Oh, now that explain why there is a layer of indirection in Xen. It 
wasn't very clear from the cover letter why it was present.

> 
>>
>>>
>>> Or we could broaden the scope and call it "firmware_interface"?
>> How would this be used? Will it be a list of interface that will be exposed
>> to the guest?
>>
> 
> The idea is to set mediator type for each Domain, so for example Xen can
> use scmi_mailbox to communicate with SCP, Dom0 and DomD are also using
> scmi_mailbox, but DomU using scmi_smc mediator because we have only 3
> mailboxes in system. This is not implemented yet, right now, we are
> introducing only scmi_smc support. In future, multiple mediator support
> can be added to Xen.

Ok. So will there be only one interface at the time for a given domain. 
Is that correct?

Cheers,

-- 
Julien Grall


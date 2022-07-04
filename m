Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A5564FBD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:31:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359942.589231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HTd-0004u1-KP; Mon, 04 Jul 2022 08:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359942.589231; Mon, 04 Jul 2022 08:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HTd-0004r0-Hd; Mon, 04 Jul 2022 08:30:41 +0000
Received: by outflank-mailman (input) for mailman id 359942;
 Mon, 04 Jul 2022 08:30:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8HTc-0004qu-Eg
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 08:30:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HTb-0002zF-PU; Mon, 04 Jul 2022 08:30:39 +0000
Received: from [54.239.6.187] (helo=[192.168.26.128])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HTb-0004Qu-JO; Mon, 04 Jul 2022 08:30:39 +0000
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
	bh=CJdok87IbF3UoHfVOHW6zoB2DBgxp5gVl2tBECzIXv4=; b=UegokG2pM8hhWL84dvnwtDCD1x
	id21tmX+UwtcumNTcUdwPUS5lzKCgzaWjDNcPtMknUGXOX18nhbxywg1XIsk+GRmR4enLy6Y+n/XV
	4F4d7YIt8lNaMnmkRxhVEtsHcTzB5bRpgZ+Y7tiuQ1FSG7wNJMIZorrciDm9J1Hqr6sw=;
Message-ID: <8970b2a7-d754-7db3-7f43-f2d30c626dc4@xen.org>
Date: Mon, 4 Jul 2022 09:30:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220704072232.117517-1-burzalodowa@gmail.com>
 <EB360E93-8353-48D0-844F-CB529B94B9C1@arm.com>
 <BB492376-6171-4ECB-8F24-6F419E9A5926@arm.com>
 <e623d9c9-0f61-144b-61ea-51367c938b03@gmail.com>
 <E77F6E48-80EE-4874-B560-D57ACFF0C264@arm.com>
 <E56D7BDD-8DA6-4131-A60F-26239A9BBEA2@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <E56D7BDD-8DA6-4131-A60F-26239A9BBEA2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/07/2022 09:28, Bertrand Marquis wrote:
>> On 4 Jul 2022, at 09:25, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>>
>>
>>> On 4 Jul 2022, at 09:06, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>>
>>>
>>>
>>> On 7/4/22 10:58, Luca Fancellu wrote:
>>>>>> I am not 100% sure about this patch.
>>>>>> I think show_stack() should be declared the same way as show_registers().
>>>>>> So either both of them will be declared with external linkage or both of them
>>>>>> will be declared with internal linkage.
>>>>>
>>>>> I think that those 2 should be declared with external linkage with a comment
>>>>> explaining why they are. For me those are useful when developing or debugging
>>>>> and I sometime call those to force dumping the status.
>>>>> So I would vote to keep the external linkage.
>>>>>
>>>>>> I decided to declare both of them static because they are referenced only in
>>>>>> traps.c but I could have, also, add the declaration of show_stack() in
>>>>>> asm/processor.h header instead. Rule 8.7 is advisory.
>>>>>
>>>>> As said I would vote for external linkage here but would be nice to have other
>>>>> developers view on this.
>>>>>
>>>> In addition to this, if we don’t want to provide a justification for those, since they seems to me
>>>> code related to debugging they can be removed from “production” code in some way.
>>>
>>> Rule 8.7 is advisory, so I think that formal justification of deviations is not necessary.
>>
>> Yes that is true, in that case we would only need to document it without a formal justification, however
>> if the codebase doesn’t include them (because not in production code) I guess the problem doesn’t exist.
> 
> Having the production code using static and the non production using external linkage would be kind of weird here.
> I think having them always with external linkage with a justification is the cleanest way.

+1 this is what I was going to answer :).

Cheers,

-- 
Julien Grall


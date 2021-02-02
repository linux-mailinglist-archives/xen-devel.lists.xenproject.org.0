Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEF830B90B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 09:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80388.147059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6qat-00056L-Cs; Tue, 02 Feb 2021 07:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80388.147059; Tue, 02 Feb 2021 07:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6qat-00054z-9Y; Tue, 02 Feb 2021 07:59:27 +0000
Received: by outflank-mailman (input) for mailman id 80388;
 Tue, 02 Feb 2021 07:59:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l6qar-00054u-QJ
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 07:59:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l6qaq-0008Bt-Ug; Tue, 02 Feb 2021 07:59:24 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l6qaq-0005Vl-P8; Tue, 02 Feb 2021 07:59:24 +0000
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
	MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=PMmzMAArqVH1l6YZzvwo1qCQH2Z4azKlIqLB2VxigfA=; b=peXsMGrjbb0hYJLmsGEVnUoqoS
	vh8onzuImGs9EcpLqmHPitSZYO0f2ZNsKDaO2efvwlbiUajLMGGiolWG7DCgI+sy0vc47RNP+uSlM
	5Ir2G4SPu2LCVuE9hhFhsvZPdROcbyJh4Y6Vq3/ED3jhPFL82JGN13+VWdt3+hxvM9YY=;
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
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
 <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4760cbac-b006-78bc-b064-3265384f6707@xen.org>
Date: Tue, 2 Feb 2021 07:59:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Dario,

On 30/01/2021 17:59, Dario Faggioli wrote:
> On Fri, 2021-01-29 at 09:08 +0100, Anders Törnqvist wrote:
>> On 1/26/21 11:31 PM, Dario Faggioli wrote:
>>> Thanks again for letting us see these logs.
>>
>> Thanks for the attention to this :-)
>>
>> Any ideas for how to solve it?
>>
> So, you're up for testing patches, right?
> 
> How about applying these two, and letting me know what happens? :-D
> 
> They are on top of current staging. I can try to rebase on something
> else, if it's easier for you to test.
> 
> Besides being attached, they're also available here:
> 
> https://gitlab.com/xen-project/people/dfaggioli/xen/-/tree/rcu-quiet-fix
> 
> I could not test them properly on ARM, as I don't have an ARM system
> handy, so everything is possible really... just let me know.
> 
> It should at least build fine, AFAICT from here:
> 
> https://gitlab.com/xen-project/people/dfaggioli/xen/-/pipelines/249101213
> 
> Julien, back in:
> 
>   https://lore.kernel.org/xen-devel/315740e1-3591-0e11-923a-718e06c36445@arm.com/
> 
> 
> you said I should hook in enter_hypervisor_head(),
> leave_hypervisor_tail(). Those functions are gone now and looking at
> how the code changed, this is where I figured I should put the calls
> (see the second patch). But feel free to educate me otherwise.

enter_hypervisor_from_guest() and leave_hypervisor_to_guest() are the 
new functions.

I have had a quick look at your place. The RCU call in 
leave_hypervisor_to_guest() needs to be placed just after the last call 
to check_for_pcpu_work().

Otherwise, you may be preempted and keep the RCU quiet.

The placement in enter_hypervisor_from_guest() doesn't matter too much, 
although I would consider to call it as a late as possible.

Cheers,

-- 
Julien Grall


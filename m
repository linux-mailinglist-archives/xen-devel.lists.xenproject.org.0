Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99FB240D63
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 21:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5D1y-0007gC-QF; Mon, 10 Aug 2020 19:00:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wyEj=BU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k5D1x-0007g7-CK
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 19:00:21 +0000
X-Inumbo-ID: 391ec1e0-6835-47be-84e4-2421b6afbea5
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 391ec1e0-6835-47be-84e4-2421b6afbea5;
 Mon, 10 Aug 2020 19:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W7cjAGAbeUEfsu+nc4Pbpl7AkOuBYIRkkqS8eJURwe4=; b=doCXJ02OB1i3klBXF7VcGYrlOk
 l6mkijCUctoemcD81Rv+1pqo60y5Et3Qlic0OCaqSYO9dBpeT/d/5+CKmvRtYduT/CStdpqwC4hsO
 9nY+933SigXkaa+TSsRoPYyOCSTK1GS8slgRiLs2xkx0iKsUJRm7ReAzZRmc9oyEYbXI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5D1n-0005yj-Ao; Mon, 10 Aug 2020 19:00:11 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5D1n-00047H-0c; Mon, 10 Aug 2020 19:00:11 +0000
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <a1a1fcca-e840-3c02-dc9c-742c3e397836@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <659a5b45-a37a-5cf2-0bcd-ba1ea3d47cc4@xen.org>
Date: Mon, 10 Aug 2020 20:00:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a1a1fcca-e840-3c02-dc9c-742c3e397836@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 10/08/2020 19:09, Oleksandr wrote:
> 
> On 05.08.20 12:32, Julien Grall wrote:
> 
> Hi Julien
> 
>>
>>>> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
>>>>    */
>>>>   void leave_hypervisor_to_guest(void)
>>>>   {
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +    /*
>>>> +     * XXX: Check the return. Shall we call that in
>>>> +     * continue_running and context_switch instead?
>>>> +     * The benefits would be to avoid calling
>>>> +     * handle_hvm_io_completion on every return.
>>>> +     */
>>>
>>> Yeah, that could be a simple and good optimization
>>
>> Well, it is not simple as it is sounds :). handle_hvm_io_completion() 
>> is the function in charge to mark the vCPU as waiting for I/O. So we 
>> would at least need to split the function.
>>
>> I wrote this TODO because I wasn't sure about the complexity of 
>> handle_hvm_io_completion(current). Looking at it again, the main 
>> complexity is the looping over the IOREQ servers.
>>
>> I think it would be better to optimize handle_hvm_io_completion() 
>> rather than trying to hack the context_switch() or continue_running().
> Well, is the idea in proposed dirty test patch below close to what you 
> expect? Patch optimizes handle_hvm_io_completion() to avoid extra 
> actions if vcpu's domain doesn't have ioreq_server, alternatively
> the check could be moved out of handle_hvm_io_completion() to avoid 
> calling that function at all.

This looks ok to me.

> BTW, TODO also suggests checking the 
> return value of handle_hvm_io_completion(), but I am completely sure we 
> can simply
> just return from leave_hypervisor_to_guest() at this point. Could you 
> please share your opinion?

 From my understanding, handle_hvm_io_completion() may return false if 
there is pending I/O or a failure.

In the former case, I think we want to call handle_hvm_io_completion() 
later on. Possibly after we call do_softirq().

I am wondering whether check_for_vcpu_work() could return whether there 
are more work todo on the behalf of the vCPU.

So we could have:

do
{
   check_for_pcpu_work();
} while (check_for_vcpu_work())

The implementation of check_for_vcpu_work() would be:

if ( !handle_hvm_io_completion() )
   return true;

/* Rest of the existing code */

return false;

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DC43009B3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 18:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73000.131604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l30GO-0008LJ-8B; Fri, 22 Jan 2021 17:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73000.131604; Fri, 22 Jan 2021 17:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l30GO-0008Ku-4K; Fri, 22 Jan 2021 17:30:24 +0000
Received: by outflank-mailman (input) for mailman id 73000;
 Fri, 22 Jan 2021 17:30:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=530u=GZ=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1l30GM-0008Kp-7L
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 17:30:22 +0000
Received: from mailrelay3-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.12]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05f55e12-1b7a-4fec-b102-325690ebe499;
 Fri, 22 Jan 2021 17:30:20 +0000 (UTC)
Received: from [192.168.101.129] (h77-53-239-0.cust.a3fiber.se [77.53.239.0])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 7efcd97b-5cd7-11eb-8cc2-d0431ea8bb03;
 Fri, 22 Jan 2021 17:30:18 +0000 (UTC)
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
X-Inumbo-ID: 05f55e12-1b7a-4fec-b102-325690ebe499
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:to:subject:from;
	bh=VZ4tMwXRlDEIKVcpuit5IKU0rYLf0dbcj9LvGmX3omo=;
	b=KyQNHknUXUU40nvy/+7bI1qSd9N+9/xsq+zcPufTYYwmjjKv3mUoGErTdhd39YRMfxcPVhGJ3t0pO
	 oKUGgGrZEC71EQ9qRV1IA8vEfne8L88FtT2fuSlx5fwkrGsQvjza92yDaDj8LGLnobXqEa+X+Diuq1
	 9DNic80j2Bp0NlvlSCvw5g3SaTsUUz2Fnkda5azGTmrumeb7gZKsYzWs5SVwAH+soH1oRUfyD+AOaQ
	 qVUALeAhFchsn6rdpGThXQ9OUbwAOBY8Hgy26hrfg3MvOwOHipTEAbuVQLQMRu5ZWj9vWwW3TxFJJw
	 a8ATFiUMO6QtYOqd7zNZaO7mFT7XtrA==
X-HalOne-Cookie: 2db1dc2311832c1599fd66da16bd90a4a76d69ab
X-HalOne-ID: 7efcd97b-5cd7-11eb-8cc2-d0431ea8bb03
Subject: Re: Null scheduler and vwfi native problem
To: Julien Grall <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <8808fb87-1cbc-9f3e-a2a0-aef94c678f55@xen.org>
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Message-ID: <372d4154-ef42-4bef-0513-dbbe733f5706@codiax.se>
Date: Fri, 22 Jan 2021 18:30:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8808fb87-1cbc-9f3e-a2a0-aef94c678f55@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 1/22/21 3:02 PM, Julien Grall wrote:
> Hi Dario,
>
> On 21/01/2021 23:35, Dario Faggioli wrote:
>> On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
>>> Hi Dario,
>>>
>> Hi!
>>
>>> On 21/01/2021 18:32, Dario Faggioli wrote:
>>>> On Thu, 2021-01-21 at 11:54 +0100, Anders Törnqvist wrote:
>>>>> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01213.html
>>>>> .
>>>>>
>>>> Right. Back then, PCI passthrough was involved, if I remember
>>>> correctly. Is it the case for you as well?
>>>
>>> PCI passthrough is not yet supported on Arm :). However, the bug was
>>> reported with platform device passthrough.
>>>
>> Yeah, well... That! Which indeed is not PCI. Sorry for the terminology
>> mismatch. :-)
>>
>>>> Well, I'll think about it. >
>>>>> Starting the system without "sched=null vwfi=native" does not
>>>>> result
>>>>> in
>>>>> the problem.
>>>>>
>>>> Ok, how about, if you're up for some more testing:
>>>>
>>>>    - booting with "sched=null" but not with "vwfi=native"
>>>>    - booting with "sched=null vwfi=native" but not doing the IRQ
>>>>      passthrough that you mentioned above
>>>>
>>>> ?
>>>
>>> I think we can skip the testing as the bug was fully diagnostics back
>>> then. Unfortunately, I don't think a patch was ever posted.
>>>
>> True. But an hackish debug patch was provided and, back then, it
>> worked.
>>
>> OTOH, Anders seems to be reporting that such a patch did not work here.
>> I also continue to think that we're facing the same or a very similar
>> problem... But I'm curious why applying the patch did not help this
>> time. And that's why I asked for more testing.
>
> I wonder if this is because your patch doesn't modify rsinterval. So 
> even if we call force_quiescent_state(), the softirq would only be 
> raised for the current CPU.
>
> I guess the following HACK could confirm the theory:
>
> diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
> index a5a27af3def0..50020bc34ddf 100644
> --- a/xen/common/rcupdate.c
> +++ b/xen/common/rcupdate.c
> @@ -250,7 +250,7 @@ static void force_quiescent_state(struct rcu_data 
> *rdp,
>  {
>      cpumask_t cpumask;
>      raise_softirq(RCU_SOFTIRQ);
> -    if (unlikely(rdp->qlen - rdp->last_rs_qlen > rsinterval)) {
> +    if (1 || unlikely(rdp->qlen - rdp->last_rs_qlen > rsinterval)) {
>          rdp->last_rs_qlen = rdp->qlen;
>          /*
>           * Don't send IPI to itself. With irqs disabled,
>
> Cheers,
>
I applied the patch above. No change. The function 
complete_domain_destroy function is not call when I destroy the domain.

/Anders



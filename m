Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C65C3004C7
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 15:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72792.131124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2x19-0000JW-WC; Fri, 22 Jan 2021 14:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72792.131124; Fri, 22 Jan 2021 14:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2x19-0000J7-Sa; Fri, 22 Jan 2021 14:02:27 +0000
Received: by outflank-mailman (input) for mailman id 72792;
 Fri, 22 Jan 2021 14:02:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2x18-0000J2-H0
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:02:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2x17-0000U8-Mu; Fri, 22 Jan 2021 14:02:25 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2x17-0000v3-DN; Fri, 22 Jan 2021 14:02:25 +0000
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
	bh=frcasNS6uElcDoyXqY8iW4QlZvhTIA1/V7djEVVpdRw=; b=JWE2AC8wM6b9cREpYtECPS4wcu
	wiX5L6uDAM0VDbV7q4o7i3YRUTm6f3+o/giyx/vQRg1ETo9bu6fookiAs+xeeuf2byk2v68ChUeh9
	Run5Iq66O65hyHVTfJzXhGryBp7+x+BNtL6DAo40AL6m30bbRzf57B5aMsk/feJQBs6A=;
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8808fb87-1cbc-9f3e-a2a0-aef94c678f55@xen.org>
Date: Fri, 22 Jan 2021 14:02:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Dario,

On 21/01/2021 23:35, Dario Faggioli wrote:
> On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
>> Hi Dario,
>>
> Hi!
> 
>> On 21/01/2021 18:32, Dario Faggioli wrote:
>>> On Thu, 2021-01-21 at 11:54 +0100, Anders Törnqvist wrote:
>>>>    
>>>> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01213.html
>>>> .
>>>>
>>> Right. Back then, PCI passthrough was involved, if I remember
>>> correctly. Is it the case for you as well?
>>
>> PCI passthrough is not yet supported on Arm :). However, the bug was
>> reported with platform device passthrough.
>>
> Yeah, well... That! Which indeed is not PCI. Sorry for the terminology
> mismatch. :-)
> 
>>> Well, I'll think about it. >
>>>> Starting the system without "sched=null vwfi=native" does not
>>>> result
>>>> in
>>>> the problem.
>>>>
>>> Ok, how about, if you're up for some more testing:
>>>
>>>    - booting with "sched=null" but not with "vwfi=native"
>>>    - booting with "sched=null vwfi=native" but not doing the IRQ
>>>      passthrough that you mentioned above
>>>
>>> ?
>>
>> I think we can skip the testing as the bug was fully diagnostics back
>> then. Unfortunately, I don't think a patch was ever posted.
>>
> True. But an hackish debug patch was provided and, back then, it
> worked.
> 
> OTOH, Anders seems to be reporting that such a patch did not work here.
> I also continue to think that we're facing the same or a very similar
> problem... But I'm curious why applying the patch did not help this
> time. And that's why I asked for more testing.

I wonder if this is because your patch doesn't modify rsinterval. So 
even if we call force_quiescent_state(), the softirq would only be 
raised for the current CPU.

I guess the following HACK could confirm the theory:

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index a5a27af3def0..50020bc34ddf 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -250,7 +250,7 @@ static void force_quiescent_state(struct rcu_data *rdp,
  {
      cpumask_t cpumask;
      raise_softirq(RCU_SOFTIRQ);
-    if (unlikely(rdp->qlen - rdp->last_rs_qlen > rsinterval)) {
+    if (1 || unlikely(rdp->qlen - rdp->last_rs_qlen > rsinterval)) {
          rdp->last_rs_qlen = rdp->qlen;
          /*
           * Don't send IPI to itself. With irqs disabled,

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C892C6424
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 12:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39230.72055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kicNa-00077e-5y; Fri, 27 Nov 2020 11:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39230.72055; Fri, 27 Nov 2020 11:57:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kicNa-00077F-2r; Fri, 27 Nov 2020 11:57:34 +0000
Received: by outflank-mailman (input) for mailman id 39230;
 Fri, 27 Nov 2020 11:57:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kicNY-00076y-VC
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:57:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kicNY-0002u2-02; Fri, 27 Nov 2020 11:57:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kicNX-0005hQ-NF; Fri, 27 Nov 2020 11:57:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kicNY-00076y-VC
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=bgm1mDmHMF5DQP5MuWlxGqX+nw5RQiXrDAPsLGSpb4Y=; b=NvZGBEYanb+paG56MicZjoiDG6
	PWXf1iJze1pIsWhYEpRfQinHyUEB9cneF1H7ALS2ietUK4K3DN68921VigpkwAWRlTzTZZh7x+PcV
	2Tb9Wv1vP6MYCS2Ke2U7kgqUTDot6Lz/1syxtMJM3yzGjtkskoOizUBpW6ZrUyZPD+Co=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kicNY-0002u2-02; Fri, 27 Nov 2020 11:57:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kicNX-0005hQ-NF; Fri, 27 Nov 2020 11:57:31 +0000
Subject: Re: [PATCH v8 1/3] xen/events: modify struct evtchn layout
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-2-jgross@suse.com>
 <4c054bdb-e74a-4ca8-ede3-8df3874b39fb@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2b135f7e-1222-9267-7755-6fe46f4f2fd8@xen.org>
Date: Fri, 27 Nov 2020 11:57:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <4c054bdb-e74a-4ca8-ede3-8df3874b39fb@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/11/2020 11:42, Jan Beulich wrote:
> On 25.11.2020 11:51, Juergen Gross wrote:
>> In order to avoid latent races when updating an event channel put
>> xen_consumer and pending fields in different bytes. This is no problem
>> right now, but especially the pending indicator isn't used only when
>> initializing an event channel (unlike xen_consumer), so any future
>> addition to this byte would need to be done with a potential race kept
>> in mind.
>>
>> At the same time move some other fields around to have less implicit
>> paddings and to keep related fields more closely together.
>>
>> Finally switch struct evtchn to no longer use fixed sized types where
>> not needed.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one more adjustment (can be done while committing, I guess):
> 
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -93,31 +93,33 @@ struct evtchn
>>   #define ECS_PIRQ         4 /* Channel is bound to a physical IRQ line.       */
>>   #define ECS_VIRQ         5 /* Channel is bound to a virtual IRQ line.        */
>>   #define ECS_IPI          6 /* Channel is bound to a virtual IPI line.        */
>> -    u8  state;             /* ECS_* */
>> -    u8  xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if nonzero */
>> -    u8  pending:1;
>> -    u16 notify_vcpu_id;    /* VCPU for local delivery notification */
>> -    u32 port;
>> +    unsigned char state;   /* ECS_* */
>> +#ifndef NDEBUG
>> +    unsigned char old_state; /* State when taking lock in write mode. */
>> +#endif
>> +    unsigned char xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if != 0 */
>> +    unsigned int port;
> 
> evtchn_port_t, to be in line with ...
> 
>>       union {
>>           struct {
>>               domid_t remote_domid;
>> -        } unbound;     /* state == ECS_UNBOUND */
>> +        } unbound;          /* state == ECS_UNBOUND */
>>           struct {
>>               evtchn_port_t  remote_port;
>>               struct domain *remote_dom;
>> -        } interdomain; /* state == ECS_INTERDOMAIN */
>> +        } interdomain;      /* state == ECS_INTERDOMAIN */
>>           struct {
>> -            u32            irq;
>> +            unsigned int   irq;
>>               evtchn_port_t  next_port;
>>               evtchn_port_t  prev_port;
> 
> ... three of the fields above from here.
> 
>> -        } pirq;        /* state == ECS_PIRQ */
>> -        u16 virq;      /* state == ECS_VIRQ */
>> +        } pirq;             /* state == ECS_PIRQ */
>> +        unsigned int virq;  /* state == ECS_VIRQ */
>>       } u;
>> -    u8 priority;
>> -#ifndef NDEBUG
>> -    u8 old_state;      /* State when taking lock in write mode. */
>> -#endif
>> -    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
>> +
>> +    bool pending;                  /* FIFO event channels only. */
>> +    unsigned char priority;        /* FIFO event channels only. */
>> +    unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
> 
> I have to admit though that I'm not fully happy with the uses of
> "unsigned char" and "unsigned short". Yes, I did ask for this
> change (based on ./CODING_STYLE), but I did also hint towards the
> use of bitfields. If bitfields aren't an option here to achieve
> the desired dense packing, perhaps this desire should be permitted
> as another reason to use fixed width types. (Question goes more
> towards everyone who cares than to you specifically.)

I think uint*_t would make sense here because they are storing 
information received from an hypercall (all the fields should be fixed 
size there).

But I am also fine the current patch as it is still readable.

Cheers,

-- 
Julien Grall


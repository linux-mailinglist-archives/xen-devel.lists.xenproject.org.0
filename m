Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70B557E9C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 17:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355073.582515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Omp-0005bJ-UF; Thu, 23 Jun 2022 15:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355073.582515; Thu, 23 Jun 2022 15:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Omp-0005Ym-QG; Thu, 23 Jun 2022 15:30:27 +0000
Received: by outflank-mailman (input) for mailman id 355073;
 Thu, 23 Jun 2022 15:30:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4Omo-0005Yg-Qs
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 15:30:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4Omo-0007tc-8J; Thu, 23 Jun 2022 15:30:26 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4Omo-000510-1e; Thu, 23 Jun 2022 15:30:26 +0000
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
	bh=LhjzCQzfVeX3yehAMi0MJ+Fdr41bZmglF8MzavW9IsM=; b=Gxhn/O4jfhb5/7S285bZVpJ+Xx
	nIUUw6ux4ivFfe8abUIx1xhJZzP0BTp32OQhP6ScoiMzSgdd9IMWvffwYMaaRJIEbB4lf1UQl95e8
	OWzXp0NDmYYmjrfFLGjrEJKChY+NB9Tn7swh08y0ileFr4+3dJc4xfZagf9xmLLc3uqI=;
Message-ID: <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
Date: Thu, 23 Jun 2022 16:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/06/2022 16:10, Rahul Singh wrote:
> Hi Julien,
> 
> 
>> On 22 Jun 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 22/06/2022 15:38, Rahul Singh wrote:
>>> Guest can request the Xen to close the event channels. Ignore the
>>> request from guest to close the static channels as static event channels
>>> should not be closed.
>>
>> Why do you want to prevent the guest to close static ports? The problem I can see is...
> 
> As a static event channel should be available during the lifetime of the guest we want to prevent
> the guest to close the static ports.
I don't think it is Xen job to prevent a guest to close a static port. 
If the guest decide to do it, then it will just break itself and not Xen.

> 
> I tested this series to send/receive event notification from the Linux user-space application via "/dev/xen/evtchn” interface and
> ioctl ( IOCTL_EVTCHN_*) calls. When we close the "/dev/xen/evtchn” interface Linux event channel
> driver will try to close the static event channel also, that why we need this patch to avoid guests to close
> the event channel as we don’t want to close the static event channel.

To me, this reads as Linux should be modified in order to avoid closing 
static event channel. In fact...

>>   
>> [...]
>>
>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>> index 84f0055a5a..cedc98ccaf 100644
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -294,7 +294,8 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>>>    * If port is zero get the next free port and allocate. If port is non-zero
>>>    * allocate the specified port.
>>>    */
>>> -int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
>>> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port,
>>> +                         bool is_static)
>>>   {
>>>       struct evtchn *chn;
>>>       struct domain *d;
>>> @@ -330,6 +331,7 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
>>>       evtchn_write_lock(chn);
>>>         chn->state = ECS_UNBOUND;
>>> +    chn->is_static = is_static;
>>>       if ( (chn->u.unbound.remote_domid = alloc->remote_dom) == DOMID_SELF )
>>>           chn->u.unbound.remote_domid = current->domain->domain_id;
>>>       evtchn_port_init(d, chn);
>>> @@ -368,7 +370,7 @@ static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
>>>    * allocate the specified lport.
>>>    */
>>>   int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
>>> -                            evtchn_port_t lport)
>>> +                            evtchn_port_t lport, bool is_static)
>>>   {
>>>       struct evtchn *lchn, *rchn;
>>>       struct domain *rd;
>>> @@ -423,6 +425,7 @@ int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
>>>       lchn->u.interdomain.remote_dom  = rd;
>>>       lchn->u.interdomain.remote_port = rport;
>>>       lchn->state                     = ECS_INTERDOMAIN;
>>> +    lchn->is_static                 = is_static;
>>>       evtchn_port_init(ld, lchn);
>>>             rchn->u.interdomain.remote_dom  = ld;
>>> @@ -659,6 +662,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
>>>           rc = -EINVAL;
>>>           goto out;
>>>       }
>>> +    /* Guest cannot close a static event channel. */
>>> +    if ( chn1->is_static && guest )
>>> +        goto out;
>>
>> ... at least the interdomain structure store pointer to the domain. I am a bit concerned that we would end up to leave dangling pointers (such as chn->u.interdomain.remote_domain) as evtchn_close() is also used while destroying the domain.
> 
> Let me have a look again if we have to do the cleanup when we destroy the guest and close the static event channel.
>>
>> Also, AFAICT Xen will return 0 (i.e. success) to the caller. I think this is a mistake because we didn't close the port as requested.
> 
> If we return non-zero to guest (in particular if linux guest), Linux will report the BUG(). Therefore I decided to return 0.

... this shows that we are papering over a bigger problem: Linux is not 
ready for static event channels.

> 
> if (HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0)
>          BUG();
The BUG() in Linux is definitely not a reason to lie and claim the port 
was closed.

If you tell that to an OS, it may validly think that it know need to 
call bind interdomain in order to "re-open" the port. So your Linux will 
already need some information to know that the port is "static".

At which point, you can modify Linux to also prevent the port to be closed.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028AE4E79FC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 18:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294862.501593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXnak-0004BP-EF; Fri, 25 Mar 2022 17:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294862.501593; Fri, 25 Mar 2022 17:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXnak-00048z-Ak; Fri, 25 Mar 2022 17:19:14 +0000
Received: by outflank-mailman (input) for mailman id 294862;
 Fri, 25 Mar 2022 17:19:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXnaj-00048t-63
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 17:19:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXnah-0007s0-4L; Fri, 25 Mar 2022 17:19:11 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXnag-00061q-Tf; Fri, 25 Mar 2022 17:19:11 +0000
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
	bh=IQAFwk1fxmL7cyE2pxvtpb6wGYZmKycTJ0jFaQaSvi0=; b=ZPq4v0AZbqvgsv22WgjfSuolwM
	raRS+5Jk6ypZ2TgybJfgoRmaZ+r//XG34jPZdwC4gEipu7MINMZdtrTmQBQKlU9n3SSUFccGbPWTo
	lFsnEnzw5+IMAzasFTUQHaNQfOLqZ3QDH4AIrs4ayCF20GI3MxEl84aKR/K3xKHohmeY=;
Message-ID: <da700983-759b-2de6-9c36-0d09c6b06c0d@xen.org>
Date: Fri, 25 Mar 2022 17:19:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "Daniel P. Smith" <dpsmith.dev@gmail.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
 <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
 <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
 <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/03/2022 00:30, Stefano Stabellini wrote:
> On Wed, 23 Mar 2022, Jan Beulich wrote:
>> On 23.03.2022 01:22, Stefano Stabellini wrote:
>>> On Tue, 15 Mar 2022, Daniel P. Smith wrote:
>>>> On 1/28/22 16:33, Stefano Stabellini wrote:
>>>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>>>
>>>>> The xenstore event channel will be allocated for dom0less domains. It is
>>>>> necessary to have access to the evtchn_alloc_unbound function to do
>>>>> that, so make evtchn_alloc_unbound public.
>>>>>
>>>>> Add a skip_xsm parameter to allow disabling the XSM check in
>>>>> evtchn_alloc_unbound (xsm_evtchn_unbound wouldn't work for a call
>>>>> originated from Xen before running any domains.)
>>>>>
>>>>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>> CC: Julien Grall <julien@xen.org>
>>>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> CC: George Dunlap <george.dunlap@citrix.com>
>>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>>> CC: Wei Liu <wl@xen.org>
>>>>> ---
>>>>> Changes v3:
>>>>> - expose evtchn_alloc_unbound, assing a skip_xsm parameter
>>>>> ---
>>>>>   xen/common/event_channel.c | 13 ++++++++-----
>>>>>   xen/include/xen/event.h    |  3 +++
>>>>>   2 files changed, 11 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>>>> index da88ad141a..be57d00a15 100644
>>>>> --- a/xen/common/event_channel.c
>>>>> +++ b/xen/common/event_channel.c
>>>>> @@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>>>>>       xsm_evtchn_close_post(chn);
>>>>>   }
>>>>>   
>>>>> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>>>> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
>>>>>   {
>>>>>       struct evtchn *chn;
>>>>>       struct domain *d;
>>>>> @@ -301,9 +301,12 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>>>>           ERROR_EXIT_DOM(port, d);
>>>>>       chn = evtchn_from_port(d, port);
>>>>>   
>>>>> -    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
>>>>> -    if ( rc )
>>>>> -        goto out;
>>>>> +    if ( !skip_xsm )
>>>>> +    {
>>>>> +        rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
>>>>> +        if ( rc )
>>>>> +            goto out;
>>>>> +    }
>>>>
>>>> Please do not subvert the security framework because it causes an
>>>> inconvenience. As Jan recommended, work within the XSM check to allow
>>>> your access so that we may ensure it is done safely. If you need any
>>>> help making modifications to XSM, please do not hesitate to reach out as
>>>> I will gladly help.
>>>
>>> Thank you!
>>>
>>> First let me reply to Jan: this series is only introducing 1 more call
>>> to evtchn_alloc_unbound, which is to allocate the special xenstore event
>>> channel, the one configured via
>>> d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN].
>>>
>>> It is not meant to be a generic function, and it is not meant to be
>>> called more than once. It could (should?) be __init.
>>
>> How that? Its pre-existing use doesn't disappear, and requires it to be
>> non-__init.
> 
> Sorry I meant the new function (calling get_free_port) for the new
> use-case could be __init. The new function could be added to
> xen/common/event_channel.c or to xen/arch/arm/domain_build.c.
> 
> 
>>> The existing XSM check in evtchn_alloc_unbound cannot work and should
>>> not work: it is based on the current domain having enough privileges to
>>> create the event channel. In this case, we have no current domain at
>>> all. The current domain is Xen itself.
>>
>> And DOM_XEN cannot be given the appropriate permission, perhaps
>> explicitly when using a real policy and by default in dummy and SILO
>> modes?
> 
> The issue is that the check is based on "current", not one of the
> domains passed as an argument to evtchn_alloc_unbound. Otherwise,
> passing DOMID_XEN would be straightforward.
> 
> We would need to use a hack (like Daniel wrote in the other email) to
> set the idle_domain temporarily as a privileged domain only for the sake
> of passing an irrelevant (irrelevant as in "not relevant to this case")
> XSM check. That cannot be an improvement. Also, setting current to a
> "fake" domain is not great either.
I agree they are not great. But this needs to be compared with the other 
proposals.

AFAIU, your proposal is to duplicate code. This brings other risks such 
as duplicated bug and more code to maintain.

In your case, you only need one helper. But in some other context (e.g. 
Live-Update and it looks like Hyperlaunch), we may need to re-use more 
hypercalls code.

So to me, the idea of switching to a "fake" domain or bypassing the 
check is more appealing. I have a preference for the "fake" domain here.

> 
> In the specific case of dom0less and this patch, this is the only
> instance of this issue and could be solved very straightforwardly by
> calling get_free_port directly as we discussed [1].

Exporting get_free_port() is a no-go for me. This can be easily mis-used 
and in fact you already did it in your proposal by not using the proper 
locking (I appreciate this is meant to be boot code only).

> 
> I know Julien had some reservations about that. Let's try to find a
> technical solution that makes everyone happy.
> 
> Maybe, instead of exporting get_free_port, we could create a new
> function in xen/common/event_channel.c and mark it as __init? This way:
> - we don't need to expose get_free_port
> - the new function would only be __init anyway, so no risk of runtime
>    misuse

I think the code duplication is short-sighted. I could possibly accept 
one instance, but I suspect the proposal [1] will end up to add more.
So IMHO we should try to resolve it generically now.

Cheers,

[1] 
<4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>

-- 
Julien Grall


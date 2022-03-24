Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9A4E6624
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 16:37:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294443.500683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPVp-0006jX-Kk; Thu, 24 Mar 2022 15:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294443.500683; Thu, 24 Mar 2022 15:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPVp-0006h5-Hi; Thu, 24 Mar 2022 15:36:33 +0000
Received: by outflank-mailman (input) for mailman id 294443;
 Thu, 24 Mar 2022 15:36:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ioZu=UD=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1nXPVn-0006gz-Gg
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 15:36:31 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c65a3ca-ab88-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 16:36:29 +0100 (CET)
Received: by mail-qt1-x82d.google.com with SMTP id j21so4163964qta.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 08:36:29 -0700 (PDT)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 e14-20020ac85dce000000b002e1ee68d2d9sm2555800qtx.95.2022.03.24.08.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 08:36:26 -0700 (PDT)
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
X-Inumbo-ID: 2c65a3ca-ab88-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=oUWndWtNiJUbjMp/5sX7I4A6rhM6PsCR3+Pgcn0pd3Q=;
        b=AfkdPTPJFIbVbxYR5r7X5Qyv4Vaq0SUHbm2+L95mgnh0+oQAa19YB0u4QwTMpSbzHJ
         rzSMxtkHY5+co2CXJOnQJa8pG95y/VTpcpuT01yGb940UTrVvZXrOXSU4dwEvtaiw2PZ
         XMMZ7cM9IVsEdzMMZokHcKfq82lrHKCxPqlwAeQLmbbazf8cZH2WF+8joh2sfSBksWyB
         nSpi9XuSeManflg8jOrRFvQXg+/ompetnlbw/lE1Oh9n08EQOQYhG4FJ92dcupQ6b01t
         abY+FZJ/Nm8hlwpfC3ycq8iB04K/yxtucqAe/oE90SXDncWGoBxKuu5GYaIZBc+KEeHA
         VA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=oUWndWtNiJUbjMp/5sX7I4A6rhM6PsCR3+Pgcn0pd3Q=;
        b=HJHYzhACmYpus05n094w1X3C7P3Gg40AvJ3AqxMzMeph7FDsKw82YCI9We3KjaGFBy
         ucCj9cqsGfeP4Azkxf7stscKhFz8N7U38KX56q+lMX0na5DjoSbkgUgOOzWa0vhRzlzv
         cTmSVl0WdDa4AVuzxbMdgJhw+NdpY6KX8IGDR6gFOLGKzbuI0BGPvIov9NZDOATVFBDC
         3pcm5yr7iCeRmdqujNldh6ITJqkqgc2YhC8D+el1NPBKiz69k7yoI/R5vmdJUeqOUMea
         Ed99MP4dMSaI0uKEqmqdMOQOAAdM2JI8rdk/gX57eb2lgDhxkOjK9vq/18uPSWq39PuJ
         JcUQ==
X-Gm-Message-State: AOAM533udtBhSTTADuoYgm4OhuwsNEo1tC7vUmOb8lZGIbIIoarTMFIo
	o7kjJN0o5/3Ebyw/g8k25dk=
X-Google-Smtp-Source: ABdhPJylEcyGOv/9lR7TRDLYNBVJY/Pr96VFyYHjHGD7FZCYPWH/3IMVcqryIUky8lwsRseOgVYhVA==
X-Received: by 2002:a05:622a:5d1:b0:2e0:70c7:1678 with SMTP id d17-20020a05622a05d100b002e070c71678mr5016146qtb.43.1648136188492;
        Thu, 24 Mar 2022 08:36:28 -0700 (PDT)
Message-ID: <ab2b2165-c819-5c47-da1d-35bcb524df79@gmail.com>
Date: Thu, 24 Mar 2022 11:36:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
To: Stefano Stabellini <sstabellini@kernel.org>, jbeulich@suse.com
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
 <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
 <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/22/22 20:22, Stefano Stabellini wrote:
> On Tue, 15 Mar 2022, Daniel P. Smith wrote:
>> On 1/28/22 16:33, Stefano Stabellini wrote:
>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> The xenstore event channel will be allocated for dom0less domains. It is
>>> necessary to have access to the evtchn_alloc_unbound function to do
>>> that, so make evtchn_alloc_unbound public.
>>>
>>> Add a skip_xsm parameter to allow disabling the XSM check in
>>> evtchn_alloc_unbound (xsm_evtchn_unbound wouldn't work for a call
>>> originated from Xen before running any domains.)
>>>
>>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>> CC: George Dunlap <george.dunlap@citrix.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Wei Liu <wl@xen.org>
>>> ---
>>> Changes v3:
>>> - expose evtchn_alloc_unbound, assing a skip_xsm parameter
>>> ---
>>>  xen/common/event_channel.c | 13 ++++++++-----
>>>  xen/include/xen/event.h    |  3 +++
>>>  2 files changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>> index da88ad141a..be57d00a15 100644
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>>>      xsm_evtchn_close_post(chn);
>>>  }
>>>  
>>> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
>>>  {
>>>      struct evtchn *chn;
>>>      struct domain *d;
>>> @@ -301,9 +301,12 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>>          ERROR_EXIT_DOM(port, d);
>>>      chn = evtchn_from_port(d, port);
>>>  
>>> -    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
>>> -    if ( rc )
>>> -        goto out;
>>> +    if ( !skip_xsm )
>>> +    {
>>> +        rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
>>> +        if ( rc )
>>> +            goto out;
>>> +    }
>>
>> Please do not subvert the security framework because it causes an
>> inconvenience. As Jan recommended, work within the XSM check to allow
>> your access so that we may ensure it is done safely. If you need any
>> help making modifications to XSM, please do not hesitate to reach out as
>> I will gladly help.
> 
> Thank you!
> 
> First let me reply to Jan: this series is only introducing 1 more call
> to evtchn_alloc_unbound, which is to allocate the special xenstore event
> channel, the one configured via
> d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN].
> 
> It is not meant to be a generic function, and it is not meant to be
> called more than once. It could (should?) be __init.
> 
> The existing XSM check in evtchn_alloc_unbound cannot work and should
> not work: it is based on the current domain having enough privileges to
> create the event channel. In this case, we have no current domain at
> all. The current domain is Xen itself.

I have already replicated this in hyperlaunch for PV construction where
I have constructed the event channel for both xenstore and the console.
For hyperlaunch the construction is under a single, fairly-tight
function where I have promoted the Idle Domain to is_privileged before
the creation/construction loop starts and then demote the Idle Domain on
the other side of the loop. Honestly this is not my preferred approach
but for the initial implementation I do have a moderate amount of
confidence regarding the risk that results. My current thinking is that
the more appropriate approach would be to introduce a new system domain,
Construct Domain??, to provide a separate context under which all the
hyperlaunch creation and construction logic would be done and then
destroyed as part of init finalization.

> For these reasons, given [1], also not to subvert the security
> framework as Daniel pointed out, I think I should go back to my own
> implementation [2][3] based on get_free_port. That is my preference
> because:
> 
> - the Xen codebase doesn't gain much by reusing evtchn_alloc_unbound
> - adding skip_xsm introduces a component of risk (unless we make it
>   __init maybe?)
> - using get_free_port is trivial and doesn't pose the same issues
> 
> 
> Let's find all an agreement on how to move forward on this.
> 
> 
> [1] https://marc.info/?l=xen-devel&m=164194128922838
> [2] https://marc.info/?l=xen-devel&m=164203543615114
> [3] https://marc.info/?l=xen-devel&m=164203544615129 


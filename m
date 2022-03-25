Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7562B4E7856
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 16:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294830.501511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXm8f-0007pH-Ti; Fri, 25 Mar 2022 15:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294830.501511; Fri, 25 Mar 2022 15:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXm8f-0007mT-Qb; Fri, 25 Mar 2022 15:46:09 +0000
Received: by outflank-mailman (input) for mailman id 294830;
 Fri, 25 Mar 2022 15:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUFh=UE=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1nXm8e-0007mN-BX
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 15:46:08 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae2c08fd-ac52-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 16:46:05 +0100 (CET)
Received: by mail-qt1-x829.google.com with SMTP id 10so6823111qtz.11
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 08:46:05 -0700 (PDT)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 d189-20020a3768c6000000b0067b248d6b3bsm3557898qkc.46.2022.03.25.08.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 08:46:03 -0700 (PDT)
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
X-Inumbo-ID: ae2c08fd-ac52-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jFfI/n3lW1ulkQcFgrS8PAHqy4olAjDFfRf0FF5h1wY=;
        b=TCJJzf+bE/S5urg+fL8MnRkCLz8i2qKoF/lLlnkQyACO1MQfpPwjq/NB+3872T4AZb
         BP0nEy1XvFOHyXDSdN1ji9qY8c4J7Ft4s69WML/8huJjd2ElLs6b1YrdU6/g5FhO2EPO
         rcKpF3uIwFjtWOOcD4jCcSG+BqWicNwamTSzZrhaLzyVArM0U/PFdaRqY9yrxmEfSVAs
         o/EEXXNiz+g4L1YS9/tGDWQRajyBqystgb0jJP8VGmZFha1t/gpuMKl+y01ECZERyK9n
         Wr7SZ7aBGBl3vgDyQp67OOQGN7CzI8t70R35tlkkSy9Q2ScIEPzKbequlGOE331ra/VH
         T4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jFfI/n3lW1ulkQcFgrS8PAHqy4olAjDFfRf0FF5h1wY=;
        b=L0mHZoE8v+MGjzR7oTmP36MrNFutUtqq/NhX3YH5tnOzgLeRs37Whr/HFoXW5asQSl
         1m68fZKZDsXCBxPWnd73krFZ7ZOUBb7m1TA35zaXr19j4qg7zFjJag6hys6A3hNwfaqa
         TSWCHOwmT24b+uj+pve3XFmOL0bPiiTbhol+V9anj6hpBngbocIIxcI94fwpRMTZd4k7
         dKSB740pSGxHcFMgepf/ViMCWHN7YNROifgGog83HxdK+gRNjWPx4zoErMWB0v7MkhfC
         BkLnPObThYquvh30t/dE6quqLQEnSl++YgHb+zEFNdZjthLHDzl39TkUkiqGR7GlMY3J
         sR8Q==
X-Gm-Message-State: AOAM530drb88dryeelZhfxu1yITeCUkFInkPgYTTS4e/WeTPz1avdmvT
	9Zz3KZp8mDz53L1Qd/PctE0=
X-Google-Smtp-Source: ABdhPJy8kR9F0Af6bEmGraxv832g9m3z/idhjl3jf4eihwhHvEiDcb3dBJZWqzkAb4SudH+cT9o8tw==
X-Received: by 2002:ac8:7ee3:0:b0:2e1:a508:c500 with SMTP id r3-20020ac87ee3000000b002e1a508c500mr9699321qtc.117.1648223164594;
        Fri, 25 Mar 2022 08:46:04 -0700 (PDT)
Message-ID: <ccb85826-feb8-7c26-64e3-0a459bdaf8b6@gmail.com>
Date: Fri, 25 Mar 2022 11:45:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
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
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
 <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/24/22 20:30, Stefano Stabellini wrote:
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
>>>>>  xen/common/event_channel.c | 13 ++++++++-----
>>>>>  xen/include/xen/event.h    |  3 +++
>>>>>  2 files changed, 11 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>>>> index da88ad141a..be57d00a15 100644
>>>>> --- a/xen/common/event_channel.c
>>>>> +++ b/xen/common/event_channel.c
>>>>> @@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>>>>>      xsm_evtchn_close_post(chn);
>>>>>  }
>>>>>  
>>>>> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>>>> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
>>>>>  {
>>>>>      struct evtchn *chn;
>>>>>      struct domain *d;
>>>>> @@ -301,9 +301,12 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>>>>          ERROR_EXIT_DOM(port, d);
>>>>>      chn = evtchn_from_port(d, port);
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

My suggestion was not to intended to be simply a hack but looking at the
larger issue instead of simply doing a targeted fix for this one
instnace. While I cannot give an example right off hand, the reality is,
at least for hyperlaunch, that we cannot say for certain there will not
be further resource allocations that is protected by the security
framework and will require preliminary handling by the construction
logic in the hypervisor. The low-complexity approach is to address each
one in a case-by-case fashion using direct calls that go around the
security framework. A more security conscience, and higher complexity,
approach would be to consider a least-privilege approach and look at
introducing the ability to do controlled switching of contexts, i.e.
moving `current` from DOMID_IDLE to DOMID_CONSTRUCT, to one that is
granted only the necessary privileges to do the resource allocations in
which it is limited.

This is also not the first time this issue has come up, I don't recall
the exact thread but several months ago someone ran into the issue they
need to make a call to a resource function and was blocked by XSM
because DOMID_IDLE has no privileges. The reality is that the idea of
monolithic high-privileged entities is being dropped in favor of
least-privilege, and where possible hardware enforced, constraint. This
can be seen with Intel de-privileging SMM and running SMI handlers in
constrained ring 3. Arm is gaining capability pointers, CHERI, that will
enable the possibility for constrained, least-privileged kernel
subsystems. Would it not be advantageous for Xen to start moving in such
a direction that would enable it to provide a new level of safety and
security for consumers of Xen?

Coming back to the short-term, I would advocate for introducing the
concept and abstraction of constrained context switching through a set
of function calls, which would likely be under XSM to allow policy
enforcement. Likely the introductory implementation would just mask the
fact that it is just setting `is_privileged` for DOMID_IDLE. Future
evolution of the capability could see the introduction of new
"contexts", whether they are represented by a domain could be determined
then, and the ability to do controlled switching based on policy.

Just wanted to put more of my thinking out there before a path is taken.

> In the specific case of dom0less and this patch, this is the only
> instance of this issue and could be solved very straightforwardly by
> calling get_free_port directly as we discussed [1].
> 
> I know Julien had some reservations about that. Let's try to find a
> technical solution that makes everyone happy.
> 
> Maybe, instead of exporting get_free_port, we could create a new
> function in xen/common/event_channel.c and mark it as __init? This way:
> - we don't need to expose get_free_port
> - the new function would only be __init anyway, so no risk of runtime
>   misuse
> 
> What do you think?
> 
> [1] https://marc.info/?l=xen-devel&m=164197327305903


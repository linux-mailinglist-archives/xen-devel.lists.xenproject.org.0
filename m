Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8B9AE6B6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825302.1239509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3y0R-0002G4-En; Thu, 24 Oct 2024 13:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825302.1239509; Thu, 24 Oct 2024 13:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3y0R-0002EP-AK; Thu, 24 Oct 2024 13:36:03 +0000
Received: by outflank-mailman (input) for mailman id 825302;
 Thu, 24 Oct 2024 13:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQmA=RU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3y0Q-00026Y-0H
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:36:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6ce4549-920c-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 15:35:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729776952321838.7940254939241;
 Thu, 24 Oct 2024 06:35:52 -0700 (PDT)
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
X-Inumbo-ID: e6ce4549-920c-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729776953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UaXSxpwC1k26BOTtQJSWUq9axliSvZLB0/HQKTd1nUI+55lteEim473p7FbG5veahiQhy+JsdYZdOgvoRQsd2FhWosqYmh/NmppJyXUyFKIfyaLIRH0S223uzfBnws8owrWIyy2c9z2nZy77H/RkkXUVYQoc6K7Q6N2LspLb7X4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729776953; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qGiioBmR5484I0N5GeYQgR4+MzUnJP6y3FYcSCS+ulo=; 
	b=oIZwmB2SkCdSgKRNbJQex0YGJczsX55iuuYqlimhnzWJg2HbgSeNOs4149zbw5NRXps4Z6kFEWj/j97Z/9rqJj5BbYQ5mQAkm16HClDqAjFFkmno2SILaXs4d5pYd97u+o7R6bS23dqN3AC3xQXNc60F0LTrL+cbs6fCf5KE948=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729776953;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qGiioBmR5484I0N5GeYQgR4+MzUnJP6y3FYcSCS+ulo=;
	b=moSZxhMSOyBZ6KsKEdyDpAvTL7f1OlCCw0xeD6lYlZFXuLREY2ONe6wabrYNCea4
	b0R1K2H3sywSiV4MzRvOnZYdHLMI0Ccw/QRS61SHo7BK+XPjuMk0BWlg5qANGDXyLDB
	OJIRQyzjUvpKxw65JxjFjMSDBDzZMVRrakOLtEUg=
Message-ID: <fa78a4f7-4b2e-46e2-8110-868735892fae@apertussolutions.com>
Date: Thu, 24 Oct 2024 09:35:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <ea2aeed1-91b7-47db-9354-d0634d0db9e8@apertussolutions.com>
 <9a049e23-471f-4987-9993-e5f2db60ac1f@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <9a049e23-471f-4987-9993-e5f2db60ac1f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/24/24 05:13, Jürgen Groß wrote:
> On 23.10.24 17:55, Daniel P. Smith wrote:
>> On 10/23/24 09:10, Juergen Gross wrote:
>>> Add a new domctl sub-function to get data of a domain having changed
>>> state (this is needed by Xenstore).
>>>
>>> The returned state just contains the domid, the domain unique id,
>>> and some flags (existing, shutdown, dying).
>>>
>>> In order to enable Xenstore stubdom being built for multiple Xen
>>> versions, make this domctl stable.  For stable domctls the
>>> interface_version is specific to the respective domctl op and it is an
>>> in/out parameter: On input the caller is specifying the desired version
>>> of the op, while on output the hypervisor will return the used version
>>> (this will be at max the caller supplied version, but might be lower in
>>> case the hypervisor doesn't support this version).
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V1:
>>> - use a domctl subop for the new interface (Jan Beulich)
>>> ---
>>>   tools/flask/policy/modules/dom0.te  |  2 +-
>>>   xen/common/domain.c                 | 51 +++++++++++++++++++++++++++++
>>>   xen/common/domctl.c                 | 19 ++++++++++-
>>>   xen/common/event_channel.c          |  9 ++++-
>>>   xen/include/public/domctl.h         | 33 +++++++++++++++++++
>>>   xen/include/xen/event.h             |  6 ++++
>>>   xen/include/xen/sched.h             |  2 ++
>>>   xen/include/xsm/dummy.h             |  8 +++++
>>>   xen/include/xsm/xsm.h               |  6 ++++
>>>   xen/xsm/dummy.c                     |  1 +
>>>   xen/xsm/flask/hooks.c               |  7 ++++
>>>   xen/xsm/flask/policy/access_vectors |  2 ++
>>>   12 files changed, 143 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tools/flask/policy/modules/dom0.te 
>>> b/tools/flask/policy/modules/dom0.te
>>> index 16b8c9646d..6043c01b12 100644
>>> --- a/tools/flask/policy/modules/dom0.te
>>> +++ b/tools/flask/policy/modules/dom0.te
>>> @@ -40,7 +40,7 @@ allow dom0_t dom0_t:domain {
>>>   };
>>>   allow dom0_t dom0_t:domain2 {
>>>       set_cpu_policy gettsc settsc setscheduler set_vnumainfo
>>> -    get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy
>>> +    get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy get_domain_state
>>
>> I don't think that is where you want it, as that restricts dom0 to 
>> only being able to make that call against dom0. The question I have 
>> is, are you looking for this permission to be explicitly assigned to 
>> dom0 or to the domain type that was allowed to create the domain. 
>> IMHO, I think you would want the latter, so not only should the 
>> permission go here, but also added to xen.if:create_domain_common.
>>
>> Additionally, I would also recommend adding the following to xenstore.te:
>>
>> allow xenstore_t domain_type:domain get_domain_state
> 
> Okay, but shouldn't this be:
> 
> allow xenstore_t domain_type:domain2 get_domain_state;

Apologies, yes that was a typo on my part.

>>
>>>   allow dom0_t dom0_t:resource { add remove };
>>
>> ...
>>
>>> @@ -866,6 +873,16 @@ long 
>>> do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>                   __HYPERVISOR_domctl, "h", u_domctl);
>>>           break;
>>> +    case XEN_DOMCTL_get_domain_state:
>>> +        ret = xsm_get_domain_state(XSM_HOOK, d);
>>
>> XSM_HOOK will allow any domain to make this call on any domain. What I 
>> think you want here is XSM_XS_PRIV. That will allow either a domain 
>> flagged as the xenstore domain or dom0 to make the call.
> 
> I thought so, too, but looking at the "getdomaininfo" example it seems
> to be okay this way, too. Especially with the addition to xsm_domctl()
> checking for XSM_XS_PRIV.

I know this has been done in the past, but imho it is not a very good 
practice. Access checks really should always restrict equal or down. 
There should be a strong reason, which probably would deserves a code 
comment, to allow a check to relax up. Restricting equal should not 
reduce access, and if it does, then it means there is an unintended 
access path which is now exposed.

>>
>>> +        if ( ret )
>>> +            break;
>>> +
>>> +        copyback = 1;
>>> +        op->interface_version = XEN_DOMCTL_GETDOMSTATE_VERS_MAX;
>>> +        ret = get_domain_state(&op->u.get_domain_state, d);
>>> +        break;
>>> +
>>>       default:
>>>           ret = arch_do_domctl(op, d, u_domctl);
>>>           break;
>>
>> ...
>>
>>> @@ -815,6 +816,13 @@ static XSM_INLINE int cf_check xsm_argo_send(
>>>   #endif /* CONFIG_ARGO */
>>> +static XSM_INLINE int cf_check xsm_get_domain_state(
>>> +    XSM_DEFAULT_ARG struct domain *d)
>>> +{
>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>
>> Per the above, this would need changed to XSM_XS_PRIV.
>>
>>> +    return xsm_default_action(action, current->domain, d);
>>> +}
>>> +
>>>   #include <public/version.h>
>>>   static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG 
>>> uint32_t op)
>>>   {
>>
>> ...
>>
>>> @@ -1853,6 +1854,11 @@ static int cf_check flask_argo_send(
>>>   #endif
>>> +static int cf_check flask_get_domain_state(struct domain *d)
>>> +{
>>> +    return current_has_perm(d, SECCLASS_DOMAIN, 
>>> DOMAIN__GET_DOMAIN_STATE);
>>
>> I believe you want SECCLASS_DOMAIN2 here.
> 
> Oh, indeed. And probably DOMAIN2__GET_DOMAIN_STATE
> 
> 
> Thanks,

No problem.

v/r,
dps


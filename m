Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C986F4550
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528656.822108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqGO-0003k5-GZ; Tue, 02 May 2023 13:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528656.822108; Tue, 02 May 2023 13:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptqGO-0003h7-De; Tue, 02 May 2023 13:41:52 +0000
Received: by outflank-mailman (input) for mailman id 528656;
 Tue, 02 May 2023 13:41:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ptqGN-0003Oi-CU
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:41:51 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 160e9f32-e8ef-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 15:41:50 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1683034905351328.7299606446121;
 Tue, 2 May 2023 06:41:45 -0700 (PDT)
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
X-Inumbo-ID: 160e9f32-e8ef-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683034906; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z8IImE2XPq+A8wp68OcU39T31usWWv0UrcK7QKKniAngTES4Oxsg/CB/EZhvXshxuL0mJDXJXMcJatiKMukhMu11UU73yZbOZufC+YlsZtyhy0dnd6NpVy+w3Vp5DpYW6SWrc4FVRozEZ26hl5udGrCGB4CRZ78iTB24HYSHBYE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683034906; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=xNbtRmBKjKSHqEgVtqUXyN+cG3mqZpX02zCxAI/TSZk=; 
	b=mYkQC4foXuhKPg11pWCBLhxMdGeHBs9skFnZ9HWK2EQnEcRu8LcFfvOcVc/BRygctP6jqDQMh6tO6oQaKEdsuyixHDvPW9glqq+arc92kWeDkgKS+Xk0swGFNelKE5WFR/RqI43C/6DyG2Ti8VVrUCUqeLBkRpA1E/bxq+ie2o0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683034906;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xNbtRmBKjKSHqEgVtqUXyN+cG3mqZpX02zCxAI/TSZk=;
	b=VFEfKsGRoxz1UNAQVVwWgBDSC3v7++0diGGP6xwskp9HmbN4BDPNXRfLA88b0Ih3
	5b9+MMkUD2IN7KfSvw9XwJqWUTMdkdcUDJmt2WFRk2DTQ/K0FCJBlpO37HAgu+Ioo1E
	YoLF+4AkLRc2KMza4NdhSaj3Jra1yNtZKOQK9EGc=
Message-ID: <b358ca18-20c2-67d5-4745-b134a9176804@apertussolutions.com>
Date: Tue, 2 May 2023 09:41:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230430144646.13624-1-jgross@suse.com>
 <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
 <ca098773-5428-c97f-87ae-402fffd114bb@suse.com>
 <25876523-8d03-7e7d-e70f-b88d52f2b270@apertussolutions.com>
 <b6550b56-fcb5-42a2-93c3-7fe486a215ba@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
In-Reply-To: <b6550b56-fcb5-42a2-93c3-7fe486a215ba@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/2/23 09:30, Juergen Gross wrote:
> On 02.05.23 15:23, Daniel P. Smith wrote:
>> On 5/2/23 09:13, Juergen Gross wrote:
>>> On 02.05.23 15:03, Daniel P. Smith wrote:
>>>> On 4/30/23 10:46, Juergen Gross wrote:
>>>>> In case XSM is active, the handling of XEN_SYSCTL_getdomaininfolist
>>>>> can fail if the last domain scanned isn't allowed to be accessed by
>>>>> the calling domain (i.e. xsm_getdomaininfo(XSM_HOOK, d) is failing).
>>>>>
>>>>> Fix that by just ignoring scanned domains where xsm_getdomaininfo()
>>>>> is returning an error, like it is effectively done when such a
>>>>> situation occurs for a domain not being the last one scanned.
>>>>>
>>>>> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>>   xen/common/sysctl.c | 3 +--
>>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
>>>>> index 02505ab044..0cbfe8bd44 100644
>>>>> --- a/xen/common/sysctl.c
>>>>> +++ b/xen/common/sysctl.c
>>>>> @@ -89,8 +89,7 @@ long 
>>>>> do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>>>>               if ( num_domains == 
>>>>> op->u.getdomaininfolist.max_domains )
>>>>>                   break;
>>>>> -            ret = xsm_getdomaininfo(XSM_HOOK, d);
>>>>> -            if ( ret )
>>>>> +            if ( xsm_getdomaininfo(XSM_HOOK, d) )
>>>>>                   continue;
>>>>>               getdomaininfo(d, &info);
>>>>
>>>>
>>>> This change does not match the commit message. This says it fixes an 
>>>> issue, but unless I am totally missing something, this change is 
>>>> nothing more than formatting that drops the use of an intermediate 
>>>> variable. Please feel free to correct me if I am wrong here, 
>>>> otherwise I believe the commit message should be changed to reflect 
>>>> the code change.
>>>
>>> You are missing the fact that ret getting set by a failing 
>>> xsm_getdomaininfo()
>>> call might result in the ret value being propagated to the sysctl 
>>> caller. And
>>> this should not happen. So the fix is to NOT modify ret here.
>>
>> You are correct, my apologies for that.
> 
> No need to apologize. :-)

I believe it is proper to admit when you are wrong.

>>>> Second, as far as the problem description goes. The *only* time the 
>>>> call to xsm_getdomaininfo() at this location will return anything 
>>>> other than 0, is when FLASK is being used and a domain whose type is 
>>>> not allowed getdomaininfo is making the call. XSM_HOOK signals a 
>>>> no-op check for the default/dummy policy, and the SILO policy does 
>>>> not override the default/dummy policy for this check.
>>>
>>> Your statement sounds as if xsm_getdomaininfo() would always return 
>>> the same
>>> value for a given caller domain. Isn't that return value also 
>>> depending on the
>>> domain specified via the second parameter? In case it isn't, why does 
>>> that
>>> parameter even exist?
>>
>> It would if the default action was something other than XSM_HOOK. Look 
>> at line 82 of include/xsm/dummy.h. XSM_HOOK will always return 0 
>> regardless of the src or dest domains. The function 
>> xsm_defualt_action() is the policy for both default/dummy and SILO 
>> with the exception for evntchn, grants, and argo checks for SILO.
> 
> Ah, okay. I didn't analyze all of the involved xsm code.

No worries! I am always willing to help in any way that I can. While I 
don't have the bandwidth to be proactive and keep up with everything on 
xen-devel, please do not hesitate to ask me or ping me on anything XSM 
related. I will gladly take a look and provide what insights I might 
have on your query.

v/r,
dps


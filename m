Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCF6F44F9
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528634.822047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptq3P-0007C8-U3; Tue, 02 May 2023 13:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528634.822047; Tue, 02 May 2023 13:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptq3P-00079M-RN; Tue, 02 May 2023 13:28:27 +0000
Received: by outflank-mailman (input) for mailman id 528634;
 Tue, 02 May 2023 13:28:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ptq3O-00079G-6U
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:28:26 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35a06913-e8ed-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:28:23 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1683034099404379.736342581768;
 Tue, 2 May 2023 06:28:19 -0700 (PDT)
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
X-Inumbo-ID: 35a06913-e8ed-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683034101; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B3zZudwY+vSCNm3jZfy0190aw5ZEQND8RF9ZiH2IQgevHU8a5curtDKgmMmuMk6Yi7DwP/0LzOf9w9C+5rTudxgoZmXSWUz/zkRRP4uuHYqhFrEVlUsDz7dJxIY1f23LWzKkaF72gE7KW1oD6/rpZCmDFCWMtxjB3rhyt3NToeU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683034101; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=3NHg7AojgcM8Ma5gKRmn71RqBszAUpxCp3PnnZLm5qo=; 
	b=K63BsfvbzEkVV1n3kuFHUDNkL4J8fDG2p1yagVx3FxNfIGb9czlwnW2e1tVnkdyX2dibrm6BgQ8yb8Vv4pkAejAK7esvFXo5ZIw/LyO5rgkly0OmkMgZqiXSfFd2FtBI56ebmI6iVf+BGQQDGt7DkISygm5Uk2D6vQ/h9hQvbm0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683034101;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3NHg7AojgcM8Ma5gKRmn71RqBszAUpxCp3PnnZLm5qo=;
	b=Tgxf0IoQvlbIsNtWJNp++CTOXZxHI+Imf0AGJI6Zf6PrEoZT0Xb9ilsze/p839VW
	qOZEpjV2v+5ca0pZq8k0nbti9zRWkDKW9Zqi7UwiJNKjryiRhbu3TTnmINx/Z8Hf+3E
	4VfSvJ+TDk+LaDjrLCx2g5LoHWbmJ/GjawC9/BbM=
Message-ID: <f08c67e6-72ab-a99c-b020-37f526efc743@apertussolutions.com>
Date: Tue, 2 May 2023 09:28:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230430144646.13624-1-jgross@suse.com>
 <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
 <ca098773-5428-c97f-87ae-402fffd114bb@suse.com>
 <25876523-8d03-7e7d-e70f-b88d52f2b270@apertussolutions.com>
In-Reply-To: <25876523-8d03-7e7d-e70f-b88d52f2b270@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/2/23 09:23, Daniel P. Smith wrote:
> On 5/2/23 09:13, Juergen Gross wrote:
>> On 02.05.23 15:03, Daniel P. Smith wrote:
>>> On 4/30/23 10:46, Juergen Gross wrote:
>>>> In case XSM is active, the handling of XEN_SYSCTL_getdomaininfolist
>>>> can fail if the last domain scanned isn't allowed to be accessed by
>>>> the calling domain (i.e. xsm_getdomaininfo(XSM_HOOK, d) is failing).
>>>>
>>>> Fix that by just ignoring scanned domains where xsm_getdomaininfo()
>>>> is returning an error, like it is effectively done when such a
>>>> situation occurs for a domain not being the last one scanned.
>>>>
>>>> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> ---
>>>>   xen/common/sysctl.c | 3 +--
>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
>>>> index 02505ab044..0cbfe8bd44 100644
>>>> --- a/xen/common/sysctl.c
>>>> +++ b/xen/common/sysctl.c
>>>> @@ -89,8 +89,7 @@ long 
>>>> do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>>>               if ( num_domains == op->u.getdomaininfolist.max_domains )
>>>>                   break;
>>>> -            ret = xsm_getdomaininfo(XSM_HOOK, d);
>>>> -            if ( ret )
>>>> +            if ( xsm_getdomaininfo(XSM_HOOK, d) )
>>>>                   continue;
>>>>               getdomaininfo(d, &info);
>>>
>>>
>>> This change does not match the commit message. This says it fixes an 
>>> issue, but unless I am totally missing something, this change is 
>>> nothing more than formatting that drops the use of an intermediate 
>>> variable. Please feel free to correct me if I am wrong here, 
>>> otherwise I believe the commit message should be changed to reflect 
>>> the code change.
>>
>> You are missing the fact that ret getting set by a failing 
>> xsm_getdomaininfo()
>> call might result in the ret value being propagated to the sysctl 
>> caller. And
>> this should not happen. So the fix is to NOT modify ret here.
> 
> You are correct, my apologies for that.
> 
>>> Second, as far as the problem description goes. The *only* time the 
>>> call to xsm_getdomaininfo() at this location will return anything 
>>> other than 0, is when FLASK is being used and a domain whose type is 
>>> not allowed getdomaininfo is making the call. XSM_HOOK signals a 
>>> no-op check for the default/dummy policy, and the SILO policy does 
>>> not override the default/dummy policy for this check.
>>
>> Your statement sounds as if xsm_getdomaininfo() would always return 
>> the same
>> value for a given caller domain. Isn't that return value also 
>> depending on the
>> domain specified via the second parameter? In case it isn't, why does 
>> that
>> parameter even exist?
> 
> It would if the default action was something other than XSM_HOOK. Look 
> at line 82 of include/xsm/dummy.h. XSM_HOOK will always return 0 
> regardless of the src or dest domains. The function xsm_defualt_action() 
> is the policy for both default/dummy and SILO with the exception for 
> evntchn, grants, and argo checks for SILO.

Sorry, one last clarification. xsm_default_action() is also what is used 
when XSM=n. The difference is that for XSM=n, xsm_default_action() is 
in-lined at the call site whereas with XSM=y and not using FLASK results 
in a function call xsm_default_action().

v/r,
dps


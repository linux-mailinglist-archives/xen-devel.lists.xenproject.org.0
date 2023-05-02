Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E9E6F44E0
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528611.821998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpt0-0003LF-NQ; Tue, 02 May 2023 13:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528611.821998; Tue, 02 May 2023 13:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpt0-0003Ik-Kn; Tue, 02 May 2023 13:17:42 +0000
Received: by outflank-mailman (input) for mailman id 528611;
 Tue, 02 May 2023 13:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ptpsy-0003IY-V1
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:17:40 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5f6a33f-e8eb-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 15:17:39 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1683033455258422.6280237200574;
 Tue, 2 May 2023 06:17:35 -0700 (PDT)
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
X-Inumbo-ID: b5f6a33f-e8eb-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683033455; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bKgVqM1cUjQg1RE4Z6Kx69DSsRAw4rMDqvv6/Sy2O23QeM5wbXrA0LI7luRdXAA/4dQw/9Ws5WwK9qMhCm1a8suuRhTktwnWhJwHo9YS5fF+o8M7ojwnViVEQTy17sXfZw7idmwx7uuC6KslLYd3sXcfZ7W/IfaUsqTeBLh39jI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683033455; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Bj4+tCe/Djy4x77OBozlm/+/KUc/w8n08KGpXcqAFa0=; 
	b=PfzrMRF/rh23CiCZobBufEefvheYPU8Fgodc/pFxKVuVUhu406UagzdU9voi/3QdAp0WFl2VVNZ85deMgIjMllE3ilpnJ5aVXrAHgWrA/VRea7cQh0cpmFbxD9LSE3g0PHNQUtnIWio1BOyO7zr7GYMADceR0xa65Z6ppMFBR0I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683033455;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Bj4+tCe/Djy4x77OBozlm/+/KUc/w8n08KGpXcqAFa0=;
	b=FgKzUjC/XehD1nI7NB2OdpPDvu9CCWiYUInyMEZe5qAO0E4oNWZZzWdt53yj/hyw
	cxHP95XG4PoLfEjXhrRfPJWPpVwZEJcn1F8TnU8b8eGKT9KwbLbZwl7Gm014ZU8K2S/
	m5+W2Le2wwJ9jMaKEbjc04GeUDuX3C1J1mCY6JAw=
Message-ID: <8eeb34f6-0889-c2e4-d2fc-e0319f032a97@apertussolutions.com>
Date: Tue, 2 May 2023 09:17:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230430144646.13624-1-jgross@suse.com>
 <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
 <ZFELr0BYpMgX9CzR@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <ZFELr0BYpMgX9CzR@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/2/23 09:10, Roger Pau Monné wrote:
> On Tue, May 02, 2023 at 09:03:00AM -0400, Daniel P. Smith wrote:
>> On 4/30/23 10:46, Juergen Gross wrote:
>>> In case XSM is active, the handling of XEN_SYSCTL_getdomaininfolist
>>> can fail if the last domain scanned isn't allowed to be accessed by
>>> the calling domain (i.e. xsm_getdomaininfo(XSM_HOOK, d) is failing).
>>>
>>> Fix that by just ignoring scanned domains where xsm_getdomaininfo()
>>> is returning an error, like it is effectively done when such a
>>> situation occurs for a domain not being the last one scanned.
>>>
>>> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>    xen/common/sysctl.c | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
>>> index 02505ab044..0cbfe8bd44 100644
>>> --- a/xen/common/sysctl.c
>>> +++ b/xen/common/sysctl.c
>>> @@ -89,8 +89,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>>                if ( num_domains == op->u.getdomaininfolist.max_domains )
>>>                    break;
>>> -            ret = xsm_getdomaininfo(XSM_HOOK, d);
>>> -            if ( ret )
>>> +            if ( xsm_getdomaininfo(XSM_HOOK, d) )
>>>                    continue;
>>>                getdomaininfo(d, &info);
>>
>>
>> This change does not match the commit message. This says it fixes an issue,
>> but unless I am totally missing something, this change is nothing more than
>> formatting that drops the use of an intermediate variable. Please feel free
>> to correct me if I am wrong here, otherwise I believe the commit message
>> should be changed to reflect the code change.
> 
> By dropping that intermediate variable it prevents returning an error
> as the result of the hypercall if xsm_getdomaininfo() for the last
> domain fails.

Ah, understood. I missed ret is state tracking.

> Note that xsm_getdomaininfo() failing for other domains not the last
> one don't cause the return value of the hypercall to be an error
> code, because the variable containing the error gets overwritten by
> further loops.

In the end, this is just addressing an issue that has not been seen by 
anyone and happened upon while debugging another issue.

V/r,
DPS


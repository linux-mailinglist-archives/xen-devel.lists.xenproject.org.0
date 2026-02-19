Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGOIHyD/lmmItQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 13:16:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C091315E89E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 13:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236196.1538944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt2wV-0002it-D9; Thu, 19 Feb 2026 12:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236196.1538944; Thu, 19 Feb 2026 12:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt2wV-0002hK-A6; Thu, 19 Feb 2026 12:15:39 +0000
Received: by outflank-mailman (input) for mailman id 1236196;
 Thu, 19 Feb 2026 12:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vt2wU-0002hE-0r
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 12:15:38 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1233be3-0d8c-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 13:15:35 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1771503318217305.49356846039416;
 Thu, 19 Feb 2026 04:15:18 -0800 (PST)
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
X-Inumbo-ID: b1233be3-0d8c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1771503322; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yf2ed+1ZVgezyQnUVpKdPIRuYSGD4NHHCy01V44HWbPmsMewYQQqs3OrGn+4QxLyuQQQs6CNREnAKn2kA1DZksr1aJxyYJjz/4vCuHemrVSw/P0sZE7iGEhLsL70UJe3MEuuFx+l9yHPVEsdxudpNiHwQv7xVoo7ft+gtmuiIxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771503322; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iVWQvwAHlrWAyEjqQylfVKxysdT9hftzKejSBSQ5E+8=; 
	b=cZHqTHmU1lpYHnDDfzhfHCBO4vPUU9OpGvkv4YyVqqCnjSwPK2KF0ssbr6ndydHQ3OiNB2vyWqVwy3K1U6uslp34QkaNgWah1fJR570O6SrlHvxdXMz1q3zRr33GytLcuLmLlyl0oJhJUKf2c/SJKnG/YkfdL45iPP07Mfg7/P8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771503322;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iVWQvwAHlrWAyEjqQylfVKxysdT9hftzKejSBSQ5E+8=;
	b=toQT+n/19pvF3RgNil2XFu71XSMH9o5139mSWzKamTwpfwfaGlvrJA6RCuywLnSS
	uxS/udbdoprDbtZNMtMTqHuSkfS4l91ZD+L4kJA/BzwpYNOfQ8RcRdRilcH08ztJX8R
	mAsLW+O+dStaJUjYr4L8y7YfLcrmJqERw59yMFX0=
Message-ID: <e402ca27-75ca-4046-8e30-305c1c8d3db8@apertussolutions.com>
Date: Thu, 19 Feb 2026 07:15:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[apertussolutions.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C091315E89E
X-Rspamd-Action: no action

On 2/18/26 18:04, Jason Andryuk wrote:
> On 2026-02-18 14:08, Daniel P. Smith wrote:
>> When using XSM Flask, passing DOMID_INVALID will result in a NULL pointer
>> reference from the passing of NULL as the target domain to
>> xsm_get_domain_state(). Simply not invoking xsm_get_domain_state() 
>> when the
>> target domain is NULL opens the opportunity to circumvent the XSM
>> get_domain_state access check. This is due to the fact that the call to
>> xsm_domctl() for get_domain_state op is a no-op check, deferring to
>> xsm_get_domain_state().
>>
>> Modify the helper get_domain_state() to ensure the requesting domain has
>> get_domain_state access for the target domain, whether the target 
>> domain is
>> explicitly set or implicitly determined with a domain state search. In 
>> the case
>> of access not being allowed for a domain found during an implicit 
>> search, the
>> search will continue to the next domain whose state has changed.
>>
>> Fixes: 3ad3df1bd0aa ("xen: add new domctl get_domain_state")
>> Reported-by: Chris Rogers <rogersc@ainfosec.com>
>> Reported-by: Dmytro Firsov <dmytro_firsov@epam.com>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes in v2:
>> - fix commit message
>> - init dom as -1
>> - rework loop logic to use test_and_clear_bit()
>> ---
>>   xen/common/domain.c | 27 +++++++++++++++++++++------
>>   xen/common/domctl.c |  7 ++-----
>>   2 files changed, 23 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index de6fdf59236e..2ffec331a8d1 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -210,7 +210,7 @@ static void set_domain_state_info(struct 
>> xen_domctl_get_domain_state *info,
>>   int get_domain_state(struct xen_domctl_get_domain_state *info, 
>> struct domain *d,
>>                        domid_t *domid)
>>   {
>> -    unsigned int dom;
>> +    unsigned int dom = -1;
>>       int rc = -ENOENT;
>>       struct domain *hdl;
>> @@ -219,6 +219,10 @@ int get_domain_state(struct 
>> xen_domctl_get_domain_state *info, struct domain *d,
>>       if ( d )
>>       {
>> +        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>> +        if ( rc )
>> +            return rc;
>> +
>>           set_domain_state_info(info, d);
>>           return 0;
>> @@ -238,28 +242,39 @@ int get_domain_state(struct 
>> xen_domctl_get_domain_state *info, struct domain *d,
> 
> Between the two hunks is this:
> 
>      hdl = lock_dom_exc_handler();
> 
>      /*
>       * Only domain registered for VIRQ_DOM_EXC event is allowed to query
>       * domains having changed state.
>       */
>      if ( current->domain != hdl )
>      {
>          rc = -EACCES;
>          goto out;
>      }
> 
> So it is only the domain with VIRQ_DOM_EXC that can enter the while loop:
> 
>>       while ( dom_state_changed )
>>       {
>> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
>> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom + 1);
>>           if ( dom >= DOMID_FIRST_RESERVED )
>>               break;
>> +
>> +        d = rcu_lock_domain_by_id(dom);
>> +        if ( d && xsm_get_domain_state(XSM_XS_PRIV, d) )
> 
> ... if the VIRQ_DOM_EXC owner is denied for domain d ...
> 
>> +        {
>> +            rcu_unlock_domain(d);
>> +            d = NULL;
>> +            continue;
> 
> ... the caller would continue ...
> 
>> +        }
>> +
>>           if ( test_and_clear_bit(dom, dom_state_changed) )
> 
> ... and this bit would never be cleared.  Should the VIRQ_DOM_EXC owner 
> always get to clear the bit even if it cannot see the result?  Is this 
> too much of a corner case to care about?

If we want to go down this discussion path, here is yet another example 
access control decisions are getting codified directly against 
properties of a domain, in particular against VIRQ's which were waived 
from XSM control. If having access to certain VIRQ's is going to be a 
privilege determination, then perhaps we should visit whether they 
should be labeled objects like physical IRQs.

> The patch generally seems okay aside from this.
> 
>>           {
>>               *domid = dom;
>> -            d = rcu_lock_domain_by_id(dom);
>> -
>>               if ( d )
>>               {
>>                   set_domain_state_info(info, d);
>> -
>>                   rcu_unlock_domain(d);
>>               }
>>               else
>>                   memset(info, 0, sizeof(*info));
>>               rc = 0;
>> -
>>               break;
>>           }
>> +
>> +        if ( d )
>> +        {
>> +            rcu_unlock_domain(d);
>> +            d = NULL;
>> +        }
>>       }
>>    out:
>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>> index 29a7726d32d0..2eedc639c72a 100644
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -860,12 +860,9 @@ long 
>> do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>           break;
>>       case XEN_DOMCTL_get_domain_state:
>> -        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
> 
> With the initial NULL deref issue, I wondered if this wouldn't be better 
> off modified to drop the d param - xsm_get_domain_state(XSM_XS_PRIV) - 
> and changing flask permissions like:
> allow dom0_t xen_t:xen get_domain_state;
> 
> That would gate the external call, and individual domain permissions 
> could be checked with xsm_getdomaininfo(), or a new hook if you don't 
> want to re-use.
> 
> But as your approach avoids passing NULL, it seems okay to me.  It also 
> doesn't change the flask policy, which is nice.

That's a plain nack from me. Whether it is viewed as a pipe dream or 
not, my goal continues to be to work towards enabling the ability to 
have a truly disaggregated platform. In the original architecture, it 
was envisioned to have multiple toolstack domains, each responsible for 
a distinct set of domains. In terms of implementation, that would mean 
multiple xenstored instances, each with a purview over a subset of domains.

v/r,
dps



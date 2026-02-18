Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKqtFlHnlWnKWAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 17:22:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A8157AFA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 17:22:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235853.1538700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vskJS-0000bR-5D; Wed, 18 Feb 2026 16:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235853.1538700; Wed, 18 Feb 2026 16:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vskJS-0000YO-2S; Wed, 18 Feb 2026 16:22:06 +0000
Received: by outflank-mailman (input) for mailman id 1235853;
 Wed, 18 Feb 2026 16:22:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfGN=AW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vskJP-0000Wm-SB
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 16:22:03 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f38de3fe-0ce5-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 17:22:01 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1771431707179904.2711152236781;
 Wed, 18 Feb 2026 08:21:47 -0800 (PST)
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
X-Inumbo-ID: f38de3fe-0ce5-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1771431710; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HVTqkwuY4xSbqqfiI2cEKDN2464fNaHWW3P/+/kXZ7lbGwrFhMl56bWluKb6cql2Qh/smWb7IPvow9QO6rQ2UFapw/YxjufrCC2f8KSSnMYKzMMnJI+4JKu5hwNxyOD4+l6U2LthLQqggF6XoNzeAADyKiHxErX2hFv851TWnbs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771431710; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xfAiDqNkrzWnT7mwYeVwSEgNvECd4Q6JW0hgC7t/hpo=; 
	b=jMk6ftF4fmkmeEEKv1SP27JHSbVQw8hlpJr0RJKbkJfjTc31p2a/UIo6B/deNaq7npuCSEbIxcdZ/97Zx8d0E2rUgEvb9JdA8rrcH77KnC5OMzz6sLUila2PUENdorsadytA5sxEpmpbbkQyErdBDufB/GaZcWBu7Nu0W1W8lTQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771431710;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xfAiDqNkrzWnT7mwYeVwSEgNvECd4Q6JW0hgC7t/hpo=;
	b=mbdUvqlrxzjCF0VZgUc2k/lDeHP7kIR43HpqlMIwkb7n1Qzn6dU30PpmObO3wohG
	czcKUI51O/aGKyMxlA414cojKAEZHl0iNXAK2h8M8DYm6/FdfhGIQ+Czwv+TIVhPArA
	v+q17dxLB4kKWimIh0MtSLSMyysaeANoTKxWs49Y=
Message-ID: <9b4e512e-c78f-436a-99ed-08e0371cb886@apertussolutions.com>
Date: Wed, 18 Feb 2026 11:21:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] common/domctl: xsm update for get_domain_state access
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260216215748.20398-1-dpsmith@apertussolutions.com>
 <1a1d8db1-d553-470a-8678-b879385b2fec@suse.com>
 <ff62ece8-a7f3-4490-967c-e9e8283dcd9d@apertussolutions.com>
 <57074bdb-6af9-4cd8-b1da-d348757ca168@suse.com>
 <2ac8e0ec-54ab-4485-b0f4-a49920726d0f@apertussolutions.com>
 <158de6d6-f7ef-453c-9c78-00c4d785bcd1@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 xsJuBFYrueARCACPWL3r2bCSI6TrkIE/aRzj4ksFYPzLkJbWLZGBRlv7HQLvs6i/K4y/b4fs
 JDq5eL4e9BdfdnZm/b+K+Gweyc0Px2poDWwKVTFFRgxKWq9R7McwNnvuZ4nyXJBVn7PTEn/Z
 G7D08iZg94ZsnUdeXfgYdJrqmdiWA6iX9u84ARHUtb0K4r5WpLUMcQ8PVmnv1vVrs/3Wy/Rb
 foxebZNWxgUiSx+d02e3Ad0aEIur1SYXXv71mqKwyi/40CBSHq2jk9eF6zmEhaoFi5+MMMgX
 X0i+fcBkvmT0N88W4yCtHhHQds+RDbTPLGm8NBVJb7R5zbJmuQX7ADBVuNYIU8hx3dF3AQCm
 601w0oZJ0jGOV1vXQgHqZYJGHg5wuImhzhZJCRESIwf+PJxik7TJOgBicko1hUVOxJBZxoe0
 x+/SO6tn+s8wKlR1Yxy8gYN9ZRqV2I83JsWZbBXMG1kLzV0SAfk/wq0PAppA1VzrQ3JqXg7T
 MZ3tFgxvxkYqUP11tO2vrgys+InkZAfjBVMjqXWHokyQPpihUaW0a8mr40w9Qui6DoJj7+Gg
 DtDWDZ7Zcn2hoyrypuht88rUuh1JuGYD434Q6qwQjUDlY+4lgrUxKdMD8R7JJWt38MNlTWvy
 rMVscvZUNc7gxcmnFUn41NPSKqzp4DDRbmf37Iz/fL7i01y7IGFTXaYaF3nEACyIUTr/xxi+
 MD1FVtEtJncZNkRn7WBcVFGKMAf+NEeaeQdGYQ6mGgk++i/vJZxkrC/a9ZXme7BhWRP485U5
 sXpFoGjdpMn4VlC7TFk2qsnJi3yF0pXCKVRy1ukEls8o+4PF2JiKrtkCrWCimB6jxGPIG3lk
 3SuKVS/din3RHz+7Sr1lXWFcGYDENmPd/jTwr1A1FiHrSj+u21hnJEHi8eTa9029F1KRfocp
 ig+k0zUEKmFPDabpanI323O5Tahsy7hwf2WOQwTDLvQ+eqQu40wbb6NocmCNFjtRhNZWGKJS
 b5GrGDGu/No5U6w73adighEuNcCSNBsLyUe48CE0uTO7eAL6Vd+2k28ezi6XY4Y0mgASJslb
 NwW54LzSSM0uRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29t
 PsJ6BBMRCAAiBQJWK7ngAhsjBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBTc6WbYpR8
 KrQ9AP94+xjtFfJ8gj5c7PVx06Zv9rcmFUqQspZ5wSEkvxOuQQEAg6qEsPYegI7iByLVzNEg
 7B7fUG7pqWIfMqFwFghYhQzOwU0EViu54BAIAL6MXXNlrJ5tRUf+KMBtVz1LJQZRt/uxWrCb
 T06nZjnbp2UcceuYNbISOVHGXTzu38r55YzpkEA8eURQf+5hjtvlrOiHxvpD+Z6WcpV6rrMB
 kcAKWiZTQihW2HoGgVB3gwG9dCh+n0X5OzliAMiGK2a5iqnIZi3o0SeW6aME94bSkTkuj6/7
 OmH9KAzK8UnlhfkoMg3tXW8L6/5CGn2VyrjbB/rcrbIR4mCQ+yCUlocuOjFCJhBd10AG1IcX
 OXUa/ux+/OAV9S5mkr5Fh3kQxYCTcTRt8RY7+of9RGBk10txi94dXiU2SjPbassvagvu/hEi
 twNHms8rpkSJIeeq0/cAAwUH/jV3tXpaYubwcL2tkk5ggL9Do+/Yo2WPzXmbp8vDiJPCvSJW
 rz2NrYkd/RoX+42DGqjfu8Y04F9XehN1zZAFmCDUqBMa4tEJ7kOT1FKJTqzNVcgeKNBGcT7q
 27+wsqbAerM4A0X/F/ctjYcKwNtXck1Bmd/T8kiw2IgyeOC+cjyTOSwKJr2gCwZXGi5g+2V8
 NhJ8n72ISPnOh5KCMoAJXmCF+SYaJ6hIIFARmnuessCIGw4ylCRIU/TiXK94soilx5aCqb1z
 ke943EIUts9CmFAHt8cNPYOPRd20pPu4VFNBuT4fv9Ys0iv0XGCEP+sos7/pgJ3gV3pCOric
 p15jV4PCYQQYEQgACQUCViu54AIbDAAKCRBTc6WbYpR8Khu7AP9NJrBUn94C/3PeNbtQlEGZ
 NV46Mx5HF0P27lH3sFpNrwD/dVdZ5PCnHQYBZ287ZxVfVr4Zuxjo5yJbRjT93Hl0vMY=
In-Reply-To: <158de6d6-f7ef-453c-9c78-00c4d785bcd1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,apertussolutions.com:mid,apertussolutions.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:rogersc@ainfosec.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[apertussolutions.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA5A8157AFA
X-Rspamd-Action: no action

On 2/18/26 10:47, Jan Beulich wrote:
> On 18.02.2026 16:32, Daniel P. Smith wrote:
>> On 2/18/26 10:03, Jan Beulich wrote:
>>> On 18.02.2026 15:33, Daniel P. Smith wrote:
>>>> On 2/17/26 04:34, Jan Beulich wrote:
>>>>> On 16.02.2026 22:57, Daniel P. Smith wrote:
>>>>>> --- a/xen/common/domain.c
>>>>>> +++ b/xen/common/domain.c
>>>>>> @@ -210,7 +210,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>>>>>     int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>>                          domid_t *domid)
>>>>>>     {
>>>>>> -    unsigned int dom;
>>>>>> +    unsigned int dom = 0;
>>>>>>         int rc = -ENOENT;
>>>>>>         struct domain *hdl;
>>>>>>     
>>>>>> @@ -219,6 +219,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>>     
>>>>>>         if ( d )
>>>>>>         {
>>>>>> +        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>>>>>> +        if ( rc )
>>>>>> +            return rc;
>>>>>> +
>>>>>>             set_domain_state_info(info, d);
>>>>>>     
>>>>>>             return 0;
>>>>>> @@ -238,10 +242,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>>     
>>>>>>         while ( dom_state_changed )
>>>>>>         {
>>>>>> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
>>>>>> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom);
>>>>>>             if ( dom >= DOMID_FIRST_RESERVED )
>>>>>>                 break;
>>>>>> -        if ( test_and_clear_bit(dom, dom_state_changed) )
>>>>>> +        if ( test_bit(dom, dom_state_changed) )
>>>>>>             {
>>>>>>                 *domid = dom;
>>>>>
>>>>> This is problematic wrt other work (already talked about in the distant past,
>>>>> but sadly only making little progress) towards trying to pull some of the
>>>>> sub-ops out of the domctl-locked region. This subop is one of the prime
>>>>> candidates, yet only if the test_and_clear_bit() remains here.
>>>>
>>>> Okay, but we can't be clearing the bit if the src domain doesn't have
>>>> access. When considering that xsm_domctl() does a no-op check for
>>>> XEN_DOMCTL_get_domain_state, deferring to xsm_get_domain_state(), then
>>>> any domain could invoke the OP with DOMID_INVALID and clear the bit
>>>> before access is checked.
>>>>
>>>> If you want to ensure atomic operations on the bit field, while I am not
>>>> a fan of this, a combination with set_bit() could be done. Let the
>>>> test_and_clear_bit() remain and then if access check fails, use
>>>> set_bit() to put it back. Would that be sufficient for your objective?
>>>
>>> No, that could then confuse a legitimate (for that domain) caller. IOW
>>> you would still build upon the domctl lock serializing things. I think
>>> you want to do the XSM check first, and only then use test_and_clear_bit().
>>
>> Currently, acquiring the struct domain pointer is inside the if
>> condition. This would have to be moved outside the if condition to be
>> able to do the access check before calling the bit operation. Which
>> brings up the question for me, if it is reordered in this fashion, why
>> not use clear_bit(), aiui it should be atomic as well.
> 
> The problem isn't with clear_bit() by itself (yes, it is atomic), but
> with how things want doing here: The test-and-clear ensures data for a
> given domain can only be retrieved exactly once (until the bit would be
> set another time later). With test split from clear, multiple callers
> could get data for the same domain, as in the window between test and
> clear a 2nd caller can come in and also commit to returning data for
> that domain. (Given the restriction on who can invoke this, one might
> conclude no such race is possible, but that single domain could process
> things on multiple vCPU-s, and would then wrongly be notified twice for
> the same domain.)

Thinking further, you are correct the rcu_read_lock will not be enough. 
The test_and_clear call will ensure this thread is the one that read and 
cleared the bit.

>>>>>> @@ -249,6 +253,15 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>>     
>>>>>>                 if ( d )
>>>>>>                 {
>>>>>> +                rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>>>>>> +                if ( rc )
>>>>>> +                {
>>>>>> +                    rcu_unlock_domain(d);
>>>>>> +                    rc = -ENOENT;
>>>>>
>>>>> As you don't otherwise use xsm_get_domain_state()'s return value, the need
>>>>> for this assignment can be eliminated by putting the function call straight
>>>>> in the if(). Then again, to address the remark above, overall code structure
>>>>> will need to change quite a bit anyway (so the remark here may be moot).
>>>>
>>>> I can drop the use of rc here and inline it.
>>>>
>>>>>> +                    dom++;
>>>>>
>>>>> It may be nice to eliminate the need to have this in two places (here and ...
>>>>>
>>>>>> +                    continue;
>>>>>> +                }
>>>>>> +
>>>>>>                     set_domain_state_info(info, d);
>>>>>>     
>>>>>>                     rcu_unlock_domain(d);
>>>>>> @@ -256,10 +269,13 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>>>                 else
>>>>>>                     memset(info, 0, sizeof(*info));
>>>>>>     
>>>>>> +            clear_bit(dom, dom_state_changed);
>>>>>>                 rc = 0;
>>>>>>     
>>>>>>                 break;
>>>>>>             }
>>>>>> +
>>>>>> +        dom++;
>>>>>>         }
>>>>>
>>>>> ... here), by having the variable's initializer be -1 and then using dom + 1
>>>>> in the find_next_bit() invocation.
>>>>
>>>> If you want this way, then there are two options, make dom no longer
>>>> unsigned or be willing to allow unsigned int overflow. If we go with the
>>>> former, If you agree, I would leave it as an int as that should cover
>>>> the range of valid domids.
>>>
>>> I wouldn't outright nak use of plain int, but I'm putting in effort to remove
>>> such undue uses of that type. Unsigned overflow is well-defined aiui, so I
>>> see no reason why the variable can't remain "unsigned int".
>>
>> Honestly, I'm not sure why it was not domid_t in the first place. I
>> can't keep all the rules, but I thought MISRA frowned on overflow usages
>> (abuse?) like this. If you will ack it with it as a uint or as a
>> domid_t, then I have no issue doing it this way.
> 
> A patch without changing the type I would ack. A switch to domid_t, if indeed
> correct (I simply didn't go check yet), likely would want to be a separate
> change.

Then I will leave it uint and init it to -1.

v/r,
dps


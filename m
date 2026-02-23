Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD7yOUSlnGkYJwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 20:06:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0417BFFC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 20:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239348.1540780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vubGD-0005au-8r; Mon, 23 Feb 2026 19:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239348.1540780; Mon, 23 Feb 2026 19:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vubGD-0005Xn-5L; Mon, 23 Feb 2026 19:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1239348;
 Mon, 23 Feb 2026 19:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AVG6=A3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vubGB-0005Xh-9w
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 19:06:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc18753b-10ea-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 20:06:20 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1771873570518818.0693383257893;
 Mon, 23 Feb 2026 11:06:10 -0800 (PST)
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
X-Inumbo-ID: bc18753b-10ea-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1771873572; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E2rqNKuo9tSP8cf2aF7BPj2m7f4i+KdP+rTrc+mWxAO/PD1hKDOB1tLbS4EUjK7CTBqApIrMS8f4MVmsg/Kh9Q+RW8AKDuUIZ9zvwM1tDAQmnnZQrEX+xHHSizR0+QnGnal8n7LWAqhMxX5KZUjL6ouPh2w+LNTp+lzJQ697G4o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771873572; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k8MYDNYCfZAeLkeED8Y20w4FpWY+mPctCe9JrfHHJ+g=; 
	b=crb2tdft9QOUaiqmcvjePInv2Am7h+MGaFWCF9qvP17puWEFkmq1VITLBtGEv8BQnmgGBEHJc/fwIQfbApwzWeYv0iPDI3tCJaRx3kug/o4hK/doHdJ2mnO2M0PuN8JQdtRjBI4G0CTRftOyCMCDckojygGgs1ejCbDYogL5KVY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771873572;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=k8MYDNYCfZAeLkeED8Y20w4FpWY+mPctCe9JrfHHJ+g=;
	b=Au61OqPphyVLUF7NrdwYvRKtQL8c+G6GfnxUUOrGZeGiuuOg6TBpfMBsgiak7oMw
	JBrbhjtOwJ6rmgnX85br3DYNSUBMzhrpyB68lwC3igkXOANYTRVRP97dMjwbwsL1aWY
	lVF6VlLp0DA+Ud9hT05EWJcal1D0QcPil2lDWbi8=
Message-ID: <4dfa33e9-e80b-4660-b5ae-bcb11517d506@apertussolutions.com>
Date: Mon, 23 Feb 2026 14:06:08 -0500
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
 <e402ca27-75ca-4046-8e30-305c1c8d3db8@apertussolutions.com>
 <082425f5-2d05-4db5-b2a5-d8a621302f9b@amd.com>
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
In-Reply-To: <082425f5-2d05-4db5-b2a5-d8a621302f9b@amd.com>
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
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[apertussolutions.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53A0417BFFC
X-Rspamd-Action: no action

On 2/23/26 13:01, Jason Andryuk wrote:
> On 2026-02-19 07:15, Daniel P. Smith wrote:
>> On 2/18/26 18:04, Jason Andryuk wrote:
> 
>>>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>>>> index 29a7726d32d0..2eedc639c72a 100644
>>>> --- a/xen/common/domctl.c
>>>> +++ b/xen/common/domctl.c
>>>> @@ -860,12 +860,9 @@ long 
>>>> do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>           break;
>>>>       case XEN_DOMCTL_get_domain_state:
>>>> -        ret = xsm_get_domain_state(XSM_XS_PRIV, d);
>>>
>>> With the initial NULL deref issue, I wondered if this wouldn't be 
>>> better off modified to drop the d param - 
>>> xsm_get_domain_state(XSM_XS_PRIV) - and changing flask permissions like:
>>> allow dom0_t xen_t:xen get_domain_state;
>>>
>>> That would gate the external call, and individual domain permissions 
>>> could be checked with xsm_getdomaininfo(), or a new hook if you don't 
>>> want to re-use.
>>>
>>> But as your approach avoids passing NULL, it seems okay to me.  It 
>>> also doesn't change the flask policy, which is nice.
>>
>> That's a plain nack from me. Whether it is viewed as a pipe dream or 
>> not, my goal continues to be to work towards enabling the ability to 
>> have a truly disaggregated platform. In the original architecture, it 
>> was envisioned to have multiple toolstack domains, each responsible 
>> for a distinct set of domains. In terms of implementation, that would 
>> mean multiple xenstored instances, each with a purview over a subset 
>> of domains.
> 
> I don't think what I wrote is at odds with your pipe dream.
> 
> My main concern is passing NULL as a domain.  I think that is wrong, 
> beyond the fault seen on ARM.  In domain_target_sid(), I think the NULL 
> dst was mistakenly matched to dom0's NULL src->target.  src->target_sid 
> is 0 from zalloc, which is not otherwise initialized and invalid.  That 
> is returned.  Later when sidtab_search() can't find it, it is remapped 
> to SECINITSID_UNLABELED and returned.  That silent remapping is dubious, 
> and it points toward unlabled_t should never be allowed in any rule. 
> Maybe it should remap unknown sids to a dedicated invalid_t, but maybe 
> invalid_t is already supposed to be that?

Understand, which in my initial approach I considered instead of setting 
the d to NULL for DOMID_INVALID, I was considered changing it to 
dom_xen. This effectively says you must have permission to wildcard 
query xen for domain states. I opted not to include it as I was able to 
rework it so that NULL was never used for xsm_get_domain_state().

Your last statement is correct, unlabeled_t literally means it is an 
unknown object. Therefore, writing any rules for unlabeled_t is dubious 
at a minimum, but more likely an invalid security statements. The 
suggestion to write the rule was not meant to be the solution, it was 
just a means to help allow people to boot their systems for the time being.

v/r,
dps



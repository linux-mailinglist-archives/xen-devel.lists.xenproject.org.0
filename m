Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yeKIKuPzKmrazwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 19:44:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112296741C3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 19:44:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=AVAdDa6q;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335981.1598054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXjRJ-0003Ht-S2; Thu, 11 Jun 2026 17:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335981.1598054; Thu, 11 Jun 2026 17:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXjRJ-0003FK-PB; Thu, 11 Jun 2026 17:43:37 +0000
Received: by outflank-mailman (input) for mailman id 1335981;
 Thu, 11 Jun 2026 17:43:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wXjRI-0003FE-09
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:43:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXjRH-007KOt-8R
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 19:43:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2af3ab-bab6-0a2a0a5309dd-0a2a4506db06-28
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 19:43:34 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2af3c4-7371-0a2a45060019-888fbc335298-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 19:43:34 +0200
Received: by mx.zohomail.com with SMTPS id 1781199800923362.86722773555596;
 Thu, 11 Jun 2026 10:43:20 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781199802; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WRBvkp/DPqWN0FSSYBL9JVTErMUrsAgxMxalE//wzexb6axo0Zl3ISZABWzDbyPWcyL/bP5m1fzTl1Vfiwj7U73KI8xZp2xvWAgDJwM+P2YPfxqpBYrzMJJyrs/JPi81JYntB1jUpgJAM/uKnmPRUYJwjc2PxA+QMYXJq+tKWrY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781199802; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NTufMvdvnTyc8lYUTSyjtj8b9aJg0FrAAmDWS26I/u8=; 
	b=IrUKuNIyKA12tj6E/ZKdMMNZydFzaptHt4Mx0m0MJmzrxtkJPMfDhEV0NDOGHhGyfp3/QkqW+oNyBgSafkF1Qv6fr9w0Sjbusyd5AvqjAmSD8gF1kPHwD4aKGxoQSm6ZjJbuFuSFR33RD0+tl03biSNgN9q3MzCEzcoAqEDsk8o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781199802;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NTufMvdvnTyc8lYUTSyjtj8b9aJg0FrAAmDWS26I/u8=;
	b=AVAdDa6q6ZGobiQ/v2cK6VbRvacShELIJUJrII972z/gZCSUK7yUzry4yPzVTCBA
	V0Lccp1mLvMEjarU0yfOBepkHK3kaTv+0N2p/nrhi9NhJ5MrBKZVlFKCXT576WLBQY0
	gMgnKCVn5XLHk8Ko0bFGOtw0picKk0eBfSKaWOBk=
Message-ID: <f7b16f43-f3c2-449e-8c09-b65e2cadca85@apertussolutions.com>
Date: Thu, 11 Jun 2026 13:43:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused log
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin <dmukhin@ford.com>, xen-devel <xen-devel@lists.xenproject.org>,
 "andrew.cooper3" <andrew.cooper3@citrix.com>,
 "anthony.perard" <anthony.perard@vates.tech>, julien <julien@xen.org>,
 "michal.orzel" <michal.orzel@amd.com>, "roger.pau" <roger.pau@citrix.com>,
 sstabellini <sstabellini@kernel.org>,
 "christopher.w.clark" <christopher.w.clark@gmail.com>,
 Mykola Kvach <mykola_kvach@epam.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-2-dmukhin@ford.com>
 <ae19de19-aef5-47af-833d-87a46efb9afc@apertussolutions.com>
 <c51ecc59-7252-4d1f-a192-717ae55dacd5@amd.com>
 <19eac3f10c4.4656d1b3334797.1477306808945740845@apertussolutions.com>
 <d5e26c5f-31cb-42e3-9a91-ee42674cf184@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d5e26c5f-31cb-42e3-9a91-ee42674cf184@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-16d1c6/1781199814-8596CD75-BC2A68AB/0/0
X-purgate-type: clean
X-purgate-size: 4263
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,amd.com:email];
	DMARC_NA(0.00)[apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:mykola_kvach@epam.com,m:jason.andryuk@amd.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ford.com,lists.xenproject.org,citrix.com,vates.tech,xen.org,amd.com,kernel.org,gmail.com,epam.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 112296741C3

On 6/11/26 11:26 AM, Jan Beulich wrote:
> On 09.06.2026 13:57, Daniel Smith wrote:
>> From: Jason Andryuk <jason.andryuk@amd.com>
>> Date: Mon, 08 Jun 2026 19:16:01 -0400
>>   > On 2026-06-08 15:54, Daniel P. Smith wrote:
>>   > > On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
>>   > >> --- a/xen/common/argo.c
>>   > >> +++ b/xen/common/argo.c
>>   > >> @@ -2034,10 +2034,9 @@ sendv(struct domain *src_d, xen_argo_addr_t
>>   > >> *src_addr,
>>   > >>                                           src_id.domain_id);
>>   > >>       if ( !ring_info )
>>   > >>       {
>>   > >> -        gprintk(XENLOG_ERR,
>>   > >> -                "argo: vm%u connection refused, src (vm%u:%x) dst
>>   > >> (vm%u:%x)\n",
>>   > >> -                current->domain->domain_id, src_id.domain_id,
>>   > >> src_id.aport,
>>   > >> -                dst_addr->domain_id, dst_addr->aport);
>>   > >> +        argo_dprintk("vm%u connection refused, src (vm%u:%x) dst
>>   > >> (vm%u:%x)\n",
>>   > >> +                     current->domain->domain_id, src_id.domain_id,
>>   > >> src_id.aport,
>>   > >> +                     dst_addr->domain_id, dst_addr->aport);
>>   > >>           ret = -ECONNREFUSED;
>>   > >>       }
>>   > >
>>   > > My apologies but this is not the wisest approach, hitting this is a real
>>   > > error and shouldn't be getting silenced.
>>   >
>>   > -ECONNREFUSED is still returned, and that is the important part, I think?
>>   >
>>
>> Absolutely not. Argo at its essence is a security protocol where you want to minimize the amount of implicit trust we have to have with the endpoint. Telling a bad actor he did a bad action tells you nothing. The send operation is the critical security path and you must have an auditable record that an endpoint misbehaved. If yo want to implicitly trust your end point after passing the accees check, then you can just use grants.
> 
> Yet then - is potentially spamming the log an appropriate model? Furthermore
> gprintk()-s are, by default, rate-limited in release builds, and hence there
> isn't going to reliably be an "auditable record" anyway. If you want logging
> for auditing purposes, I think you'll need to add separate logging (not to
> the system console).

I must strongly object to the characterization of this logging as 
"spamming the log." The mechanism is functioning exactly as designed.

Argo uses rate-limited logging to report attempts to write to a ring 
that does not exist. Argo also exposes explicit interfaces for a domain 
to determine whether a ring is available and whether access has been 
granted. When software attempts an operation without first verifying 
these preconditions through the provided mechanisms, the resulting log 
message is both expected and necessary. It is not the role of the 
logging interface to remain silent in the face of incorrect usage.

Blaming the interface for correctly surfacing misuse, rather than 
addressing the software that fails to use the capability properly, 
inverts the proper assignment of responsibility. Logging exists to make 
such problems visible; suppressing it does not solve the underlying 
issue.This is especially true in this case, where failed attempts to 
send to a ring is of security relevance.

Consider the direct parallel: a domain is started with the expectation 
that a peer domain will establish a grant mapping for predetermined 
grant reference, instead of coordinating through xenstore. If the first 
domain attempts the mapping without performing or waiting for the proper 
xenstore coordination, the system will correctly log the invalid grant 
reference[1]. The appropriate response in that case is to correct the 
lack of coordination in the domain's startup sequence, not to disable 
the log message that reveals the misuse. The same principle applies here.

Proposals to remove or disable this logging in response to observed 
misuse should be rejected on principle. The correct course of action is 
to ensure that calling code uses the established discovery and 
access-control interfaces before attempting operations on rings.

[1] 
https://elixir.bootlin.com/xen/v4.21.1/source/xen/common/grant_table.c#L1071

V/r,
Daniel P. Smith


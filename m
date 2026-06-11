Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kyb7G0LFKmqGwgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:25:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2617672B2C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:25:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b="YZu/AMSs";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335666.1597846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgL2-0005Bd-8Y; Thu, 11 Jun 2026 14:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335666.1597846; Thu, 11 Jun 2026 14:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgL2-00059M-5N; Thu, 11 Jun 2026 14:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1335666;
 Thu, 11 Jun 2026 14:24:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wXgL0-000594-19
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:24:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgKz-006oCD-7Y
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:24:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2ac527-5cb7-0a2a0a5109dd-0a2a45048a8e-28
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:24:52 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2ac532-1dec-0a2a45040019-888fbc335278-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:24:52 +0200
Received: by mx.zohomail.com with SMTPS id 178118788136187.22204318317074;
 Thu, 11 Jun 2026 07:24:41 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781187884; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DYWNnJ+i7+8AyBerhU8SnQ0H5uzqqi3vmJWjGkZlV8OQ2FtWnSEPtk47xnWzoft8nQ77isB5ybmI+Qj7r0H/Mto9ByFnfcKzO23HaxZ3BEUeLfC+5suJziztRselaOjR+7plYuMLSpZJscIiIMrasK2OH4H79V+JPpWcauurDF0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781187884; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hb7eJla8sBDts27YuSATiqA9EwenDS4luGbIZd+phLA=; 
	b=RF4NRH0bi9m074fKXXCd7hXwUbuQFeir6q7ADGtyNrN4vWlLf1qqlkDLMA9AcNpl2DpovJFstFKsyWFDiDCJNA4j4byEm5g9qBp6Z5Csv8j2xhs7EnM3SW3goBRNjtIHhZRNzeSHlSwdiAsyYI0b/tvfMbMZgRYL6yASmdd+38s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781187884;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Hb7eJla8sBDts27YuSATiqA9EwenDS4luGbIZd+phLA=;
	b=YZu/AMSsIa6dM2jbYnzG+A21eTiuNh7/rMDNMjuv0kCUmot5+rFDi9aSR1K4Sb7x
	MmTNJjvd3rkDZRXjY6olCz+BbXwqeyZLbF6FCTf5c0HYTSi5aEHkkMq6mpkY9sX8Di1
	RnKSoPU6fp2pNivm2N2IyMDvgm/k85DXG67656K8=
Message-ID: <a73d8e52-d5d5-4d9b-a860-15e6d5aff020@apertussolutions.com>
Date: Thu, 11 Jun 2026 10:24:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] domctl: Handle some of XEN_DOMCTL_shadow_op
 without the domctl lock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-3-ross.lagerwall@citrix.com>
 <987f029b-02c0-423c-88fc-2e588f03a5bf@apertussolutions.com>
 <airESvOliZS6tSch@macbook.local>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <airESvOliZS6tSch@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ebf023/1781187892-40D743FF-1AA8229E/0/0
X-purgate-type: clean
X-purgate-size: 4196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,apertussolutions.com:dkim,apertussolutions.com:email,apertussolutions.com:mid,apertussolutions.com:from_mime];
	DMARC_NA(0.00)[apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2617672B2C



On 6/11/26 10:20 AM, Roger Pau Monné wrote:
> On Thu, Jun 11, 2026 at 09:18:15AM -0400, Daniel P. Smith wrote:
>> On 6/9/26 11:15 AM, Ross Lagerwall wrote:
>>> Handle XEN_DOMCTL_SHADOW_OP_{CLEAN,PEEK} without taking the domctl lock.
>>> This is safe because for these subops, the paging lock is mostly held
>>> which prevents it from operating concurrently on the same domain. There
>>> are some parts that are called without the paging lock held:
>>>
>>> * hvm_mapped_guest_frames_mark_dirty() - The function itself takes a
>>>     spinlock so is protected from concurrent calls. In any case, it will
>>>     mark all the pages dirty as required.
>>>
>>> * domain_pause() - The toolstack cannot unpause the domain while in
>>>     paging_log_dirty_op() because the toolstack's pause/unpause ops have
>>>     a separate ref count.
>>>
>>> * p2m_flush_hardware_cached_dirty() - This is called elsewhere without
>>>     the domctl lock held so holding it wouldn't achieve anything. It
>>>     should be fine as long as it is called at least once.
>>>
>>> * log_dirty.ops->clean() - If the callback is hap_clean_dirty_bitmap(),
>>>     then it will hold the p2m lock while modifying the table. If the
>>>     callback is sh_clean_dirty_bitmap(), it will hold the paging lock
>>>     while modifying the table. In both cases, this is OK.
>>>
>>> * domain_unpause() - Same as the earlier domain_pause().
>>
>> Please add a comment that that xsm check is to continue protecting the
>> sub-ops with XS_PRIV.
>>
>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> ---
>>>    xen/arch/x86/mm/paging.c |  8 ++++++--
>>>    xen/common/domctl.c      | 12 ++++++++++++
>>>    2 files changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
>>> index 1a5822808620..bfb5b423a0dd 100644
>>> --- a/xen/arch/x86/mm/paging.c
>>> +++ b/xen/arch/x86/mm/paging.c
>>> @@ -746,11 +746,15 @@ long do_paging_domctl_cont(
>>>        ret = xsm_domctl(XSM_OTHER, d, &op);
>>>        if ( !ret )
>>>        {
>>> -        if ( domctl_lock_acquire() )
>>> +        bool lock = !(op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
>>> +                      op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK);
>>> +
>>> +        if ( !lock || domctl_lock_acquire() )
>>>            {
>>>                ret = paging_domctl(d, &op.u.shadow_op, u_domctl, 1);
>>> -            domctl_lock_release();
>>> +            if ( lock )
>>> +                domctl_lock_release();
>>>            }
>>>            else
>>>                ret = -ERESTART;
>>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>>> index 35144d95b808..a3888c4e87d4 100644
>>> --- a/xen/common/domctl.c
>>> +++ b/xen/common/domctl.c
>>> @@ -559,6 +559,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>            ret = arch_do_domctl(op, d, u_domctl);
>>>            goto domctl_out_unlock_domonly;
>>> +    case XEN_DOMCTL_shadow_op:
>>> +        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
>>> +             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )
>>> +        {
>>> +            ret = xsm_domctl(XSM_OTHER, d, op);
>>> +            if ( ret )
>>> +                goto domctl_out_unlock_domonly;
>>> +
>>> +            ret = arch_do_domctl(op, d, u_domctl);
>>> +            goto domctl_out_unlock_domonly;
>>> +        }
>>> +        fallthrough;
>>>        default:
>>>            /* Everything else handled further down. */
>>>            break;
>>
>> After commit message change,
>>
>> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Sorry, this was already picked up in a rush to get it into 4.22 and I
> didn't realize it was missing an XSM maintainer Ack.  That's entirely
> my fault, there was no intention to bypass or overrule your opinion.

I fully understand and take no offense.


> Given it's already committed, and there are no objections aside from
> the commit message adjustment my preference would be to leave it
> alone.

Hmm, I saw patch 1 but not patch 2. Sorry for the extra noise.

v/r,
dps


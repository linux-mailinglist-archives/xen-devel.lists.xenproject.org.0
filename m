Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6z1QKsdVNWpBtQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 16:44:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2172E6A6798
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 16:44:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b="Pi4fqx/A";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1342432.1602614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waaS3-0001fQ-5w; Fri, 19 Jun 2026 14:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342432.1602614; Fri, 19 Jun 2026 14:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waaS3-0001cg-2O; Fri, 19 Jun 2026 14:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1342432;
 Fri, 19 Jun 2026 14:44:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1waaS1-0001cX-VA
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 14:44:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1waaS1-00HNfb-1V;
 Fri, 19 Jun 2026 14:44:09 +0000
Received: from [2a02:8012:3a1:0:fccc:84a8:79ae:61b9]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1waaS0-001bTP-2D;
 Fri, 19 Jun 2026 14:44:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=P17qoFPHA8Y/ljv8TsgDjsry64rFtuZAWeC1LLRVyYQ=; b=Pi4fqx/AsFYf4k3hVILIuBFc0a
	yO9o49uWyeyIz8tO1agMewUrRrf0solYHwhxhl56cTY52CvQoBDdajJnSJyUUCQcJzJ484KgeLpm8
	DuXgLgJYsDdYKpUTRrhaAfaOOJbtwn/sSV/EFgrMghjVVdSLr6WWli++VbRb/3Y2p13g=;
Message-ID: <4be1705f-02ef-4e04-932b-736421464a4f@xen.org>
Date: Fri, 19 Jun 2026 15:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation
 until after ITS init
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Orzel, Michal" <michal.orzel@amd.com>, Mykola Kvach
 <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Mykola Kvach
 <xakep.amatop@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
 <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com>
 <e43afc29-cfbb-4978-9324-e8d540040bfa@amd.com>
 <1877ea55-0c8d-4593-a310-259b4c5aef3c@xen.org>
 <b47b9bf3-1aa6-41b6-8c7c-48d64cca1c36@amd.com>
 <5d3dff74-f51d-4bfc-b917-3c84f2094f34@xen.org>
 <6f154afa-38b0-4193-be42-585f4ce72fc8@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6f154afa-38b0-4193-be42-585f4ce72fc8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:michal.orzel@amd.com,m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:xakep.amatop@gmail.com,m:oleksandr_tyshchenko@epam.com,m:oleksiikurochko@gmail.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,xen.org:dkim,xen.org:mid,xen.org:from_mime];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,epam.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,epam.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2172E6A6798



On 19/06/2026 14:17, Oleksii Kurochko wrote:
> 
> 
> On 6/19/26 1:52 PM, Julien Grall wrote:
>>
>>
>> On 19/06/2026 12:34, Orzel, Michal wrote:
>>>
>>>
>>> On 19-Jun-26 13:23, Julien Grall wrote:
>>>> Hi Michal,
>>>>
>>>> On 19/06/2026 10:48, Orzel, Michal wrote:
>>>>> @Oleksii, can we ask for a release ack here?
>>>>
>>>> Can you explain the pros/cons of introducing this patch quite late?
>>> The advantage is that it fixes the broken LPIs on affected hardware.
>>
>>  > The disadvantage is the reordering risk but I don't think there is 
>> any issue.
>>
>> See more below.
>>>>
>>>> One of the risk here is that we are now initializing the LPIs *after*
>>>> the ITSes. I understand this is because we want to know the workaround.
>>>> However, I vaguely recall that there was a dependency in the
>>>> configuration. So are we confident the new ordering will not bring 
>>>> other
>>>> issues? Ideally this should have been explained in the commit message.
>>> gic-v3-its.c never references host LPI state, so ITS init has no 
>>> dependency on LPIs.
>>
>> My concern is at the HW level. The ITS is using LPIs. But we will 
>> configure the ITS first and then the LPIs.
>>
>> What probaly saves us is the fact gicv3_lpi_init_host_lpis() only seem 
>> to allocate memory. This is a bit fragile though.
> 
> Julien, do you think that a fix should be done differently and this one 
> isn't really acceptable?

The code is alright for 4.22 so long the ordering impact is clarified in 
the commit message.

But for the next release, I think it would be good to move the LPI init 
call in the ITS initialization so we can have the following steps:
  1. Query the workaround
  2. Initialize LPIs
  2. Initialize the ITSes

Cheers,

-- 
Julien Grall



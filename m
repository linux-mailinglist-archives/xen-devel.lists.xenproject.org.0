Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RHNsNBKQKWqPZgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 18:25:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78F66B72B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 18:25:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=nTU5yekw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1334575.1597546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXLjb-0004T2-9Q; Wed, 10 Jun 2026 16:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334575.1597546; Wed, 10 Jun 2026 16:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXLjb-0004QH-5i; Wed, 10 Jun 2026 16:24:55 +0000
Received: by outflank-mailman (input) for mailman id 1334575;
 Wed, 10 Jun 2026 16:24:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wXLjZ-0004QB-Bc
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 16:24:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wXLjZ-003Izl-0T;
 Wed, 10 Jun 2026 16:24:52 +0000
Received: from [2a02:8012:3a1:0:187b:85f9:f7d:a6e9]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wXLjY-006be7-1C;
 Wed, 10 Jun 2026 16:24:52 +0000
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
	bh=MLfufS7vnJdcPtGUWss2ymmmIB5z1a5HUldodTCEOQc=; b=nTU5yekw+S6Uofujd7twxOfjWY
	p9+6MGBWQUD7F5jArthA4mjTr+fpxnPeDTYgiwXvnVPnBZoAP4F5a9CoQMR/hj3+LfGTK1KKynPan
	4QDNSE0kd7Gb1MCWGa642yFIMAGcCOFQSEze0dVLvBBfqpM1aAXfcA1CP+5rqhQ+fjew=;
Message-ID: <bd0588e3-2824-4c2a-a1cc-6ff62fed7f62@xen.org>
Date: Wed, 10 Jun 2026 17:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
 <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
 <cd2c76a2-7a13-4bbf-9c29-5dcf3ae06fc0@xen.org>
 <4c96c478-aeb5-443c-a6ca-f23caf7d5430@epam.com>
 <e489f44e-ef61-425c-bd0e-0a992c32f7cf@xen.org>
 <f258e2e5-f7ba-4183-8b33-c3a169dc1d7c@epam.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <f258e2e5-f7ba-4183-8b33-c3a169dc1d7c@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid,xen.org:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C78F66B72B



On 08/06/2026 10:25, Milan Djokic wrote:
> Hi Julien,

Hi Milan,
> On 5/24/26 13:00, Julien Grall wrote:
>> Hi Milan,
>>
>> On 28/04/2026 11:16, Milan Djokic wrote:
>>>>> The original idea was to also allow stage-1-only support. But I'm not
>>>>> sure if stage-1-only usecase is useful or even valid for Xen.. I will
>>>>> update the patch series with the missing parts for stage-1-only 
>>>>> support,
>>>>> pointed out by Luca, but the question remains if this is needed at 
>>>>> all.
>>>>> If not, I can revert to original state where stage-2 was always
>>>>> required.
>>>>
>>>> By "stage-1 only" support, do you mean Xen would use the stage-1 in
>>>> replacement of the stage-2? Or do you mean the guest will use the
>>>> stage-1 page-table and there will be no isolation from Xen?
>>>>
>>>> If the former, then I believe the page tables don't have the exact same
>>>> format. Today, the page-tables are shared between the CPU and IOMMU, so
>>>> this would need to be duplicated. For now, I am not sure this is worth
>>>> to do.
>>>>
>>>> If the latter, this would require the guest to be directly mapped (i.e.
>>>> IPA == PA) but it would also open a big hole. So I would want to
>>>> understand the exact use case first.
>>>>
>>>
>>> The latter. In this case, the guest would configure stage-1 while
>>> stage-2 translation is not used, so there is no additional isolation
>>> enforced by Xen. This would only be intended for specific usecases with
>>> trusted domains. But yes, this opens a significant hole if used with
>>> untrusted guests. If there is no strong usecase, we could restrict the
>>> implementation to always require stage-2.
>>
>> It is still unclear what would be the exact use-case. Is it a system
>> where the SMMU doesn't support stage-2? Performance reason?
>>
> 
> This primarily targets systems where the SMMU does not support Stage-2 
> translation.
> If we decide to keep this code, I will address the associated security 
> considerations and document the corresponding AoU in the design. 
> Otherwise, we can fall back to supporting only the "nested" translation 
> case.

Thanks for the feedback. I think for such setup, I would consider 
whether we can use the stage-1 in Xen to protect the device. AFAIK, this 
what Linux will do.

I would be interested to hear what the other maintainers think.

Cheers,

-- 
Julien Grall



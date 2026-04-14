Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Aq1JpWi3mkeGwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E73FE565
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282087.1564786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJT-00065Q-QA; Tue, 14 Apr 2026 20:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282087.1564786; Tue, 14 Apr 2026 20:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJT-00063D-MC; Tue, 14 Apr 2026 20:24:47 +0000
Received: by outflank-mailman (input) for mailman id 1282087;
 Tue, 14 Apr 2026 20:24:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCkJS-0005oE-5y
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:24:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJM-001nTQ-1v;
 Tue, 14 Apr 2026 20:24:40 +0000
Received: from [2a02:8012:3a1:0:6452:fdce:8dbd:9a39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJM-0036wi-1G;
 Tue, 14 Apr 2026 20:24:40 +0000
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
	bh=hM9fqT/J7mb5lZTQsjxgjpy1ycoQF+7u90mM95CalWM=; b=Dm8u9zuf+yTX0fLInCjfU/PmV2
	DqZjhx7HaqZmEJBzDsqTredSOH9YuXb9UOuAyQRViXz6wUbLiBanG6nc5zSQMvN8TZ9nZE0Ha2SK6
	Rfulx3dPGtjWGTZfd/GD4+d6twJM02AXsbULOg07kJPVDCoLqYBus/IJnx4tXzk8rmPM=;
Message-ID: <75f9ccb1-e7e8-419c-9359-7779c5662a02@xen.org>
Date: Tue, 14 Apr 2026 15:26:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/27] xen/riscv: Implement construct_domain()
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <3a86599284108e6f2a27488a03145f8dd1b71def.1773157782.git.oleksii.kurochko@gmail.com>
 <cd1fa52a-0ff2-4b7f-9b0b-c33b6a01b6c8@suse.com>
 <95fc62d9-cfd4-4b75-a9b0-7e90c9ba1095@gmail.com>
 <c3e20570-6dbf-4dd9-86de-d334e0f71f3a@suse.com>
 <2926ad08-39c8-4559-bb40-7231c69d9a65@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2926ad08-39c8-4559-bb40-7231c69d9a65@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,kernel.org,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 954E73FE565
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 09/04/2026 22:39, Oleksii Kurochko wrote:
>>>>> +    BUG_ON(v->is_initialised);
>>>>> +
>>>>> +    kernel_load(kinfo);
>>>>> +    initrd_load(kinfo, copy_to_guest_phys);
>>>>> +    dtb_load(kinfo, copy_to_guest_phys);
>>>> These all return void, despite this also being used for non-Dom0. Is it
>>>> really fatal to a dom0less system if one out of many domains fail to be
>>>> built?
>>> For a dom0less system, my opinion is that it should not be fatal, it
>>> should simply ignore a domain that fails to build and continue with the
>>> rest. However, with the current common dom0less code it will just
>>> panic(). This is a behavior I would like to change and it is on my TODO
>>> list.
>>>
>>> Regarding the functions returning void, this is because all of them
>>> currently call panic() on failure, which I expect will need to change in
>>> order to ignore a domain that fails to build in dom0less mode.
>>>
>>> For the current implementation of the common dom0less code this is fine,
>>> but I agree it should be addressed in a separate patch series.
>>>
>>>    Especially when, despite the name, there is a Dom0?
>>>
>>> For this case, a failure there should indeed be fatal, so panic() is
>>> appropriate.
>> I think you misunderstood. I wasn't referring to the building of Dom0
>> failing. Was rather emphasizing that when there is a Dom0, failure to
>> create a DomU likely should even less so be fatal, as Dom0 could later
>> rectify the situation.
> 
> Oh, okay, then it is really less fatal if DomU creation will fail in the 
> case of Dom0.

I am not sure I agree with this statement. The goal of dom0less is to 
not have a dom0 at all. So there is no way to rectify after the fact.

At least on Arm, we took the stance that boot failures are fatal because 
this is a clear signal that something went wrong. It may be more 
difficult to notice if you continue to boot.

Cheers,

-- 
Julien Grall



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB7D525EB9
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 11:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328327.551332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npRgb-0002tQ-5W; Fri, 13 May 2022 09:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328327.551332; Fri, 13 May 2022 09:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npRgb-0002qh-2A; Fri, 13 May 2022 09:34:13 +0000
Received: by outflank-mailman (input) for mailman id 328327;
 Fri, 13 May 2022 09:34:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npRgZ-0002qb-2p
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 09:34:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npRgY-0004Ol-9K; Fri, 13 May 2022 09:34:10 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.8.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npRgY-0002Vr-2b; Fri, 13 May 2022 09:34:10 +0000
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
	bh=I2i8LsrfMGeHrJpYk4FSI8SKulkmmDrNdryLjoJEWjY=; b=tYrHC7UwUg6QVPlNOGNWIe3Su6
	snNA39IokHAMx251/YEebQjvZyoWKypMkMJeS6WYoEo1hFYHJgCI7vNgXD4eFI9pxctiZl8o7zWyc
	Wi0MKGMBUSgItbT6bHMlqnE6EmS8QUbgEVo/F8kOpPw8NGBISfLhtr5paVNma+gwBaCw=;
Message-ID: <990efb92-e3b7-9487-2039-cf93ea1011af@xen.org>
Date: Fri, 13 May 2022 10:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 6/7] tools: add example application to initialize
 dom0less PV drivers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-6-sstabellini@kernel.org>
 <fb9aefed-ef4b-c26e-9ff0-1eb59e7d215c@xen.org>
 <alpine.DEB.2.22.394.2205121806210.3842@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2205121806210.3842@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/05/2022 02:09, Stefano Stabellini wrote:
> On Wed, 11 May 2022, Julien Grall wrote:
>>> +    rc = xs_introduce_domain(xsh, info->domid,
>>> +            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
>>> +            xenstore_evtchn);
>>
>> I might be missing something here. In an ealier version, I pointed out that
>> xs_introduce_domain() would fail in the case the dom0less domain doesn't have
>> "xen,enhanced".
>>
>> AFAICT, you agreed that the (part?) of initialization should be skipped. But I
>> don't see the change in the code. Regarding the placement, we could either
>> fully skip init_domain() or just xs_introduce_domain(). The latter might be
>> better so all the domains are listed using xenstore-ls.
>>
>> So something like below should work:
>>
>> if ( xenstore_evtchn )
>> {
>>      rc = xs_introduce...();
>>      ...
>> }
> 
> Yes, good point. xenstore_evtchn could be zero validly (first evtchn is
> zero),

Event channel 0 is always reserved when initialization the event channel 
subsystem (evtchn_init()):

evtchn_from_port(d, 0)->state = ECS_RESERVED;

> so instead I'll check on xenstore_pfn to be zero (xenstore_pfn is
> 0 for non-enhanced domUs.)

I spotted that difference but decided to not comment on it as Linux is 
already considering the values 0 and ~0 as invalid. However, I am not in 
favor on any code to rely on 0 means Xenstore will never be available 
while ~0 means that it might be available.

Anyway, as I wrote above, the event channel 0 is always reserved. So you 
can safely use this value to detect whether we allocated the event 
channel for Xenstore.

Cheers,

-- 
Julien Grall


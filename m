Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CFA46771F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237533.411967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7R0-0008Rz-Id; Fri, 03 Dec 2021 12:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237533.411967; Fri, 03 Dec 2021 12:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7R0-0008PV-Et; Fri, 03 Dec 2021 12:13:02 +0000
Received: by outflank-mailman (input) for mailman id 237533;
 Fri, 03 Dec 2021 12:13:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mt7Qz-0008PP-6H
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:13:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt7Qy-0003pz-MI; Fri, 03 Dec 2021 12:13:00 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.21.218]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt7Qy-0006Qa-Gd; Fri, 03 Dec 2021 12:13:00 +0000
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
	bh=G08tjXDpc2BAPpX+vTX4PfvHnYD5+X0cErmJ/iHQFGc=; b=JGTPyOFErsR82D0qCQValf114z
	UbIuyyP415wutiqE6iD17YLteRa2K8Eomrdnhvw7tsLPaNlcQzUX+XR7RqqrEO12m62Hld5nDK0OK
	bbBM0jD5iLVg8leK9yBpYMX5diwTAvXc3KADHTP6Mr+5biMDNpJfymIluzHCb0U2Vblw=;
Message-ID: <8c0f108f-379c-cece-26b3-9fceccc6e91e@xen.org>
Date: Fri, 3 Dec 2021 12:12:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] arm/vgic: Fix reference to a non-existing function
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211203095837.20394-1-michal.orzel@arm.com>
 <4f14f0ec-82f4-df4a-5d87-9c39727b4634@xen.org>
 <6b66bb69-9cb3-3311-d690-848b95295d18@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6b66bb69-9cb3-3311-d690-848b95295d18@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/12/2021 12:08, Michal Orzel wrote:
> On 03.12.2021 13:05, Julien Grall wrote:
>> Hi Michal,
>>
>> On 03/12/2021 09:58, Michal Orzel wrote:
>>> Commit 68dcdf942326ad90ca527831afbee9cd4a867f84
>>> (xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq)
>>> forgot to modify a comment about lr_pending list,
>>> referring to a function that has been renamed.
>>> Fix that.
>>>
>>> Fixes: 68dcdf942326ad90ca527831afbee9cd4a867f84
>>
>> The format for fixes tag is a 12 characters sha1 followed by the commit message. In this case, it would be:
>>
>> Fixes: 68dcdf942326 ("xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq") >>
>> I can fix it on commit.
> Please do. I forgot about this requirement.

Done and committed. I have also re-wrapped the commit message to 72 
characters rather than 50-characters.

-- 
Julien Grall


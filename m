Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB37520447
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 20:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324721.546892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no7uA-0003kk-42; Mon, 09 May 2022 18:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324721.546892; Mon, 09 May 2022 18:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no7uA-0003hp-14; Mon, 09 May 2022 18:14:46 +0000
Received: by outflank-mailman (input) for mailman id 324721;
 Mon, 09 May 2022 18:14:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1no7u9-0003hj-DM
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 18:14:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no7u9-000308-5e; Mon, 09 May 2022 18:14:45 +0000
Received: from [54.239.6.187] (helo=[192.168.22.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no7u9-0004xG-06; Mon, 09 May 2022 18:14:45 +0000
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
	bh=79IwOqeLdCM3sFEealN76rJn8rVZJ7E8O4fMOeu+ORE=; b=WkdMMUR5qo/ZE89M5gX+wcRQUf
	9Y8xL4XAZRVN5HAkm9EUuC29cLvwXmYol2/FQwmA1YeeWZr6bx8rqyRthWn1P2bAuS/yNDB1xb7CQ
	cHkPCQTRlB6eVeGoS+oB7xLevh2dkAr8FZo73CzsCpMbgutNry8zg2xRL261yUohP2Vw=;
Message-ID: <52708a7f-03d5-8133-f7d6-e2288fae0b57@xen.org>
Date: Mon, 9 May 2022 19:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] arm/its: enable LPIs before mapping the collection
 table
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b19768d1db24123c76e50a410965582502937bb4.1651684160.git.rahul.singh@arm.com>
 <0CE12746-697A-4005-8FD1-FE2546A8E018@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0CE12746-697A-4005-8FD1-FE2546A8E018@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2022 12:28, Bertrand Marquis wrote:
>> On 4 May 2022, at 18:15, Rahul Singh <Rahul.Singh@arm.com> wrote:
>>
>> When Xen boots on the platform that implements the GIC 600, ITS
>> MAPC_LPI_OFF uncorrectable command error issue is observed.
>>
>> As per the GIC-600 TRM (Revision: r1p6) MAPC_LPI_OFF command error can
>> be reported if the MAPC command has tried to map a collection to a core
>> that does not have LPIs enabled. The definition of GICR.EnableLPIs
>> also suggests enabling the LPIs before sending any ITS command that
>> involves LPIs
>>
>> 0b0 LPI support is disabled. Any doorbell interrupt generated as a
>>     result of a write to a virtual LPI register must be discarded,
>>     and any ITS translation requests or commands involving LPIs in
>>     this Redistributor are ignored.
>>
>> 0b1 LPI support is enabled.
>>
>> To fix the MAPC command error issue, enable the LPIs using
>> GICR_CTLR.EnableLPIs before mapping the collection table.
>>
>> gicv3_enable_lpis() is using writel_relaxed(), write to the GICR_CTLR
>> register may not be visible before gicv3_its_setup_collection() send the
>> MAPC command. Use wmb() after writel_relaxed() to make sure register
>> write to enable LPIs is visible.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Committed. Thanks!

Cheers,

-- 
Julien Grall


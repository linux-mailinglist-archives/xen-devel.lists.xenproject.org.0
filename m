Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F079A38776D
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 13:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129092.242334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixqS-0008Mi-7b; Tue, 18 May 2021 11:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129092.242334; Tue, 18 May 2021 11:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixqS-0008KX-4I; Tue, 18 May 2021 11:25:04 +0000
Received: by outflank-mailman (input) for mailman id 129092;
 Tue, 18 May 2021 11:25:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lixqQ-0008KR-KX
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 11:25:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d180322-31f4-479e-99f1-3e99bef5951b;
 Tue, 18 May 2021 11:25:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C1F4B146;
 Tue, 18 May 2021 11:25:00 +0000 (UTC)
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
X-Inumbo-ID: 5d180322-31f4-479e-99f1-3e99bef5951b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621337100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAMQJdglmsufR5MaAs0XgLKdnX0Di8T2vc+gGmAPTk0=;
	b=qtUKDfzcaUhLbT4O3JF3DydFJFzsjvaGXqo8sM72/GP6IybsS7QkmRfoHLtCUM0kF9lgpX
	ezrPzaQTc8z4/UK8zE3xxaT41FPXyod+tzRaKv/IIMheRYd2NjjHDoBPouHMZ0tG5GlaUQ
	JE14G1LV2nms33ZqU1TX7J1oMsO3YvE=
Subject: Re: [PATCH 08/10] xen/arm: introduce reserved_page_list
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-9-penny.zheng@arm.com>
 <97bc6ca6-206b-197f-de08-20691578b9db@suse.com>
 <VE1PR08MB521538CF7B0BFED3007E5D8DF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <285e39b3-1bfc-aff3-31e7-d29993d77a20@suse.com>
Date: Tue, 18 May 2021 13:24:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB521538CF7B0BFED3007E5D8DF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 10:38, Penny Zheng wrote:
> Hi Jan
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, May 18, 2021 3:39 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; julien@xen.org
>> Subject: Re: [PATCH 08/10] xen/arm: introduce reserved_page_list
>>
>> On 18.05.2021 07:21, Penny Zheng wrote:
>>> Since page_list under struct domain refers to linked pages as gueast
>>> RAM allocated from heap, it should not include reserved pages of static
>> memory.
>>>
>>> The number of PGC_reserved pages assigned to a domain is tracked in a
>>> new 'reserved_pages' counter. Also introduce a new reserved_page_list
>>> to link pages of static memory. Let page_to_list return
>>> reserved_page_list, when flag is PGC_reserved.
>>>
>>> Later, when domain get destroyed or restarted, those new values will
>>> help relinquish memory to proper place, not been given back to heap.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>  xen/common/domain.c     | 1 +
>>>  xen/common/page_alloc.c | 7 +++++--
>>>  xen/include/xen/sched.h | 5 +++++
>>>  3 files changed, 11 insertions(+), 2 deletions(-)
>>
>> This contradicts the title's prefix: There's no Arm-specific change here at all.
>> But imo the title is correct, and the changes should be Arm-specific. There's
>> no point having struct domain fields on e.g. x86 which aren't used there at all.
>>
> 
> Yep, you're right.
> I'll add ifdefs in the following changes.

As necessary, please. Moving stuff to Arm-specific files would be
preferable.

Jan


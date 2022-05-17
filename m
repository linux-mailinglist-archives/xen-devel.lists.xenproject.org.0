Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D152A937
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 19:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331336.554830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0yl-0006A5-1U; Tue, 17 May 2022 17:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331336.554830; Tue, 17 May 2022 17:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr0yk-000679-Te; Tue, 17 May 2022 17:27:26 +0000
Received: by outflank-mailman (input) for mailman id 331336;
 Tue, 17 May 2022 17:27:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nr0yj-00066d-AW
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 17:27:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr0yi-0000gq-OE; Tue, 17 May 2022 17:27:24 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.147.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr0yi-0007RP-HR; Tue, 17 May 2022 17:27:24 +0000
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
	bh=fYi3NWjuka35MAaoV5e/tnGC9ARvdDvrniUl3iBUnqQ=; b=7Da8LkxyDIdWq8H4gyElSCvCfA
	q0qmvnTzlQYsmo0RgHBn3EWlvBRQyBOdENonSUl74DKqXhxMWK0n+FAD1+d5EkmiHPL3cLE8ty0OZ
	04ytv2GlZQRTweiXnn8bm49ine6nJ/0mtzQY0XPwfEFnzgill7b4RluPQO/0j/9N5rpI=;
Message-ID: <e722c0e6-90ac-7fe2-3623-a03c9a84ce3c@xen.org>
Date: Tue, 17 May 2022 18:27:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/2] xen/arm: gnttab: modify macros to evaluate all
 arguments and only once
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20220506094225.181815-1-michal.orzel@arm.com>
 <20220506094225.181815-3-michal.orzel@arm.com>
 <ed8e9d16-56ea-68ab-8221-d654e15b40a0@xen.org>
 <9eb95e25-1a19-4048-259f-dc2dbee6cac7@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9eb95e25-1a19-4048-259f-dc2dbee6cac7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 17/05/2022 08:14, Michal Orzel wrote:
> On 16.05.2022 12:19, Julien Grall wrote:
>> Hi Michal,
>>
>> On 06/05/2022 10:42, Michal Orzel wrote:
>>> Modify macros to evaluate all the arguments and make sure the arguments
>>> are evaluated only once. Introduce following intermediate macros:
>>> gnttab_status_gfn_, gnttab_shared_gfn_ that do not take domain as a
>>> parameter. These are to be used locally and allow us to avoid passing
>>> NULL from gnttab_get_frame_gfn to the respective macros (without _ suffix).
>>> Make use of a domain parameter from gnttab_shared_gfn and gnttab_status_gfn
>>> by adding an ASSERT.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>
>> Most of the helpers below are going to disappear with Oleksandr latest work (see [1]).
>>
>> Looking at Oleksandr's patch, I think only gnttab_set_frame_gfn() would end up to use one of the macro parameters twice. So I would like to suggest to chat with Oleksandr if we can tweak his patch (can be done on commit) or we rebase this patch on top of his work.
>>
>> Cheers,
>>
>> [1] https://lore.kernel.org/xen-devel/1652294845-13980-1-git-send-email-olekstysh@gmail.com/
>>
> 
> By looking at Oleksandr patch:
> 1. there are 2 macros: gnttab_set_frame_gfn, gnttab_need_iommu_mapping that use one of the macro parameters twice.
> 2. gnttab_get_frame_gfn still passes NULL as a domain parameter to gnttab_shared_gfn/gnttab_status_gfn that do not evaluate domain parameter
> 
> I agree that point 1 could be fixed on commit but point 2 requires in my opinion adding intermediate macros to avoid passing NULL (just like I did).

Ok. I think we could avoid the intermediate macros by implementing the 
helpers the other way around. I.e gnttab_{status}_gfn() call 
gnttab_get_frame_gfn().

> 
> As this would require more work from Oleksandr, I'm ok to rebase my patch on top of his work once merged.

Thanks!

Cheers,

-- 
Julien Grall


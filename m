Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE75F8A60
	for <lists+xen-devel@lfdr.de>; Sun,  9 Oct 2022 11:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418936.663637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohSe1-0005EL-0A; Sun, 09 Oct 2022 09:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418936.663637; Sun, 09 Oct 2022 09:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohSe0-0005C0-To; Sun, 09 Oct 2022 09:30:48 +0000
Received: by outflank-mailman (input) for mailman id 418936;
 Sun, 09 Oct 2022 09:30:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ohSdz-0005Bu-2i
 for xen-devel@lists.xenproject.org; Sun, 09 Oct 2022 09:30:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohSdv-0003Dn-Cu; Sun, 09 Oct 2022 09:30:43 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohSdv-0000od-50; Sun, 09 Oct 2022 09:30:43 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=FWgU6+2ftm+DVwYPLX3NI2/OKNW1Iztel4h2ct3GwrQ=; b=47KdhBLVUmiId+7daTwGFLwWIX
	Xs328OUJFClP0nkdse2NkAa9AKB7HDCvQ4UZMQ72PWjPsgeG+OrPCdRaNbMbmAMno4EaVYgyCQQXn
	lzfYE+UW2KK1g6pRAEW7twOC4zuaQDH+ocItegyoCsY9AQhu0n7g5qfboyMh1ctsOAPY=;
Message-ID: <aae228af-a939-0f51-0496-167c03107a6c@xen.org>
Date: Sun, 9 Oct 2022 10:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta.poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <598de284f5f133a622eca3e120a1aabae0f2a1e2.1665137247.git.mykyta_poturai@epam.com>
 <87czb2f02o.fsf@hp.mail-host-address-is-not-set>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 01/19] xen/arm: Implement PSCI system suspend
In-Reply-To: <87czb2f02o.fsf@hp.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/10/2022 23:00, Volodymyr Babchuk wrote:
>> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
>> new file mode 100644
>> index 0000000000..987ba6ac11
>> --- /dev/null
>> +++ b/xen/arch/arm/suspend.c
>> @@ -0,0 +1,182 @@
>> +/*
>> + * Copyright (C) 2022 EPAM Systems Inc.

Not related to Volodymyr's answer but I will reply here as I noticed it.

The code was written in 2018 by Aggios. So shouldn't this be a 2018 
copyright from Aggios? You can add yours on top if you want but it is 
not super clear what has been modified (a changelog after --- in the 
commit message would have been useful).

>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU Lesser General Public License as published
>> + * by the Free Software Foundation; version 2.1 only. with the special
>> + * exception on linking described in file LICENSE.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU Lesser General Public License for more details.
>> + */

We are not allowing LGPL* license in the hypervisor. This has to be 
GPLv2-only (this was the original contribution even if there were no 
copyright).

But it would be better to use an SPDX tag as it makes clearer which 
license is used (see [1]).

[...]

>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 8f4b1ca10d..4e1ea62c44 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -38,6 +38,10 @@
>>   #include <xsm/xsm.h>
>>   #include <xen/err.h>
>>   
>> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
>> +#include <asm/suspend.h>
>> +#endif
>> +
>>   #include "private.h"
>>   
>>   #ifdef CONFIG_XEN_GUEST
>> @@ -957,6 +961,10 @@ void vcpu_unblock(struct vcpu *v)
>>   {
>>       if ( !test_and_clear_bit(_VPF_blocked, &v->pause_flags) )
>>           return;
>> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
>> +    if ( test_bit(_VPF_suspended, &v->pause_flags) )
>> +        vcpu_resume(v);
>> +#endif
> 
> This does not look good. I do understant that that was I, who suggested
> to add this flag, but I didn't expected that it will get into common code.

AFAIU, you are using the flag to indicate whether the vCPU should be 
reset. If I am not mistaken, this should only happen for vCPU0 (other 
vCPUs will be brought up using PSCI CPU ON). So you could reset the vCPU 
before blocking it.

With that, the flag should not be necessary (at least in this situation).

> 
> Also, this is not justified in the commit message. I remeber that there was
> some discussion about why vcpu_block()/vcpu_unblock() could not be used, and
> I'd love to see its summary in the commit message.

Are you referring to the discussion in [2]?

Cheers,

[1] 20221008001544.78302-2-sstabellini@kernel.org
[2] 1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com

Cheers,

-- 
Julien Grall


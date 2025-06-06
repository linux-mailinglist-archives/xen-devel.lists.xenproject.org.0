Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7ADAD096F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 23:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008910.1388085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNedI-0005Cw-4d; Fri, 06 Jun 2025 21:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008910.1388085; Fri, 06 Jun 2025 21:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNedI-0005AP-1h; Fri, 06 Jun 2025 21:29:48 +0000
Received: by outflank-mailman (input) for mailman id 1008910;
 Fri, 06 Jun 2025 21:29:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uNedG-0005AC-3V
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 21:29:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNedF-005Qr9-1K;
 Fri, 06 Jun 2025 21:29:45 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNedF-00DlA1-1x;
 Fri, 06 Jun 2025 21:29:45 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=9MZAmwPMX6E6UhQcBqbToxnHspEw0+bZS2FT2iZhTrM=; b=sHUZxim7am7U6zsb59BZvxlsmb
	MhTm9Bsc+mEPz+YxkyNoobd7lpGZ+GXblz92t5+TXovYUXPIh0VJGpYIRDq3Q8jXVkDggdCPz6RJS
	FM1otTGmLej69y/H0XvZXWCKu/3ZrM1yYhMQKshKg9Gc27U/t6d+3rQ5fqdrLTo8+Tsg=;
Message-ID: <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org>
Date: Fri, 6 Jun 2025 22:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: dmkhn@proton.me, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech,
 dmukhin@ford.com
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-3-dmukhin@ford.com>
 <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org>
In-Reply-To: <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Denis,

On 05/06/2025 23:05, Julien Grall wrote:
> Hi Denis,
> 
> On 28/05/2025 23:50, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmkhn@proton.me>
>>
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Remove the hardcoded domain ID 0 allocation for hardware domain and 
>> replace it
>> with a call to get_initial_domain_id() (returns the value of 
>> hardware_domid on
>> Arm).
> 
> I am not entirely why this is done. Are you intending to pass a 
> different domain ID? If so...
> 
>>
>> Update domid_alloc(DOMID_INVALID) case to ensure that 
>> get_initial_domain_id()
>> ID is skipped during domain ID allocation to cover domU case in dom0less
>> configuration. That also fixes a potential issue with re-using ID#0 
>> for domUs
>> when get_initial_domain_id() returns non-zero.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>> Changes since v8:
>> - rebased
>> ---
>>   xen/arch/arm/domain_build.c             | 4 ++--
>>   xen/common/device-tree/dom0less-build.c | 9 +++------
>>   xen/common/domain.c                     | 4 ++--
>>   3 files changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index e9d563c269..0ad80b020a 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2035,9 +2035,9 @@ void __init create_dom0(void)
> 
> ... naming like create_dom0() probably wants to be renamed.
> 
> That said, I am not convinced a domain other than 0 should have full 
> privilege by default. So I would argue it should stay as ...
> 
>>       if ( !llc_coloring_enabled )
>>           flags |= CDF_directmap;
>> -    domid = domid_alloc(0);
>> +    domid = domid_alloc(get_initial_domain_id());
> 
> ... 0.

Looking at the implementation of get_initial_domain_id(), I noticed the 
behavior was changed for x86 by [1].

Before, get_initial_domain_id() was returning 0 except for the PV shim.
But now, it would could return the domain ID specified on the command 
line (via hardware_dom).

 From my understanding, the goal of the command line was to create the 
hardware domain *after* boot. So initially we create dom0 and then 
initialize the hardware domain. With the patch below, this has changed.

However, from the commit message, I don't understand why. It seems like 
we broke late hwdom?

For instance, late_hwdom_init() has the following assert:

     dom0 = rcu_lock_domain_by_id(0);
     ASSERT(dom0 != NULL);

Jan, I saw you were involved in the review of the series. Any idea why 
this was changed?

Cheers,

[1] https://lore.kernel.org/all/20250306075819.154361-1-dmkhn@proton.me/

-- 
Julien Grall



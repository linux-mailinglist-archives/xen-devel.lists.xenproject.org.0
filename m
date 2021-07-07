Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C3F3BE8EC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152266.281316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17mW-0004NE-K9; Wed, 07 Jul 2021 13:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152266.281316; Wed, 07 Jul 2021 13:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17mW-0004Hq-Gl; Wed, 07 Jul 2021 13:40:04 +0000
Received: by outflank-mailman (input) for mailman id 152266;
 Wed, 07 Jul 2021 13:40:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m17mU-00046d-Up
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:40:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17mT-0004b6-Jh; Wed, 07 Jul 2021 13:40:01 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17mT-0001mN-D3; Wed, 07 Jul 2021 13:40:01 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qlVcr/O7pKpKxioCJo42QzPZjf76ML8OSLj6pF9e1fk=; b=sxVRoR9ahoiAqaegSnWvjyaz6/
	dm8DM0VVa9xfXFKdAMsMcnnJ9ZhvL2j7XahvTnC/NSBQ3yGaq/6lcPH/sWHi2meuPGv7vSDPbQG3E
	vHRroGTkap7IPrlpMEtoDJncHQ7tL65TzEDpViZfTffgoUezvjLidJJ9JMhrFwfnQ9Vo=;
Subject: Re: [PATCH v5 1/4] xen: XENMEM_exchange should only be used/compiled
 for arch supporting PV guest
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210703171152.15874-1-julien@xen.org>
 <20210703171152.15874-2-julien@xen.org>
 <8c0100ab-dfd7-9c64-c89d-338db62cf20b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3bb6ff6a-a4e8-daaf-daaf-a6efe07819d4@xen.org>
Date: Wed, 7 Jul 2021 14:39:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8c0100ab-dfd7-9c64-c89d-338db62cf20b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/07/2021 09:41, Jan Beulich wrote:
> On 03.07.2021 19:11, Julien Grall wrote:
>> Changes in v5:
>>      - Removed the #ifdef CONFIG_X86 as they are not necessary anymore
>>      - Used paging_mode_translate() rather than is_pv_domain()
> 
> Is there a particular reason you use this in favor of steal_page()'s
> paging_mode_external()?

This is what you suggested in v4 [1]. I can switch to 
paging_mode_external() if this is what you now prefer.

> 
>> @@ -815,6 +812,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>       if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
>>           rc = -EFAULT;
> 
> I'm afraid that for correctness of the interface you need to keep
> this part even in the !PV case.

Xen never initializes the field nr_exchanged. Instead, it expects the 
guest to set to 0. So I am not quite to sure why we would need to keep 
this line.

> Seeing the 2nd use of steal_page() I wonder if it was too much to
> ask you to do a similar transformation for gnttab_transfer(), even
> if it's not directly related to the immediate purpose of this
> series. If you're not going to do so, I guess I'd put it on my list
> (perhaps together with moving x86'es steal_page() and dropping
> Arm's stub).

I will have a look to #ifdef the code in gnttab_transfer() and drop 
steal_page() on Arm.

Cheers,

[1] <834db49d-dda5-784c-1135-8427086a04eb@suse.com>

-- 
Julien Grall


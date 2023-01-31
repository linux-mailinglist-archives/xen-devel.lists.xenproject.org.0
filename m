Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC7A682C2C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 13:04:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487599.755264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpMT-00019e-Qe; Tue, 31 Jan 2023 12:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487599.755264; Tue, 31 Jan 2023 12:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMpMT-00017H-NW; Tue, 31 Jan 2023 12:03:41 +0000
Received: by outflank-mailman (input) for mailman id 487599;
 Tue, 31 Jan 2023 12:03:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMpMR-00017A-PR
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 12:03:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMpMQ-00017H-VS; Tue, 31 Jan 2023 12:03:38 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMpMQ-0000fT-Pq; Tue, 31 Jan 2023 12:03:38 +0000
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
	bh=u5nY5Kts/Uq5eSWU6q+8En3cC2yDTmdBxeciRaBP2tE=; b=bO7817/dhQFRwQvsH26wcxFXbg
	bBYA3G/iQjBAo80LOQyJGsHHO7o3ghkxWfOKLfjDp1DaRm0SIV0LHlO51oQY9/9/vl895c/xudjqs
	wQQ4/GT1cFE1q3FmI9KqQVlC3vHDNJ4HbuWhDr8PqJ3PZt0T2MKIssmAyNeDjyK0Wizk=;
Message-ID: <2f6a3b17-4e41-fe9a-1713-4942b3bd3585@xen.org>
Date: Tue, 31 Jan 2023 12:03:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 1/2] xen/riscv: introduce early_printk basic stuff
To: Alistair Francis <alistair23@gmail.com>,
 Oleksii <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Connor Davis
 <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1674819203.git.oleksii.kurochko@gmail.com>
 <f5cd1bfb116bfcc86fc2848df7eead05cd1a24c0.camel@gmail.com>
 <CAKmqyKMGiDiPRZBekdKan=+YduSmkB2DoWo5btrtVQ8nS3KMAg@mail.gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAKmqyKMGiDiPRZBekdKan=+YduSmkB2DoWo5btrtVQ8nS3KMAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/01/2023 11:44, Alistair Francis wrote:
> On Sat, Jan 28, 2023 at 12:15 AM Oleksii <oleksii.kurochko@gmail.com> wrote:
>>
>> Hi Alistair, Bobby and community,
>>
>> I would like to ask your help with the following check:
>> +/*
>> + * early_*() can be called from head.S with MMU-off.
>> + *
>> + * The following requiremets should be honoured for early_*() to
>> + * work correctly:
>> + *    It should use PC-relative addressing for accessing symbols.
>> + *    To achieve that GCC cmodel=medany should be used.
>> + */
>> +#ifndef __riscv_cmodel_medany
>> +#error "early_*() can be called from head.S with MMU-off"
>> +#endif
> 
> I have never seen a check like this before. 

The check is in the Linux code, see [3].

> I don't really understand
> what it's looking for, if the linker is unable to call early_*() I
> would expect it to throw an error. I'm not sure what this is adding.

When the MMU is off during early boot, you want any C function called to 
use PC-relative address rather than absolute address. This is because 
the physical address may not match the virtual address.

 From my understanding, on RISC-V, the use of PC-relative address is 
only guaranteed with medany. So if you were going to change the cmodel 
(Andrew suggested you would), then early_*() may end up to be broken.

This check serve as a documentation of the assumption and also help the 
developer any change in the model and take the appropriate action to 
remediate it.

> 
> I think this is safe to remove.
Based on what I wrote above, do you still think this is safe?

Cheers,

>> Please take a look at the following messages and help me to decide if
>> the check mentioned above should be in early_printk.c or not:
>> [1]
>> https://lore.kernel.org/xen-devel/599792fa-b08c-0b1e-10c1-0451519d9e4a@xen.org/
>> [2]
>> https://lore.kernel.org/xen-devel/0ec33871-96fa-bd9f-eb1b-eb37d3d7c982@xen.org/

[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/mm/init.c


-- 
Julien Grall


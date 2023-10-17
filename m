Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD757CC60C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 16:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618273.961715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qslEg-0001HZ-4w; Tue, 17 Oct 2023 14:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618273.961715; Tue, 17 Oct 2023 14:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qslEg-0001F0-1q; Tue, 17 Oct 2023 14:39:54 +0000
Received: by outflank-mailman (input) for mailman id 618273;
 Tue, 17 Oct 2023 14:39:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qslEe-0001Eu-HN
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 14:39:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qslEe-0006qe-2i; Tue, 17 Oct 2023 14:39:52 +0000
Received: from [15.248.3.1] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qslEd-0001bv-TM; Tue, 17 Oct 2023 14:39:52 +0000
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
	bh=3KYdbEah9xs0ADhmXaQxWb5VLopC25MlsZ4oe05NPUU=; b=cVGeJtN9oeNAc+LG+kviqrIyWu
	fmn4nepKwq1Ksf0hiDMjlk9srVU0QeY/ExJNh5kKxBWA/DW3DRkOe0dD3EWF8fAbeMViaCQeIugsQ
	GtBLCMoQKvcg51Ldco30nexRcDD9dOyKfoRn3VzQcQTogLzZYywtrimeTZiz1IS8RuMs=;
Message-ID: <2b10267a-514c-4c9b-b715-f65c26d7f757@xen.org>
Date: Tue, 17 Oct 2023 15:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.19] xen/arm64: head: only use the macro load_paddr() in
 the MMU code
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: ayan.kumar.halder@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231017125219.76626-1-julien@xen.org>
 <9487bcbc-fedd-4d0e-86a4-023480bc9c54@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9487bcbc-fedd-4d0e-86a4-023480bc9c54@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/10/2023 15:07, Michal Orzel wrote:
> On 17/10/2023 14:52, Julien Grall wrote:
>>
>>
>> The macro load_paddr() requires to know the offset between the
>> physical location of Xen and the virtual location.
>>
>> When using the MPU, x20 will always be 0. Rather than wasting
>> a register for a compile-time constant value, it would be best if
>> we can avoid using load_paddr() altogher in the common head.S code.
> s/altogher/altogether/

I will fix it.

> 
>>
>> The current use of load_paddr() are equivalent to adr_l() because
>> the MMU is off.
>>
>> All the use of load_paddr() in arm64/head.S are now replaced with
>> adr_l(). With that, load_paddr() can now be moved in arm64/mmu/head.S.
>>
>> For now, x20 is still unconditionally set. But this could change
>> in the future if needed.
>>
>> Signed-off-by: Julien Grall <julien@xen.org>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Side note:
> Looking at all the uses of load_paddr(), none of them takes place after enabling MMU
> which would indicate that we actually don't need this macro at all. Do you agree?

I agree they are none today called after enabling the MMU. But, 
create_table_entry() used to be called after and I can't rule out this 
will not happen again.

So I don't think we should replace the use in create_table_entry() with 
adr_l. We could consider to open-code code though.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A14E52B4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 14:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293883.499422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX0cQ-0003Nc-Nl; Wed, 23 Mar 2022 13:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293883.499422; Wed, 23 Mar 2022 13:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX0cQ-0003Lv-Kd; Wed, 23 Mar 2022 13:01:42 +0000
Received: by outflank-mailman (input) for mailman id 293883;
 Wed, 23 Mar 2022 13:01:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nX0cP-0003Lp-3a
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 13:01:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nX0cN-0004uI-HJ; Wed, 23 Mar 2022 13:01:39 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.10.149]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nX0cN-0001Oa-BA; Wed, 23 Mar 2022 13:01:39 +0000
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
	bh=GddZiesaSpF6OnrwOBsQ0Qh3bjDZStKEu9duXyuCs4U=; b=xudspDDQ4dtboJ2K1cVZQSVKUQ
	16beO69/44wWjA6hJ7uh7m2xZIQFnUUev702FyYJIHpC2SiC7tfRpiXOYxHryBoRJArXhz0OmPrtP
	Uf+AotN78vULPapjM4JkH9MaMWj57HIMtnLUWSPxHvPLKCZvGddl4RAyqWRRoiTiHGZk=;
Message-ID: <cea82447-58c4-be37-153f-d764ea5f4891@xen.org>
Date: Wed, 23 Mar 2022 13:01:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32 guests
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220322202825.418232-1-sstabellini@kernel.org>
 <57924f67-2419-bcdc-73ab-96ea9f1d2614@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <57924f67-2419-bcdc-73ab-96ea9f1d2614@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 23/03/2022 12:36, Andrew Cooper wrote:
> On 22/03/2022 20:28, Stefano Stabellini wrote:
>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>
>> The first 32 bytes of zImage are NOPs. When CONFIG_EFI is enabled in the
>> kernel, certain versions of Linux will use an UNPREDICATABLE NOP
>> encoding, sometimes resulting in an unbootable kernel. Whether the
>> resulting kernel is bootable or not depends on the processor. See commit
>> a92882a4d270 in the Linux kernel for all the details.
>>
>> All kernel releases starting from Linux 4.9 without commit a92882a4d270
>> are affected.
>>
>> Fortunately there is a simple workaround: setting the "Z" bit in CPSR
>> make it so those invalid NOP instructions are never executed. That is
>> because the instruction is conditional (not equal). So, on QEMU at
>> least, the instruction will end up to be ignored and not generate an
>> exception. Setting the "Z" bit makes those kernel versions bootable
>> again and it is harmless in the other cases.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> A discussion relevant to this came up with XTF/ARM.
> 
> There is not currently a written ABI for the start state of vCPUs, and
> there needs to be.  I know x86 is in a poor shape too, but we do at
> least have some scraps of docs littered around and a plan to write some
> proper Sphinx docs.
> 
> (A separate conversation was about booting from plain ELF files.  Linux
> ARM Zimage is entirely undocumented for 32bit, and discussions with RMK
> suggest that we've got bugs

Do you mind providing more details on what would be the bugs here?

> , while 64bit has insufficient documentation
> to demonstrate that our logic is correct.)

Did you actually read 
https://github.com/torvalds/linux/blob/master/Documentation/arm64/booting.rst? 


> 
> In particular...
> 
>> ---
>> Changes in v2:
>> - improve commit message
>> - add in-code comment
>> - move PSR_Z to the beginning
>> ---
>>   xen/include/public/arch-arm.h | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index 94b31511dd..81cee95f14 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
>>   #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
>>   #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
>>   #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
>> +#define PSR_Z           (1<<30)       /* Zero condition flag */
>>   
>>   /* 32 bit modes */
>>   #define PSR_MODE_USR 0x10
>> @@ -383,7 +384,12 @@ typedef uint64_t xen_callback_t;
>>   #define PSR_MODE_EL1t 0x04
>>   #define PSR_MODE_EL0t 0x00
>>   
>> -#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
>> +/*
>> + * We set PSR_Z to be able to boot Linux kernel versions with an invalid
>> + * encoding of the first 8 NOP instructions. See commit a92882a4d270 in
>> + * Linux.
>> + */
>> +#define PSR_GUEST32_INIT  (PSR_Z|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
> 
> ... this change is either breaking the ABI, or demonstrates that these
> values must not be in a public header file to begin with.
PSR_GUEST32_INIT is only exposed to the toolstack (see the ifdef above). 
It is defined in the arch-arm.h because it makes easier to keep the 
value in sync.

This is not part of the ABI and therefore we are free to change the 
value in any way we want. Setting Z is a convenient way to handle the 
Linux issue without making it too invasive.

Cheers,

-- 
Julien Grall


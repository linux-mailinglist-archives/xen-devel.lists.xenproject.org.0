Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A886CC6EE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515965.799392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBVF-00020a-5U; Tue, 28 Mar 2023 15:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515965.799392; Tue, 28 Mar 2023 15:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBVF-0001ya-2j; Tue, 28 Mar 2023 15:44:53 +0000
Received: by outflank-mailman (input) for mailman id 515965;
 Tue, 28 Mar 2023 15:44:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phBVD-0001yU-Kt
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:44:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phBV9-0000eM-9L; Tue, 28 Mar 2023 15:44:47 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.22]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phBV9-0001uZ-2E; Tue, 28 Mar 2023 15:44:47 +0000
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
	bh=nrlIQc5Bzeb32cDNCaTlF2/ofru2rKJQ1WLwbs3qWYw=; b=KDW8fcJMTWRM3D8nkdE74rErXZ
	McFylTPEfG2x888lMiXg7JtQomNV9NWvtYr+LtiFukXzdWNrKev9BBCaMx9+MxXnqU/Jmw4UCYklU
	tDlP+5l9yI2D5NRr893CBy6Y8h5XtJlJSBiurherKAdna9ZvSm6b08UkT67qVB9tOlZ8=;
Message-ID: <fa074729-ccf7-cf2a-b8df-6c77ae3117f1@xen.org>
Date: Tue, 28 Mar 2023 16:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1679934166.git.oleksii.kurochko@gmail.com>
 <93da6ba381604748e2c71e2ebd35e80798ec4bb2.1679934166.git.oleksii.kurochko@gmail.com>
 <0a16b79e-8292-6947-24d4-dd027113943f@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0a16b79e-8292-6947-24d4-dd027113943f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/03/2023 16:34, Jan Beulich wrote:
> On 27.03.2023 19:17, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/config.h
>> +++ b/xen/arch/riscv/include/asm/config.h
>> @@ -39,12 +39,25 @@
>>     name:
>>   #endif
>>   
>> -#define XEN_VIRT_START  _AT(UL, 0x80200000)
>> +#define ADDRESS_SPACE_END (_AC(-1, UL))
>> +#define SZ_1G             0x40000000
> 
> No need for this - please use GB(1) (see xen/config.h) in its stead.
> 
>> +#ifdef CONFIG_RISCV_64
>> +#define XEN_VIRT_START    (ADDRESS_SPACE_END - SZ_1G + 1)
> 
> I first thought the " + 1" would be rendering the address misaligned.
> May I suggest (ADDRESS_SPACE_END + 1 - SZ_1G) to help avoiding this
> impression?

I will jump on this to say that I am finding quite difficult to review 
code using define/variable that contains "end" in their name because it 
is never clear whether this is inclusive or exclusive.

In this case, it is inclusive, but within the same patch I can see 
map_end which is exclusive.

For this case, my suggestion would be to remove ADDRESS_SPACE_END and 
just hardcode the value where you want to put Xen. For others, you could 
use (start, size) to describe a region.

Also, are you sure that all the CPU will be able to support more full 
64-bit VA space?

Cheers,

-- 
Julien Grall


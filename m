Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF1E74896D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559446.874438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5aY-0006zj-EP; Wed, 05 Jul 2023 16:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559446.874438; Wed, 05 Jul 2023 16:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5aY-0006xu-BS; Wed, 05 Jul 2023 16:42:46 +0000
Received: by outflank-mailman (input) for mailman id 559446;
 Wed, 05 Jul 2023 16:42:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qH5aW-0006xo-Tf
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:42:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH5aW-0005V3-1A; Wed, 05 Jul 2023 16:42:44 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.19.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH5aV-0001lD-Pt; Wed, 05 Jul 2023 16:42:43 +0000
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
	bh=dINrxk4jzyAV5ddpUdYH8xJ6xCsxhj44rA4YszpTDak=; b=fujywRd/vQDRiBCCPQZJ7S2lIk
	vAkhOjHhbCQX4nWQshFjh9KVwuffCLUM3mC0HRZ2n0gN+5k3mcdKkRLn+zyA5fc9Hc+h+elKG7ji9
	S+tXiDu7IrBK3sN0KJoCqU2mzpasaje/0SgciOrQQeiQMs9F6xdsVyfCDIamA3REcwYo=;
Message-ID: <a2455b22-1876-dce9-e907-0b437d9c7e8c@xen.org>
Date: Wed, 5 Jul 2023 17:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 04/13] xen/arm: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <c58aa850214380cb6f799226a911968fd33a98ff.1688559115.git.gianluca.luparini@bugseng.com>
 <FDCB18E6-3D49-4634-BD11-931E03B2438C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FDCB18E6-3D49-4634-BD11-931E03B2438C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/07/2023 17:27, Luca Fancellu wrote:
>> diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
>> index 8b43bb8495..0e890b666d 100644
>> --- a/xen/arch/arm/include/asm/arm64/efibind.h
>> +++ b/xen/arch/arm/include/asm/arm64/efibind.h
>> @@ -22,12 +22,12 @@ Revision History
>> #pragma pack()
>> #endif
>>
>> -#define EFIERR(a)           (0x8000000000000000 | a)
>> -#define EFI_ERROR_MASK      0x8000000000000000
>> -#define EFIERR_OEM(a)       (0xc000000000000000 | a)
>> +#define EFIERR(a)           (0x8000000000000000U | a)
>> +#define EFI_ERROR_MASK      0x8000000000000000U
>> +#define EFIERR_OEM(a)       (0xc000000000000000U | a)
>>
>> -#define BAD_POINTER         0xFBFBFBFBFBFBFBFB
>> -#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFF
>> +#define BAD_POINTER         0xFBFBFBFBFBFBFBFBU
>> +#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFFU
>>
> 
> Should these be UL? (From EFIERR to MAX_ADDRESS)

Even though this arm64 only, it would be best to use ULL.

[...]

>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>> index 9c1fdcc3f8..f3e9eb2f92 100644
>> --- a/xen/arch/arm/vgic-v3.c
>> +++ b/xen/arch/arm/vgic-v3.c
>> @@ -354,7 +354,7 @@ read_reserved:
>>      return 1;
>>
>> read_unknown:
>> -    *r = vreg_reg64_extract(0xdeadbeafdeadbeaf, info);
>> +    *r = vreg_reg64_extract(0xdeadbeafdeadbeafU, info);
> 
> Should this be UL?

The code is common between arm32 and arm64. So this wants to be ULL (UL 
is 32-bit on arm32).

Cheers,

-- 
Julien Grall


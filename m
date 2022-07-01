Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4645633D7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 14:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359002.588384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GE0-00072O-Jl; Fri, 01 Jul 2022 12:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359002.588384; Fri, 01 Jul 2022 12:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GE0-0006zZ-GE; Fri, 01 Jul 2022 12:58:20 +0000
Received: by outflank-mailman (input) for mailman id 359002;
 Fri, 01 Jul 2022 12:58:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o7GDy-0006zO-CM
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 12:58:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o7GDt-0001Gy-IE; Fri, 01 Jul 2022 12:58:13 +0000
Received: from [54.239.6.185] (helo=[192.168.1.77])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o7GDt-0008U5-CD; Fri, 01 Jul 2022 12:58:13 +0000
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
	bh=HhdLZJG16irC4WgExTydf2rtiy0BJFQOFZN7hC2/dGM=; b=WUCcBJ87fq355zymLanZhCCexT
	O2SsMJBaFW93fS7QZQCn2fQXPaO28T8Yi1pGx1L893bYRHLRXE5c9ZnBQpWFCAd7/2PWQHeEPMXD6
	DCjK7RH4xk0HSkEBoAJWMLkT6QLpvyyQ6cr5MoaPyeAf5s1b5mZ12QFifSIxAAQVhaJo=;
Message-ID: <6e4a4da7-23e9-a976-2fdc-a96244c536fd@xen.org>
Date: Fri, 1 Jul 2022 13:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] Xen: fix EFI stub wchar_t size warning of arm32 building
To: Jan Beulich <jbeulich@suse.com>, Wei Chen <wei.chen@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220701101358.954527-1-wei.chen@arm.com>
 <061c06ae-e45a-b18c-9c86-3387dac60820@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <061c06ae-e45a-b18c-9c86-3387dac60820@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/07/2022 11:34, Jan Beulich wrote:
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>>   xen/arch/arm/efi/Makefile | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
>> index dffe72e589..b06fb96c1f 100644
>> --- a/xen/arch/arm/efi/Makefile
>> +++ b/xen/arch/arm/efi/Makefile
>> @@ -1,5 +1,9 @@
>>   include $(srctree)/common/efi/efi-common.mk
>>   
>> +ifeq ($(CONFIG_ARM_32),y)
>> +CFLAGS-y += -fno-short-wchar
>> +endif
> 
> Simply
> 
> CFLAGS-$(CONFIG_ARM_32) += -fno-short-wchar
> 
> ? But, as suggested, perhaps further
> 
> $(obj)/stub.o: CFLAGS-$(CONFIG_ARM_32) += -fno-short-wchar
> 
> to make sure we'd notice any other uses / issues here. After all it
> is - at least in theory - possible that Arm32 would also gain EFI
> support, and then it would be a problem if the other ("real") files
> were compiled that way (albeit I think the issue would be easily
> noticeable, as I don't think things would build that way).

Instead of CONFIG_ARM_32, I would use CONFIG_ARM_EFI. So this would also 
work if we want to disable EFI on arm64 or enable on arm32.

Cheers,

-- 
Julien Grall


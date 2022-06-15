Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000654D1D9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 21:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350303.576602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1YvP-0003Wc-5h; Wed, 15 Jun 2022 19:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350303.576602; Wed, 15 Jun 2022 19:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1YvP-0003Tq-2Z; Wed, 15 Jun 2022 19:43:35 +0000
Received: by outflank-mailman (input) for mailman id 350303;
 Wed, 15 Jun 2022 19:43:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o1YvN-0003Tk-0e
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 19:43:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1YvM-0001AB-9m; Wed, 15 Jun 2022 19:43:32 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1YvL-00069J-Jv; Wed, 15 Jun 2022 19:43:31 +0000
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
	bh=bMgGonnEiv+yxqh5aHw/ojo91IbRi8VRnhsZ22GFEOc=; b=Aecp+ZUGTxJc6s2/vg24WrBeCa
	jeu6cmMLhHay448XsvRu7olMK+9NAED5Q8FPAfQrjP8ESagLQqZJCTQjn6ihpHmpRY/g/2bPk3Z76
	TDrW9ofMNqHCRzcKXj/uBCerPgk9WtLEoaor9uROI1hNsZBSK77Mk5FbSB4jwH5Oeumk=;
Message-ID: <9c39d8dc-4a74-297c-45fd-4e261fe9ef90@xen.org>
Date: Wed, 15 Jun 2022 20:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-2-jens.wiklander@linaro.org>
 <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
In-Reply-To: <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11/06/2022 01:41, Stefano Stabellini wrote:
>>   #endif /* __ASSEMBLY__ */
>>   
>>   /*
>> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
>> index 676740ef1520..6f90c08a6304 100644
>> --- a/xen/arch/arm/vsmc.c
>> +++ b/xen/arch/arm/vsmc.c
>> @@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
>>       switch ( fid )
>>       {
>>       case ARM_SMCCC_VERSION_FID:
>> -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
>> +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
>>           return true;
>    
> This is going to be a problem for ARM32 given that ARM_SMCCC_VERSION_1_2
> is unimplemented on ARM32. If there is an ARM32 implementation in Linux
> for ARM_SMCCC_VERSION_1_2 you might as well import it too.
> 
> Otherwise we'll have to abstract it away, e.g.:
> 
> #ifdef CONFIG_ARM_64
> #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_2
> #else
> #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_1
> #endif

I don't understand why you want to tie the virtual and host SMCCC version.

In theory, it would be possible for us to implement a subsystem to fully 
emulate, lets say, FFA. We would to tell the VM that we are v1.2 
compliant but we would not need the helper as no calls would be forwarded.

When a 32-bit guest is running on Xen Arm64, we are going to say that 
SMCCC v1.2 will be available. This is not much different from running a 
32-bit guest on 32-bit hardware. So I think we should expose 1.2 unless 
we think there is a problem in the Xen 32-bit specific code.

Cheers,

-- 
Julien Grall


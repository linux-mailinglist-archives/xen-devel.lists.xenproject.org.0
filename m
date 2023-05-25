Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECFB710978
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 12:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539515.840470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27sc-0005dT-JC; Thu, 25 May 2023 10:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539515.840470; Thu, 25 May 2023 10:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27sc-0005am-GF; Thu, 25 May 2023 10:07:34 +0000
Received: by outflank-mailman (input) for mailman id 539515;
 Thu, 25 May 2023 10:07:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q27sa-0005aT-KZ
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 10:07:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q27sa-00027V-6O; Thu, 25 May 2023 10:07:32 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.224]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q27sZ-0000hv-VP; Thu, 25 May 2023 10:07:32 +0000
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
	bh=QbrOr9E3GqxP0BG8gU+zcrcR/75yIDTj2OiWleo21xQ=; b=ao59pIgA7oA3AU2Z/MJZ0bpLPe
	O9dl2ViBCU/UZ1o6L6C1XyQ1PuKOovfar2FQNh2ED3sq97/trTL89U+F+WDQFBM7Qeu08xC45N+Ta
	uav4DlrUZTqMwe74ETovEfy3dInnGBXZd29ktN+U0AtLtvZd+tO+p4Pdw+P+ZxJD2dA0=;
Message-ID: <c384a6e7-90a5-7102-3f17-64abeca40c76@xen.org>
Date: Thu, 25 May 2023 11:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v7 05/12] arm/sve: save/restore SVE context switch
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-6-luca.fancellu@arm.com>
 <5b09d5d9-360f-d0ef-06c4-6efe1b660a90@xen.org>
 <8DF528FE-8F09-469C-B8C4-28B34B20A273@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8DF528FE-8F09-469C-B8C4-28B34B20A273@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 25/05/2023 11:01, Luca Fancellu wrote:
>> On 25 May 2023, at 10:09, Julien Grall <julien@xen.org> wrote:
>>> diff --git a/xen/arch/arm/include/asm/arm64/vfp.h b/xen/arch/arm/include/asm/arm64/vfp.h
>>> index e6e8c363bc16..4aa371e85d26 100644
>>> --- a/xen/arch/arm/include/asm/arm64/vfp.h
>>> +++ b/xen/arch/arm/include/asm/arm64/vfp.h
>>> @@ -6,7 +6,19 @@
>>>     struct vfp_state
>>>   {
>>> +    /*
>>> +     * When SVE is enabled for the guest, fpregs memory will be used to
>>> +     * save/restore P0-P15 registers, otherwise it will be used for the V0-V31
>>> +     * registers.
>>> +     */
>>>       uint64_t fpregs[64] __vfp_aligned;
>>> +    /*
>>> +     * When SVE is enabled for the guest, sve_zreg_ctx_end points to memory
>>> +     * where Z0-Z31 registers and FFR can be saved/restored, it points at the
>>> +     * end of the Z0-Z31 space and at the beginning of the FFR space, it's done
>>> +     * like that to ease the save/restore assembly operations.
>>> +     */
>>> +    uint64_t *sve_zreg_ctx_end;
>>
>> Sorry I only noticed now. But shouldn't this be protected with #ifdef CONFIG_SVE? Same...
>>
>>>       register_t fpcr;
>>>       register_t fpexc32_el2;
>>>       register_t fpsr;
>>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>>> index 331da0f3bcc3..814652d92568 100644
>>> --- a/xen/arch/arm/include/asm/domain.h
>>> +++ b/xen/arch/arm/include/asm/domain.h
>>> @@ -195,6 +195,8 @@ struct arch_vcpu
>>>       register_t tpidrro_el0;
>>>         /* HYP configuration */
>>> +    register_t zcr_el1;
>>> +    register_t zcr_el2;
>>
>> ... here.
> 
> Sure I can protect them. It was done on purpose before to avoid ifdefs but I think saving space
> is better here and also there won’t be any use of them when the config is off.

I wasn't thinking about saving space. I was more thinking about catching 
any (mis)use of the fields in common code. With the #ifdef, the 
compilation would fail.

Cheers,

-- 
Julien Grall


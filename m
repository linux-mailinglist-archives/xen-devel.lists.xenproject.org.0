Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E7A89988
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952481.1347920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dDw-00024F-5s; Tue, 15 Apr 2025 10:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952481.1347920; Tue, 15 Apr 2025 10:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dDw-00023H-1m; Tue, 15 Apr 2025 10:09:00 +0000
Received: by outflank-mailman (input) for mailman id 952481;
 Tue, 15 Apr 2025 10:08:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4dDu-00022j-Hr
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:08:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4dDu-00Gx12-0D;
 Tue, 15 Apr 2025 10:08:58 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4dDt-0031HY-1n;
 Tue, 15 Apr 2025 10:08:57 +0000
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
	bh=30+nHoXhM1HKJD5jVk3ExrRCsBsij7f6Aozhhh9di/E=; b=No6ZJTd0IPDPJzHOfCM+qUVmyV
	xJn4qd2m+1Ipji63L/yZMYSxvdHZqNZqcBqGrtpZyQRdpgL+NBy6khEbSUdbm3vVjUNBMWcK2YPQ3
	XH0eZQyxEJokjPZwvzMpO1H2D3HMQrszAOgN2bPgVzyeNxLjtx6T5PuypKrbG21478Rw=;
Message-ID: <a9dac3d6-fc12-4caf-b61e-d189d3deaaf9@xen.org>
Date: Tue, 15 Apr 2025 19:08:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-3-luca.fancellu@arm.com>
 <d58be435-fd83-42bc-9fd0-a8884f358704@xen.org>
 <1A24757A-ECCB-4080-B370-DA44D469CC7D@arm.com>
 <6a681c92-8c61-43f5-b266-b0306bc0b1ce@xen.org>
 <72B2783C-AF90-4154-8EF9-4F81A0A537B2@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <72B2783C-AF90-4154-8EF9-4F81A0A537B2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15/04/2025 17:08, Luca Fancellu wrote:
> Hi Julien,
> 
>>>>>   +/*
>>>>> + * The following are needed for the case generators GENERATE_WRITE_PR_REG_CASE
>>>>> + * and GENERATE_READ_PR_REG_CASE with num==0
>>>>> + */
>>>>> +#define PRBAR0_EL2 PRBAR_EL2
>>>>> +#define PRLAR0_EL2 PRLAR_EL2
>>>>
>>>> Rather than aliasing, shouldn't we just rename PR{B,L}AR_EL2 to PR{B,L}AR0_EL2? This would the code mixing between the two.
>>> PR{B,L}AR0_ELx does not exists really, the PR{B,L}AR<n>_ELx exists for n=1..15, here I’m only using this “alias” for the generator,
>>> but PR{B,L}AR_EL2 are the real register.
>>
>> In this case, can PR{B,L}AR0_EL2 defined in mm.c so they are not used anywhere else?
> 
> So this was the case in my previous serie, but Ayan asked me to put them in
> here because PRBAR_EL2 is arm64 specific, not sure now, shall we move it back
> and protect it with CONFIG_ARM_64?

Yes. I don't thikn PRBAR0_EL2 should be exposed.

Cheers,

-- 
Julien Grall



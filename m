Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959CF63483D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 21:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447308.703397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZyG-0008IW-5G; Tue, 22 Nov 2022 20:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447308.703397; Tue, 22 Nov 2022 20:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxZyG-0008Gk-2P; Tue, 22 Nov 2022 20:34:20 +0000
Received: by outflank-mailman (input) for mailman id 447308;
 Tue, 22 Nov 2022 20:34:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxZyF-0008Ge-1H
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 20:34:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZyE-00084S-Q9; Tue, 22 Nov 2022 20:34:18 +0000
Received: from [54.239.6.190] (helo=[192.168.0.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxZyE-0004FZ-J2; Tue, 22 Nov 2022 20:34:18 +0000
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
	bh=YRCf3Cb9sV3u/9CW8RMMLA+FoblCwH67IYd9aX7eNJM=; b=XGhn9H4P5p1i0gW5ghNQ+TlTjr
	2NsJM2evIRc7TuTzOLi61yWgJIx1m51zH50NS3p7FlONGBTI5gGIvrNqZ2Rb+CpWj50G0s015dI1c
	xeJuuTmjq8UfFlaky05XVNEEa12U53NrPVJBlOm6Ob1Y1WZa6TD13U9/SZvOx67wEVI8=;
Message-ID: <5925c335-0f4b-6221-24cd-07fed8f0e678@xen.org>
Date: Tue, 22 Nov 2022 21:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v3 03/12] xen/Arm: vreg: Support vreg_reg64_* helpers on
 AArch32
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, jgrall@amazon.com, burzalodowa@gmail.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-4-ayan.kumar.halder@amd.com>
 <a2a471dc-f757-940b-c0bb-2eba696e5a70@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a2a471dc-f757-940b-c0bb-2eba696e5a70@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 17/11/2022 13:11, Michal Orzel wrote:
> On 11/11/2022 15:17, Ayan Kumar Halder wrote:
>> In some situations (e.g. GICR_TYPER), the hypervior may need to emulate
>> 64bit registers in AArch32 mode. In such situations, the hypervisor may
>> need to read/modify the lower or upper 32 bits of the 64 bit register.
>>
>> In AArch32, 'unsigned long' is 32 bits. Thus, we cannot use it for 64 bit
>> registers.
>>
>> While we could replace 'unsigned long' by 'uint64_t', it is not entirely clear
>> whether a 32-bit compiler would not allocate register for the upper 32-bit.
>> Therefore fold vreg_reg_* helper in the size specific one and use the
>> appropriate type based on the size requested.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


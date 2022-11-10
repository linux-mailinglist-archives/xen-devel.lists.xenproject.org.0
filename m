Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC0624A26
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 20:04:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442134.696164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otCpd-0004wZ-Lq; Thu, 10 Nov 2022 19:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442134.696164; Thu, 10 Nov 2022 19:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otCpd-0004ti-Iv; Thu, 10 Nov 2022 19:03:21 +0000
Received: by outflank-mailman (input) for mailman id 442134;
 Thu, 10 Nov 2022 19:03:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1otCpb-0004tc-Uy
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 19:03:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otCpb-0006nY-Cm; Thu, 10 Nov 2022 19:03:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.6.115]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otCpa-0001ma-VA; Thu, 10 Nov 2022 19:03:19 +0000
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
	bh=kRZNe64XznxWHyXRAN3SMueTiN1/weR4zBnn2Lp6AXM=; b=0B23unkqry+7ChEaEMjleREj1X
	bU5NpaNdqvsnW0FMFAEgozgwTeSeBkuMOkcSmvhLahbhg1UCgTKChAdWPtihrYNuJN8pPVvaXwFkE
	mund4WJHHCNo1YR9wg6p/UZDoPZN3h5VhgiBmhwZAe38UeMWT1TG/2fkZ7Zgg45NH90U=;
Message-ID: <6adb621c-e3ef-ec22-fb46-3c04f52d0b8a@xen.org>
Date: Thu, 10 Nov 2022 19:03:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v3] xen/arm: Enforce alignment check in debug build for
 {read, write}_atomic
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefanos@xilinx.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Ayan Kumar Halder <ayankuma@amd.com>
References: <20221108094503.40253-1-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2211091600180.50442@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2211091600180.50442@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/11/2022 00:00, Stefano Stabellini wrote:
> On Tue, 8 Nov 2022, Ayan Kumar Halder wrote:
>> From: Ayan Kumar Halder <ayankuma@amd.com>
>>
>> Xen provides helper to atomically read/write memory (see {read,
>> write}_atomic()). Those helpers can only work if the address is aligned
>> to the size of the access (see B2.2.1 ARM DDI 08476I.a).
>>
>> On Arm32, the alignment is already enforced by the processor because
>> HSCTLR.A bit is set (it enforce alignment for every access). For Arm64,
>> this bit is not set because memcpy()/memset() can use unaligned access
>> for performance reason (the implementation is taken from the Cortex
>> library).
>>
>> To avoid any overhead in production build, the alignment will only be
>> checked using an ASSERT. Note that it might be possible to do it in
>> production build using the acquire/exclusive version of load/store. But
>> this is left to a follow-up (if wanted).
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Signed-off-by: Julien Grall <julien@xen.org>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

I have pushed this patch in a branch for-next/4.18 on my public repo. I 
will apply the patch to staging once the tree re-opened.

Cheers,

-- 
Julien Grall


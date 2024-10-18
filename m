Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBB9A4943
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 23:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822185.1236158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ur7-0000me-Pq; Fri, 18 Oct 2024 21:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822185.1236158; Fri, 18 Oct 2024 21:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ur7-0000lA-N3; Fri, 18 Oct 2024 21:49:57 +0000
Received: by outflank-mailman (input) for mailman id 822185;
 Fri, 18 Oct 2024 21:49:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1ur5-0000l4-QY
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 21:49:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1ur5-0005rG-Ho; Fri, 18 Oct 2024 21:49:55 +0000
Received: from [2a02:8012:3a1:0:11d8:dae4:636f:615c]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1ur5-0003h5-91; Fri, 18 Oct 2024 21:49:55 +0000
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
	bh=e0c9y30/PkyRqGXPgFiq4cMngAF6UndroV3+nRgB5A4=; b=hFzSElx65jpb63IJKhdxb6u3po
	B2YhMsmstFX0xN3aomQkyInMbXkAf25s/a0PVcOsinnX7gdi0o0VxJhUhdelqDovKcnDJvulnO17q
	VdvtxAIC3znQ1djVK+8cgzxu5/Nvbiepu/ZZoF5K0w/EnRR4GNaCHqHAYlxgujWMKmB8=;
Message-ID: <2969514c-932b-4fc7-a762-2f9998296462@xen.org>
Date: Fri, 18 Oct 2024 22:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>,
 "frediano.ziglio@cloud.com" <frediano.ziglio@cloud.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-4-ayan.kumar.halder@amd.com>
 <8AE12285-F017-4FC9-9F9C-6218257211F9@arm.com>
 <9c19c7a3-2e1e-43e3-88c4-ff8c02b4adfe@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <9c19c7a3-2e1e-43e3-88c4-ff8c02b4adfe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/10/2024 17:24, Ayan Kumar Halder wrote:
> Hi,

Hi Ayan & Luca,

> On 14/10/2024 19:53, Luca Fancellu wrote:
>> + Frediano for suggestion about header protection define name
>>
>>> +++ b/xen/arch/arm/include/asm/mpu/layout.h
>>> @@ -0,0 +1,33 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __ARM_MPU_LAYOUT_H__
>>> +#define __ARM_MPU_LAYOUT_H__
>> I think we are moving away from this notation:
>> https://patchwork.kernel.org/project/xen-devel/patch/20241004081713.749031-6-frediano.ziglio@cloud.com/
>> Shall this be ASM___ARM__MPU__LAYOUT_H ? @Frediano
> 
> I could see that the patch hasn't been Rb yet and as per 
> https://patchwork.kernel.org/project/xen-devel/cover/20241004081713.749031-1-frediano.ziglio@cloud.com/ , the new coding style is still under discussion.
> 
> May be the Arm maintainers (Stefano, Julien, Bertrand, Michal) can 
> provide their opinion on this.

The current guideline is been debating within among the committers. For 
now, please ignore the guideline.

Cheers,

-- 
Julien Grall


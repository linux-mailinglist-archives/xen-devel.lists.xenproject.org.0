Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8916C64673C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 03:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456773.714586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p36xU-0005Ut-GZ; Thu, 08 Dec 2022 02:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456773.714586; Thu, 08 Dec 2022 02:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p36xU-0005Sc-Dx; Thu, 08 Dec 2022 02:48:24 +0000
Received: by outflank-mailman (input) for mailman id 456773;
 Thu, 08 Dec 2022 02:48:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=miOe=4G=zlw.email=sisyphean@srs-se1.protection.inumbo.net>)
 id 1p36xR-0005SW-Iz
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 02:48:22 +0000
Received: from mail.zlw.email (unknown [112.49.95.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdd26eec-76a2-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 03:48:18 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
 by mail.zlw.email (Postfix) with ESMTP id C711D173F34;
 Thu,  8 Dec 2022 02:48:24 +0000 (UTC)
Received: from mail.zlw.email ([127.0.0.1])
 by localhost (mail.zlw.email [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKdH68aT08z2; Thu,  8 Dec 2022 10:48:22 +0800 (CST)
Received: from [192.168.66.233] (OpenWrt.lan [192.168.66.1])
 by mail.zlw.email (Postfix) with ESMTPSA id 9EB54173BFC;
 Thu,  8 Dec 2022 10:48:21 +0800 (CST)
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
X-Inumbo-ID: bdd26eec-76a2-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlw.email; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:to:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id; s=dkim; t=
	1670467702; x=1673059703; bh=yDq4Dr6UhgYURsOv/3WUc3CtNSV7lwxc1NT
	3XNdonlo=; b=kAdt6tLKNHUr6ZqBBvXlk5tcE9LuOz51goTagIYz5iyNHi2fKwa
	Xf9qu+P4fzJHrI/NkUK2jAnDHeyDq/Dmi0/RDFbI9+TLHhr6advGLPwltJTByTQD
	qBSRChX9SHtURLb2aFHF0fXZF5Fz405B4DROYnSIdA+Y82jd5nZssL4A=
X-Virus-Scanned: amavisd-new at zlw.email
Message-ID: <ad2fe136-7a22-8435-143d-783fcbdab001@zlw.email>
Date: Thu, 8 Dec 2022 10:48:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [BUG]SMMU-V3 queue need no-cache memory
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: julien@xen.org, sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <e1e0e347-6530-7b68-92f7-ef52defa55ac@zlw.email>
 <75D89B2C-BBE4-419A-80B7-FEE39445ABB2@arm.com>
From: sisyphean <sisyphean@zlw.email>
In-Reply-To: <75D89B2C-BBE4-419A-80B7-FEE39445ABB2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul Singh,

在 2022/12/7 18:24, Rahul Singh 写道:
> Hi Sisyphean,
>
>> On 7 Dec 2022, at 2:04 am, sisyphean <sisyphean@zlw.email> wrote:
>>
>> Hi,
>>
>>      I try to run XEN on my ARM board(Sorry, for some commercial reasons, I can't tell you
>>      on which platform I run XEN)  and enable SMMU-V3, but all cmds in cmdq failed when XEN started.
>>
>>      After using the debugger to track debugging, the reason for this problem is that
>>      the queue in the smmu-v3 driver is not no-cache, so after the function arm_smmu_cmdq_build_cmd
>>      is executed, the cmd is still in cache.Therefore, the SMMU-V3 hardware cannot obtain the correct cmd
>>      from the memory for execution.
> Yes you are right as of now we are allocating the memory for cmdqueue via _xzalloc() which is cached
> memory because of that you are observing the issue. We have tested the Xen SMMUv3 driver on SOC
> where SMMUv3 HW is in the coherency domain, and because of that we have not encountered this issue.
>
> I think In your case SMMUv3 HW is not in the coherency domain. Please confirm from your side if the
> "dma-coherent” property is not set in DT.
>
> I think there is no function available as of now to request Xen to allocate memory that is not cached.
>
> @Julien and @Stefano do you have any suggestion on how we can request memory from Xen that is not
> cached something like dma_alloc_coherent() in Linux.
>
> Regards,
> Rahul
I have tried to set "dma-coherent" and not set "dma-coherent" in DT. The 
results are consistent, and
SMMUv3 HW cannot get the correct cmd from memory


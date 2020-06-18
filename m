Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8841FFA7B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 19:46:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlycG-0004Mi-Ow; Thu, 18 Jun 2020 17:46:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AXO0=77=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jlycE-0004Md-RI
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 17:46:18 +0000
X-Inumbo-ID: 9cd39b0c-b18b-11ea-bad6-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cd39b0c-b18b-11ea-bad6-12813bfff9fa;
 Thu, 18 Jun 2020 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VBX4pk3vzbZUK3ycpONoacX6vu9VZUWAfcvVsS1/NiI=; b=v6d4jRcYa9tJh3hs5BngBPWAZ2
 GlqtY6KQPcKp9Lb4zgu+FX8M6whInSDGRoDS2cQxV0R0v8/bgpWW96ZjddAA+LM/RD6i0LqCr0iZ4
 ZuIH9J3b8hhAbKlY+QXVd6b7n/H8Cl/T73B6TajsT8WElsbEJ+R7b8fMjlv1ZyhKUKPM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlyc6-0006HA-9q; Thu, 18 Jun 2020 17:46:10 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlyc6-0000VK-2c; Thu, 18 Jun 2020 17:46:10 +0000
Subject: Re: [PATCH 2/2] xen/arm: Mitigate straight-line speculation for SMC
 call
To: security@xenproject.org
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-3-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <0ae27312-f8ab-e3b6-fbaa-a4aba4905405@xen.org>
Date: Thu, 18 Jun 2020 18:46:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616175913.7368-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, paul@xen.org, Andre.Przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 16/06/2020 18:59, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> SMC call will update some of registers (typically only x0) depending on
> the arguments provided.
> 
> Some CPUs can speculate past a SMC instruction and potentially perform
> speculative access to emrmoy using the pre-call values before executing
> the SMC.
> 
> There is no known gadget available after the SMC call today. However
> some of the registers may contain values from the guest and are expected
> to be updated by the SMC call.
> 
> In order to harden the code, it would be better to prevent straight-line
> speculation from an SMC. Architecturally executing the speculation
> barrier after every SMC can be rather expensive (particularly on core
> not SB). Therefore we want to mitigate it diferrently:
> 
>      * For arm_smccc_1_0_smc, we can avoid a speculation barrier right
>      after the SMC instruction and instead rely on the one after eret.
>      * For arm_smccc_1_1_smc, we can place a B instruction after the SMC
>      instruction to skip the barrier.
> 
> Note that arm_smccc_1_0_smc version on arm32 is just an alias to
> arm_smccc_1_1_smc.
> 
> Note that no speculation barrier has been added after the SMC
> instruction in arm64/entry.S. This is fine because the call is not
> expected to modify any registers. So straight-line speculation doesn't
> matter.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Note this hasn't been vetted by Arm but they are using the same
> sort of mitigation for blr. So I am quite confident this could do the
> trick.

Actually there is some unknown on whether this may introduce issue on 
other sort of speculation. As there is no known reveal gadge after the 
SMC call and this is only about prevention, I will withdraw this patch 
for the time being.

Patch #1 is still valid though.

Cheers,

-- 
Julien Grall


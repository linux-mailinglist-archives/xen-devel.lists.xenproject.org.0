Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50195A65B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 23:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781507.1191009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgseu-0006GM-3z; Wed, 21 Aug 2024 21:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781507.1191009; Wed, 21 Aug 2024 21:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgseu-0006E0-1H; Wed, 21 Aug 2024 21:14:24 +0000
Received: by outflank-mailman (input) for mailman id 781507;
 Wed, 21 Aug 2024 21:14:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sgset-0006Du-A6
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 21:14:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sgses-0003mz-6N; Wed, 21 Aug 2024 21:14:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sgser-0001MY-TL; Wed, 21 Aug 2024 21:14:22 +0000
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
	bh=Cx4ssKakeEdCwyas0wHUJUaML984dvzkX+lxx17QvQA=; b=OgH0k58BCqL7VCVKf/9RDktz+b
	PEgv+Uz5ib+OBRjhYjEAx5ubzX7cPeUFVPDIlD+nkLBjRfnxoCuFYd0/Ln2C1AZXA35WKl+mtAXSR
	0IwFQMlCs8LE3jUt4n4Rg5U/0DRPY3q2ghTS/KgcaRpsmjO7//O7+ql+Hr5IfUodw8wI=;
Message-ID: <cd2e6b08-ce76-4707-831a-c21b05ca85cf@xen.org>
Date: Wed, 21 Aug 2024 22:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: make VMAP support in MMU system only
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>
References: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
 <20240821122503.2315844-5-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240821122503.2315844-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/08/2024 13:25, Ayan Kumar Halder wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> Introduce CONFIG_VMAP which is selected by the architectures that use
> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
> 
> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
> with new memory attributes. Since this is highly dependent on virtual
> address translation, we choose to fold VMAP in MMU system.
> 
> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
> only support in MMU system on ARM architecture. And ALTERNATIVE now
> depends on VMAP.
> 
> HARDEN_BRANCH_PREDICTOR is now gated on MMU as speculative
> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
> See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.

I don't have a strong opinion on whether it should be split. But I do 
agree this deserves a bit more explanation.

Also, as I mentioned before, speculative attacks may be possible on 
non-MMU based systems. In fact some the Cortex-R are in the affected 
list... The R82 and R52 are not listed, but note:

"For information about any unlisted processors please contact Arm".

So how about the following explanation:

"At the moment, the users of HARDEN_BRANCH_PREDICTOR requires to use the 
vmap() to update the exceptions vectors. While it might be possible to 
rework the code, it is believed that speculative attackes would be 
difficult to exploit on non-MMU because the software is tightly 
controlled. So for now make HARDEN_PREDICTOR to depend on the !MMU.

> 
> Also took the opportunity to remove "#ifdef VMAP_VIRT_START .. endif"
> from vmap.c. Instead vmap.c is compiled when HAS_VMAP is enabled. Thus,
> HAS_VMAP is now enabled from x86, ppc and riscv architectures as all of
> them use MMU and has VMAP_VIRT_START defined.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

With the typo pointed out by Jan:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


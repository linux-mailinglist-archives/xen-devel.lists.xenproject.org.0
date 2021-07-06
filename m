Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03523BC83B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 11:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150930.279006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gyn-0001nE-JH; Tue, 06 Jul 2021 09:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150930.279006; Tue, 06 Jul 2021 09:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gyn-0001l2-GF; Tue, 06 Jul 2021 09:02:57 +0000
Received: by outflank-mailman (input) for mailman id 150930;
 Tue, 06 Jul 2021 09:02:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0gyl-0001ku-Sw
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 09:02:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0gyd-0005M4-2x; Tue, 06 Jul 2021 09:02:47 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0gyc-0006QO-SY; Tue, 06 Jul 2021 09:02:47 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=P/SQsoY0SDIFTAMieQvhtlHws74JqQMmVyprDpj+wzA=; b=F2erenH3fl3td2EiOFlji/0OUM
	Z6z24JC0CM7WdCs3mfBo0uqFfdeT21n7vcSW3MmQ9EbAXfvuJ8EFWzNP6EsFqicA1INvgWhOrWFou
	zg44zVAu3y1DghCvoL4lXkcP/5NkN70xzZtN/xme7SC6gg6U+qIdIhTv/ervN4ShNUVc=;
Subject: Re: [PATCH v4] arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com
References: <20210705063952.25629-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <36597cf4-eca9-2263-3f4d-3ac6c69a257a@xen.org>
Date: Tue, 6 Jul 2021 10:02:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705063952.25629-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 05/07/2021 07:39, Michal Orzel wrote:
> AArch64 registers are 64bit whereas AArch32 registers
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 registers have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify type of hsr, cpsr, spsr_el1 to uint64_t.
> Previously we relied on the padding after spsr_el1.
> As we removed the padding, modify the union to be 64bit so we don't corrupt spsr_fiq.
> No need to modify the assembly code because the accesses were based on 64bit
> registers as there was a 32bit padding after spsr_el1.
> 
> Remove 32bit padding in cpu_user_regs before spsr_fiq
> as it is no longer needed due to upper union being 64bit now.
> Add 64bit padding in cpu_user_regs before spsr_el1
> because the kernel frame should be 16-byte aligned.
> 
> Change type of cpsr to uint64_t in the public outside interface
> "public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
> Increment XEN_DOMCTL_INTERFACE_VERSION.
> 
> Change type of cpsr to uint64_t in the public outside interface
> "public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

and committed.

Cheers,

-- 
Julien Grall


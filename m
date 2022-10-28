Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC80610C6D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 10:43:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431754.684373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooKxB-0006Qf-O3; Fri, 28 Oct 2022 08:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431754.684373; Fri, 28 Oct 2022 08:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooKxB-0006OH-LC; Fri, 28 Oct 2022 08:43:01 +0000
Received: by outflank-mailman (input) for mailman id 431754;
 Fri, 28 Oct 2022 08:43:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ooKxA-0006OB-3x
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 08:43:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooKx9-00076J-MD; Fri, 28 Oct 2022 08:42:59 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.25.146]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooKx9-0002Cu-Ds; Fri, 28 Oct 2022 08:42:59 +0000
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
	bh=+0wGAR4JBxoi6WuT0gI6g9XX9jgPWnYWkAU7fmXHg0M=; b=fJ9XFUS0OCxSA/KtTfmUJ5VlJ9
	aiGekVzfM4XWUxQVxVWMMqhQWZw24e+awolwis/SeP+VmN3MPAjloxHAsV1TNTOsSMeckpRPdXNiX
	E6zmJwovVlKLdJYbeYG7AdUN/JgbyEt+BuDkNpHgd3w2NtcS/QVpBQpBZ8pC+CdJhEoE=;
Message-ID: <8d7fb5c6-b1f4-e6ea-76cd-a3b98b2fcb52@xen.org>
Date: Fri, 28 Oct 2022 09:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v5] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, Henry.Wang@arm.com
References: <20221027185555.46125-1-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221027185555.46125-1-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 27/10/2022 19:55, Ayan Kumar Halder wrote:
> If a guest is running in 32 bit mode and it tries to access
> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
> This will be stored in a 64bit cpu register.
> So now we have the top 32 bits of GICR_PENDBASER (a 64 bit MMIO register) stored
> in the lower 32 bits of the 64bit cpu register.
> 
> This 64bit cpu register is then modified bitwise with a mask (ie
> GICR_PENDBASER_PTZ, it clears the 62nd bit). But the PTZ (which is bit 30 in the
> 64 bit cpu register) is not cleared as expected by the specification.
> 
> The correct thing to do here is to store the value of
> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
> vreg_reg64_extract() which will extract 32 bits from the given offset.
> 
> Also, we have removed spin_lock_irqsave()/spin_unlock_irqrestore() to protect
> v->arch.vgic.rdist_pendbase in __vgic_v3_rdistr_rd_mmio_read(). The reason
> being v->arch.vgic.rdist_pendbase is now being read in an atomic manner.
> 
> Similarly in __vgic_v3_rdistr_rd_mmio_write(), we have used read_atomic(),
> write_atomic() to read/write v->arch.vgic.rdist_pendbase.
> 
> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3DA64BE52
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 22:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461197.719256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Clg-0001OF-Rd; Tue, 13 Dec 2022 21:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461197.719256; Tue, 13 Dec 2022 21:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Clg-0001LG-OA; Tue, 13 Dec 2022 21:24:52 +0000
Received: by outflank-mailman (input) for mailman id 461197;
 Tue, 13 Dec 2022 21:24:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5Clf-0001L4-Je
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:24:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5Clf-0003nv-IT
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:24:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Clf-0000qP-Dh; Tue, 13 Dec 2022 21:24:51 +0000
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
	bh=gXnhtS/3l/O6hELM/t7xtIGJEw2w5M5KOEgxTgmFHh0=; b=XKvNn8T/IlMHqSmyCfQ7/I8Bs+
	yaNTVHrz5L9qOEldEqVKIyWWm8asbAhsBzfF5YzfKGFtq/6OpF+7ruKz+TbAmN3Ap4VGwaSeaHvQg
	g4f5Ft9HAe2QUsA76GuXkZnK5voB0FzSoEDVN05T5z7kbsp+Z1MeKa2QvUGDG3D0RuM4=;
Message-ID: <6849354d-6e45-11f3-6c8c-c1cdeae2ffb2@xen.org>
Date: Tue, 13 Dec 2022 21:24:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v5 10/11] xen/Arm: GICv3: Define macros to read/write 64 bit
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
 <20221205132637.26775-11-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221205132637.26775-11-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/12/2022 13:26, Ayan Kumar Halder wrote:
> On AArch32, ldrd/strd instructions are not atomic when used to access MMIO.
> Furthermore, ldrd/strd instructions are not decoded by Arm when running as
> a guest to access emulated MMIO region.
> Thus, we have defined readq_relaxed_non_atomic()/writeq_relaxed_non_atomic()
> which in turn calls readl_relaxed()/writel_relaxed() for the lower and upper
> 32 bits.
> For AArch64, readq_relaxed_non_atomic()/writeq_relaxed_non_atomic() invokes
> readq_relaxed()/writeq_relaxed() respectively.
> As GICv3 registers (GICD_IROUTER, GICR_TYPER) can be accessed in a non atomic
> manner, so we have used readq_relaxed_non_atomic()/readq_relaxed_non_atomic().
> 
> However, the following points are noted for the non atomic access :-
> 1. In gicv3_dist_init(), using non atomic write on GICD_IROUTER is fine as this
> gets invoked when interrupts are disabled.
> 2. In gicv3_populate_rdist(), using non atomic read on GICR_TYPER is fine as
> the register is read and the interrupts are disabled as well.
> 3. In gicv3_irq_set_affinity(), using non atomic write on GICD_IROUTER. This
> may be called with interrupts enabled. So, a non-atomic access (on AArch32)
> means the GIC will see a transient value when only one of two 32-bit will be
> updated. However, only AFF3 is defined in the upper 32 bits and they are 0, so
> this will never change.
> On AArch64, writeq_relaxed_non_atomic() invokes writeq_relaxed() (which is
> atomic), so this problem does not arise.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


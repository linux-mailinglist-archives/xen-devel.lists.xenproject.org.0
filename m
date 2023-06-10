Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A009872AE2C
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 20:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546588.853568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q83eM-0003hj-In; Sat, 10 Jun 2023 18:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546588.853568; Sat, 10 Jun 2023 18:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q83eM-0003eQ-Fo; Sat, 10 Jun 2023 18:49:22 +0000
Received: by outflank-mailman (input) for mailman id 546588;
 Sat, 10 Jun 2023 18:49:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q83eL-0003eK-2O
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 18:49:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q83eK-0004Cg-Dl; Sat, 10 Jun 2023 18:49:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q83eK-00084S-81; Sat, 10 Jun 2023 18:49:20 +0000
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
	bh=N7vTGnehv2z7weMC3moTpV9z7poBegXWfouw5w7j+O8=; b=A0nKJGzIfeK8z5oGZ+jtJrv/wm
	hmVmf6cU0W/DzZxGoXc/8/s/gXe/bJOccyvnq642gk4keYTcQqwFoBQQaWooOA9XfMwh+4i4IXvOX
	qT109d5/3cVkePAUnXL+SZz0WNBU00kdd/rX4LXnwE22IrdbSZhNuBjERzSNlPk/s/S8=;
Message-ID: <f4d42fa6-33fb-379c-b2ff-d5e818d53442@xen.org>
Date: Sat, 10 Jun 2023 19:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v7 1/5] xen/arm32: head: Widen the use of the temporary
 mapping
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-2-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230416143211.72227-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 16/04/2023 15:32, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, the temporary mapping is only used when the virtual
> runtime region of Xen is clashing with the physical region.
> 
> In follow-up patches, we will rework how secondary CPU bring-up works
> and it will be convenient to use the fixmap area for accessing
> the root page-table (it is per-cpu).
> 
> Rework the code to use temporary mapping when the Xen physical address
> is not overlapping with the temporary mapping.
> 
> This also has the advantage to simplify the logic to identity map
> Xen.

I had to revert this patch a couple of months ago because Xen was not 
booting anymore on the Arndale. I finally managed to figure out what was 
the issue. It was an interesting read through the Arm Arm.

In switch_to_runtime_mapping we have the following code:

         flush_xen_tlb_local r0

         /* Map boot_second into boot_pgtable */
         mov_w r0, XEN_VIRT_START
         create_table_entry boot_pgtable, boot_second, r0, 1

         /* Ensure any page table updates are visible before continuing */
         dsb   nsh

ready_to_switch:
         mov   pc, lr

Per Arm Arm (Armv7 ARM DDI 0406C.d, section A3-148):

"The DMB and DSB memory barriers affect reads and writes to the memory 
system generated by load/store
instructions and data or unified cache maintenance operations being 
executed by the processor. Instruction fetches
or accesses caused by a hardware translation table access are not 
explicit accesses."

In the example above, 'lr' points to a region covered by the mapping we 
created just above. As the 'dsb' doesn't affect instruction fetch, it 
means it could happen before the page-table entry was observed and 
therefore result to a translation fault.

There is another situation where this could happen (taken from Linux 
commit d0b7a302d58a "Revert "arm64: Remove unnecessary ISBs from 
set_{pte,pmd,pud}"):

             MOV     X0, <valid pte>
             STR     X0, [Xptep]     // Store new PTE to page table
             DSB     ISHST
             LDR     X1, [X2]        // Translates using the new PTE

The dsb needs to be followed by an isb otherwise, a translation fault 
could occur.

There are a few places in where where the isb is missing. I think we 
didn't notice it before because we don't often create a new PTE and then 
directly access it.

Note that this issue is not in this patch but in fbd9b5fb4c26 
("xen/arm32: head: Remove restriction where to load Xen"). We didn't 
notice it because the temporary mapping wasn't much used before.

I will prepare a patch series to add the missing isb.

Cheers,

-- 
Julien Grall


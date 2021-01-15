Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0042F7955
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 13:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68047.121722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0OMA-00059f-4i; Fri, 15 Jan 2021 12:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68047.121722; Fri, 15 Jan 2021 12:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0OMA-00059H-1X; Fri, 15 Jan 2021 12:37:34 +0000
Received: by outflank-mailman (input) for mailman id 68047;
 Fri, 15 Jan 2021 12:37:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0OM8-00059C-Hd
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 12:37:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0OM4-0003Ry-PC; Fri, 15 Jan 2021 12:37:28 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0OM4-000643-E2; Fri, 15 Jan 2021 12:37:28 +0000
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
	bh=O1doWoMtjwAahZzbOz9GQnx/sjiRe75MXQjnqG0Lr8o=; b=vhWqfnMcjdCjILZDndfLpKK+QE
	Cv3Q7hGDTsUgqHLnNGlOCaNgyh2vCxLWPlzZvzHfzha462OQOA+OQlm8xrBkaEfV76SmEmpPPUtVa
	eABCJ1OGaOx5Oah8Di1tltMte8gVsVa6jlMBtkHh8v9vz0BSyUsxt36PpkJXaxQRIeFk=;
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <884262e5-3292-6b29-d4a2-49b92d974998@xen.org>
Date: Fri, 15 Jan 2021 12:37:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 08/01/2021 14:46, Rahul Singh wrote:
> Add support for ARM architected SMMUv3 implementation. It is based on
> the Linux SMMUv3 driver.
> 
> Driver is currently supported as Tech Preview.
> 
> Major differences with regard to Linux driver are as follows:
> 2. Only Stage-2 translation is supported as compared to the Linux driver
>     that supports both Stage-1 and Stage-2 translations.
> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>     capability to share the page tables with the CPU.
> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>     and priority queue IRQ handling.
> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>     access functions based on atomic operations implemented in Linux.
>     Atomic functions used by the commands queue access functions are not
>     implemented in XEN therefore we decided to port the earlier version
>     of the code. Atomic operations are introduced to fix the bottleneck
>     of the SMMU command queue insertion operation. A new algorithm for
>     inserting commands into the queue is introduced, which is lock-free
>     on the fast-path.
>     Consequence of reverting the patch is that the command queue
>     insertion will be slow for large systems as spinlock will be used to
>     serializes accesses from all CPUs to the single queue supported by
>     the hardware. Once the proper atomic operations will be available in
>     XEN the driver can be updated.
> 6. Spin lock is used in place of mutex when attaching a device to the
>     SMMU, as there is no blocking locks implementation available in XEN.
>     This might introduce latency in XEN. Need to investigate before
>     driver is out for tech preview.
> 7. PCI ATS functionality is not supported, as there is no support
>     available in XEN to test the functionality. Code is not tested and
>     compiled. Code is guarded by the flag CONFIG_PCI_ATS.
> 8. MSI interrupts are not supported as there is no support available in
>     XEN to request MSI interrupts. Code is not tested and compiled. Code
>     is guarded by the flag CONFIG_MSI.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Aside what Oleksandr pointed out, this code looks ok to me.

Cheers,

-- 
Julien Grall


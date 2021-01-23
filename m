Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027623014EC
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 12:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73277.132091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3HVb-0000Ks-7l; Sat, 23 Jan 2021 11:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73277.132091; Sat, 23 Jan 2021 11:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3HVb-0000KT-4M; Sat, 23 Jan 2021 11:55:15 +0000
Received: by outflank-mailman (input) for mailman id 73277;
 Sat, 23 Jan 2021 11:55:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l3HVZ-0000KJ-J3
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 11:55:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l3HVV-0005bN-QX; Sat, 23 Jan 2021 11:55:09 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l3HVV-0008Dn-GP; Sat, 23 Jan 2021 11:55:09 +0000
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
	bh=4t7p09Yyty8AlkWbzZZL9fvWfZhGW0mVSz1SQe+Tjq8=; b=N04dUgz1Q/989Gh+K3UIps7fZI
	4/iQHb8nFjSd/WWWb50NtUrcoYvrdf9YLl8B9z6nQFiUyrfX5DhBxuVNJWunQmLUfy8E4gwblDOPo
	jop8n7Y1+hyhqGwKN9t3atI+qaNlWKqgQAkCBM1eBe0p3NMFdYXhkPsWEjgkl4w+Xhys=;
Subject: Re: [PATCH v6 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <388adde9a060eb9fc685cc743a354361fcdf0374.1611314782.git.rahul.singh@arm.com>
 <df3a76bc971a09daf4e61361bbc635e82cf9b59e.1611314782.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1a7e0989-29c6-7c7e-43a1-0caa11caad61@xen.org>
Date: Sat, 23 Jan 2021 11:55:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <df3a76bc971a09daf4e61361bbc635e82cf9b59e.1611314782.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul

On 22/01/2021 11:37, Rahul Singh wrote:
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
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thank you for sending a new version. I have commited the series now.

Cheers,

-- 
Julien Grall


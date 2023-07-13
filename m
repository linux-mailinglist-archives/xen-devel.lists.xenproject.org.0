Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1244752A67
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 20:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563365.880585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK1HA-0002Y3-OH; Thu, 13 Jul 2023 18:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563365.880585; Thu, 13 Jul 2023 18:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK1HA-0002WO-LV; Thu, 13 Jul 2023 18:42:52 +0000
Received: by outflank-mailman (input) for mailman id 563365;
 Thu, 13 Jul 2023 18:42:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qK1H8-0002WI-RB
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 18:42:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qK1H8-0000xY-Cx; Thu, 13 Jul 2023 18:42:50 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.30.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qK1H8-0005ru-7Q; Thu, 13 Jul 2023 18:42:50 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=uciWJ6ncC1UbU99qMDc1CGTA6jFa7k6eUckYNUY1O2A=; b=oks5VfMZoNF3gUNEW3zqcOt3J0
	qX8QzmveU7p+96vPjJ1GtIQtCNeuHwtf1ctL8eNPUWSwadKR7iPp83cDWlw5FPh40xYukxoiLKDjb
	MUIIPsywk3tDSm6R62Vo0P265f5tj9dZQVDd2pqmIsT2+sBKUVZN2oFYN/TlfabuTDA4=;
Message-ID: <c3ed2f28-4f71-d5cb-0e6e-a073a0ca1766@xen.org>
Date: Thu, 13 Jul 2023 19:42:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3] xen/arm: pci: fix check in pci_check_bar()
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Rahul Singh <Rahul.Singh@arm.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230712135226.747472-1-stewart.hildebrand@amd.com>
 <1FA588FD-8C55-4796-A75D-120D27AD5507@arm.com>
 <1a14cd31-0499-cb70-4da5-d355119c6355@xen.org>
In-Reply-To: <1a14cd31-0499-cb70-4da5-d355119c6355@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/07/2023 19:18, Julien Grall wrote:
> 
> 
> On 12/07/2023 18:04, Rahul Singh wrote:
>> Hi Stewart,
>>
>>> On 12 Jul 2023, at 2:52 pm, Stewart Hildebrand 
>>> <Stewart.Hildebrand@amd.com> wrote:
>>>
>>> When mapping BARs for vPCI, it's valid for a BAR mfn_t start to equal 
>>> the BAR
>>> mfn_t end (i.e. start == end) since end is inclusive. However, 
>>> pci_check_bar()
>>> currently returns false in this case, which results in Xen not 
>>> mapping the BAR
>>> in the guest 2nd stage page tables. In this example boot log, Linux 
>>> has mapped
>>> the BARs in the 1st stage, but since Xen did not map them in the 2nd 
>>> stage,
>>> Linux encounters a data abort and panics:
>>>
>>> [    2.593300] pci 0000:00:00.0: BAR 0: assigned [mem 
>>> 0x50008000-0x50008fff]
>>> [    2.593682] pci 0000:00:00.0: BAR 2: assigned [mem 
>>> 0x50009000-0x50009fff]
>>> [    2.594066] pci 0000:00:00.0: BAR 4: assigned [mem 
>>> 0x5000a000-0x5000afff]
>>> ...
>>> [    2.810502] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
>>> (XEN) 0000:00:00.0: not mapping BAR [50008, 50008] invalid position
>>> (XEN) 0000:00:00.0: not mapping BAR [50009, 50009] invalid position
>>> (XEN) 0000:00:00.0: not mapping BAR [5000a, 5000a] invalid position
>>> [    2.817502] virtio-pci 0000:00:00.0: virtio_pci: leaving for 
>>> legacy driver
>>> [    2.817853] virtio-pci 0000:00:00.0: enabling bus mastering
>>> (XEN) arch/arm/traps.c:1992:d0v0 HSR=0x00000093010045 
>>> pc=0xffff8000089507d4 gva=0xffff80000c46d012 gpa=0x00000050008012
>>> [    2.818397] Unable to handle kernel ttbr address size fault at 
>>> virtual address ffff80000c46d012
>>> ...
>>>
>>> Adjust the end physical address e to account for the full page when 
>>> converting
>>> from mfn, at which point s and e cannot be equal, so drop the 
>>> equality check in
>>> the condition.
>>>
>>> Note that adjusting e to account for the full page also increases the 
>>> accuracy
>>> of the subsequent is_bar_valid check.
>>>
>>> Fixes: cc80e2bab0d0 ("xen/pci: replace call to is_memory_hole to 
>>> pci_check_bar")
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I tested the patch on N1SDP board everything works.
>>
>> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
>> Tested-by: Rahul Singh <rahul.singh@arm.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall


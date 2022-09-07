Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582F55B0436
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401611.643491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuTv-0005Va-0p; Wed, 07 Sep 2022 12:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401611.643491; Wed, 07 Sep 2022 12:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuTu-0005UE-T1; Wed, 07 Sep 2022 12:48:38 +0000
Received: by outflank-mailman (input) for mailman id 401611;
 Wed, 07 Sep 2022 12:48:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVuTt-0005Tr-Ia
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:48:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVuTp-0005XY-KX; Wed, 07 Sep 2022 12:48:33 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVuTp-0001MF-Eb; Wed, 07 Sep 2022 12:48:33 +0000
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
	bh=JU2kpfk5qmFEZ4Ggvr8ncyUVTtSid99SstJtJyoSe2I=; b=AB1HdpCstB/09s+PRQGJTxFt37
	qnUOyABnjq4tokgj2vJ+isbon7qSx+Cr3517mDifGENU4CbzaHwbhR79tImY3XdyzxFvVxDYrlL6k
	DmDsYDb6Ob3pyqnb2piG4mNzfHoBnz1bVCZrh2B/VDoBtZJK7D+k2B+6y67s9a+Jupc0=;
Message-ID: <11fed186-7295-00b0-4fb9-50d08e63f364@xen.org>
Date: Wed, 7 Sep 2022 13:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1662548825.git.rahul.singh@arm.com>
 <d1db7461eb4ae3f9423814877c5ab6d946dae4e7.1662548825.git.rahul.singh@arm.com>
 <a7576b0c-2134-1778-7751-375cd4c02554@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a7576b0c-2134-1778-7751-375cd4c02554@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/09/2022 13:06, Jan Beulich wrote:
> On 07.09.2022 13:09, Rahul Singh wrote:
>> is_memory_hole was implemented for x86 and not for ARM when introduced.
>> Replace is_memory_hole call to pci_check_bar as function should check
>> if device BAR is in defined memory range. Also, add an implementation
>> for ARM which is required for PCI passthrough.
>>
>> On x86, pci_check_bar will call is_memory_hole which will check if BAR
>> is not overlapping with any memory region defined in the memory map.
>>
>> On ARM, pci_check_bar will go through the host bridge ranges and check
>> if the BAR is in the range of defined ranges.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v4:
>>   - check "s <= e" before callback
>>   - Add TODO comment for revisiting the function pci_check_bar() when
>>     ACPI PCI passthrough support is added.
>>   - Not Added the Jan Acked-by as patch is modified.
> 
> Hmm, I don't see any change to the parts the ack covers (x86 and common),
> so please re-instate. I'm not in the position to ack Arm changes; things
> would be different for a Reviewed-by without scope restriction.

I would like the question about the BAR alignment to be resolved before 
giving my Reviewed-by/Acked-by here.

Hopefully Stefano can clarify it.

Cheers,

-- 
Julien Grall


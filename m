Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653499E1E37
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 14:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848033.1263043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tITIk-0000PI-49; Tue, 03 Dec 2024 13:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848033.1263043; Tue, 03 Dec 2024 13:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tITIk-0000Mc-0n; Tue, 03 Dec 2024 13:50:54 +0000
Received: by outflank-mailman (input) for mailman id 848033;
 Tue, 03 Dec 2024 13:50:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tITIi-0000MW-Os
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 13:50:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tITIh-001xNR-3B;
 Tue, 03 Dec 2024 13:50:52 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tITIi-00CqQe-0G;
 Tue, 03 Dec 2024 13:50:52 +0000
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
	bh=uLa4qfKBHDtHVQTN8QYkqLF6xUntc/HcZWCWCPtBaOo=; b=ozAe1+3Y8tXnmZ06beD135I9bf
	H2WvUNzlVW5sNg/oZ82YXiCWrc1i8DK40KEsesGUY8D/Xz5tYsKYTdk8viLMi6XENeGqjvh90y0dF
	gOCiSdrAd/JO/3QXbibcqkMW5yU6ZDttwZ9LleAbPmlh5dutopVRQmMDX5BM9dWQl3I8=;
Message-ID: <f62e511e-40ab-453a-a907-6d27d074adba@xen.org>
Date: Tue, 3 Dec 2024 13:50:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
 <20241127183906.485824-2-ayan.kumar.halder@amd.com>
 <c44686fc-f4c0-428a-8a3f-ce17a7c589ae@xen.org>
 <41114d52-b618-4692-87f5-94de4b7ddeff@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <41114d52-b618-4692-87f5-94de4b7ddeff@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/12/2024 13:34, Ayan Kumar Halder wrote:
> 
> On 02/12/2024 20:53, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 27/11/2024 18:39, Ayan Kumar Halder wrote:
>>> CONFIG_EARLY_UART_SIZE is introduced to let user provide physical 
>>> size of
>>> early UART. Unlike MMU where we map a page in the virtual address space,
>>> here we need to know the exact physical size to be mapped.
>>> As VA == PA in case of MPU, the memory layout follows exactly the 
>>> hardware
>>> configuration. As a consequence, we set EARLY_UART_VIRTUAL_ADDRESS as 
>>> physical
>>> address.
>>>
>>> EARLY_UART_BASE_ADDRESS and EARLY_UART_SIZE should be aligned to the 
>>> minimum
>>> size of MPU region (ie 64 bits) as per the hardware restrictions. 
>>> Refer ARM
>>> DDI 0600A.d ID120821 A1.3 "A minimum protection region size of 64 
>>> bytes.".
>>>
>>> UART is mapped as nGnRE region (as specified by ATTR=100 , refer 
>>> G1.3.13,
>>> MAIR_EL2, "---0100 Device memory nGnRE") and Doc ID - 102670_0101_02_en
>>
>> I can't find the Doc you point online. Do you have a link?
> https://developer.arm.com/documentation/102670/0101 - Cortex-R82 
> processor TRM

Thanks. But why are you quoting the Cortex-R82 TRM? This code is meant 
to work on any Armv8-R processor.

Cheers,

-- 
Julien Grall



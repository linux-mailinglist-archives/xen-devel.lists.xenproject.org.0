Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FED67C81D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 11:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484915.751794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKzGZ-00075c-PT; Thu, 26 Jan 2023 10:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484915.751794; Thu, 26 Jan 2023 10:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKzGZ-00073J-Lx; Thu, 26 Jan 2023 10:13:59 +0000
Received: by outflank-mailman (input) for mailman id 484915;
 Thu, 26 Jan 2023 10:13:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKzGX-00073D-L5
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 10:13:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKzGX-0007Df-7J; Thu, 26 Jan 2023 10:13:57 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.8.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKzGX-0008DG-16; Thu, 26 Jan 2023 10:13:57 +0000
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
	bh=5tPIG1qmtNwurtmmSSmJk8cImvT1+LsA9AgPiRDKbQ4=; b=W9YoECbPg912MxaAUDxQsb9kKS
	1jx9LmXTALKek1SQoymAJ1in4a9FOMnVAVmNwsxd+dOGXcHuMytriTpZJS2O26GD9xlfXvH9iCJZE
	sf8vhdmfKxAPYOEJkOlr3S30Y9u1CkozaJtbiSVgxCJ/GDWzFyGzF6spmtev+QqRDAYY=;
Message-ID: <55e75c62-7b8c-dd6e-092e-48984aecff3b@xen.org>
Date: Thu, 26 Jan 2023 10:13:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v5] xen/arm: Use the correct format specifier
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230125101943.1854-1-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301251309160.1978264@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301251309160.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/01/2023 21:09, Stefano Stabellini wrote:
> On Wed, 25 Jan 2023, Ayan Kumar Halder wrote:
>> 1. One should use 'PRIpaddr' to display 'paddr_t' variables. However,
>> while creating nodes in fdt, the address (if present in the node name)
>> should be represented using 'PRIx64'. This is to be in conformance
>> with the following rule present in https://elinux.org/Device_Tree_Linux
>>
>> . node names
>> "unit-address does not have leading zeros"
>>
>> As 'PRIpaddr' introduces leading zeros, we cannot use it.
>>
>> So, we have introduced a wrapper ie domain_fdt_begin_node() which will
>> represent physical address using 'PRIx64'.
>>
>> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
>> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
>> address.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> (I checked that Ayan also addressed Julien's latest comments.)

They are indeed.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


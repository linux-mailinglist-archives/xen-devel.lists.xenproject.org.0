Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A77A7061A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926661.1329500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6q0-0006FI-M7; Tue, 25 Mar 2025 16:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926661.1329500; Tue, 25 Mar 2025 16:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6q0-0006CR-Ij; Tue, 25 Mar 2025 16:09:12 +0000
Received: by outflank-mailman (input) for mailman id 926661;
 Tue, 25 Mar 2025 16:09:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tx6py-0006CL-M3
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:09:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tx6py-007loX-1j;
 Tue, 25 Mar 2025 16:09:10 +0000
Received: from [15.248.2.26] (helo=[10.24.67.162])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tx6py-00Ensi-0I;
 Tue, 25 Mar 2025 16:09:10 +0000
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
	bh=bJ4j46HN7qzpTqg9a8dRjGOk2MOybzhJfDE3VSJtcY0=; b=f/yb/F30qDteUP1qu/vvoh9G8M
	Artixa0QSfrpdHWX8kAfU7S9EunDAFdrVKs43xcRqpKrR6Dp1R6TnjR8nJcG6GVOf2TETRfIhDa5H
	asHHA5Pr7dUuwYpn+svGpinABhz0HDI0cHNKrneMg+By3i4+v1V/kc4Mj55EwkXGog+4=;
Message-ID: <180d0f62-cab1-4fb5-a09f-c82b117ff554@xen.org>
Date: Tue, 25 Mar 2025 16:09:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
 <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
 <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 25/03/2025 16:05, Oleksandr Tyshchenko wrote:
>>>> Furthermore, what happen if we decide to use ACPI afterwards? Wouldn't
>>>> this mean that the static regions would be reserved even if ACPI doesn't
>>>> use static memory (all the memory is expected to be given to the
>>>> allocator)?
>>> I don't think such hybrid configuration is valid (booting with ACPI yet
>>> declaring reserved regions in DT). See commit:
>>> 9c2bc0f24b2ba7082df408b3c33ec9a86bf20cf0
>>
>> I don't think the commit is preventing hybrid configuration. It is just
>> saying that the region (which could be a static region because this is
>> not supported) will be unreserved.
>>
>> IOW, when booting with Device-Tree you may be able to use static memory.
>> But if you were booting with ACPI, static memory is not supported and
>> therefore the regions should be free for other purpose.
> 
> 
> Julien, I see your points, but the current patch does not attempt to
> make static (reserved) memory properly work on ACPI-based system (if it
> is available there), current patch tries to solve the real issue on
> device-tree-based system with Xen compiled with CONFIG_ACPI=y (at least
> unintentionally). 

I am not asking to make ACPI work with static memory. I am asking to not 
break ACPI if the Device-Tree is specifying static memory region.

> However, I wonder, why it has not been noticed so far.

ACPI is not a supported feature and gated by UNSUPPORTED. So the 
implication is you have enabled UNSUPPORTED and anything can happen 
really ;).

> 
> It took some time to understand why just enabling CONFIG_STATIC_MEMORY=y
> triggered a BUG in common code. And it turned out that it was
> CONFIG_ACPI=y in my Xen's .config that caused that consequence (I
> specially wrote so long description to provide full context).

As I wrote above, the only thing I am asking is that memory for static 
regions should be unreserved when ACPI is enabled like it is already the 
case today.

Cheers,

-- 
Julien Grall



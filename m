Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF18B173D7
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065779.1431095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhV49-0008B4-MX; Thu, 31 Jul 2025 15:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065779.1431095; Thu, 31 Jul 2025 15:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhV49-00088l-Jm; Thu, 31 Jul 2025 15:19:33 +0000
Received: by outflank-mailman (input) for mailman id 1065779;
 Thu, 31 Jul 2025 15:19:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uhV48-00088f-AP
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:19:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uhV47-00Attf-1B;
 Thu, 31 Jul 2025 15:19:31 +0000
Received: from [2a02:8012:3a1:0:bd8a:42aa:3f2a:d320]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uhV47-000Z6x-0S;
 Thu, 31 Jul 2025 15:19:31 +0000
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
	bh=MiBpSriyO5Y8EpV5odv0/2IdScTt24Xl4oZAP8XqY+E=; b=M9hTcbEozPUTpCFrLiVnEatC3y
	Mn7xDSH9aosODbhLlsCgGuOCxkZduaC96+ZmPqMvrlQwLsf6dbY7aMkc14mreWWPvlHASQBqge2fA
	PpTNA8gL02xxU61lyZw4FEGU/OQMXXQ43R/jmKkQZQt6yPPk6o4CV+DoWhDAOubvHV5o=;
Message-ID: <53c59368-1338-4406-847c-c71ced042293@xen.org>
Date: Thu, 31 Jul 2025 16:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/7] xen/domctl: introduce XEN_DOMCTL_CDF_is_32bits
Content-Language: en-GB
To: Teddy Astie <teddy.astie@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
 <20250731094234.996684-3-grygorii_strashko@epam.com>
 <3288f8dc-55a2-4c58-b77c-3e24ffe0c657@vates.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3288f8dc-55a2-4c58-b77c-3e24ffe0c657@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Teddy,

On 31/07/2025 15:02, Teddy Astie wrote:
> Hello,
> 
> Le 31/07/2025 à 11:44, Grygorii Strashko a écrit :
>> Hence, this patch introduces extra "XEN_DOMCTL_CDF_is_32bits" flag which is
>> intended to be used by 64bit Arches for proper configuration of domain type
>> when domain is created.
>>
>> Now it adds initial support for this flag for Arm64 arch only. The default
>> Arm64 domain type is changed to 64bit:
>> - the Arm Xen boot code is handling this case properly already;
>> - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
>> updated to forcibly configure domain type regardless of current domain type
>> configuration. Hence toolstack configures vcpus and memory after
>> configuring domain type it allows to start with domain default AArch64 type
>> and then switch to requested domain type and ensures all required domain
>> settings applied.
>>
>> For Arm32 this flag is ignored.
>>
>> Note. For Arm64, Once toolstack is updated to probe guest binary before
>> creating domain the XEN_DOMCTL_set_address_size will become obsolete.
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01647.html
>> [2] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01648.html
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
> 
> I would prefer it be better presented as a platform-specific enum.
> Something like
> 
> ```
> enum xen_arch_subarch {

We need to be cautious when using enum in the public interface because, 
if I am not mistaken, the size of the enum if not stable.

>     XEN_ARM_SUBARCH_NATIVE = 0,

"native" is a bit ambiguous when a platform is able to support 32-bit 
and 64-bit. Does this refer to the bitness of the hypervisor (EL2)? 
Firmware (EL3)?

That said, I am not entirely sure I see the value of native because EL1 
(the kernel exception level) has to be known at boot. So it is better to 
explicitly mention whether the kernel is 32-bit or 64-bit.

>     XEN_ARM_SUBARCH_ARMV7 = 1,

This name would not be correct. You can have a 32-bit Armv8 guest. A 
better name is SUBARCH_AARCH32.

>     XEN_ARM_SUBARCH_AARCH64 = 2,

Cheers,

-- 
Julien Grall



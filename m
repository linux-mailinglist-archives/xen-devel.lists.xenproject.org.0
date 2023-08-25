Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC6788185
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590599.923020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRpG-0008Ie-Ir; Fri, 25 Aug 2023 08:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590599.923020; Fri, 25 Aug 2023 08:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRpG-0008Gd-G1; Fri, 25 Aug 2023 08:05:50 +0000
Received: by outflank-mailman (input) for mailman id 590599;
 Fri, 25 Aug 2023 08:05:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZRpF-0008GM-GQ
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:05:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZRpD-0004cZ-5x; Fri, 25 Aug 2023 08:05:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZRpD-0005Dd-0Q; Fri, 25 Aug 2023 08:05:47 +0000
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
	bh=d8cetybDxbFPAGkBDIPNszYp2DOtCbRlxFJQwogcLxo=; b=a9Qopnrhf2sfSdYN6HZId3bYpN
	aOoomHCg1XUWWf5crH8vbuOKz7maucJS8aKQZijFHqGI5TbaQUkT/IjBZnRdjeQLy7ZssWxwwvbZZ
	w4bbtNyPOCisMkGUVh13DeXAV82vwG8KDMipwWXcp3QdfakHzqZF/jxGXX+dcT0K228g=;
Message-ID: <d3a4012d-1964-4392-bd70-e4c0d3675f1c@xen.org>
Date: Fri, 25 Aug 2023 09:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 sstabellini@kernel.org, jbeulich@suse.com, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-6-vikram.garhwal@amd.com>
 <5c38c1da-8d7f-45cf-98b7-c80a55557b36@xen.org> <ZOgdRIjd2nMWDtNP@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZOgdRIjd2nMWDtNP@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/08/2023 04:17, Vikram Garhwal wrote:
> Hi Julien,
> On Tue, Aug 22, 2023 at 08:10:05PM +0100, Julien Grall wrote:
>> Hi Vikram,
>>
>> On 19/08/2023 01:28, Vikram Garhwal wrote:
>>> Introduce a config option where the user can enable support for adding/removing
>>> device tree nodes using a device tree binary overlay.
>>>
>>> Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
>>> Arm.
>>>
>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>> Acked-by: Henry Wang <Henry.Wang@arm.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> ---
>>> Changes from v7:
>>>       Add this feature as "experimental support" in CHANGELOG.md
>>> ---
>>> ---
>>>    CHANGELOG.md         | 3 ++-
>>>    SUPPORT.md           | 6 ++++++
>>>    xen/arch/arm/Kconfig | 5 +++++
>>>    3 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 7d7e0590f8..47098dbfca 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -24,7 +24,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>     - xl/libxl can customize SMBIOS strings for HVM guests.
>>>     - Add support for AVX512-FP16 on x86.
>>>     - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
>>> -
>>> + - On Arm, experimental support for dynamic addition/removal of Xen device tree
>>> +   nodes using a device tree overlay binary(.dtbo).
>>
>> Typo: missing space before (.
>>
>>>    ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index 35a6249e03..8eb006565c 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -844,6 +844,12 @@ No support for QEMU backends in a 16K or 64K domain.
>>>        Status: Supported
>>> +### Device Tree Overlays
>>> +
>>> +Add/Remove device tree nodes using a device tree overlay binary(.dtbo).
>>
>> Same here. I don't suggest to handle it on commit because this is not
>> something I want to merge without the rest of the series.
>>
>>> +
>>> +    Status, ARM: Experimental
>>> +
>>>    ### ARM: Guest ACPI support
>>>        Status: Supported
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index fd57a82dd2..02c4796438 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -92,6 +92,11 @@ config HAS_ITS
>>>            bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>>>            depends on GICV3 && !NEW_VGIC && !ARM_32
>>> +config OVERLAY_DTB
>>> +	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
>>> +	help
>>> +	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
>>
>> Do we have any documentation in the tree of the limitations and how this
>> works?
>>
>> The reason I am asking is the wording here suggests that it would be
>> possible to remove nodes from the original Device-Tree. AFAIU this is not
>> possible with the implementation and you are not planning to handle it.
>> Correct?
> Yes, that is correct. This series doesn't remove the nodes which are not added
> by overlay before.
> 
> I will add a document file. Is this needs to be in .pandoc or .txt format?

I think we now prefer .pandoc.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D22D748564
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 15:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559193.873959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2rj-0004Gc-8C; Wed, 05 Jul 2023 13:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559193.873959; Wed, 05 Jul 2023 13:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2rj-0004DO-4r; Wed, 05 Jul 2023 13:48:19 +0000
Received: by outflank-mailman (input) for mailman id 559193;
 Wed, 05 Jul 2023 13:48:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qH2rh-0004DI-7N
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 13:48:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH2rg-0000nr-NQ; Wed, 05 Jul 2023 13:48:16 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.19.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH2rg-000106-Df; Wed, 05 Jul 2023 13:48:16 +0000
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
	bh=9786cWhmHLb79msPfaC4Ne0US48ChbVFnRfaB9ovDkg=; b=eOqypQUHAWPou1ae3Nv0t3jTKo
	epdWnzZqmXIUK05gPP2cw0YJcFN8SHRY5Sh5BaBcjJ8Budhpba9N1ny7XgSdKwCrjrr12vHkocLsU
	Pm4Ff0lgjOrXFIKKVqRnNWGf6wOtY3+0y/F7wT5W+yKH4GUxgt7GUIkEhUrHqgZnfV4Y=;
Message-ID: <d7ba609e-bdb1-c756-fda2-d23400a8e317@xen.org>
Date: Wed, 5 Jul 2023 14:48:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Penny Zheng <Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230705115534.26004-1-julien@xen.org>
 <FE3E6650-ECCE-4E3D-9515-FDB589FF025D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FE3E6650-ECCE-4E3D-9515-FDB589FF025D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/07/2023 13:51, Bertrand Marquis wrote:
>> On 5 Jul 2023, at 13:55, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> On Arm, it is not possible to use ACPI without UEFI. In fact disabling
>> UEFI but not ACPI will lead to a compilation error:
>>
>> ld: prelink.o: in function `acpi_os_get_root_pointer':
>> /builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:
>> undefined reference to `efi'
>> /builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:(.init.text+0x8ac0):
>> relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against
>> undefined symbol `efi'
>>
>> So make the dependency clear in the Kconfig.
>>
>> This was spotted by the randconfig build in gitlab CI.
>>
>> Fixes: 12314be5749e ("xen/arm: make ARM_EFI selectable for Arm64")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks. I have committed the patch.

Cheers,

-- 
Julien Grall


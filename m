Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5174842F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 14:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559159.873879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1ek-0001Ly-3R; Wed, 05 Jul 2023 12:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559159.873879; Wed, 05 Jul 2023 12:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1ej-0001J7-Vk; Wed, 05 Jul 2023 12:30:49 +0000
Received: by outflank-mailman (input) for mailman id 559159;
 Wed, 05 Jul 2023 12:30:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qH1ei-0001J1-Oh
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 12:30:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH1ee-0007SX-9v; Wed, 05 Jul 2023 12:30:44 +0000
Received: from [15.248.3.5] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH1ee-0005aj-3m; Wed, 05 Jul 2023 12:30:44 +0000
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
	bh=iIuxbPU1CAtJT8bBUEgNsAXEcm9/IPHbfJ0sN4WYZWY=; b=WsEsZfXIEe+Gql1E9HwouyPJQM
	nGBzWIjnFrJoAwRP92V8g6qutjYexRCAg2smiaJmGnUnomvGWIwh5+PvYzc17tyKGT7FOgd7yNkxa
	r+uek7OOSXAFTsJNC3IBaBcfw/IM/WC+m2SL3vuAPcv0op5gnYG0J/90isoAKKMhfc6U=;
Message-ID: <822b68a0-7832-9213-d340-a3787e790a3f@xen.org>
Date: Wed, 5 Jul 2023 13:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com, Henry.Wang@arm.com,
 andrew.cooper3@citrix.com, Penny.Zheng@arm.com, wei.chen@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230705115534.26004-1-julien@xen.org>
 <2761ae84-113d-c230-ad50-e9cfb0ae434b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2761ae84-113d-c230-ad50-e9cfb0ae434b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/07/2023 13:04, Jan Beulich wrote:
> On 05.07.2023 13:55, Julien Grall wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -63,11 +63,11 @@ source "arch/Kconfig"
>>   
>>   config ACPI
>>   	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
>> -	depends on ARM_64
>> +	depends on ARM_64 && ARM_EFI
> 
> Wouldn't it make sense to drop the ARM_64 dependency then? It's now
> redundant, and it seems quite likely that if EFI was ever support
> for 32-bit, ACPI could then be supported there as well.

I think so. I am not planning to resend a new version for that. So I 
will do it on commit and mention it in the commit message.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0FC74AC8B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 10:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560264.876038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgXt-0002xX-OW; Fri, 07 Jul 2023 08:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560264.876038; Fri, 07 Jul 2023 08:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgXt-0002v7-LO; Fri, 07 Jul 2023 08:10:29 +0000
Received: by outflank-mailman (input) for mailman id 560264;
 Fri, 07 Jul 2023 08:10:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHgXs-0002ux-2E
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 08:10:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHgXn-0003ij-9T; Fri, 07 Jul 2023 08:10:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHgXn-0002TC-35; Fri, 07 Jul 2023 08:10:23 +0000
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
	bh=vZGHCxYyKeO8Tk94yuxEuQ0JPM+BGHcOSxoKoMYi41M=; b=PBFpupzB/coAB1GyX63D749ZXG
	vn+oRTst7oO+VcaL/KLHscG9PjEjcK+K9vSOgeFNJskZiZ1kxbnEi1eRxLql1vI5Hl7MntdvvG1q/
	0F0VE8o4kS9DhSGS1gUttiRwoQ4lp4JQ4d5wodH1krFsfbwlNkNFY1HkrU1sk4ZFYbuE=;
Message-ID: <45169f0f-78f0-468f-0cdc-c1649fbd580b@xen.org>
Date: Fri, 7 Jul 2023 09:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-2-stewart.hildebrand@amd.com>
 <3ab542ff-9145-d989-2ec1-3d01168902a5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3ab542ff-9145-d989-2ec1-3d01168902a5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/07/2023 07:55, Jan Beulich wrote:
> On 07.07.2023 03:47, Stewart Hildebrand wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -190,6 +190,15 @@ config STATIC_SHM
>>   	help
>>   	  This option enables statically shared memory on a dom0less system.
>>   
>> +config PCI_PASSTHROUGH
>> +	bool "PCI passthrough" if EXPERT
>> +	depends on ARM_64
>> +	select HAS_PCI
>> +	select HAS_VPCI
>> +	default n
> 
> No need for this line - that's what the tool does by default anyway.

I would rather keep. We are already using 'default n' and it is making 
more obvious the default value.

Cheers,

-- 
Julien Grall


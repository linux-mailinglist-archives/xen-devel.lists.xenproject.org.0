Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D62CC47C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 19:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42943.77278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkWTY-0008CJ-DS; Wed, 02 Dec 2020 18:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42943.77278; Wed, 02 Dec 2020 18:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkWTY-0008Bu-9k; Wed, 02 Dec 2020 18:03:36 +0000
Received: by outflank-mailman (input) for mailman id 42943;
 Wed, 02 Dec 2020 18:03:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkWTW-0008Bp-TT
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 18:03:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkWTU-00087d-PD; Wed, 02 Dec 2020 18:03:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkWTU-0006Hm-CH; Wed, 02 Dec 2020 18:03:32 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=h1RaJKZGs67HCwMBIg/HMcjp3ktjOJpM+aawCccispI=; b=tnQ4qzLgm/JXK+eUKqHCvHlEeQ
	+oj5pJgeOTU2+n/lWUQzJpmUowpkCkD5cGGmUF2vxCYw4lL8DFnleuNjmsd0HhPTl5385M13J6+pZ
	rzG5Qdn1HGTzGRzaPNHUlWYNCayb4TPI9HymTApvux1xVe+JRLn5kW2+dAPuXDjx2ZRk=;
Subject: Re: [PATCH] xen/iommu: vtd: Fix undefined behavior pci_vtd_quirks()
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>
References: <20201119145216.29280-1-julien@xen.org>
 <MWHPR11MB16456E395CC9B993E0C07EC48CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <adffc9f6-9418-080f-135b-e723fbd3fb28@xen.org>
Date: Wed, 2 Dec 2020 18:03:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB16456E395CC9B993E0C07EC48CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 30/11/2020 02:50, Tian, Kevin wrote:
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, November 19, 2020 10:52 PM
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> When booting Xen with CONFIG_USBAN=y on Sandy Bridge, UBSAN will
>> throw
>> the following splat:
>>
>> (XEN)
>> ================================================================
>> ================
>> (XEN) UBSAN: Undefined behaviour in quirks.c:449:63
>> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
>> (XEN) ----[ Xen-4.11.4  x86_64  debug=y   Not tainted ]----
>>
>> [...]
>>
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d0802c0ccc>] ubsan.c#ubsan_epilogue+0xa/0xad
>> (XEN)    [<ffff82d0802c16c9>]
>> __ubsan_handle_shift_out_of_bounds+0xb4/0x145
>> (XEN)    [<ffff82d0802eeecd>] pci_vtd_quirk+0x3d3/0x74f
>> (XEN)    [<ffff82d0802e508b>]
>> iommu.c#domain_context_mapping+0x45b/0x46f
>> (XEN)    [<ffff82d08053f39e>] iommu.c#setup_hwdom_device+0x22/0x3a
>> (XEN)    [<ffff82d08053dfbc>] pci.c#setup_one_hwdom_device+0x8c/0x124
>> (XEN)    [<ffff82d08053e302>] pci.c#_setup_hwdom_pci_devices+0xbb/0x2f7
>> (XEN)    [<ffff82d0802da5b7>] pci.c#pci_segments_iterate+0x4c/0x8c
>> (XEN)    [<ffff82d08053e8bd>] setup_hwdom_pci_devices+0x25/0x2c
>> (XEN)    [<ffff82d08053e916>]
>> iommu.c#intel_iommu_hwdom_init+0x52/0x2f3
>> (XEN)    [<ffff82d08053d6da>] iommu_hwdom_init+0x4e/0xa4
>> (XEN)    [<ffff82d080577f32>] dom0_construct_pv+0x23c8/0x2476
>> (XEN)    [<ffff82d08057cb50>] construct_dom0+0x6c/0xa3
>> (XEN)    [<ffff82d080564822>] __start_xen+0x4651/0x4b55
>> (XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x55
>>
>> Note that splat is from 4.11.4 and not staging. Although, the problem is
>> still present.
>>
>> This can be solved by making the first operand unsigned int.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thanks! I have committed the patch.

Cheers,

-- 
Julien Grall


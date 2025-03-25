Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FB5A704EC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 16:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926613.1329449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx67m-00032t-DB; Tue, 25 Mar 2025 15:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926613.1329449; Tue, 25 Mar 2025 15:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx67m-00030u-9j; Tue, 25 Mar 2025 15:23:30 +0000
Received: by outflank-mailman (input) for mailman id 926613;
 Tue, 25 Mar 2025 15:23:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tx67l-00030o-Ce
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 15:23:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tx67l-007juA-0k;
 Tue, 25 Mar 2025 15:23:29 +0000
Received: from [15.248.2.26] (helo=[10.24.67.162])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tx67k-00Ehhh-2O;
 Tue, 25 Mar 2025 15:23:28 +0000
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
	bh=NedO+IYNq2J8i+6JmOkiuq2oer+7pVHJxTMDOThvsGQ=; b=FmnFInifcb2Qc6BSUcBhnCgjG8
	f+cujoNbirsOuF2WfzymK/AgvFUvVzsnEDryaYWV23QusWHwXLOs+xd5+C/Kove8q9Ztvfz+dMi/3
	I6JDG/SobcycOdZwHjai4/V4fl3MxyF0ii4IZXdYF4NYqaLJfCAtcaGSkORIBamu2fC8=;
Message-ID: <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
Date: Tue, 25 Mar 2025 15:23:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr, Michal,

On 25/03/2025 15:08, Oleksandr Tyshchenko wrote:
> On the device-tree-based Arm64 system, if Xen is built with
> CONFIG_ACPI=y, CONFIG_STATIC_MEMORY=y, and the static memory range
> is provided in the host device tree, the BUG is triggered in
> common/page_alloc.c during Xen's early boot. The BUG occurs when
> the first page from the static range is fed to the domain
> sub-allocator and finally ends up in mark_page_free().
> The pg->count_info & PGC_state is not in the state that
> the code expects to see there.
> 
> (XEN) Checking for initrd in /chosen
> (XEN) Checking for "xen,static-mem" in domain node
> (XEN) RAM: 0000000040000000 - 00000000bfffffff
> (XEN)
> (XEN) MODULE[0]: 0000000043200000 - 0000000043343fff Xen
> (XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree
> (XEN) MODULE[2]: 0000000042e00000 - 0000000043111f82 Ramdisk
> (XEN) MODULE[3]: 0000000040400000 - 0000000042cfffff Kernel
> (XEN)  RESVD[0]: 0000000050000000 - 000000005fffffff
> (XEN)
> (XEN) CMDLINE[0000000040400000]:domU0 console=ttyAMA0
> (XEN)
> (XEN) Command line: console=dtuart conswitch=ax
> (XEN) pg MFN 50000 c=0x2180000000000000 o=0 v=0 t=0
> (XEN) Xen BUG at common/page_alloc.c:1474
> [snip]
> 
> The problem is that the static range gets mistakenly unreserved
> in populate_boot_allocator() and reaches init_boot_pages().
> This happens since by the time the populate_boot_allocator()
> is executed, the evaluated in fw_unreserved_regions()
> an acpi_disabled variable is still false and as the result
> the dt_unreserved_regions() which should simply skip that static range
> does not get called. The acpi_disabled will be set to the actual value
> (in our case it is true) later on in acpi_boot_table_init().
 > > The important question is why acpi_disabled is false by the time
> setup_mm() is executed. With CONFIG_ACPI=n it is a macro that is always
> true, but with CONFIG_ACPI=y it is a boolean that is false from the very
> beggining, even though the entire acpi_boot_table_init() (which is called
> after setup_mm()) is written with the assumption that ACPI is off by default
> at the start. So, initialize acpi_disabled to true during declaration
> if CONFIG_ACPI=y to avoid an issue and match to acpi_boot_table_init().

While I agree that acpi_disabled should be false. It feels like a bit of 
a workaround for the issue you are trying to solve here. If 
fw_unreserved_regions() doesn't work with ACPI enabled, then it is still 
a problem after your patch.

Furthermore, what happen if we decide to use ACPI afterwards? Wouldn't 
this mean that the static regions would be reserved even if ACPI doesn't 
use static memory (all the memory is expected to be given to the allocator)?

Cheers,

-- 
Julien Grall



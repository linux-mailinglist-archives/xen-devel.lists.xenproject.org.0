Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40755364049
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 13:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112823.215133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYRtj-0006j8-A2; Mon, 19 Apr 2021 11:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112823.215133; Mon, 19 Apr 2021 11:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYRtj-0006ij-6e; Mon, 19 Apr 2021 11:16:59 +0000
Received: by outflank-mailman (input) for mailman id 112823;
 Mon, 19 Apr 2021 11:16:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYRth-0006ie-2h
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 11:16:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28dcf9b6-0366-4953-81f7-ab4f549764a5;
 Mon, 19 Apr 2021 11:16:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D382ACC5;
 Mon, 19 Apr 2021 11:16:55 +0000 (UTC)
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
X-Inumbo-ID: 28dcf9b6-0366-4953-81f7-ab4f549764a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618831015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGMheD6SbVw9Oz7pBnA433BAXdpfUVVQaeY4C+E0vJo=;
	b=hgMi6AwU6NoC4XupaSfZX+KPEDSoFISo4g6z0ADegnzaWyhfW/+OTk28KMWO/kDOjGnpHM
	/y0elwMKoqE8iyEJ+Q4tmK8KTuDxCfnWjdhpBgANMPAPmRKrvYmKt5cs0mpQ5ixrmB7rFs
	b9RmYbjfSTBmV+WOUea2OQwsy5DYzFs=
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Julien Grall <julien@xen.org>, xen-devel
 <xen-devel@lists.xenproject.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
 <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
Date: Mon, 19 Apr 2021 13:16:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YH1CBP8At7lVoHCz@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.04.2021 10:40, Roger Pau Monné wrote:
> On Mon, Apr 19, 2021 at 07:16:52AM +0000, Rahul Singh wrote:
>> Thanks you everyone for reviewing the code. I will summarise what I have understood from all the comments 
>> and what I will be doing for the next version of the patch.  Please let me know your view on this.
>>
>> 1. Create a separate non-arch specific file "msi-intercept.c"  for the below newly introduced function and 
>>     compile that file if CONFIG_PCI_MSI_INTERCEPT is enabled.CONFIG_PCI_MSI_INTERCEPT  will  be 
>>     enabled for x86 by default.

Everything up to here wants to be separate from ...

>> Also Mention in the commit message that these function will be needed for Xen to 
>>     support MSI interrupt within XEN.
>>
>> 	pdev_msi_initi(..)
>> 	pdev_msi_deiniti(..)

... this (if all of these functions really are needed beyond the
purpose of intercepting MSI accesses).

> I would drop the last 'i' from both function names above, as we use
> init/deinit in the rest of the code base.

+1

>> 	pdev_dump_msi(..),
>> 	pdev_msix_assign(..)
>>
>> 2. Create separate patch for iommu_update_ire_from_msi() related code. There are two suggestion please help me which one to choose. 
>>  
>>      - Move the iommu_update_ire_from_msi() function to asm-x86/iommu.h and also move the hook from iommu_ops under CONFIG_X86.
> 
> I would go for this one.

Strictly speaking this isn't x86-specific and hence shouldn't move there.
It merely depends on whether full MSI support is wanted by an arch. I'd
therefore guard the declaration by an #ifdef (if needed at all - have a
declaration without implementation isn't really that problematic). For
the definition question is going to be whether you introduce another new
file for the pdev_*() functions above. If not, #ifdef may again be better
than moving to an x86-specific file.

>>       - Implement a more generic function "arch_register_msi()"). This could call iommu_update_ire_from_msi() on x86 and the 
>>         ITS related code once implemented on Arm. Introduce the new Kconfig CONFIG_HAS_IOMMU_INTERRUPT_REMAP for this option.
> 
> I think it's best to introduce this hook when you actually have to
> implement the Arm version of it.

Plus arch_register_msi() sounds like a one-time operation, whereas (iirc)
iommu_update_ire_from_msi() may get called many times during the lifetime
of a single MSI interrupt.

Jan


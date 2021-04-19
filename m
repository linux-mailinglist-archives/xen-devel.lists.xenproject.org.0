Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5932364119
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 13:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112855.215185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYSUU-0002GG-60; Mon, 19 Apr 2021 11:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112855.215185; Mon, 19 Apr 2021 11:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYSUU-0002Fr-2t; Mon, 19 Apr 2021 11:54:58 +0000
Received: by outflank-mailman (input) for mailman id 112855;
 Mon, 19 Apr 2021 11:54:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYSUS-0002Em-7s
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 11:54:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYSUL-0008HN-S5; Mon, 19 Apr 2021 11:54:49 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYSUL-0002aR-HI; Mon, 19 Apr 2021 11:54:49 +0000
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
	bh=6wbZMU6F53nhJ6Ik1I9Gy9Zvrv8Ewa5Qk/CdC8a4w1M=; b=XXjJlwElKnQ6lsjuOnbxiFGaPr
	S+cy/Lh3eW6lbIARnBXmK9oLlKyRQOdk1ALHH6CRZjJRw+PjE4iofU/zGkxQj6Z2pQHRg9IAqIK0I
	d3fSwyiI59ji+L7DtPq2bRDXCRHZj+MkIG5kizUVJrYJkXZknhgOx9ffPs9F3MQV0GcM=;
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
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
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
Date: Mon, 19 Apr 2021 12:54:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 19/04/2021 12:16, Jan Beulich wrote:
> On 19.04.2021 10:40, Roger Pau Monné wrote:
>> On Mon, Apr 19, 2021 at 07:16:52AM +0000, Rahul Singh wrote:
>>> Thanks you everyone for reviewing the code. I will summarise what I have understood from all the comments
>>> and what I will be doing for the next version of the patch.  Please let me know your view on this.
>>>
>>> 1. Create a separate non-arch specific file "msi-intercept.c"  for the below newly introduced function and
>>>      compile that file if CONFIG_PCI_MSI_INTERCEPT is enabled.CONFIG_PCI_MSI_INTERCEPT  will  be
>>>      enabled for x86 by default.
> 
> Everything up to here wants to be separate from ...
> 
>>> Also Mention in the commit message that these function will be needed for Xen to
>>>      support MSI interrupt within XEN.
>>>
>>> 	pdev_msi_initi(..)
>>> 	pdev_msi_deiniti(..)
> 
> ... this (if all of these functions really are needed beyond the
> purpose of intercepting MSI accesses).
> 
>> I would drop the last 'i' from both function names above, as we use
>> init/deinit in the rest of the code base.
> 
> +1
> 
>>> 	pdev_dump_msi(..),
>>> 	pdev_msix_assign(..)
>>>
>>> 2. Create separate patch for iommu_update_ire_from_msi() related code. There are two suggestion please help me which one to choose.
>>>   
>>>       - Move the iommu_update_ire_from_msi() function to asm-x86/iommu.h and also move the hook from iommu_ops under CONFIG_X86.
>>
>> I would go for this one.
> 
> Strictly speaking this isn't x86-specific and hence shouldn't move there.
> It merely depends on whether full MSI support is wanted by an arch. 

As I pointed out before, Arm doesn't use the IOMMU to setup the MSIs. So 
the naming and using an IOMMU callback is definitely wrong for Arm.

> I'd
> therefore guard the declaration by an #ifdef (if needed at all - have a
> declaration without implementation isn't really that problematic). For
> the definition question is going to be whether you introduce another new
> file for the pdev_*() functions above. If not, #ifdef may again be better
> than moving to an x86-specific file.
AFAIK, this helper is only called by x86 specific code and it will not 
be used as-is by Arm.

I can't tell for other arch (e.g RISCv, PowerPC). However... we can take 
the decision to move the code back to common back when it is necessary.

For the time being, I think move this code in x86 is a lot better than 
#ifdef or keep the code in common code.

Cheers,

-- 
Julien Grall


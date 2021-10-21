Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504CD436357
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 15:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214407.372938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYPq-00041f-8h; Thu, 21 Oct 2021 13:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214407.372938; Thu, 21 Oct 2021 13:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYPq-0003yY-4x; Thu, 21 Oct 2021 13:47:30 +0000
Received: by outflank-mailman (input) for mailman id 214407;
 Thu, 21 Oct 2021 13:47:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdYPp-0003yS-18
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 13:47:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdYPn-0001a6-SM; Thu, 21 Oct 2021 13:47:27 +0000
Received: from [54.239.6.190] (helo=[192.168.27.91])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdYPn-0003jj-Lc; Thu, 21 Oct 2021 13:47:27 +0000
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
	bh=sL0Yp17XctBCuTTfTWdQPRiDqAmRKEFyfHd35aJV8go=; b=XBtpHwOCT7XUHUtKrkY6jFEIdt
	zF5mDSfoz4ohrTjmTu1a67gjTtKMQCuB8SIYoEig1YUGla/jLWhQ0uV34xBnVOCKb527USK8xqPks
	Vip7eIDf4e0MSHYxhj3JqOmf6mJY8YRp5+4kIKWbfWOr1AtHC/ilr6A2I55NQnuRfBFQ=;
Message-ID: <f7c1a7ca-0046-9a58-1cfd-61b096248d9f@xen.org>
Date: Thu, 21 Oct 2021 14:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: xen/arm: Missing appropriate locking for the IOMMU (WAS Re:
 [PATCH v5 02/11] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove) support for
 ARM)
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <0dc4423b2e20c1eb40c961b211b18ed041f707b7.1633540842.git.rahul.singh@arm.com>
 <99f6d6c4-bcc6-03a9-ef9b-0d01be0fd7f1@xen.org>
 <75784F90-198E-400D-877B-CF62ED69F409@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <75784F90-198E-400D-877B-CF62ED69F409@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/10/2021 14:15, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertand,

>> On 21 Oct 2021, at 10:28, Julien Grall <julien@xen.org> wrote:
>>
>> Hi all,
>>
>> While going through the passthrough code. I noticed that we don't have a common lock for the IOMMU between the PCI and DT code.
>>
>> This is going to be an issue given it would technically be possible to add a PCI device while assigning a DT.
>>
>> Rahul, Bertrand, Oleksandr, can you have a look at the issue?
> 
> Yes we can have a look at this.
> 
> Right now pci device add is done by dom0 so I do not think we have an issue in practice unless I wrongly understood something
This will depend on the XSM policy. With the default one, then yes I 
agree that only dom0 (we don't support hardware domain) can add PCI device.

However, this restriction doesn't really matter here. You would be 
relying on dom0 to do the locking and AFAIK this doesn't exist. Instead, 
the admin would have to ensure that two don't happen at the same time.

Anyway, I think Xen should take care of preventing concurrent IOMMU 
operations rather than relying on external subsystem (e.g. dom0) to do 
it. At least the Arm SMMU driver will rely the generic locking to modify 
atomically internal list.

Cheers,

-- 
Julien Grall


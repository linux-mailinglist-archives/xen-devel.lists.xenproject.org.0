Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8EF86C67A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 11:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686925.1069548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdNZ-0003mJ-Ko; Thu, 29 Feb 2024 10:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686925.1069548; Thu, 29 Feb 2024 10:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdNZ-0003kQ-IB; Thu, 29 Feb 2024 10:11:05 +0000
Received: by outflank-mailman (input) for mailman id 686925;
 Thu, 29 Feb 2024 10:11:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfdNY-0003kK-FD
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 10:11:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfdNV-0000nA-CB; Thu, 29 Feb 2024 10:11:01 +0000
Received: from [15.248.3.86] (helo=[10.45.19.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfdNV-00013q-6d; Thu, 29 Feb 2024 10:11:01 +0000
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
	bh=uWACTYlld6o6URRybhcGiwQ1PW6iTyXiVTWdw714I/8=; b=UBW4EbDnygSuhjl10+ULICtncE
	qhoa9rJ9ovKKwnvcLhEbiF5q5vQ7EHSECn6uA/b/UlfjOuDANoexeRuNNCdUey3AFNDXRMLF+qKKc
	ziT21KeIuDwF5Fep16KOcq82xFQNoFC8mA0EFYCu4McT7F3Y2MOyWVUodBM7zB025qLY=;
Message-ID: <99b74dda-225b-4402-abb9-fcccfda0adbc@xen.org>
Date: Thu, 29 Feb 2024 10:10:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix arm32 build failure when early printk is
 enabled
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240228103555.172101-1-michal.orzel@amd.com>
 <9201bdc5-2e4c-48b7-8c92-f5063fde90b6@xen.org>
 <af11620a-ec16-4677-b968-d8e36c4555d2@amd.com>
 <alpine.DEB.2.22.394.2402281425260.575685@ubuntu-linux-20-04-desktop>
 <8228a48f-566c-4931-9f24-27bdaa1f0f28@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8228a48f-566c-4931-9f24-27bdaa1f0f28@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/02/2024 10:07, Michal Orzel wrote:
> 
> 
> On 28/02/2024 23:27, Stefano Stabellini wrote:
>>
>>
>> On Wed, 28 Feb 2024, Michal Orzel wrote:
>>> Hi Julien,
>>>
>>> On 28/02/2024 12:42, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 28/02/2024 10:35, Michal Orzel wrote:
>>>>> Commit 0441c3acc7e9 forgot to rename FIXMAP_CONSOLE to FIX_CONSOLE in
>>>>> TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS macro. This results in a build
>>>>> failure on arm32, when early printk is enabled:
>>>>> arch/arm/arm32/mmu/head.S:311: Error: invalid operands (*UND* and *ABS* sections) for `*'
>>>>
>>>> Good catch! Somewhat related I wonder whether we should add earlyprintk
>>>> testing in gitlab?
>>> I thought about adding this and I think we should at least have build jobs (hypervisor only, no toolstack)
>>> selecting early printk. When it comes to testing if early printk works, I'm not sure. It'd be nice
>>> but FWIR we have limited bandwidth.
>>>
>>> @Stefano, what's your opinion?
>>
>> I think it would be a good and quick test to have. To save testing
>> bandwidth I think we should reduce the amount of debug/non-debug
>> variations of the same tests that we have.
> Yes, I suggested that some time ago. We could keep both versions for generic tests,
> but remove the non-debug version (unless you prefer to do the opposite) for:

I think it makes sense during development window to use the debug 
version. However, I think we want some non-debug testing during the 
hardening phase.

Can gitlab read CONFIG_DEBUG from Config.mk?

Cheers,

-- 
Julien Grall


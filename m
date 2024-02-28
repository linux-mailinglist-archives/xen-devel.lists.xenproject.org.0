Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32886AE57
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 12:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686509.1068678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIYh-0002ZI-07; Wed, 28 Feb 2024 11:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686509.1068678; Wed, 28 Feb 2024 11:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIYg-0002Xl-Sz; Wed, 28 Feb 2024 11:57:10 +0000
Received: by outflank-mailman (input) for mailman id 686509;
 Wed, 28 Feb 2024 11:57:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfIYf-0002Xd-On
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 11:57:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfIYf-0001GP-GN; Wed, 28 Feb 2024 11:57:09 +0000
Received: from [15.248.2.225] (helo=[10.45.19.69])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfIYf-0007tk-B4; Wed, 28 Feb 2024 11:57:09 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=ZH/YCG1g8b9nhcrPE9WEwVLQcY/BdV2qCyFooCB0B1A=; b=VaV+CsAjS9B7AwtvsPOwHXgrKz
	MfMld6hhj1GdMCiATdCak0DiEAHGYsdeNhM8OeR8N8DJ5tWE0q7z89FAam3JeuI1wd3CbmxdROqcs
	LOFB/xQmxgfN51okTTQ2IugpUzXKzJRHEBHqPz+kL1X/fRRSkKgHxjUXcUh/qB+a0DKY=;
Message-ID: <f4f94437-9bcb-4eb7-8f80-9e11019a53bb@xen.org>
Date: Wed, 28 Feb 2024 11:57:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix arm32 build failure when early printk is
 enabled
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240228103555.172101-1-michal.orzel@amd.com>
 <9201bdc5-2e4c-48b7-8c92-f5063fde90b6@xen.org>
In-Reply-To: <9201bdc5-2e4c-48b7-8c92-f5063fde90b6@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/02/2024 11:42, Julien Grall wrote:
> Hi Michal,
> 
> On 28/02/2024 10:35, Michal Orzel wrote:
>> Commit 0441c3acc7e9 forgot to rename FIXMAP_CONSOLE to FIX_CONSOLE in
>> TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS macro. This results in a build
>> failure on arm32, when early printk is enabled:
>> arch/arm/arm32/mmu/head.S:311: Error: invalid operands (*UND* and 
>> *ABS* sections) for `*'
> 
> Good catch! Somewhat related I wonder whether we should add earlyprintk 
> testing in gitlab?
> 
>>
>> Fixes: 0441c3acc7e9 ("xen/arm: fixmap: Rename the fixmap slots to 
>> follow the x86 convention")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall


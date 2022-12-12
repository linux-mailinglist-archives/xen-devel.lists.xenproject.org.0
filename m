Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E887564A48F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 17:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459806.717590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lLJ-0003gl-Dd; Mon, 12 Dec 2022 16:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459806.717590; Mon, 12 Dec 2022 16:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lLJ-0003dN-AO; Mon, 12 Dec 2022 16:07:49 +0000
Received: by outflank-mailman (input) for mailman id 459806;
 Mon, 12 Dec 2022 16:07:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4lLH-0003dF-MT
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 16:07:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4lLH-0002n0-9X; Mon, 12 Dec 2022 16:07:47 +0000
Received: from [54.239.6.188] (helo=[192.168.19.227])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4lLH-0001Ne-3A; Mon, 12 Dec 2022 16:07:47 +0000
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
	bh=ajH7b8aq1sNn1CazpuBJ9WcXeLk6JjnmKYxVfz1lrLA=; b=QafT3OPjLWUbJ3ZLbMzrLLdr7H
	LIk5daEIwTfKw6lSuFiWovMDITkJNcgaW3RnVqJS3nScIavRzodb+wrqXMSuuLeb6B9O7rrzREY8T
	tPGiYkPdf7nvR6GvOHhhNhFhDASeMCi4OZ5NKFHdvxh/w55WZmjoTzdJSedvrjj/xumk=;
Message-ID: <19f2def6-89ac-4cb3-9cfc-78351e9b5bde@xen.org>
Date: Mon, 12 Dec 2022 16:07:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] xen/arm: smmuv3: remove unused function
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212160031.31590-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221212160031.31590-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 12/12/2022 16:00, Stewart Hildebrand wrote:
> When building with clang 12 and CONFIG_ARM_SMMU_V3=y, we observe the
> following build error:
> 
> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_smmu_disable_pasid' [-Werror,-Wunused-function]
> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
>                     ^
> 
> Remove the function.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> There is also a definition of arm_smmu_disable_pasid() just above,
> guarded by #ifdef CONFIG_PCI_ATS. Should this one be removed too? It
> might be nice to keep this definition for ease of backporting patches
> from Linux, but if we ever plan on supporting PCI_ATS in Xen this may
> need to be re-visited.

Given the function is not called at all, I think this is a bit odd to 
remove the stub but leave the implementation when CONFIG_PCI_ATS is defined.

Rahul, do you plan to use it in the PCI passthrough code? If yes, then I 
would consider to use __maybe_unused.

> 
> This is a candidate for backport to 4.17, 4.16, and possibly 4.15,
> although 4.15 has other issues with clang 12.

The SMMUv3 is a tech preview feature. So we don't usually backport 
fixes. I don't see any reason to diverge here.

Also, note that 4.15 is in any case only security supported since 
October 2022. So such patch would not qualify for backport.

Cheers,

-- 
Julien Grall


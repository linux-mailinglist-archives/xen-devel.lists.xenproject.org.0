Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E787E6A5C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 13:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629642.981988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r13u5-00077t-PE; Thu, 09 Nov 2023 12:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629642.981988; Thu, 09 Nov 2023 12:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r13u5-00074Y-MN; Thu, 09 Nov 2023 12:12:57 +0000
Received: by outflank-mailman (input) for mailman id 629642;
 Thu, 09 Nov 2023 12:12:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r13u4-00074Q-0j
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 12:12:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r13u3-0003wL-KV; Thu, 09 Nov 2023 12:12:55 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=[10.95.133.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r13u3-00033d-Eu; Thu, 09 Nov 2023 12:12:55 +0000
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
	bh=h8UAZf+xsdb8pjY4Qr4xGSL61EbcPKpiPN3vjqCg+ow=; b=tHabmgWXzkzHo43cFLWzdFtIw9
	bkMXCqhktRWGd9bhrABGUbK5bYCEa4zk9rhORsB7dBAXPbGDst8ef0cGX6POP2RDOthHLDce5DQLd
	284EgqnBoRHTaUwF2ECrrEba1dn9N+5sPmqEukeyV0we6X1DdniBo2K6iDkwFL5wYtiU=;
Message-ID: <622cd2ce-1c01-40eb-bef3-064baddf49a7@xen.org>
Date: Thu, 9 Nov 2023 12:12:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] xen/arm: Map ITS doorbell register to IOMMU page
 tables.
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-10-stewart.hildebrand@amd.com>
 <7123faae-562e-4e78-a5d2-18c5ccc1b7f6@xen.org>
 <a368fb39-f8c5-4238-803a-08e83d2c43e9@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a368fb39-f8c5-4238-803a-08e83d2c43e9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/11/2023 20:10, Stewart Hildebrand wrote:
>>> +            ret = map_mmio_regions(its->d, gaddr_to_gfn(its->doorbell_address),
>>> +                           PFN_UP(ITS_DOORBELL_OFFSET),
>>> +                           maddr_to_mfn(its->doorbell_address));
>>
>>
>> A couple of remarks. Firstly, we know the ITS doorbell at domain
>> creation. So I think thish should be called from vgic_v3_its_init_virtual().
>>
>> Regardless that, any code related to device initialization belongs to
>> gicv3_its_map_guest_device().
> 
> How about calling it from a map_hwdom_extra_mappings() hook?
> For example see [1].

I don't think this is the correct place because sooner or later you will 
need the same mapping when enable the ITS for domUs. So I think the 
mapping should be part of vgic_v3_its_init_virtual().

Cheers,

-- 
Julien Grall


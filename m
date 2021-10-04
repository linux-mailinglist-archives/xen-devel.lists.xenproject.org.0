Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E594205F0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 08:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201194.355620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXHfi-00006v-87; Mon, 04 Oct 2021 06:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201194.355620; Mon, 04 Oct 2021 06:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXHfi-0008VW-3K; Mon, 04 Oct 2021 06:41:58 +0000
Received: by outflank-mailman (input) for mailman id 201194;
 Mon, 04 Oct 2021 06:41:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mXHfg-0008VP-52
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 06:41:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mXHfd-0005Oi-PE; Mon, 04 Oct 2021 06:41:53 +0000
Received: from laubervilliers-658-1-38-51.w217-128.abo.wanadoo.fr
 ([217.128.182.51] helo=[192.168.84.62])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mXHfd-0005KO-FW; Mon, 04 Oct 2021 06:41:53 +0000
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
	bh=VZzRJ1f0EbcrV3t9fSr9jAh3C0eP9022KE2MRf/+xsY=; b=OOYslnTDL0Ap4MtGfIGQ2KkRw4
	bazfo8m/wcIN842DecSNBPH6gvAVkgnzPN4kL9LRRDS+naI5HbCg6kdl/2MN05J40VayN5o3oPJOf
	sO7DvZ403k92WL0D6UTFXsoSzb5AUtNEEsmt4YPSt2bcG2T4fUcCwyoV3YBDdaiz5CDQ=;
Message-ID: <c0f3969a-5d44-063e-6ab2-f6f5d904901d@xen.org>
Date: Mon, 4 Oct 2021 08:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH V4 2/3] xen/arm: Add handling of extended regions for Dom0
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110011704350.3209@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.21.2110011704350.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 02/10/2021 02:33, Stefano Stabellini wrote:
> On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The extended region (safe range) is a region of guest physical
>> address space which is unused and could be safely used to create
>> grant/foreign mappings instead of wasting real RAM pages from
>> the domain memory for establishing these mappings.
>>
>> The extended regions are chosen at the domain creation time and
>> advertised to it via "reg" property under hypervisor node in
>> the guest device-tree. As region 0 is reserved for grant table
>> space (always present), the indexes for extended regions are 1...N.
>> If extended regions could not be allocated for some reason,
>> Xen doesn't fail and behaves as usual, so only inserts region 0.
>>
>> Please note the following limitations:
>> - The extended region feature is only supported for 64-bit domain
>>    currently.
>> - The ACPI case is not covered.
>>
>> ***
>>
>> As Dom0 is direct mapped domain on Arm (e.g. MFN == GFN)
>> the algorithm to choose extended regions for it is different
>> in comparison with the algorithm for non-direct mapped DomU.
>> What is more, that extended regions should be chosen differently
>> whether IOMMU is enabled or not.
>>
>> Provide RAM not assigned to Dom0 if IOMMU is disabled or memory
>> holes found in host device-tree if otherwise. Make sure that
>> extended regions are 2MB-aligned and located within maximum possible
>> addressable physical memory range. The minimum size of extended
>> region is 64MB. The maximum number of extended regions is 128,
>> which is an artificial limit to minimize code changes (we reuse
>> struct meminfo to describe extended regions, so there are an array
>> field for 128 elements).
>>
>> It worth mentioning that unallocated memory solution (when the IOMMU
>> is disabled) will work safely until Dom0 is able to allocate memory
>> outside of the original range.
>>
>> Also introduce command line option to be able to globally enable or
>> disable support for extended regions for Dom0 (enabled by default).
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> I thought about it and I decided to commit this patch because it doesn't
> actually need anything from the other two patches, and it is very useful
> on its own (both of them are for domU, while this one is for dom0).
> 
> In regards to Julien's suggestion: as explained in earlier emails I
> prefer this version but I don't have a strong opinion. If Julien still
> prefers the other approach we can still change it in time for 4.16
> (Oleksandr has already implemented both and I am happy to review.)

Lets keep the committed approach for the 4.16. This is not something we 
tie into the ABI so it can be modified later on if we find some issues 
(i.e. more and more ranges to exclude).

However, I would still like to see some changes on top of this patch for 
4.16 (will comment separately).

Cheers,

-- 
Julien Grall


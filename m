Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1A731DDD8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 18:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86377.162165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCQEO-0006BR-EV; Wed, 17 Feb 2021 17:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86377.162165; Wed, 17 Feb 2021 17:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCQEO-0006B5-BH; Wed, 17 Feb 2021 17:03:16 +0000
Received: by outflank-mailman (input) for mailman id 86377;
 Wed, 17 Feb 2021 17:03:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCQEM-0006B0-RC
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 17:03:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff620281-393a-4fce-a474-807e649b114f;
 Wed, 17 Feb 2021 17:03:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D249CB7AE;
 Wed, 17 Feb 2021 17:03:12 +0000 (UTC)
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
X-Inumbo-ID: ff620281-393a-4fce-a474-807e649b114f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613581392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ofAHBmxiXPw1XkhhaHsSb0iNu3YjM+dKi/K/AamBjAo=;
	b=fa6pjqKtXTEqcyIiun3ywb4rGaRjbEvMOHurmwb0Uuzu7zD/3w63IAvVXFDrGWkpgomLcJ
	SJdjaHg6S2BUTX/yjQnX3ri/OE0ia+espKFYJKtPVAd8mip4JkGMmNehWF/fw/keIEc+ZR
	y9YgRDH/o8j2Sauq6uJBsaHJY5cXb7s=
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
 <538F9995-6D8D-4B02-A9B6-7C5F26F95657@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d416b29a-ac05-3bc7-2c60-0b0f3e8febba@suse.com>
Date: Wed, 17 Feb 2021 18:03:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <538F9995-6D8D-4B02-A9B6-7C5F26F95657@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.02.2021 16:34, Bertrand Marquis wrote:
>> On 17 Feb 2021, at 02:00, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> Today Linux uses the swiotlb-xen driver (drivers/xen/swiotlb-xen.c) to
>> translate addresses for DMA operations in Dom0. Specifically,
>> swiotlb-xen is used to translate the address of a foreign page (a page
>> belonging to a domU) mapped into Dom0 before using it for DMA.
>>
>> This is important because although Dom0 is 1:1 mapped, DomUs are not. On
>> systems without an IOMMU swiotlb-xen enables PV drivers to work as long
>> as the backends are in Dom0. Thanks to swiotlb-xen, the DMA operation
>> ends up using the MFN, rather than the GFN.
>>
>>
>> On systems with an IOMMU, this is not necessary: when a foreign page is
>> mapped in Dom0, it is added to the Dom0 p2m. A new GFN->MFN translation
>> is enstablished for both MMU and SMMU. Dom0 could safely use the GFN
>> address (instead of the MFN) for DMA operations and they would work. It
>> would be more efficient than using swiotlb-xen.
>>
>> If you recall my presentation from Xen Summit 2020, Xilinx is working on
>> cache coloring. With cache coloring, no domain is 1:1 mapped, not even
>> Dom0. In a scenario where Dom0 is not 1:1 mapped, swiotlb-xen does not
>> work as intended.
>>
>>
>> The suggested solution for both these issues is to add a new feature
>> flag "XENFEAT_ARM_dom0_iommu" that tells Dom0 that it is safe not to use
>> swiotlb-xen because IOMMU translations are available for Dom0. If
>> XENFEAT_ARM_dom0_iommu is set, Linux should skip the swiotlb-xen
>> initialization. I have tested this scheme with and without cache
>> coloring (hence with and without 1:1 mapping of Dom0) on ZCU102 and it
>> works as expected: DMA operations succeed.
> 
> Wouldn’t it be easier to name the flag XENFEAT_ARM_swiotlb_needed ?

Except that "swiotlb" is Linux terminology, which I don't think a
Xen feature should be named after. Names should be generic, except
maybe when they're really targeting exactly one kind of guest
(which imo would better never be the case).

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1630BAED6D5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 10:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028912.1402620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9em-0004Va-4T; Mon, 30 Jun 2025 08:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028912.1402620; Mon, 30 Jun 2025 08:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9em-0004T4-1j; Mon, 30 Jun 2025 08:14:28 +0000
Received: by outflank-mailman (input) for mailman id 1028912;
 Mon, 30 Jun 2025 08:14:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uW9ek-0004Sy-BD
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 08:14:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uW9ei-00AC6d-04;
 Mon, 30 Jun 2025 08:14:24 +0000
Received: from [2a02:8012:3a1:0:a1f7:3d35:dea1:a2b4]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uW9eh-00BYOJ-2n;
 Mon, 30 Jun 2025 08:14:23 +0000
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
	bh=jjn/JAuSlZR29TpVPgH097NnNH+kq+EAI60VCaGaPTM=; b=DalWJiTjKv9Z6XVFfz+qk7Rmpz
	+RQli6POk9XCcAyxHkkFZ60DODWjUqapUnT/CwlxAraP/cIG+CCrs1wJlJnP4UfS+Xk2KGVvmLy65
	2BWvYPt2/ArBd5EXW3sOIYWFPwZ3Ry40Y4SEN7NLkTPONtrAfcPW3RabspeLvr8+mzy8=;
Message-ID: <32bbe11b-a92b-484a-ad77-d0354f8e9339@xen.org>
Date: Mon, 30 Jun 2025 09:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Enhance IPMMU-VMSA driver robustness and debug
 output
To: Jahan Murudi <jahan.murudi.zg@renesas.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20250620103123.2174529-1-jahan.murudi.zg@renesas.com>
 <445c5594-a003-4cd8-aa46-8544c0543b1c@amd.com>
 <OSOPR01MB12408AB9E8CD52B45381E83FFAB7BA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
 <52b27bae-b182-488f-afcb-bdbfbc1a495e@xen.org>
 <OSOPR01MB12408F2C96C1E82BA03F842ECAB46A@OSOPR01MB12408.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <OSOPR01MB12408F2C96C1E82BA03F842ECAB46A@OSOPR01MB12408.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/2025 07:37, Jahan Murudi wrote:
> Hi Julien,
> 
> On 25/06/2025 16:53, Julien Grall wrote:
> 
>> Hi Jahan,
> 
>>>>> +    dsb(sy);
>>>> Any clue why Linux (mainline) does not do that?
> 
>> One process remark, we typically comment inline rather than pasting a quote and replying at the top of the e-mail.
> 
>   Thanks for the style note - I'll follow the inline commenting convention moving forward.
> 
>>> The implementation writel() which contains an implicit dsb(st) which likely sufficient for Linux for its Stage-1 IOMMU usage where CPU and IOMMU interactions are coherent.
>>> However, Xen uses the IPMMU as a Stage-2 IOMMU for non-coherent DMA operations (such as PCIe passthrough), requiring the stronger dsb(sy) to ensure writes fully propagate to the IPMMU >>hardware before continuing.
> 
>> I don't follow. Are you saying the IPMMU driver in Linux doesn't non-coherent DMA operations?
> 
> Let me clarify my understanding:  In native Linux, the IOMMU works at stage-1 (VA -> PA) and typically assumes coherency between CPU and IOMMU. The implicit dsb(st) in writel() is enough there. But in Xen, we use this as stage-2 (GPA -> HPA) for cases like PCI passthrough where devices might be non-coherent. 


I understand for the PCI passthrough, Xen will be using stage-2, so in 
theory the stage-1 could be used by the guest OS. But ultimately, this 
is the same PCI device behind. So if it is not coherent, it should be 
for both stages. Do you have any pointer to the documentation that would 
state otherwise?

 > We might need stronger barrier dsb(sy) in xen because: 1) We can't 
assume the TLB walker is coherent for stage -2

Why would the TLB walker coherent for stage-2 but not stage-1? Any 
pointer to the documentation?

Note, I just noticed that IOMMU_FEAT_COHERENT_WALK is not set for the 
IPMMU. So the "dsb sy" is coherent. However, I find doubful an IOMMU 
would have a difference of coherency between two stages. So maybe we 
should set the flag either unconditionally or based on a register.

 > and we must also prevent(minimise) any DMA operations during TLB 
invalidation( observed some IPMMU hardware limitations in the 
documentation) .

I don't understand what you wrote in parentheses. But isn't it what you 
wrote all true for stage-1?

Cheers,

-- 
Julien Grall



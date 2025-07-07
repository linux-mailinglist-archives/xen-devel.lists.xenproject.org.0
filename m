Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F083EAFB239
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 13:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035507.1407814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYk0G-00048n-Uf; Mon, 07 Jul 2025 11:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035507.1407814; Mon, 07 Jul 2025 11:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYk0G-00047M-Rg; Mon, 07 Jul 2025 11:27:20 +0000
Received: by outflank-mailman (input) for mailman id 1035507;
 Mon, 07 Jul 2025 11:27:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uYk0F-00047E-9p
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 11:27:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uYk0C-005TkX-2W;
 Mon, 07 Jul 2025 11:27:16 +0000
Received: from [2a02:8012:3a1:0:e42c:dbf1:efcd:aabb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uYk0C-004gAO-1m;
 Mon, 07 Jul 2025 11:27:16 +0000
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
	bh=KarcBHKWBUF+w52z0EE00wBSx2uERSHq9cTBQvQQeWs=; b=vY+oliHMhzJjGj5yi7TMGLo/KM
	mUJpRmEBfk9R14XrtJDru10C5GK31F1h4Yx9VbD7bQNglnMSIDsaI9PnbnqbBLIN/H5/6p3BNlKPk
	pqNOss1pq1DrO5FjHpqGf3ZvFxOJdjkLSj1SX09bw0G+ztyPXRA+vgTRR2/GPqZklDzk=;
Message-ID: <429e8943-1721-4c4f-a944-57fb05468bd2@xen.org>
Date: Mon, 7 Jul 2025 12:27:14 +0100
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
 <32bbe11b-a92b-484a-ad77-d0354f8e9339@xen.org>
 <TYRPR01MB124142BE747EAFF7DDDDB9011AB4FA@TYRPR01MB12414.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <TYRPR01MB124142BE747EAFF7DDDDB9011AB4FA@TYRPR01MB12414.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jahan,

On 07/07/2025 12:24, Jahan Murudi wrote:
>> On 30/06/2025 13:44, Julien Grall wrote:
> 
>>> On 25/06/2025 16:53, Julien Grall wrote:
>>
>>> Hi Jahan,
>>
>>>>>>> +    dsb(sy);
>>>>>> Any clue why Linux (mainline) does not do that?
> 
>> I understand for the PCI passthrough, Xen will be using stage-2, so in theory the stage-1 could be used by the guest OS. But ultimately, this is the same PCI device behind. So if it is not coherent, it should be for both stages. Do you have any pointer to the documentation that would state otherwise?
> 
> You're right - coherency characteristics are identical for both stages. My earlier understanding was incorrect.
> 
>> Note, I just noticed that IOMMU_FEAT_COHERENT_WALK is not set for the IPMMU. So the "dsb sy" is coherent. However, I find doubful an IOMMU would have a difference of coherency between two stages. So maybe we should set the flag either unconditionally or based on a register.
> 
> Excellent observation. Current R-car IPMMU doesn't supports coherent walks - we should indeed set this flag unconditionally.

To clarify, the R-car IPMMU doesn't support coherent walk, then the flag 
IOMMU_FEAT_COHERENT_WALK *must not* be set.

Cheers,

-- 
Julien Grall



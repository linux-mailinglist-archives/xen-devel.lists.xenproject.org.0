Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C8976D792
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 21:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575140.900945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRHJh-0001RO-NF; Wed, 02 Aug 2023 19:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575140.900945; Wed, 02 Aug 2023 19:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRHJh-0001OW-JG; Wed, 02 Aug 2023 19:15:29 +0000
Received: by outflank-mailman (input) for mailman id 575140;
 Wed, 02 Aug 2023 19:15:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRHJf-0001OQ-Qw
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 19:15:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRHJd-0002X8-Qs; Wed, 02 Aug 2023 19:15:25 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.26.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRHJd-0002tN-JG; Wed, 02 Aug 2023 19:15:25 +0000
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
	bh=d1wLjcJg9FiEWaX/Xn3WopQJZQYBCLitG5chy4hwaxs=; b=sMTpKGAKHprp63kxop31AE9YrV
	E8K/w80G/j6Lf1RVUtIhRSyV9reZSIg43m/lkjsDfq+DDzIGVCGUEMfW1LNDZ9DSTa3x3s4mo4he0
	WTMkflFLNryJlf0zJxYZe0MEDj5lp6DkOFaGZkejFFEHzVaotZoVE/4Gmq96WBmgEtCs=;
Message-ID: <cf83ca05-2942-0509-9677-dc97b9dc604e@xen.org>
Date: Wed, 2 Aug 2023 20:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
 <9B62D8DC-2425-42A4-A95F-BC41FA27238D@arm.com>
 <46a985da-03e9-b05d-0107-7c54526c71f9@xen.org>
 <E90F9075-3578-472A-AF42-6495F8E5456B@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <E90F9075-3578-472A-AF42-6495F8E5456B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 02/08/2023 19:48, Luca Fancellu wrote:
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 5cdba07df964..93309cd49144 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -18,6 +18,7 @@ config ARM
>          select HAS_PMAP
>          select HAS_UBSAN
>          select IOMMU_FORCE_PT_SHARE
> +       select GICV2 if !GICV3 && !NEW_VGIC
>   
>   config ARCH_DEFCONFIG
>          string
> 
> If I’ve played a bit with the menuconfig and it selects GICv2 if no other gic driver is selected, so basically
> as before when gicv2 was always enabled.
> If everyone agrees I can use this solution and include it in the next push

I am not thrilled with this approach. I understand that the default 
today is GICv2, but why should it continue to be like that?

Even if we were switching to GICv3, it feels rather a odd approach 
because you would make it work for one set of the users but not the others.

Cheers,

-- 
Julien Grall


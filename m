Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245A37B15D3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 10:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609353.948385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmB2-0005O0-So; Thu, 28 Sep 2023 08:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609353.948385; Thu, 28 Sep 2023 08:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlmB2-0005LW-PF; Thu, 28 Sep 2023 08:15:16 +0000
Received: by outflank-mailman (input) for mailman id 609353;
 Thu, 28 Sep 2023 08:15:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qlmB1-0005LQ-0A
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 08:15:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlmB0-0007D4-Qc; Thu, 28 Sep 2023 08:15:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlmB0-0001rh-K0; Thu, 28 Sep 2023 08:15:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=viE0Oye7B3X4rwylIwHWjoNBA9YJD8fcBZrsWeANWDQ=; b=Ksz1vsoi83hcVd9TDFhoIDR6zr
	4SoGqj4sDVMXw2vYwS7yaQQ7TPwV5Dw7TjMFQLrqKKZnIV21Gs970sjoQdKRJKxasGhaySzjTnbHC
	nTCXKSarazvHXT/Yub+cq9obOpsqG3AA2lwte8bl5jKdd+EWSnLAVIw0q5ENLj5fCjhY=;
Message-ID: <dba88398-3aef-4541-a8e8-8fd075c0d40e@xen.org>
Date: Thu, 28 Sep 2023 09:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: changing Dom0 data during smc call inside of xen during cache
 coloring
Content-Language: en-GB
To: Oleg Nikitenko <oleshiiwood@gmail.com>, xen-devel@lists.xenproject.org
References: <CA+SAi2tXMupikB2YgEXuq98KnOcqm6zWrk19rNvWTfzf2=ku-w@mail.gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+SAi2tXMupikB2YgEXuq98KnOcqm6zWrk19rNvWTfzf2=ku-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2023 11:07, Oleg Nikitenko wrote:
> Hello,

Hi,

> It is necessary to change some structure contents from xen.
> I have access to the registers.
> One of them keeps the physical address of the structure.
> But this physical address is valid for Dom0 only.
> Dom0 kernel gets it by the call dma_alloc_coherent
> A lower mentioned scheme does not work.

It is not clear to me what you mean by does not work. Are you getting 
the wrong address?

> 
>              uint64_t paramaddr = (uint64_t)get_user_reg(regs, 2);
>              uint64_t phyaddr = mfn_to_maddr(gfn_to_mfn(current->domain,
>                  gaddr_to_gfn(paramaddr)));
>              phyaddr += (paramaddr & ~PAGE_MASK);

Can you provide a bit more context of what are you trying to do with 
phyaddr afterwards? Are you trying to map it in Xen?

Cheers,

-- 
Julien Grall


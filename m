Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B174F489
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 18:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561818.878376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFx1-00084h-Gq; Tue, 11 Jul 2023 16:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561818.878376; Tue, 11 Jul 2023 16:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFx1-00082n-Dx; Tue, 11 Jul 2023 16:10:55 +0000
Received: by outflank-mailman (input) for mailman id 561818;
 Tue, 11 Jul 2023 16:10:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qJFx0-00082h-K1
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 16:10:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJFx0-0003vG-8T; Tue, 11 Jul 2023 16:10:54 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.8.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJFx0-0002o7-2j; Tue, 11 Jul 2023 16:10:54 +0000
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
	bh=8v0c/AtjzRiHbX0M2NJojbYKCAkvwv13WWD0LQ5dIYk=; b=cBFgumKbiDixijx5drrtNNGf2O
	gNjzq1pQY1OJ1iUZdGCKt7AvsV6XF212N741exMPlKqQXQrnk2gt6ze+VdqHNO/kz6s7BMGYG+99D
	kWJcmBfOuulX6AkKG8HMcONbPN+Owr4/KtgctB4489thXdVtIXs4lskamRTwxGhPORvI=;
Message-ID: <da7a0268-57d6-74ad-4f22-80ca8a0a5f3c@xen.org>
Date: Tue, 11 Jul 2023 17:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: pci: fix check in pci_check_bar()
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20230711154648.729567-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230711154648.729567-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/07/2023 16:46, Stewart Hildebrand wrote:
> When mapping BARs for vPCI, it's valid for a BAR start address to equal the BAR
> end address (i.e. s == e). However, pci_check_bar() currently returns false in
> this case, which results in Xen not mapping the BAR. In this example boot log,
> Linux has mapped the BARs, but since Xen did not map them, Linux encounters a
> data abort and panics:
> 
> [    2.593300] pci 0000:00:00.0: BAR 0: assigned [mem 0x50008000-0x50008fff]
> [    2.593682] pci 0000:00:00.0: BAR 2: assigned [mem 0x50009000-0x50009fff]
> [    2.594066] pci 0000:00:00.0: BAR 4: assigned [mem 0x5000a000-0x5000afff]
> ...
> [    2.810502] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
> (XEN) 0000:00:00.0: not mapping BAR [50008, 50008] invalid position
> (XEN) 0000:00:00.0: not mapping BAR [50009, 50009] invalid position
> (XEN) 0000:00:00.0: not mapping BAR [5000a, 5000a] invalid position
> [    2.817502] virtio-pci 0000:00:00.0: virtio_pci: leaving for legacy driver
> [    2.817853] virtio-pci 0000:00:00.0: enabling bus mastering
> (XEN) arch/arm/traps.c:1992:d0v0 HSR=0x00000093010045 pc=0xffff8000089507d4 gva=0xffff80000c46d012 gpa=0x00000050008012
> [    2.818397] Unable to handle kernel ttbr address size fault at virtual address ffff80000c46d012
> ...
> 
> Fix this by changing the condition in pci_check_bar().
> 
> Fixes: cc80e2bab0d0 ("xen/pci: replace call to is_memory_hole to pci_check_bar")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
>   xen/arch/arm/pci/pci-host-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 7cdfc89e5211..e0ec526f9776 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -406,7 +406,7 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>           .is_valid = false
>       };
>   
> -    if ( s >= e )
> +    if ( s > e )
>           return false;

This is yet another example why using start/end in parameters are a bad 
idea :). I am OK if you want to keep the same interface, but can we at 
least document on top of the function whether we are expecting 'end' to 
be excluded or included?

Cheers,

-- 
Julien Grall


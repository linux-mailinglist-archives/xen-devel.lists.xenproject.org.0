Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3A43CFD7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 19:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217149.377020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmqB-0001Ri-H1; Wed, 27 Oct 2021 17:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217149.377020; Wed, 27 Oct 2021 17:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfmqB-0001PJ-De; Wed, 27 Oct 2021 17:35:55 +0000
Received: by outflank-mailman (input) for mailman id 217149;
 Wed, 27 Oct 2021 17:35:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mfmq9-0001PD-VR
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 17:35:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mfmq8-0000gG-MY; Wed, 27 Oct 2021 17:35:52 +0000
Received: from [54.239.6.185] (helo=[192.168.29.96])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mfmq8-0002HX-Ei; Wed, 27 Oct 2021 17:35:52 +0000
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
	bh=Vd+DQmk1rQNBtODXMucWIaaELYAfQaTQwGvyh1TUmws=; b=HJlaAOw0sp6GHztbbVWwtI/wQw
	WW52867gTr2t0SCv2aTJY7m0otaxPoIbGThBUtl0UDTB94CZTNpR1Ow4xn7B6+V8RWUWQCBnc1acf
	IvTS9kOd7YafXkJxMY/CXqUSGFKg9HJ/QdG2+1c0R+XfI08AgJjQNXyFeSs/eWF8zioY=;
Message-ID: <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
Date: Wed, 27 Oct 2021 18:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, iwj@xenproject.org, bertrand.marquis@arm.com,
 rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211027082533.1406015-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 27/10/2021 09:25, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
> the base address may not be aligned in the way that the translation
> always work. If not adjusted with respect to the base address it may not be
> able to properly convert SBDF and crashes:
> 
> (XEN) vpci_mmio_read 0000:65:1a.0 reg 8bc gpa e65d08bc

I can't find a printk() that may output this message. Where does this 
comes from?

Anyway, IIUC the guest physical address is 0xe65d08bc which, if I am not 
mistaken, doesn't belong to the range advertised for GUEST_VPCI_ECAM.

IMHO, the stack trace should come from usptream Xen or need some 
information to explain how this was reproduced.

> (XEN) Data Abort Trap. Syndrome=0x6
> (XEN) Walking Hypervisor VA 0x467a28bc on CPU0 via TTBR 0x00000000481d5000
I can understnad that if we don't substract GUEST_VPCI_ECAM, we would 
(in theory) not get the correct BDF. But... I don't understand how this 
would result to a data abort in the hypervisor.

In fact, I think the vPCI code should be resilient enough to not crash 
if we pass the wrong BDF.

When there is a data abort in Xen, you should get a stack trace from 
where this comes from. Can you paste it here?

> 
> Fix this by adjusting the gpa with respect to the host bridge base address
> in a way as it is done for x86.
> 
> Fixes: d59168dc05a5 ("xen/arm: Enable the existing x86 virtual PCI support for ARM")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   xen/arch/arm/vpci.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 8f40a0dec6d2..23f45386f4b3 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -24,7 +24,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>       unsigned long data;
>   
>       /* We ignore segment part and always handle segment 0 */
> -    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
> +    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);

Looking at the rest of the rest, it seems that
  1) the issue is latent as the bits 0-27 are clear
  2) this will need to be modified to take into account dom0.

So I would prefer if the base address is passed differently (maybe in 
priv?) from the start. This will avoid extra modification that you 
already plan to have in a follow-up series.

>   
>       if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>                           1U << info->dabt.size, &data) )
> @@ -44,7 +44,7 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>       pci_sbdf_t sbdf;
>   
>       /* We ignore segment part and always handle segment 0 */
> -    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa);
> +    sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);
>   
>       return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                              1U << info->dabt.size, r);
> 

Cheers,

-- 
Julien Grall


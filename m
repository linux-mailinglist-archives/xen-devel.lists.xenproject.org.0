Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA20608BE1
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 12:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428200.678123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omC1W-0007Ra-U7; Sat, 22 Oct 2022 10:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428200.678123; Sat, 22 Oct 2022 10:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omC1W-0007OS-Qd; Sat, 22 Oct 2022 10:46:38 +0000
Received: by outflank-mailman (input) for mailman id 428200;
 Sat, 22 Oct 2022 10:46:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omC1V-0007OM-2s
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 10:46:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omC1U-0000vu-BY; Sat, 22 Oct 2022 10:46:36 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omC1U-0007XO-5g; Sat, 22 Oct 2022 10:46:36 +0000
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
	bh=K5TKwJV1rjxZBEEN1koO3DY4ZNll8HMN3a0w67D4g7A=; b=ZS2ArrvcOTk1sNd7XApAG/aAg+
	fVy5XYcJBNoUMdUvvqscdSSE7lNKNwtOeNCfQ7KF+F63E5yn4qEYC/qKUEARHM/BC2Brfr4dB+BMB
	tE6KbDQ63mWGMF5HPqrJj4hwSSY7jNwZzSXvFDaBVx2tsDJ0wFMOkPRfR4Y2rTgQrWgI=;
Message-ID: <1de3eac1-0ca5-5ff8-58e4-6e1cadd58ca0@xen.org>
Date: Sat, 22 Oct 2022 11:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [RFC PATCH v1 06/12] Arm: GICv3: Emulate of ICC_SGI1R on AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-7-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221021153128.44226-7-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Title: Similar to the previous patch, you are fixing the existing emulation.

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> Refer Arm IHI 0069H ID020922, 12.5.23, ICC_SGI1R is a 64 bit register on
> Aarch32 systems. Thus, the prototype needs to change to reflect this.
At first, it wasn't obvious why changing the prototype is enough. So it 
would be good to explain it in the commit message.

> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/vgic-v3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 9f31360f56..48e8ef95d2 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1482,7 +1482,7 @@ write_reserved:
>       return 1;
>   }
>   
> -static bool vgic_v3_to_sgi(struct vcpu *v, register_t sgir)
> +static bool vgic_v3_to_sgi(struct vcpu *v, uint64_t sgir)
>   {
>       int virq;
>       int irqmode;

Cheers,

-- 
Julien Grall


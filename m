Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C27B9CF7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 14:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612973.953177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNV8-0006C1-TO; Thu, 05 Oct 2023 12:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612973.953177; Thu, 05 Oct 2023 12:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoNV8-0006AF-Qk; Thu, 05 Oct 2023 12:30:46 +0000
Received: by outflank-mailman (input) for mailman id 612973;
 Thu, 05 Oct 2023 12:30:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoNV6-0006A9-Sz
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 12:30:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoNV6-0003mf-HB; Thu, 05 Oct 2023 12:30:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoNV6-0002c0-67; Thu, 05 Oct 2023 12:30:44 +0000
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
	bh=RQnj51vXwHYaxKfvrDp2GXRhis3/V/u4DVotdVP05Kc=; b=gL18mRux8NA6gTVurz5jNdqT6V
	sp2nkBnI31luxbqbjuslcUPPggiV1w63xtnIZmC8Dgn6JTshaEqEAxpnZ5VEwSIKDNJbYwperd3mV
	U63Nw/HydZKHyn7bOKWj7M02lW7Nmu3Kl4Ns5Ks9upalgv6WHcb0Z86CeO0JWwSVBYQ0=;
Message-ID: <c38c503c-1ec8-471c-911f-907e3bfd7c85@xen.org>
Date: Thu, 5 Oct 2023 13:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [for-4.18] Re: [PATCH v2] arm/ioreq: guard interaction data on
 read/write operations
Content-Language: en-GB
To: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "andrii.chepurnyi82@gmail.com" <andrii.chepurnyi82@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>
References: <20231005092141.2540016-1-andrii_chepurnyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231005092141.2540016-1-andrii_chepurnyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Henry)

Hi Andrii,

@Henry, this patch is a candidate for Xen 4.18. The fix is 
self-contained in the IOREQ code which is in tech preview. So I think 
the risk is limited.

On 05/10/2023 10:21, Andrii Chepurnyi wrote:
> For read operations, there's a potential issue when the data field
> of the ioreq struct is partially updated in the response. To address
> this, zero data field during read operations. This modification
> serves as a safeguard against implementations that may inadvertently
> partially update the data field in response to read requests.
> For instance, consider an 8-bit read operation. In such cases, QEMU,
> returns the same content of the dat field with only 8 bits of
> updated data. This behavior could potentially result in the
> propagation of incorrect or unintended data to ioreq clients.
> There is also a good point to guard interaction data with actual size
> of the interaction.

I don't quite understand the last sentence. Is it meant to justify why 
the two other changes? I.e.:
   * Masking the value for a write
   * Masking the value returned by the Device-Model

>  > Signed-off-by: Andrii Chepurnyi <andrii_chepurnyi@epam.com>
> ---
>   xen/arch/arm/ioreq.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 3bed0a14c0..26dae8ca28 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -17,6 +17,8 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>   {
>       const union hsr hsr = { .bits = regs->hsr };
>       const struct hsr_dabt dabt = hsr.dabt;
> +    const uint8_t access_size = (1 << dabt.size) * 8;

Please use 1U.

> +    const uint64_t access_mask = GENMASK_ULL(access_size - 1, 0);
>       /* Code is similar to handle_read */
>       register_t r = v->io.req.data;
>   
> @@ -26,6 +28,7 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>       if ( dabt.write )
>           return IO_HANDLED;
>   
> +    r &= access_mask;

I would add a comment on top with:

"The Arm Arm requires the value to be zero-extended to the size of the 
register. The Device Model is not meant to touch the bits outside of the 
access size, but let's not trust that."

>       r = sign_extend(dabt, r);
>   
>       set_user_reg(regs, dabt.reg, r);
> @@ -39,6 +42,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>       struct vcpu_io *vio = &v->io;
>       const struct instr_details instr = info->dabt_instr;
>       struct hsr_dabt dabt = info->dabt;
> +    const uint8_t access_size = (1 << dabt.size) * 8;

Please use 1U.

> +    const uint64_t access_mask = GENMASK_ULL(access_size - 1, 0);
>       ioreq_t p = {
>           .type = IOREQ_TYPE_COPY,
>           .addr = info->gpa,
> @@ -79,8 +84,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>           return IO_HANDLED;
>   
>       ASSERT(dabt.valid);
> -

This change seems to be spurious?

> -    p.data = get_user_reg(regs, info->dabt.reg);
> +    p.data = p.dir ? 0 : get_user_reg(regs, info->dabt.reg) & access_mask;

For this case, I would add:

"During a write access, the Device Model only need to know the content 
of the bits associated with the access size (e.g. for 8-bit, the lower 
8-bits). During a read access, the Device Model don't need to know any 
value. So restrict the value it can access."

Cheers,

-- 
Julien Grall


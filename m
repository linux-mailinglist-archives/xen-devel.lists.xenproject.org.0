Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B07B6AE6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 15:50:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612228.952068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnflw-0007Ye-5L; Tue, 03 Oct 2023 13:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612228.952068; Tue, 03 Oct 2023 13:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnflw-0007VI-2B; Tue, 03 Oct 2023 13:49:12 +0000
Received: by outflank-mailman (input) for mailman id 612228;
 Tue, 03 Oct 2023 13:49:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qnflt-0007VC-VO
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 13:49:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnflt-000160-BV; Tue, 03 Oct 2023 13:49:09 +0000
Received: from [15.248.2.158] (helo=[10.24.67.42])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnflt-0002Y7-2k; Tue, 03 Oct 2023 13:49:09 +0000
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
	bh=JGPGCQdxcy0NRd/uv+tBlifnKjpGc9ZLPgVyx3qLY/U=; b=GV93WFJXsHXVoORUStapu0B/JU
	PzoIC/UXTe0ST0a3uFmu+8RruPocNMwgYjiEfFKmb23WD9/HnAVpfYcQSWOGKDIsyB1ruhnuUMtbN
	uV8+r1OaV1OFNTNMxJ0e40gmmzMGu+X2ScFWbGbz2ct8t8KUfPDw2wL4Cuib7chqugfw=;
Message-ID: <27044e68-4a49-4f1d-b8a9-174810efb5fe@xen.org>
Date: Tue, 3 Oct 2023 14:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/ioreq: clean data field in ioreq struct on read
 operations
Content-Language: en-GB
To: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "andrii.chepurnyi82@gmail.com" <andrii.chepurnyi82@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231003131923.2289867-1-andrii_chepurnyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231003131923.2289867-1-andrii_chepurnyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/10/2023 14:19, Andrii Chepurnyi wrote:
> For read operations, there's a potential issue when the data field
> of the ioreq struct is partially updated in the response. To address
> this, zero data field during read operations. This modification
> serves as a safeguard against implementations that may inadvertently
> partially update the data field in response to read requests.
> For instance, consider an 8-bit read operation. In such cases, QEMU,
> returns the same content of the data field with only 8 bits of
> updated data. 

Do you have a pointer to the code?

> This behavior could potentially result in the
> propagation of incorrect or unintended data to user-space applications.

I am a bit confused with the last sentence. Are you referring to the 
device emulator or a guest user-space applications? If the latter, then 
why are you singling out user-space applications?

> 
> Signed-off-by: Andrii Chepurnyi <andrii_chepurnyi@epam.com>
> ---
>   xen/arch/arm/ioreq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 3bed0a14c0..aaa2842acc 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -80,7 +80,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>   
>       ASSERT(dabt.valid);
>   
> -    p.data = get_user_reg(regs, info->dabt.reg);
> +    p.data = (p.dir) ? 0 : get_user_reg(regs, info->dabt.reg);

To take the 8-bits example, the assumption is that QEMU will not touch 
the top 24-bits. I guess that's a fair assumption. But, at this point, I 
feel it would be better to also zero the top 24-bits in handle_ioserv() 
when writing back to the register.

Also, if you are worried about unintended data shared, then we should 
also make the value of get_user_reg() to only share what matters to the 
device model.

Lastly, NIT, the parenthesis around p.dir are not necessary.

>       vio->req = p;
>       vio->suspended = false;
>       vio->info.dabt_instr = instr;

Cheers,

-- 
Julien Grall


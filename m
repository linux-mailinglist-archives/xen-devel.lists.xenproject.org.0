Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C508B49DF44
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 11:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261402.452570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD1vi-0008Ef-KH; Thu, 27 Jan 2022 10:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261402.452570; Thu, 27 Jan 2022 10:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD1vi-0008Bp-GA; Thu, 27 Jan 2022 10:23:02 +0000
Received: by outflank-mailman (input) for mailman id 261402;
 Thu, 27 Jan 2022 10:23:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nD1vh-0008Bj-Bw
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 10:23:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD1vg-0005BP-Nm; Thu, 27 Jan 2022 10:23:00 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.9.172]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD1vg-0005v2-HG; Thu, 27 Jan 2022 10:23:00 +0000
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
	bh=vPJI9gtyLCYXwij5hv1a4o2sHv9CU//8h/50obrRdsI=; b=G9KLIcmWofGNS8waSOkRn7dMgM
	r1N3GfHwRq5wxbQj1o7zFKbab6mSssm27os6oEXcjHPvWiBN9dm08yFanvtWFlAjcH4UL5fNh3B0T
	Pxc3UZtMOvZE2ar2JdmkcIz+rc7GprLiotocC9usRCnt+j4t+BeEtB+P8cklvBYIAYLA=;
Message-ID: <f09f4f12-5eb8-ce1e-3fed-6f2d9ba7809d@xen.org>
Date: Thu, 27 Jan 2022 10:22:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, jbeulich@suse.com,
 wei.chen@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220125211808.23810-1-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220125211808.23810-1-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

Below some more comments on a few issues I noticed while reviewing your 
other patch yesterday.

On 25/01/2022 21:18, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 729287e37c..b9c15e1fe7 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -106,14 +106,29 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           .gpa = gpa,
>           .dabt = dabt
>       };
> +    int rc;
> +    union ldr_str_instr_class instr = {0};
>   
>       ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>   
> +    /*
> +     * Armv8 processor does not provide a valid syndrome for post-indexing
> +     * ldr/str instructions. So in order to process these instructions,
> +     * Xen must decode them.
> +     */
> +    if ( !info.dabt.valid )
> +    {
> +        rc = decode_instruction(regs, &info.dabt, &instr);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> +            return IO_ABORT;

Sorry, I should have noticed this earlier.

If we return IO_ABORT here, it means Xen will inject an abort to the 
domain. However, an I/O may trap in Xen for other reasons. One explain 
is when Xen modify the P2M it has to temporarily remove the mapping and 
then recreate it. This leaves a small window when an access may trap.

In this situation, we don't care that the instruction syndrome is 
invalid. Therefore, it would be wrong to inject an abort to the domain. 
What we want is looking whether another part of Xen handles it.

One possibility would be to return IO_UNHANDLED here. However... it 
means that we will end up to decode the instruction when this is not 
necessary. So I think we want to move the decode after 
find_mmio_handler() has succeeded.

Regarding, try_fwd_ioserv(). As you rightly pointed out, it already 
contains a dabt.valid check. We would want to augment it to decode the 
instruction. I think the thumb workaround should be there as well.

> +        }
> +    }
> +
>       handler = find_mmio_handler(v->domain, info.gpa);
>       if ( !handler )
>       {
> -        int rc;
> -
>           rc = try_fwd_ioserv(regs, v, &info);
>           if ( rc == IO_HANDLED )
>               return handle_ioserv(regs, v);
> @@ -121,10 +136,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           return rc;
>       }
>   
> -    /* All the instructions used on emulated MMIO region should be valid */
> -    if ( !dabt.valid )
> -        return IO_ABORT;
> -
>       /*
>        * Erratum 766422: Thumb store translation fault to Hypervisor may
>        * not have correct HSR Rt value.
> @@ -134,7 +145,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>       {
>           int rc;
>   
> -        rc = decode_instruction(regs, &info.dabt);
> +        rc = decode_instruction(regs, &info.dabt, NULL);
>           if ( rc )
>           {
>               gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> @@ -143,9 +154,21 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>       }
>   
>       if ( info.dabt.write )
> -        return handle_write(handler, v, &info);
> +        rc = handle_write(handler, v, &info);
>       else
> -        return handle_read(handler, v, &info);
> +        rc = handle_read(handler, v, &info);
> +
> +#if CONFIG_ARM_64
> +    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )
> +    {
> +        if ( instr.value != 0 )
> +        {
> +            post_increment_register(&instr);
> +        }

This path will not be reached when the I/O is forwarded to an IOREQ 
server. I think we need to add similar code in 
arch_ioreq_complete_mmio() (just before advance_pc()).

Just for completeness, even if it would be easier, I don't think we can 
update the register before the MMIO is handled (i.e. in 
try_fwd_ioserv()) because in theory the instruction is not completed. So 
I am a bit worry that this may impact other subsystem (the obvious one 
are the registers dump would be incorrect).

Cheers,

-- 
Julien Grall


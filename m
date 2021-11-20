Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C21457A7A
	for <lists+xen-devel@lfdr.de>; Sat, 20 Nov 2021 02:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228281.394976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moFO9-00038Z-5B; Sat, 20 Nov 2021 01:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228281.394976; Sat, 20 Nov 2021 01:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moFO9-00035B-20; Sat, 20 Nov 2021 01:41:57 +0000
Received: by outflank-mailman (input) for mailman id 228281;
 Sat, 20 Nov 2021 01:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAp4=QH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1moFO7-00034m-3X
 for xen-devel@lists.xenproject.org; Sat, 20 Nov 2021 01:41:55 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 088daeef-49a3-11ec-9787-a32c541c8605;
 Sat, 20 Nov 2021 02:41:52 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8574C61AD2;
 Sat, 20 Nov 2021 01:41:50 +0000 (UTC)
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
X-Inumbo-ID: 088daeef-49a3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637372510;
	bh=T7rK7+MJP8qaRA4FiJNqZjUpbph/9PXqTGJpjSvPuG8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XC2iU31BiwXhtuK8jryuZw/Tc6AofJbUagxqTF7TqNvn8oFsJgB3UqsKYYWe+16Np
	 27qFqM0i9J/IWEkMLrLPq0KFnJC7RBaUzPO6CTUqNQSX56bSmby6tfCQoNyyD+VxBp
	 atibpwCppTZqdLcqh/wtxDBW6I5KYgpRpR2VnF3464bepQA18CXmIBsh9tGeo+dgL0
	 zlyUawrzNjMUH1yeWsD6M7GlydAd6zsAb9QYTwEbaDXmYQ+kBz3l2N9QLtnvwE593j
	 8UCMCh1DJlAk4hgt4gVlg4gk0IYDbQ2mv1d+LdkSgI06JYrMzMb6f6oNptvhLV322e
	 EZpCQXYdoBSJA==
Date: Fri, 19 Nov 2021 17:41:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, rahul.singh@arm.com, ayankuma@xilinx.com
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str post-indexing
 instructions
In-Reply-To: <20211119165202.42442-1-ayankuma@xilinx.com>
Message-ID: <alpine.DEB.2.22.394.2111191721000.1412361@ubuntu-linux-20-04-desktop>
References: <20211119165202.42442-1-ayankuma@xilinx.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Nov 2021, Ayan Kumar Halder wrote:
> At present, post indexing instructions are not emulated by Xen.
> When Xen gets the exception, EL2_ESR.ISV bit not set. Thus as a
> result, data abort is triggered.
> 
> Added the logic to decode ldr/str post indexing instructions.
> With this, Xen can decode instructions like these:-
> ldr w2, [x1], #4
> Thus, domU can read ioreg with post indexing instructions.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
> Note to reviewer:-
> This patch is based on an issue discussed in 
> https://lists.xenproject.org/archives/html/xen-devel/2021-11/msg00969.html
> "Xen/ARM - Query about a data abort seen while reading GICD registers"
> 
> 
>  xen/arch/arm/decode.c | 77 +++++++++++++++++++++++++++++++++++++++++++
>  xen/arch/arm/io.c     | 14 ++++++--
>  2 files changed, 88 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 792c2e92a7..7b60bedbc5 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,80 @@ bad_thumb2:
>      return 1;
>  }
>  
> +static inline int32_t extract32(uint32_t value, int start, int length)
> +{
> +    int32_t ret;
> +
> +    if ( !(start >= 0 && length > 0 && length <= 32 - start) )
> +        return -EINVAL;
> +
> +    ret = (value >> start) & (~0U >> (32 - length));
> +
> +    return ret;
> +}
> +
> +static int decode_64bit_loadstore_postindexing(register_t pc, struct hsr_dabt *dabt)
> +{
> +    uint32_t instr;
> +    int size;
> +    int v;
> +    int opc;
> +    int rt;
> +    int imm9;
> +
> +    /* For details on decoding, refer to Armv8 Architecture reference manual
> +     * Section - "Load/store register (immediate post-indexed)", Pg 318
> +    */
> +    if ( raw_copy_from_guest(&instr, (void * __user)pc, sizeof (instr)) )
> +        return -EFAULT;
> +
> +    /* First, let's check for the fixed values */
> +
> +    /*  As per the "Encoding table for the Loads and Stores group", Pg 299
> +     * op4 = 1 - Load/store register (immediate post-indexed)
> +     */
> +    if ( extract32(instr, 10, 2) != 1 )
> +        goto bad_64bit_loadstore;
> +
> +    /* For the following, refer to "Load/store register (immediate post-indexed)"
> +     * to get the fixed values at various bit positions.
> +     */
> +    if ( extract32(instr, 21, 1) != 0 )
> +        goto bad_64bit_loadstore;
> +
> +    if ( extract32(instr, 24, 2) != 0 )
> +        goto bad_64bit_loadstore;
> +
> +    if ( extract32(instr, 27, 3) != 7 )
> +        goto bad_64bit_loadstore;
> +
> +    size = extract32(instr, 30, 2);
> +    v = extract32(instr, 26, 1);
> +    opc = extract32(instr, 22, 1);
> +
> +    /* At the moment, we support STR(immediate) - 32 bit variant and
> +     * LDR(immediate) - 32 bit variant only.
> +     */
> +    if (!((size==2) && (v==0) && ((opc==0) || (opc==1))))
> +        goto bad_64bit_loadstore;

The opc field is actually 2 bits, not 1. I think we should get both
bits for opc even if some of the configurations are not interesting.


> +    rt = extract32(instr, 0, 5);
> +    imm9 = extract32(instr, 12, 9);
> +
> +    if ( imm9 < 0 )
> +        update_dabt(dabt, rt, size, true);
> +    else
> +        update_dabt(dabt, rt, size, false);

It doesn't look like we are setting dabt->write anywhere.

Also, is info.gpa in try_handle_mmio already updated in the pre-index
case? If not, do we need to apply the offset manually here?

In the post-index case, we need to update the base address in the Rn
register?


> +    dabt->valid = 1;
> +
> +
> +    return 0;
> +bad_64bit_loadstore:
> +    gprintk(XENLOG_ERR, "unhandled 64bit instruction 0x%x\n", instr);
> +    return 1;
> +}
> +
>  static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>  {
>      uint16_t instr;
> @@ -155,6 +229,9 @@ int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
>      if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>          return decode_thumb(regs->pc, dabt);
>  
> +    if ( is_64bit_domain(current->domain) )
> +        return decode_64bit_loadstore_postindexing(regs->pc, dabt);
> +
>      /* TODO: Handle ARM instruction */
>      gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
>  
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 729287e37c..49e80358c0 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -106,14 +106,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>          .gpa = gpa,
>          .dabt = dabt
>      };
> +    int rc;
>  
>      ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>  
>      handler = find_mmio_handler(v->domain, info.gpa);
>      if ( !handler )
>      {
> -        int rc;
> -
>          rc = try_fwd_ioserv(regs, v, &info);
>          if ( rc == IO_HANDLED )
>              return handle_ioserv(regs, v);
> @@ -123,7 +122,16 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>  
>      /* All the instructions used on emulated MMIO region should be valid */
>      if ( !dabt.valid )
> -        return IO_ABORT;
> +    {
> +        /*
> +         * Post indexing ldr/str instructions are not emulated by Xen. So, the
> +         * ISS is invalid. In such a scenario, we try to manually decode the
> +         * instruction from the program counter.
> +         */
> +        rc = decode_instruction(regs, &info.dabt);
> +        if ( rc )
> +            return IO_ABORT;
> +    }
>  
>      /*
>       * Erratum 766422: Thumb store translation fault to Hypervisor may
> -- 
> 2.17.1
> 


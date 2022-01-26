Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB26949C0D7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 02:46:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260646.450500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCXNk-00021h-Kb; Wed, 26 Jan 2022 01:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260646.450500; Wed, 26 Jan 2022 01:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCXNk-0001zD-Gw; Wed, 26 Jan 2022 01:45:56 +0000
Received: by outflank-mailman (input) for mailman id 260646;
 Wed, 26 Jan 2022 01:45:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pz6t=SK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCXNi-0001X6-S3
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 01:45:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2ade12f-7e49-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 02:45:54 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17957B81AC6;
 Wed, 26 Jan 2022 01:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A5FC340E0;
 Wed, 26 Jan 2022 01:45:51 +0000 (UTC)
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
X-Inumbo-ID: b2ade12f-7e49-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643161551;
	bh=U69e5fcyXZZh3khbXEvteuifH/gk5ZFQwP5QmsYnhWc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l01n8I/Yekdeckhh/K3Afle3XenKLvD4jQxPqvqKDcPOP7dePcZaMhf7fCgjRjRZJ
	 qrNl55SyxxPb6XjUK2WxEW/b5jy1G+O2+6WBrdO/PQF2aEnXmMt1D42IpHFqtgFFAT
	 YslFnECCtDeWsaRnN10eR0ahSxd++3Q0rJ7VSpkuOMqYOCclv3jRX9QgM5XvNzccT7
	 pGpKmFIMEKpR/Rug5BwveMbTQG1251ZpeCZAiL1hi5hbGwrbOLlJ3969bRjDaqasSd
	 8NU1C6mKdoUVwHM6DfbIohgTVKfMPo40e11DAY9Ri7V1nl/p4WSO7FKOdejPDMGBoG
	 4qOhzW89JxIjg==
Date: Tue, 25 Jan 2022 17:45:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, jbeulich@suse.com, wei.chen@arm.com, 
    Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing
 instructions
In-Reply-To: <8eb4949c-aa9f-38fd-682e-7620b5f9e03c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201251519120.27308@ubuntu-linux-20-04-desktop>
References: <20220125211808.23810-1-ayankuma@xilinx.com> <8eb4949c-aa9f-38fd-682e-7620b5f9e03c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jan 2022, Julien Grall wrote:
> > +
> >       /* TODO: Handle ARM instruction */
> >       gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
> >         return 1;
> >   }
> >   +#if CONFIG_ARM_64
> > +void post_increment_register(union ldr_str_instr_class *instr)
> 
> instr should not be modified, so please use const. Also, it would be
> preferrable to pass the regs in parameter. So the none of the decoding code
> relies on the current regs.
> 
> Furthermore, decode.c should only contain code to update the syndrome and in
> theory Arm could decide to provide an valid syndrome in future revision. So I
> would move this code in io.c (or maybe traps.c).

I was the one to suggest moving it to decode.c to keep it closer to the
decoding function it is related to, and also because it felt a bit out
of place in io.c.

I don't feel strongly about this at all; I am fine either way.


> > +{
> > +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> > +    register_t val;
> > +
> > +    /* handle when rn = SP */
> > +    if ( instr->code.rn == 31 )
> > +        val = regs->sp_el1;
> > +    else
> > +        val = get_user_reg(regs, instr->code.rn);
> > +
> > +    val += instr->code.imm9;
> > +
> > +    if ( instr->code.rn == 31 )
> > +        regs->sp_el1 = val;
> > +    else
> > +        set_user_reg(regs, instr->code.rn, val);
> > +}
> > +#endif
> > +
> >   /*
> >    * Local variables:
> >    * mode: C
> > diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> > index 4613763bdb..511cd4a05f 100644
> > --- a/xen/arch/arm/decode.h
> > +++ b/xen/arch/arm/decode.h
> > @@ -23,6 +23,35 @@
> >   #include <asm/regs.h>
> >   #include <asm/processor.h>
> >   +/*
> > + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
> > + * Page 318 specifies the following bit pattern for
> > + * "load/store register (immediate post-indexed)".
> > + *
> > + * 31 30 29  27 26 25  23   21 20              11   9         4       0
> > + * ___________________________________________________________________
> > + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
> > + * |____|______|__|____|____|__|_______________|____|_________|_______|
> > + */
> > +union ldr_str_instr_class {
> > +    uint32_t value;
> > +    struct ldr_str {
> > +        unsigned int rt:5;     /* Rt register */
> > +        unsigned int rn:5;     /* Rn register */
> > +        unsigned int fixed1:2; /* value == 01b */
> > +        signed int imm9:9;            /* imm9 */
> > +        unsigned int fixed2:1; /* value == 0b */
> > +        unsigned int opc:2;    /* opc */
> > +        unsigned int fixed3:2; /* value == 00b */
> > +        unsigned int v:1;      /* vector */
> > +        unsigned int fixed4:3; /* value == 111b */
> > +        unsigned int size:2;   /* size */
> > +    } code;
> > +};
> 
> Looking at the code, post_increment_register() only care about 'rn' and
> 'imm9'. So rather than exposing the full instruction, could we instead provide
> the strict minimum? I.e something like:
> 
> struct
> {
>      enum instr_type; /* Unknown, ldr/str post increment */
>      union
>      {
>          struct
>          {
>            register; /* Register to increment */
>            imm;      /* Immediate to add */
>          } ldr_str;
>      }
>      uint64_t register;
> }
 
The full description helped a lot during review. I would prefer to keep
it if you don't feel strongly about it.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9EF49D263
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 20:15:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261079.451678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCnkq-0006vy-VO; Wed, 26 Jan 2022 19:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261079.451678; Wed, 26 Jan 2022 19:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCnkq-0006tP-Rf; Wed, 26 Jan 2022 19:14:52 +0000
Received: by outflank-mailman (input) for mailman id 261079;
 Wed, 26 Jan 2022 19:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pz6t=SK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCnkp-0006tJ-Ar
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 19:14:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b5e8160-7edc-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 20:14:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18A69B81FBE;
 Wed, 26 Jan 2022 19:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D64C340E3;
 Wed, 26 Jan 2022 19:14:47 +0000 (UTC)
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
X-Inumbo-ID: 3b5e8160-7edc-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643224487;
	bh=5U9eKRJ9wbUmTkGhzdXtScb3FRnCG/ettkxm0+oAx1c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ToQmILyio9eV5AkIHafMBTvHLUfL2LQgnTW8tU0BdvgcOLaA68XBzuhxHvH6aY4vr
	 o9c7Mu94y1WpiXIGz8XeVQVHdZylw6qBqI5MJk2jTZeB4EZFnAKZDMGVqTYch5om8s
	 8B1jgUJexdHaFY/vlxkcM13SDPXGdNEk1AOF4USJd+VH27yYD4tT4rOBMZhXK5H7G/
	 O7TlM6vYhFnW1xxwg2T3eCCm4uEkSKcmEmi8DWKJYjzvoCt5baeEjV34yMeGdc4x4D
	 OG+11Y2ZlsITz6yBQxAsMuVGqAagKz3W1IGp1nBMZKuGRyU0SojSR8YCopXG1dGq6s
	 K6XS2GWsgoj1Q==
Date: Wed, 26 Jan 2022 11:14:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
    xen-devel@lists.xenproject.org, stefanos@xilinx.com, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, jbeulich@suse.com, wei.chen@arm.com, 
    Ayan Kumar Halder <ayankuma@xilinx.com>
Subject: Re: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing
 instructions
In-Reply-To: <b28ca89c-290d-2c56-1bf7-a5be3dacc55a@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201261105490.27308@ubuntu-linux-20-04-desktop>
References: <20220125211808.23810-1-ayankuma@xilinx.com> <8eb4949c-aa9f-38fd-682e-7620b5f9e03c@xen.org> <alpine.DEB.2.22.394.2201251519120.27308@ubuntu-linux-20-04-desktop> <b28ca89c-290d-2c56-1bf7-a5be3dacc55a@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jan 2022, Julien Grall wrote:
> On 26/01/2022 01:45, Stefano Stabellini wrote:
> > On Tue, 25 Jan 2022, Julien Grall wrote:
> > > > +
> > > >        /* TODO: Handle ARM instruction */
> > > >        gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
> > > >          return 1;
> > > >    }
> > > >    +#if CONFIG_ARM_64
> > > > +void post_increment_register(union ldr_str_instr_class *instr)
> > > 
> > > instr should not be modified, so please use const. Also, it would be
> > > preferrable to pass the regs in parameter. So the none of the decoding
> > > code
> > > relies on the current regs.
> > > 
> > > Furthermore, decode.c should only contain code to update the syndrome and
> > > in
> > > theory Arm could decide to provide an valid syndrome in future revision.
> > > So I
> > > would move this code in io.c (or maybe traps.c).
> > 
> > I was the one to suggest moving it to decode.c to keep it closer to the
> > decoding function it is related to, and also because it felt a bit out
> > of place in io.c.
> 
> How about traps.c? This is where we also take care of incrementing pc after we
> handle a MMIO trap.
> 
> > > > +{
> > > > +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> > > > +    register_t val;
> > > > +
> > > > +    /* handle when rn = SP */
> > > > +    if ( instr->code.rn == 31 )
> > > > +        val = regs->sp_el1;
> > > > +    else
> > > > +        val = get_user_reg(regs, instr->code.rn);
> > > > +
> > > > +    val += instr->code.imm9;
> > > > +
> > > > +    if ( instr->code.rn == 31 )
> > > > +        regs->sp_el1 = val;
> > > > +    else
> > > > +        set_user_reg(regs, instr->code.rn, val);
> > > > +}
> > > > +#endif
> > > > +
> > > >    /*
> > > >     * Local variables:
> > > >     * mode: C
> > > > diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> > > > index 4613763bdb..511cd4a05f 100644
> > > > --- a/xen/arch/arm/decode.h
> > > > +++ b/xen/arch/arm/decode.h
> > > > @@ -23,6 +23,35 @@
> > > >    #include <asm/regs.h>
> > > >    #include <asm/processor.h>
> > > >    +/*
> > > > + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and
> > > > Stores
> > > > + * Page 318 specifies the following bit pattern for
> > > > + * "load/store register (immediate post-indexed)".
> > > > + *
> > > > + * 31 30 29  27 26 25  23   21 20              11   9         4       0
> > > > + * ___________________________________________________________________
> > > > + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
> > > > + * |____|______|__|____|____|__|_______________|____|_________|_______|
> > > > + */
> > > > +union ldr_str_instr_class {
> > > > +    uint32_t value;
> > > > +    struct ldr_str {
> 
> No need to name the struct here.
> 
> > > > +        unsigned int rt:5;     /* Rt register */
> > > > +        unsigned int rn:5;     /* Rn register */
> > > > +        unsigned int fixed1:2; /* value == 01b */
> > > > +        signed int imm9:9;            /* imm9 */
> > > > +        unsigned int fixed2:1; /* value == 0b */
> > > > +        unsigned int opc:2;    /* opc */
> > > > +        unsigned int fixed3:2; /* value == 00b */
> > > > +        unsigned int v:1;      /* vector */
> > > > +        unsigned int fixed4:3; /* value == 111b */
> > > > +        unsigned int size:2;   /* size */
> > > > +    } code;
> 
> It would be best to name it ldr_str so this can be easily extended (e.g. no
> renaming) for other instructions in the future.
> 
> > > > +};
> > > 
> > > Looking at the code, post_increment_register() only care about 'rn' and
> > > 'imm9'. So rather than exposing the full instruction, could we instead
> > > provide
> > > the strict minimum? I.e something like:
> > > 
> > > struct
> > > {
> > >       enum instr_type; /* Unknown, ldr/str post increment */
> > >       union
> > >       {
> > >           struct
> > >           {
> > >             register; /* Register to increment */
> > >             imm;      /* Immediate to add */
> > >           } ldr_str;
> > >       }
> > >       uint64_t register;
> > > }
> >   The full description helped a lot during review. I would prefer to keep
> > it if you don't feel strongly about it.
> 
> I haven't suggested to drop the union. Instead, I am suggesting to keep it
> internally to decode.c and expose something different to the external the
> user. The idea is the caller doesn't care about the full instruction, it only
> cares about what action to do.
> 
> Basically, what I am asking is an augmented dabt. So all the information are
> in one place rather than having to carry two structure (struct hsr_dabt and
> union ldr_str_instr_class) which contain mostly redundant information.

That could be a good idea. We shouldn't need "union ldr_str_instr_class"
in io.c, it should only be needed in decode.c. Thus, it could be
internal to decode.c. That's fine by me.


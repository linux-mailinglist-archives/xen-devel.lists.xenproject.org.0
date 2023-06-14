Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D51730526
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 18:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549042.857370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9TUy-0008R3-3X; Wed, 14 Jun 2023 16:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549042.857370; Wed, 14 Jun 2023 16:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9TUy-0008P1-0q; Wed, 14 Jun 2023 16:37:32 +0000
Received: by outflank-mailman (input) for mailman id 549042;
 Wed, 14 Jun 2023 16:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOBz=CC=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q9TUv-0008Ov-Vo
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 16:37:30 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf2c2025-0ad1-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 18:37:27 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id C40DA43A47;
 Wed, 14 Jun 2023 09:36:24 -0700 (PDT)
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
X-Inumbo-ID: bf2c2025-0ad1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686760585; bh=NYuf0nJMqeA0Euy/f6MNeArvCCSNnYFCDmGSoJPMUgg=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=WJUA+j92csd3KLAs2WScXiq1ZYHwcj6Um1WAaTjeCJk4t/YthNVEd/Ud5+oFqmSKF
	 U7UUg2J4QzA8j1ppL7C+wM1uufwjGsLREcKh0AkkkyA0JSdb+MrUCHRMYlb47W60r4
	 osEIeQ7hQMUU2u09TS4Ig9RnPxfjuX5ZoAsC49Cqv+uKJakKdHQORnOHeNLS9Sb9x5
	 adxcJJHMZfZHcML3JpdZmffOKq7RexnYtlM+xTxH4eNPH7cCW3wgDgiAYipQlsc7md
	 ChkDuY1R0RbIUW6vCDZgGYAep7/nFYwvp4VOVC4C0gy8MAcqWz9nmB9JDoKFrwRmu8
	 uN/OGLEI9pAhg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jun 2023 11:36:23 -0500
Message-Id: <CTCIQ2OTB80O.2W5D3HEB8OWLZ@Shawns-Mac-mini.lan>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: <tpearson@raptorengineering.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "George Dunlap" <george.dunlap@citrix.com>,
 "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>, "Shawn Anastasio"
 <sanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/4] xen: Add files needed for minimal ppc64le build
From: "Shawn Anastasio" <shawn@anastas.io>
References: <cover.1686667191.git.shawn@anastas.io>
 <d45855963671225b5e20cb0f26da1e7ec64427f2.1686667191.git.shawn@anastas.io>
 <e04c4cc2-21b4-d508-94d2-5fb786df37b7@suse.com>
In-Reply-To: <e04c4cc2-21b4-d508-94d2-5fb786df37b7@suse.com>

On Wed Jun 14, 2023 at 10:51 AM CDT, Jan Beulich wrote:
> On 13.06.2023 16:50, Shawn Anastasio wrote:
> > --- /dev/null
> > +++ b/xen/arch/ppc/Makefile
> > @@ -0,0 +1,16 @@
> > +obj-$(CONFIG_PPC64) +=3D ppc64/
> > +
> > +$(TARGET): $(TARGET)-syms
> > +	cp -f $< $@
> > +
> > +$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> > +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
> > +	$(NM) -pa --format=3Dsysv $(@D)/$(@F) \
> > +		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> > +		>$(@D)/$(@F).map
>
> Elsewhere we recently switched these uses of $(@D)/$(@F) to just $@.
> Please can you do so here as well?

Sure, will fix in v4.

> > --- /dev/null
> > +++ b/xen/arch/ppc/arch.mk
> > @@ -0,0 +1,11 @@
> > +########################################
> > +# Power-specific definitions
> > +
> > +ppc-march-$(CONFIG_POWER_ISA_2_07B) :=3D power8
> > +ppc-march-$(CONFIG_POWER_ISA_3_00) :=3D power9
> > +
> > +CFLAGS +=3D -mcpu=3D$(ppc-march-y) -mstrict-align -mcmodel=3Dlarge -ma=
bi=3Delfv2 -mno-altivec -mno-vsx
>
> Wouldn't it make sense to also pass -mlittle here, such that a tool
> chain defaulting to big-endian can still be used?

Good call. On this topic, I suppose I'll also add -m64 to allow 32-bit
toolchains to be used as well.

> > --- /dev/null
> > +++ b/xen/arch/ppc/ppc64/head.S
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +
> > +.section .text.header, "ax", %progbits
> > +
> > +ENTRY(start)
> > +    /*
> > +     * Depending on how we were booted, the CPU could be running in ei=
ther
> > +     * Little Endian or Big Endian mode. The following trampoline from=
 Linux
> > +     * cleverly uses an instruction that encodes to a NOP if the CPU's
> > +     * endianness matches the assumption of the assembler (LE, in our =
case)
> > +     * or a branch to code that performs the endian switch in the othe=
r case.
> > +     */
> > +    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
> > +    b $ + 44          /* Skip trampoline if endian is good  */
>
> If I get this right, $ and . are interchangable on Power? If not,
> then all is fine and there likely is a reason to use . in the
> comment but $ in the code. But if so, it would be nice if both
> could match, and I guess with other architectures in mind . would
> be preferable.

As hinted by the comment, this code was directly inherited from Linux
and I'm not sure why the original author chose '$' instead of '.'. That
said, as far as I can tell you are correct about the two being
interchangeable, and changing the $ to . results in the exact same
machine code.

I can go ahead and make the change for consistency in v4.

> > +    DECL_SECTION(.bss) {                     /* BSS */
> > +        __bss_start =3D .;
> > +        *(.bss.stack_aligned)
> > +        . =3D ALIGN(PAGE_SIZE);
> > +        *(.bss.page_aligned)
>
> ... the one between the two .bss parts looks unmotivated. Within
> a section definition ALIGN() typically only makes sense when followed
> by a label definition, like ...

Correct me if I'm wrong, but wouldn't the ALIGN here serve to ensure
that the subsequent '.bss.page_aligned' section has the correct alignment
that its name implies?

> Jan

Thanks,
Shawn


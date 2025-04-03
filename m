Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE30A7AC76
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 21:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937240.1338248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0QQL-0000S9-0I; Thu, 03 Apr 2025 19:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937240.1338248; Thu, 03 Apr 2025 19:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0QQK-0000Pg-To; Thu, 03 Apr 2025 19:40:24 +0000
Received: by outflank-mailman (input) for mailman id 937240;
 Thu, 03 Apr 2025 19:40:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u0QQI-0000PT-I4
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 19:40:23 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79b59dea-10c3-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 21:40:19 +0200 (CEST)
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
X-Inumbo-ID: 79b59dea-10c3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743709218; x=1743968418;
	bh=sc2yFQNXp/F39+/llOCqL2Y7wDs73l+1zvPiHn2ms7I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TbF3gnOWmFmsGdhckT9iBd7hkzEBFEwWMsMxKDTWQOuloWJcW58C3lWdBmcHStlgI
	 Uerl35GbQe6LQgp87phHxjBKj+cwk3hiOqvvswC+Jnl3KsZ1vN5LUy2+0beBmSwH/s
	 pkCdVnUsiCGlrHTxVPcNRQpgaabyvId4NH+VguDo12nSxWS09hXqbpDIiqIw2wPlpF
	 PjIYK1TgIL/DAvPnNTZtMJXHQZlYOTKDLDbpaUJmeD1yNzPm7vJKWlbOHWFitEWup4
	 TWk4wBw1g43xlgdh8sqcv0Jhu8ZQBfoKCd6BI1bBcvfCWRIpaMtdbzVabsbM2ZHS6r
	 /bIe2sSjzA0Kg==
Date: Thu, 03 Apr 2025 19:40:12 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2 1/6] x86/vmx: remove HAVE_AS_{EPT,VMX}, GAS_VMX_OP() and *_OPCODE
Message-ID: <60W8YcOEaCr_48cvay1GkakH2dwi1KXBfxmzepNh6axJibw3xbS0h-_64B7IRCCcdTP7LQm-sXLWtVPMuG-IhUFukdBHDscuNcVQRnLa91s=@proton.me>
In-Reply-To: <9079e1dd-3c2c-43e3-8afb-bf92fd13d3ee@citrix.com>
References: <20250403182250.3329498-1-dmukhin@ford.com> <20250403182250.3329498-2-dmukhin@ford.com> <9079e1dd-3c2c-43e3-8afb-bf92fd13d3ee@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e0f3a1a5839dd01c92875cf655365e6eac06da46
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, April 3rd, 2025 at 12:10 PM, Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:

>=20
>=20
> On 03/04/2025 7:23 pm, dmkhn@proton.me wrote:
>=20
> > From: Denis Mukhin dmukhin@ford.com
> >=20
> > The new toolchain baseline knows the VMX instructions,
> > no need to carry the workaround in the code.
> >=20
> > Move asm for vmxoff directly on the only callsite in vmcs.c
>=20
>=20
> Ideally VMXOFF in capitals as it's an instruction name. But, this type
> of thing is more commonly phrased as "Inline __vmxoff() into it's single
> caller", or so.
>=20
> > Updated formatting for all __xxx() calls to be consistent.
>=20
>=20
> I'd suggest "for the other wrappers to be".
>=20
> > Resolves: https://gitlab.com/xen-project/xen/-/work_items/202
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/x86/arch.mk | 4 +-
> > xen/arch/x86/hvm/vmx/vmcs.c | 2 +-
> > xen/arch/x86/include/asm/hvm/vmx/vmx.h | 119 ++++---------------------
>=20
>=20
> Just as a note, you're CC-ing The Rest, but this is an x86-only change,
> so should really only be CCing myself, Jan and Roger.

Whoops, I need to improve my tooling.

>=20
> > diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> > index 1d427100ce..aef746a293 100644
> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> > @@ -811,7 +811,7 @@ void cf_check vmx_cpu_down(void)
> >=20
> > BUG_ON(!(read_cr4() & X86_CR4_VMXE));
> > this_cpu(vmxon) =3D 0;
> > - __vmxoff();
> > + asm volatile ("vmxoff" : : : "memory");
>=20
>=20
> asm volatile ( "vmxoff" ::: "memory" );
>=20
> > local_irq_restore(flags);
> > }
> > diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/incl=
ude/asm/hvm/vmx/vmx.h
> > index 7c6ba73407..ed6a6986b9 100644
> > --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > @@ -310,97 +292,54 @@ extern uint8_t posted_intr_vector;
> > #define INVVPID_ALL_CONTEXT 2
> > #define INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 3
> >=20
> > -#ifdef HAVE_AS_VMX
> > -# define GAS_VMX_OP(yes, no) yes
> > -#else
> > -# define GAS_VMX_OP(yes, no) no
> > -#endif
> > -
> > static always_inline void __vmptrld(u64 addr)
> > {
> > - asm volatile (
> > -#ifdef HAVE_AS_VMX
> > - "vmptrld %0\n"
> > -#else
> > - VMPTRLD_OPCODE MODRM_EAX_06
> > -#endif
> > + asm volatile ( "vmptrld %0\n"
>=20
>=20
> As you're changing the line anyway, this ought to be \n\t. It's
> cosmetic, but comes in handy if you need to read the intermediate assembl=
y.
>=20
> > /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
> > UNLIKELY_START(be, vmptrld)
> > _ASM_BUGFRAME_TEXT(0)
> > UNLIKELY_END_SECTION
> > :
> > -#ifdef HAVE_AS_VMX
> > : "m" (addr),
> > -#else
> > - : "a" (&addr),
> > -#endif
> > _ASM_BUGFRAME_INFO(BUGFRAME_bug, LINE, FILE, 0)
> > - : "memory");
> > + : "memory" );
> > }
> >=20
> > static always_inline void __vmpclear(u64 addr)
> > {
> > - asm volatile (
> > -#ifdef HAVE_AS_VMX
> > - "vmclear %0\n"
> > -#else
> > - VMCLEAR_OPCODE MODRM_EAX_06
> > -#endif
> > + asm volatile ( "vmclear %0\n"
> > /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
> > UNLIKELY_START(be, vmclear)
> > _ASM_BUGFRAME_TEXT(0)
> > UNLIKELY_END_SECTION
> > :
> > -#ifdef HAVE_AS_VMX
> > : "m" (addr),
> > -#else
> > - : "a" (&addr),
> > -#endif
> > _ASM_BUGFRAME_INFO(BUGFRAME_bug, LINE, FILE, 0)
> > - : "memory");
> > + : "memory" );
> > }
> >=20
> > static always_inline void __vmread(unsigned long field, unsigned long v=
alue)
> > {
> > - asm volatile (
> > -#ifdef HAVE_AS_VMX
> > - "vmread %1, %0\n\t"
> > -#else
> > - VMREAD_OPCODE MODRM_EAX_ECX
> > -#endif
> > + asm volatile ( "vmread %1, %0\n\t"
> > / CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
> > UNLIKELY_START(be, vmread)
> > _ASM_BUGFRAME_TEXT(0)
> > UNLIKELY_END_SECTION
> > -#ifdef HAVE_AS_VMX
> > : "=3Drm" (*value)
> > : "r" (field),
> > -#else
> > - : "=3Dc" (*value)
> > - : "a" (field),
> > -#endif
> > _ASM_BUGFRAME_INFO(BUGFRAME_bug, LINE, FILE, 0)
> > );
>=20
>=20
> Fold this onto the previous line, as you're fixing up all the other
> closing brackets.
>=20
> > @@ -494,24 +422,14 @@ static always_inline void __invvpid(unsigned long=
 type, u16 vpid, u64 gva)
> > } operand =3D {vpid, 0, gva};
> >=20
> > /* Fix up #UD exceptions which occur when TLBs are flushed before VMXON=
. */
>=20
>=20
> I find this comment deeply troubling, but lets not go changing that
> right now.
>=20
> I'm happy to fix this all on commit.

I will appreciate help with that!
Thanks!

>=20
> ~Andrew


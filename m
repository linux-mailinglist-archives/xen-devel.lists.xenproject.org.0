Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC6A81B20
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 04:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943302.1342092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2LKT-0006PW-KQ; Wed, 09 Apr 2025 02:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943302.1342092; Wed, 09 Apr 2025 02:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2LKT-0006NS-Hl; Wed, 09 Apr 2025 02:38:17 +0000
Received: by outflank-mailman (input) for mailman id 943302;
 Wed, 09 Apr 2025 02:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2LKR-0006Mi-ED
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 02:38:16 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af0698ee-14eb-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 04:38:13 +0200 (CEST)
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
X-Inumbo-ID: af0698ee-14eb-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744166292; x=1744425492;
	bh=hF/s67m1NX8D5P1+RQ2tKNt9XTLR3T/FyJ7wDCg1+/c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TCbkHwadgmNMIkPbS5m3HadDyUl3p5bk4YDtST0bESYMIYdjizjuMiCt+pSSXrRmJ
	 +hskziToooQIx9RZSR5zO5xy0y5hxN33cm8teTip9eZT9imzGP/U/1cVE6u8hcbdXm
	 6cA5xw7Lrm4dnNUeElImDlc/WyjP/6l6SeLnuIuyQy6W9FN4+VvykU2PjRBMU79X9R
	 i4KD6Fqd9dm3X3huNYdV2/e4TvjCB0REA72nXYQozfABrUkFdB6Gsxxn+4Xjh2T66a
	 rXCXHYV8KWOrmIhc3yIYSAQ5tocWLhGQu6HZ9/bV0alzufj4uAaDedGz2rdarOU2Tq
	 /W0oe/PXrpZ3Q==
Date: Wed, 09 Apr 2025 02:38:05 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] x86/vmx: Rework __vmread()/vmread_safe()/vmr()
Message-ID: <CxIVyaUYkldYcboibmxY8S49_ZUNdqZ30uvybH_l0KRndpL-w6vhpKuCCSJ2yllHI_7hRDuXDbAGp68BVc047GLDKqBfVoJbviwOzQgFF_s=@proton.me>
In-Reply-To: <e6e43d87-4e6d-498f-b234-a2b577fce7b6@suse.com>
References: <20250408011454.2274613-1-dmukhin@ford.com> <e6e43d87-4e6d-498f-b234-a2b577fce7b6@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dec20f86d87849abc4fab27d9bee39e97ad2f821
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 8th, 2025 at 12:12 AM, Jan Beulich <jbeulich@suse.com> wr=
ote:

>
>
> On 08.04.2025 03:15, dmkhn@proton.me wrote:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Use `asm goto()` in vmread_safe() to simplify the error handling logic.
>
>
> This can't be quite right, considering we need to avoid outputs there.

I should have experiment a bit more :-/

Thanks for reviewing this.

>
> > Update __vmread() to return `unsigned long` as per suggestion in [1].
> > Rename __vmread() to vmread_unsafe() to match the behavior.
>
>
> I disagree with this renaming: See e.g. rdmsr() and rdmsr_safe() that we =
have.
> The common case function wants to not have unnecessary verbosity in its n=
ame.
> And there's nothing unsafe about it in the general case. Plus if there wa=
s
> anything unsafe, many of the call sites would require some form of error
> handling.

I will revert all the naming changes and limit the scope only to __vmread()
signature change.

>
> > @@ -1957,38 +1955,44 @@ void cf_check vmx_do_resume(void)
> > hvm_do_resume(v);
> >
> > /* Sync host CR4 in case its value has changed. */
> > - __vmread(HOST_CR4, &host_cr4);
> > - if ( host_cr4 !=3D read_cr4() )
> > + if ( vmread_unsafe(HOST_CR4) !=3D read_cr4() )
> > __vmwrite(HOST_CR4, read_cr4());
> >
> > reset_stack_and_jump(vmx_asm_do_vmentry);
> > }
> >
> > -static inline unsigned long vmr(unsigned long field)
> > +static inline unsigned long vmread(unsigned long field)
> > {
> > - unsigned long val;
> > + unsigned long value =3D 0;
> >
> > - return vmread_safe(field, &val) ? 0 : val;
> > + asm goto ( "vmread %[field], %[value]\n\t"
> > + "jmp %l[out]"
>
>
> Why's the JMP needed here? With it dropped, why's open-coding of vmread_u=
nsafe()
> necessary here? And why's the "safe" variant being replaced by the "unsaf=
e" one?
>
> > + :
> > + : [field] "r" (field), [value] "m" (value)
>
>
> "value" is an output and hence cannot be just "m" (and hence be an input"=
).
> The only option to make such work correctly would be to ...
>
> > + :
>
>
> ... add a "memory" clobber here. Which may have other unwanted side effec=
ts.
>
> > + : out );
> > +out:
>
>
> Nit (here and elsewhere): Labels indented by at least one blank please. S=
ee
> ./CODING_STYLE.

Overlooked formatting change.

>
> > + return value;
> > }
> >
> > -#define vmr16(fld) ({ \
> > +#define vmread16(fld) ({ \
> > BUILD_BUG_ON((fld) & 0x6001); \
> > - (uint16_t)vmr(fld); \
> > + (uint16_t)vmread(fld); \
> > })
> >
> > -#define vmr32(fld) ({ \
> > +#define vmread32(fld) ({ \
> > BUILD_BUG_ON(((fld) & 0x6001) !=3D 0x4000); \
> > - (uint32_t)vmr(fld); \
> > + (uint32_t)vmread(fld); \
> > })
> >
> > static void vmx_dump_sel(const char *name, uint32_t selector)
> > {
> > uint32_t sel, attr, limit;
> > uint64_t base;
> > - sel =3D vmr(selector);
> > - attr =3D vmr(selector + (GUEST_ES_AR_BYTES - GUEST_ES_SELECTOR));
> > - limit =3D vmr(selector + (GUEST_ES_LIMIT - GUEST_ES_SELECTOR));
> > - base =3D vmr(selector + (GUEST_ES_BASE - GUEST_ES_SELECTOR));
> > + sel =3D vmread(selector);
> > + attr =3D vmread(selector + (GUEST_ES_AR_BYTES - GUEST_ES_SELECTOR));
> > + limit =3D vmread(selector + (GUEST_ES_LIMIT - GUEST_ES_SELECTOR));
> > + base =3D vmread(selector + (GUEST_ES_BASE - GUEST_ES_SELECTOR));
>
>
> The renaming causes entirely unnecessary extra churn here (and of course
> elsewhere). The patch is already big enough without this.
>
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -595,7 +595,7 @@ struct arch_vcpu
> >
> > /* Debug registers. /
> > unsigned long dr[4];
> > - unsigned long dr7; / Ideally int, but __vmread() needs long. /
> > + unsigned long dr7; / Ideally int, but vmread_unsafe() needs unsigned =
long. */
> > unsigned int dr6;
>
>
> If you left this comment alone, all would be (largely) fine - this partic=
ular
> aspect could then be tidied in a follow-on path. But vmread_unsafe() spec=
ifically
> does not need "unsigned long" anymore. The issue was with __vmread() taki=
ng a
> pointer argument.
>
> > --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > @@ -320,16 +320,40 @@ static always_inline void __vmpclear(u64 addr)
> > BUG();
> > }
> >
> > -static always_inline void __vmread(unsigned long field, unsigned long =
value)
> > +static always_inline unsigned long vmread_unsafe(unsigned long field)
> > {
> > - asm volatile ( "vmread %1, %0\n\t"
> > - / CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
> > - UNLIKELY_START(be, vmread)
> > - _ASM_BUGFRAME_TEXT(0)
> > - UNLIKELY_END_SECTION
> > - : "=3Drm" (*value)
> > - : "r" (field),
> > - _ASM_BUGFRAME_INFO(BUGFRAME_bug, LINE, FILE, 0) );
> > + unsigned long value;
> > +
> > + asm volatile ( "vmread %[field], %[value]\n\t"
> > + "jc 1f\n\t"
> > + "jz 1f\n\t"
>
>
> Why not JBE as it was before?
>
> > + "jmp 2f\n\t"
> > + "1:\n\t"
> > + " ud2\n\t"
> > + "2:"
>
>
> This is specifically why we used UNLIKELY_*() before. There's no justific=
ation
> whatsoever in the description for the dropping of its use here.
>
> Plus - where did _ASM_BUGFRAME_TEXT(0) go? A bare UD2 isn't acceptable, a=
s it
> won't be possible to associate it back with the respective source line.
>
> > + : [value] "=3Drm" (value)
> > + : [field] "r" (field) );
> > +
> > + return value;
> > +}
> > +
> > +static inline enum vmx_insn_errno vmread_safe(unsigned long field,
> > + unsigned long *value)
> > +{
> > + asm goto ( "vmread %[field], %[value]\n\t"
> > + "jc %l[vmfail_invalid]\n\t"
> > + "jz %l[vmfail_error]"
> > + :
> > + : [field] "r" (field), [value] "m" (*value)
>
>
> See comments on the vmr() adjustments you're making.
>
> Jan


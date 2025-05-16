Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC8DABA208
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 19:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987399.1372682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFz3z-0000e1-Nw; Fri, 16 May 2025 17:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987399.1372682; Fri, 16 May 2025 17:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFz3z-0000cZ-LI; Fri, 16 May 2025 17:41:39 +0000
Received: by outflank-mailman (input) for mailman id 987399;
 Fri, 16 May 2025 17:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFz3x-0000cT-5r
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 17:41:38 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 026045ef-327d-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 19:41:34 +0200 (CEST)
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
X-Inumbo-ID: 026045ef-327d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747417293; x=1747676493;
	bh=njgExrnbYLtvK1OaAzeaTD4ltQW3C5C3WVRRW05RHWE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TXshXSz4q1NobHNtxASVeOM+Ny7FUDFKq8uh0lp4OjioD3zt0RVp8ealCvVy7Tlxu
	 VBXeS4n4l4U7OCiK1F7jBqSWh+3TMsBC4Meci08SdqBwA9EoauL6dTOJf9xve6uyGd
	 sMfi7F/wdaYYGX8lepRUPrOfzzjRs+7KqiM/5GFQ3l52G7R/87gq11pwk19gmC1mUn
	 7zT3gJ4UGyYVM8gfSNnTMcQLtUIZb3lhcy8WluewJCI7iSccfbnYzMy+yRLO0izpQb
	 kvATY2AYMTX5Kg9rCdAipX1V4fIdnQ2/K5Ornxnhd8D11Tb/vIav+Pk7MTzf/3z9JI
	 /kC7VL7tMsb/w==
Date: Fri, 16 May 2025 17:41:26 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, roger.pau@citrix.com, nicola.vetrini@bugseng.com, consulting@bugseng.com, dmukhin@ford.com
Subject: Re: [PATCH v5 1/2] x86/vmx: replace __vmread() with vmread()
Message-ID: <aCd4wSfYJQfOf7Jl@kraken>
In-Reply-To: <7c0a689e-c116-49e2-9caa-f5679f8960eb@citrix.com>
References: <20250513052809.3947164-1-dmukhin@ford.com> <20250513052809.3947164-2-dmukhin@ford.com> <7c0a689e-c116-49e2-9caa-f5679f8960eb@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 36b4c2573d8b712348fca386ce19a70ff1a9f8a9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 01:42:23PM +0100, Andrew Cooper wrote:
> On 13/05/2025 6:28 am, dmkhn@proton.me wrote:
> > diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> > index 91b407e6bc..b622ae1e60 100644
> > --- a/xen/arch/x86/hvm/vmx/intr.c
> > +++ b/xen/arch/x86/hvm/vmx/intr.c
> > @@ -65,7 +65,7 @@ static void vmx_enable_intr_window(struct vcpu *v, st=
ruct hvm_intack intack)
> >      {
> >          unsigned long intr;
> >
> > -        __vmread(VM_ENTRY_INTR_INFO, &intr);
> > +        intr =3D vmread(VM_ENTRY_INTR_INFO);
> >          TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
> >                (intr & INTR_INFO_VALID_MASK) ? intr & 0xff : -1);
> >      }
>=20
> As Jan said in v4, lots of these should now change away from being
> unsigned long.

Sorry, I interpreted v4 feedback as "first, do straight reuse of vmread()
everywhere, then send follow on smaller patches cleaning up the code around
vmread()s".

>=20
> For example, this delta alone:
>=20
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 203ca83c16e7..c540ea5bd850 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4154,9 +4154,8 @@ static void undo_nmis_unblocked_by_iret(void)
> =C2=A0
> =C2=A0void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0 unsigned long exit_qualification, exit_reason, idtv_i=
nfo, intr_info
> =3D 0;
> -=C2=A0=C2=A0=C2=A0 unsigned long cs_ar_bytes =3D 0;
> -=C2=A0=C2=A0=C2=A0 unsigned int vector =3D 0;
> +=C2=A0=C2=A0=C2=A0 unsigned long exit_qualification;
> +=C2=A0=C2=A0=C2=A0 unsigned int exit_reason, idtv_info, intr_info =3D 0,=
 cs_ar_bytes =3D
> 0, vector =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu *v =3D current;
> =C2=A0=C2=A0=C2=A0=C2=A0 struct domain *currd =3D v->domain;
> =C2=A0
> @@ -4830,7 +4829,7 @@ void asmlinkage vmx_vmexit_handler(struct
> cpu_user_regs *regs)
> =C2=A0=C2=A0=C2=A0=C2=A0 /* fall through */
> =C2=A0=C2=A0=C2=A0=C2=A0 default:
> =C2=A0=C2=A0=C2=A0=C2=A0 exit_and_crash:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gprintk(XENLOG_ERR, "Unexpect=
ed vmexit: reason %lu\n",
> exit_reason);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gprintk(XENLOG_ERR, "Unexpect=
ed vmexit: reason %u\n", exit_reason);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( vmx_get_cpl() )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 hvm_inject_hw_exception(X86_EXC_UD,
>=20
> results in:
>=20
> =C2=A0=C2=A0=C2=A0 add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-331 (-331=
)
> =C2=A0=C2=A0=C2=A0 Function=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old=C2=A0=C2=A0=C2=A0=C2=A0 new=C2=A0=C2=
=A0 delta
> =C2=A0=C2=A0=C2=A0 vmx_vmexit_handler.cold=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 929=C2=A0=C2=A0=C2=A0=C2=A0 839=C2=A0=C2=A0=
=C2=A0=C2=A0 -90
> =C2=A0=C2=A0=C2=A0 vmx_vmexit_handler=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5490=C2=A0=C2=A0=C2=A0 5249=
=C2=A0=C2=A0=C2=A0 -241
>=20
> worth of saving in the fastpath.=C2=A0 (Yes, I chose this example careful=
ly
> because it's surely the largest win to be had.)
>=20
> I've just sent out a minor docs patch annotating the sizes of the fields.
>=20
> This patch wants splitting into at least 3:
>=20
> =C2=A0* One for the 64bit and natural fields which are a straight transfo=
rm
> and no type-change away from unsigned long.
> =C2=A0* One for the 16bit fields (there are few enough that this can easi=
ly
> be a single patch).
> =C2=A0* One or more for the 32bit fields, doing a type change to unsigned=
 int
> too.=C2=A0 (Might get quite large.=C2=A0 Hard to judge whether it wants t=
o be one
> or more without seeing it.)

Thanks for the feedback!

>=20
> ~Andrew



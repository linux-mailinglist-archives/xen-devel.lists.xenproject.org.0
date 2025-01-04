Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B450EA0122F
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865246.1276541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvN6-0000Pt-PX; Sat, 04 Jan 2025 04:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865246.1276541; Sat, 04 Jan 2025 04:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvN6-0000Ns-Mx; Sat, 04 Jan 2025 04:02:44 +0000
Received: by outflank-mailman (input) for mailman id 865246;
 Sat, 04 Jan 2025 04:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvN5-0008H2-OA
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:02:43 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf6868dd-ca50-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 05:02:43 +0100 (CET)
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
X-Inumbo-ID: bf6868dd-ca50-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735963359; x=1736222559;
	bh=Veu6p8QFmCe8xyZECYGH33Aw1h+i1nxVtHvFtIHC3tc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=XrpoeL+EyGV3u30rnJY4NuLBj8zmB1ftPoZ9K0KkPX7v04mB/AB315PDTgC5URyGW
	 XhDCOoaNdmx9IGoGQvvp9TyHDxo4F1ipc0lyvNGRQOamjTsObRvrO9kqp2Ct5hMAHO
	 svfmRHWfsGcZkFpQLJFGIRWKj43qe1ZcXTfL6IEW7noApdwquSMY0UCL2T6otttUDC
	 wi4A+XXJbzWvGR3p7iXOrBnXDYb8M4pi6HNEAdWcDS60BdXo/vb8ZVY3B5oToUb2uR
	 BT8odotgkcxEAr8o0d9oKhktxyf8Gc/SmTOFQ+rUXcZiCSY6siuJAk/BdeWr+A41BQ
	 qSe+6KM/4ehVw==
Date: Sat, 04 Jan 2025 04:02:34 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 30/35] x86/hvm: add helpers for raising guest IRQs
Message-ID: <WWGpizlEZm2Dqz0GKYb_U37t6JwX_DZkJt4e1N7NZ1_yuS3MfjtWQnFfZycFODrnYEKrO7_SekjWjjhpwQFoWJjx8GyeK9c7W4D4gH_Kkso=@proton.me>
In-Reply-To: <Z1sM4pri0oJRyMPJ@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-30-e9aa923127eb@ford.com> <Z1sM4pri0oJRyMPJ@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 005f7634b28dd13ef2e0ecd1bb5f2c47648996a5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 8:18 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:42:00PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Added convenience wrappers for asserting/de-asserting interrupts in the
> > hardware emulation code.
> >
> > That will be used for PCI-based NS8250 emulator.
>
>
> Strictly speaking the ns8250 uart should only generate ISA interrupts
> as I understand it, as it only uses IRQs 3 and 4? IOW from that code
> you should only need to use hvm_isa_irq_assert().

Correct, current code uses IRQ#3 and IRQ#4 only.
I dropped the patch from the series for now.

>
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/x86/hvm/irq.c | 24 ++++++++++++++++++++++++
> > xen/arch/x86/include/asm/hvm/irq.h | 3 +++
> > 2 files changed, 27 insertions(+)
> >
> > diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> > index 1eab44defca4c82ec35769617c66c380cc07d1b6..9e3a50d21dcf281c1015116=
094e47795c51ed5d0 100644
> > --- a/xen/arch/x86/hvm/irq.c
> > +++ b/xen/arch/x86/hvm/irq.c
> > @@ -242,6 +242,30 @@ void hvm_isa_irq_deassert(
> > spin_unlock(&d->arch.hvm.irq_lock);
> > }
> >
> > +void hvm_irq_raise(struct domain *d, unsigned int irq)
> > +{
> > + if ( irq < NR_ISAIRQS )
> > + {
> > + hvm_isa_irq_assert(d, irq, NULL);
> > + }
> > + else
> > + {
> > + hvm_gsi_assert(d, irq);
> > + }
> > +}
> > +
> > +void hvm_irq_lower(struct domain *d, unsigned int irq)
>
>
> It would be better to use the assert/deassert nomenclature, like it's
> used for the functions that are called.
>
> > +{
> > + if ( irq < NR_ISAIRQS )
> > + {
> > + hvm_isa_irq_deassert(d, irq);
> > + }
> > + else
> > + {
> > + hvm_gsi_deassert(d, irq);
> > + }
> > +}
>
>
> The parameter to thins function is kind of fuzzy, as I understand it,
> if the parameter is < NR_ISAIRQS it's an ISA IRQ, while if it's >=3D
>
> NR_ISAIRQS it's a GSI?

Yes, agree, mixing two address spaces is at least confusing.
I dropped the patch from the series.

>
> It would also be helpul to mention that hvm_isa_irq_deassert() will
> already do the ISA IRQ -> GSI conversion in case there are any source
>
> overrides.
>
> Thanks, Roger.




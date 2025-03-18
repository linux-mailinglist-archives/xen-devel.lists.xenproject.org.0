Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF8A680D6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920008.1324319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugZY-0002dp-T5; Tue, 18 Mar 2025 23:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920008.1324319; Tue, 18 Mar 2025 23:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugZY-0002c0-QM; Tue, 18 Mar 2025 23:42:12 +0000
Received: by outflank-mailman (input) for mailman id 920008;
 Tue, 18 Mar 2025 23:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugZX-0002bl-84
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:42:11 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c2aca53-0452-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 00:42:10 +0100 (CET)
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
X-Inumbo-ID: 9c2aca53-0452-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742341329; x=1742600529;
	bh=JrSdvzSEUxyTewevb+betpChh8cxYIYjakB/ObSAfiA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FvOCfKtCcO8a50IrmzyEngytIMEWGbZVmqPhoDM2F+rPSM6zCxFDiEX9RBKX0PF9v
	 kZXBThMqcrt4nRgq66BEtQ13OEwoa8dZXz7J7RyWErqnQJlNG0H0TbMSCgY1l8NyKQ
	 9KwjYI+gv0ANjV1VrYsgK8niPE7mdiqeVp7GznOYC+51X9hoHKZKKrRjb6GWw2+N8i
	 GlJrf626VJc8hipMoFU3+yJSAoof83vtvKa15/kzvG5owJK/nGFR5p0WvLQDOHO7xP
	 gtSXFA5dnn+6r+QfkC6JkncBVT0GDGkOM0MLq+V+JhIiHsru6kg1yr0SKEG4vKC4Qm
	 +3VqRhMpjScaQ==
Date: Tue, 18 Mar 2025 23:42:05 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] x86/irq: introduce APIC_VECTOR_VALID
Message-ID: <P0RTWUo-6LQ6iOwO0spC7MdM4uH2YFasy5sN79HSXCtMXeYJaWQpVBzQL-6OWiOj8fDpmG35rwYcYBH-f48qraysWnADsmJL9sAWAoKISic=@proton.me>
In-Reply-To: <c14f9eef-1bb8-4259-a3f4-44c739ed3258@suse.com>
References: <20250315010033.2917197-1-dmukhin@ford.com> <20250315010033.2917197-4-dmukhin@ford.com> <c14f9eef-1bb8-4259-a3f4-44c739ed3258@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ecf2dd5ed57dc7d86045d978fe776b32ebc83303
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, March 17th, 2025 at 1:30 AM, Jan Beulich <jbeulich@suse.com> wro=
te:

>
>
> On 15.03.2025 02:00, dmkhn@proton.me wrote:
>
> > Add new symbol APIC_VECTOR_VALID to replace open-coded value 16 in
> > LAPIC and virtual LAPIC code.
>
>
> First a good name is needed to make such a change. APIC_VECTOR_VALID
> could imo be the name of a predicate macro, but it can't be a mere
> number.

Do you think something like

  #define APIC_VECTOR_VALID_START 16
  #define APIC_VECTOR_VALID_END   255

will be satisfactory names to use?

>
> Then ...
>
> > --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
> > +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
> > @@ -136,7 +136,7 @@ static void intel_init_thermal(struct cpuinfo_x86 *=
c)
> > * is required to set the same value for all threads/cores).
> > */
> > if ( (val & APIC_DM_MASK) !=3D APIC_DM_FIXED
> > - || (val & APIC_VECTOR_MASK) > 0xf )
> > + || (val & APIC_VECTOR_MASK) > APIC_VECTOR_VALID )
>
>
> ... care needs to be taken that replacements are done such that the
> "no functional change" claim is actually correct. (The 0xf, i.e. 15,
> is replaced by 16 here. I didn't check if there are other similar
> issues.)

My bad.
Thanks for the catch.

>
> > --- a/xen/arch/x86/include/asm/apicdef.h
> > +++ b/xen/arch/x86/include/asm/apicdef.h
> > @@ -78,6 +78,7 @@
> > #define APIC_DM_STARTUP 0x00600
> > #define APIC_DM_EXTINT 0x00700
> > #define APIC_VECTOR_MASK 0x000FF
> > +#define APIC_VECTOR_VALID (16)
> > #define APIC_ICR2 0x310
>
>
> Nit: No real need for parentheses here; adjacent #define-s don't have
> any, so it's a little hard to see why you added them.

My understanding was MISRA requires parentheses around expressions resultin=
g
from the expansion of a macro.
After double checking, such requirement only applicable to macros w/ parame=
ters.

>
> Jan


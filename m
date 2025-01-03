Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF5A00D70
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 19:11:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864611.1275820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTm7j-0002lg-R1; Fri, 03 Jan 2025 18:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864611.1275820; Fri, 03 Jan 2025 18:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTm7j-0002jV-OK; Fri, 03 Jan 2025 18:10:15 +0000
Received: by outflank-mailman (input) for mailman id 864611;
 Fri, 03 Jan 2025 18:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdeY=T3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tTm7h-0002jP-PH
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 18:10:13 +0000
Received: from flow-b2-smtp.messagingengine.com
 (flow-b2-smtp.messagingengine.com [202.12.124.137])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6f54335-c9fd-11ef-99a4-01e77a169b0f;
 Fri, 03 Jan 2025 19:10:08 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailflow.stl.internal (Postfix) with ESMTP id 115A61D40989;
 Fri,  3 Jan 2025 13:10:06 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Fri, 03 Jan 2025 13:10:07 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jan 2025 13:09:54 -0500 (EST)
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
X-Inumbo-ID: f6f54335-c9fd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1735927805;
	 x=1735935005; bh=hJC8t2zQcYbMlocgzOTCoo+YKCbPjNASrYrXMiYm4gQ=; b=
	nWR4vMgAWYHOnuUE+AJAAZLXtSrvbQMw7WdfA5d1lmXvuzGrotvbi2D6WFzT51WL
	kDyRgLgVWqG/xDKKq24hyZSosMxxFT9fjKN6txsx69kzyJgOZg+WsycpXhkWa2EC
	SsiXQkhL+10tHMA0qZujbB0C/JdpeF813Ll/qnqbhzqMOVTDQv5gJ3J6NLPD4r9N
	z22r9QMRv4WXpcPE/P8sNOG/01eVD9m8xXrWZ8u9+pwLeqY6nyfn2dODvCZGIvax
	Jd65aAIBAv4CFKI+vmwBV99zunvBXT095w2r8nOzzzG1Aix80V2EdfRJAkaz6+Pb
	doPZUYwJMntgn0Nw4jSXYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735927805; x=1735935005; bh=hJC8t2zQcYbMlocgzOTCoo+YKCbPjNASrYr
	XMiYm4gQ=; b=FVX/4JQ6/hDpukqzLVB498nsl+dAQ2hqMzxVbYbfyLFf6pNmHZ0
	Qm1v2Qioq7eKVnu2jU4qiUKnHjpR7PcbeC1WDiFE5Hcp/pUiWadCIFdG9rVqU17S
	eKT3iX8Al4xlCnx33EgxkueGOiYIvdth/mVHxr36KgBJaotUCu9CYx3Yg2nZDvsi
	05o0268nkfqSf9dtIqnFru/poM8ZBsa4Fp7aXOMEGY5mqpcBJ0yAB30dWD1IJqYW
	cQYPzILQBy3vNCQhyOOquXf8mym8Iqqeacsi7BL/3L2AgKUAle9pmWgqOHs0Pgov
	CuqvCsos84/aKgqEQxq0uwx+EaFYo0x7mJg==
X-ME-Sender: <xms:-Cd4Z15f1xIQfpPO0smZv12rLJjQS_EJRWUhK3qEWlneckwrq87Cnw>
    <xme:-Cd4Zy4rADzaOmrLPBTrEpukg6Vhr7QI_MPFmZ_TlR1FNuufELYnFn6mhMmAaSGIU
    H-fFHm7vFYzOg>
X-ME-Received: <xmr:-Cd4Z8cOplyiW2PNOcLdmR4VdYeWrdlpzdfxJhUJ90cWnJpIcq2_DiGKBHYod49XrLkFXpm-yn1NKJ85FTQPSDz0gIAtCf3Lug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpedvieegfefgieejuedutefhffehjeegjeevuedtgeduteeujeetve
    evudevieffkeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgt
    phhtthhopeegiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrd
    gtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehjghhrohhsshesshhu
    shgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhgpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehmtghgrhhofheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvg
    grshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehluhhtoheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:-Sd4Z-KAUhq2X0L9XNWyJO9uVkNjB2r6gPlGFNkS7Tf5e769w0xX_g>
    <xmx:-Sd4Z5Kwh13Y2kBuLklSyhuIJz97TKYw5o86myQHtXPYLYrfheT8pg>
    <xmx:-Sd4Z3z2554qiJNt6-bnTDrDhXLJfOmjP0nn_AitLPo6WwVlExi4pQ>
    <xmx:-Sd4Z1LsJEVr8F-etn214vHiFYfpBfE6lOsMiuAIWgYxt9o2EW57jA>
    <xmx:_Sd4ZzU53v6VA8DAcu73R1QFsItRDYKJpR6qP544GLh_e7jeuEDZbfVJ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 3 Jan 2025 19:09:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Mike Rapoport <rppt@kernel.org>,	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,	Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,	Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>,	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Christoph Hellwig <hch@lst.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,	Guo Ren <guoren@kernel.org>,
 Helge Deller <deller@gmx.de>,	Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,	Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,	Vineet Gupta <vgupta@kernel.org>,
 Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Linux 6.13-rc5 Xen HVM with PCI passthrough (USB controller)
 crash
Message-ID: <Z3gn8OD6a5weneAM@mail-itl>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
 <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com>
 <Z3aFdrygLF9yK2EK@mail-itl>
 <Z3bg-gvaBEdSIuRW@mail-itl>
 <08f9604b-df23-4766-a290-ef9daa506f8d@suse.com>
 <Z3brZQmYhx-QTnga@mail-itl>
 <Z3cs1-wG5WJ9FrAR@mail-itl>
 <Z3cyhdKu6M1vdBe_@mail-itl>
 <b4b2229f-a139-4cfe-9cb1-e218b7123c08@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1kggHxHjQ/xzifQq"
Content-Disposition: inline
In-Reply-To: <b4b2229f-a139-4cfe-9cb1-e218b7123c08@citrix.com>


--1kggHxHjQ/xzifQq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 3 Jan 2025 19:09:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Mike Rapoport <rppt@kernel.org>,	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,	Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,	Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>,	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Christoph Hellwig <hch@lst.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,	Guo Ren <guoren@kernel.org>,
 Helge Deller <deller@gmx.de>,	Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,	Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,	Vineet Gupta <vgupta@kernel.org>,
 Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Linux 6.13-rc5 Xen HVM with PCI passthrough (USB controller)
 crash

On Fri, Jan 03, 2025 at 02:00:28AM +0000, Andrew Cooper wrote:
> On 03/01/2025 12:42 am, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Jan 03, 2025 at 01:18:31AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> >> On Thu, Jan 02, 2025 at 08:39:16PM +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> >>> On Thu, Jan 02, 2025 at 08:17:00PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> >>>> On 02.01.25 19:54, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> There is
> >>>>> one issue (likely unrelated to this change) - sys-usb (HVM domU wit=
h USB
> >>>>> controllers passed through) crashes on a system with Raptor Lake CPU
> >>>>> (only, others, including ADL and MTL look fine):
> >> Correction, it does happen on some others too, just got the crash on t=
he ADL
> >> system, although looks a bit different ("Corrupted page table at ..."):
> > I've collected some more of them at https://github.com/QubesOS/qubes-is=
sues/issues/9681
> >
> > Should I start new thread for this? On one hand, it's a different domain
> > type (HVM), but on the other hand, many of the crashes are around
> > loading modules too.
>=20
> https://lore.kernel.org/lkml/20241227072825.1288491-1-rppt@kernel.org/T/#t
> looks relevant.=C2=A0 Probably worth following up.

As responded there, I don't think so, as that series is not part of
6.13-rc5. But in the meantime, I bisected it and got this commit:

5185e7f9f3bd754ab60680814afd714e2673ef88 is the first bad commit
commit 5185e7f9f3bd754ab60680814afd714e2673ef88
Author: Mike Rapoport (Microsoft) <rppt@kernel.org>
Date:   Wed Oct 23 19:27:11 2024 +0300

    x86/module: enable ROX caches for module text on 64 bit
   =20
    Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module te=
xt
    allocations on 64 bit.
   =20
    Link: https://lkml.kernel.org/r/20241023162711.2579610-9-rppt@kernel.org
    Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
    Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
    Tested-by: kdevops <kdevops@lists.linux.dev>
    Cc: Andreas Larsson <andreas@gaisler.com>
    Cc: Andy Lutomirski <luto@kernel.org>
    Cc: Ard Biesheuvel <ardb@kernel.org>
    Cc: Arnd Bergmann <arnd@arndb.de>
    Cc: Borislav Petkov (AMD) <bp@alien8.de>
    Cc: Brian Cain <bcain@quicinc.com>
    Cc: Catalin Marinas <catalin.marinas@arm.com>
    Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
    Cc: Christoph Hellwig <hch@lst.de>
    Cc: Dave Hansen <dave.hansen@linux.intel.com>
    Cc: Dinh Nguyen <dinguyen@kernel.org>
    Cc: Geert Uytterhoeven <geert@linux-m68k.org>
    Cc: Guo Ren <guoren@kernel.org>
    Cc: Helge Deller <deller@gmx.de>
    Cc: Huacai Chen <chenhuacai@kernel.org>
    Cc: Ingo Molnar <mingo@redhat.com>
    Cc: Johannes Berg <johannes@sipsolutions.net>
    Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
    Cc: Kent Overstreet <kent.overstreet@linux.dev>
    Cc: Liam R. Howlett <Liam.Howlett@Oracle.com>
    Cc: Mark Rutland <mark.rutland@arm.com>
    Cc: Masami Hiramatsu (Google) <mhiramat@kernel.org>
    Cc: Matt Turner <mattst88@gmail.com>
    Cc: Max Filippov <jcmvbkbc@gmail.com>
    Cc: Michael Ellerman <mpe@ellerman.id.au>
    Cc: Michal Simek <monstr@monstr.eu>
    Cc: Oleg Nesterov <oleg@redhat.com>
    Cc: Palmer Dabbelt <palmer@dabbelt.com>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Richard Weinberger <richard@nod.at>
    Cc: Russell King <linux@armlinux.org.uk>
    Cc: Song Liu <song@kernel.org>
    Cc: Stafford Horne <shorne@gmail.com>
    Cc: Steven Rostedt (Google) <rostedt@goodmis.org>
    Cc: Suren Baghdasaryan <surenb@google.com>
    Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Cc: Uladzislau Rezki (Sony) <urezki@gmail.com>
    Cc: Vineet Gupta <vgupta@kernel.org>
    Cc: Will Deacon <will@kernel.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

 arch/x86/Kconfig   |  1 +
 arch/x86/mm/init.c | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

I'm extending CC...

See initial quoted part for the issue description, and link to collected
crash messages.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--1kggHxHjQ/xzifQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd4J/AACgkQ24/THMrX
1yy8hwf/dh/cbJsxOpO9qk6DZ9yCsUt8k6TENfOX9GsohEU1usjUmLGQ2+oTrjbY
uzuEzz1XEhogb/Q298CxIKqn3QD6txnFZG/ppKTBPcoS1jLHWdc+9qpzvr5+OhEO
+ejbdThVXlZEOXrtqdXXGNpNX288uHnkzKDulw/itqj0zemqvZMJIg4wFU1ROYGI
5Utd1eULz1xWeuV0xaSAud0aVG5VSF+pCL+nOd77FRh2uuM5N2sitnpJX89bTCmy
Elb5t8eh4PN7Dv1SWzhWWMgZq6ecD3KijinnDORKZucJIILB0/GGozyRpbMzDE/y
7YgaU2WrACxmNxsW1MIgAThYFnfeGQ==
=d/90
-----END PGP SIGNATURE-----

--1kggHxHjQ/xzifQq--


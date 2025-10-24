Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73404C07170
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 17:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150658.1481730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCK5P-0001Rg-I2; Fri, 24 Oct 2025 15:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150658.1481730; Fri, 24 Oct 2025 15:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCK5P-0001QF-FL; Fri, 24 Oct 2025 15:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1150658;
 Fri, 24 Oct 2025 15:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pSNC=5B=zedat.fu-berlin.de=glaubitz@srs-se1.protection.inumbo.net>)
 id 1vCK5N-0001Q9-P3
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 15:52:13 +0000
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 670f1972-b0f1-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 17:52:11 +0200 (CEST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.98) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vCK55-00000000R61-3t7w; Fri, 24 Oct 2025 17:51:55 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52]
 helo=suse-laptop.fritz.box) by inpost2.zedat.fu-berlin.de (Exim 4.98)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vCK55-00000000Lvz-2RRr; Fri, 24 Oct 2025 17:51:55 +0200
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
X-Inumbo-ID: 670f1972-b0f1-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=+WGt0cv6lLjP7TTTzKdDcUwT/Nmru/ATJlKONEKntac=; t=1761321131;
	x=1761925931; b=O2mOHgwo/WUCiZK1qMkmx8dampv7DUQlqOnq3UZRS+Cw5n1AQQyRf+xCL61of
	R6z6az40uN1o3oBYO+uIxaYmiz5rx1xz3RRN+RHTSnkI3AS2gAGYpIuNIAOG7m0Lon7CtNfS/10ej
	sftCAHTcZJ9utyWCBINLeMTgeJJvl7W4AsAtEoLOp0fYv2ERFTJvvuDTSuER99u42oY5pH1Jecmi6
	sSKhi6NJm+go4aiFds8UITtCpYHw263uK6OygylxTAtuAAO+6PjnwFP+eqiT/xSqatoUTgmOzd8Ii
	TfrJJv9N78PxEaSglTji4T7XzX4ZXmiy/kQJTk7QJX6sKo4T4g==;
Message-ID: <1d9f416fd3665faf27841b6305b1e8d661427125.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David Hildenbrand <david@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>,  Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev
 <agordeev@linux.ibm.com>,  Andreas Larsson <andreas@gaisler.com>, Andrew
 Morton <akpm@linux-foundation.org>, Boris Ostrovsky	
 <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin"	 <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,  Juergen
 Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes	 <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>,  Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko
 <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ryan Roberts	
 <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, Thomas
 Gleixner	 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will
 Deacon	 <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Date: Fri, 24 Oct 2025 17:51:54 +0200
In-Reply-To: <9faf750e-2369-4fae-b58a-ed9052cfd6f6@redhat.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
	 <20251015082727.2395128-12-kevin.brodsky@arm.com>
	 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
	 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
	 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
	 <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
	 <fcd7b731d38b256e59edd532e792a00efa4e144e.camel@physik.fu-berlin.de>
	 <9faf750e-2369-4fae-b58a-ed9052cfd6f6@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO

Hi David,

On Fri, 2025-10-24 at 17:47 +0200, David Hildenbrand wrote:
> > Please have people test kernel changes on SPARC on real hardware. QEMU =
does not
> > emulate sun4v, for example, and therefore testing in QEMU does not cove=
r all
> > of SPARC hardware.
> >=20
> > There are plenty of people on the debian-sparc, gentoo-sparc and sparcl=
inux
> > LKML mailing lists that can test kernel patches for SPARC. If SPARC-rel=
evant
> > changes need to be tested, please ask there and don't bury such things =
in a
> > deeply nested thread in a discussion which doesn't even have SPARC in t=
he
> > mail subject.
>=20
> out of curiosity, do people monitor sparclinux@ for changes to actively=
=20
> offer testing when required -- like would it be sufficient to CC=20
> relevant maintainers+list (like done here) and raise in the cover letter=
=20
> that some testing help would be appreciated?

Yes, that's definitely the case. But it should be obvious that from the sub=
ject
of the mail that the change affects SPARC as not everyone can read every ma=
il
they're receiving through mailing lists.

I'm trying to keep up, but since I'm on mailing lists for many different ar=
chitectures,
mails can slip through the cracks.

For people that want to test changes on SPARC regularly, I can also offer a=
ccounts
on SPARC test machines running on a Solaris LDOM (logical domain) on a SPAR=
C T4.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


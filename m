Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A5DC070D4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 17:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150618.1481710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJzb-0007dB-OV; Fri, 24 Oct 2025 15:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150618.1481710; Fri, 24 Oct 2025 15:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJzb-0007cG-Kn; Fri, 24 Oct 2025 15:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1150618;
 Fri, 24 Oct 2025 15:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pSNC=5B=zedat.fu-berlin.de=glaubitz@srs-se1.protection.inumbo.net>)
 id 1vCJsd-0003nv-43
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 15:39:03 +0000
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8db7d325-b0ef-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 17:38:57 +0200 (CEST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.98) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vCJs4-00000000MJF-0C1i; Fri, 24 Oct 2025 17:38:28 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52]
 helo=suse-laptop.fritz.box) by inpost2.zedat.fu-berlin.de (Exim 4.98)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vCJs3-00000000KCV-30QZ; Fri, 24 Oct 2025 17:38:27 +0200
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
X-Inumbo-ID: 8db7d325-b0ef-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=73Zwdq32M3wvIOvcsImSKjLgygutGdvwi4JFjWo6zTA=; t=1761320337;
	x=1761925137; b=lwp5Vy7CNybY1kA0EGickK9DaUcqBkrn3bXa/7XhYCixMwIA/1cKOlPBGYb++
	G/WF8Z0eYspyBI9b8+CkJQC/eXZvj0YFecE64LhcPjIVbOuBixtVYxpQGe4qE89JHLym27zMKyCRz
	I3tFw42f/EwZ70zR3tNk5cKlmlE1LXb6IuUvdQOrR0cfqRYgxpVrtQ8KQaJ+uUD8M41JQnz8Gpud7
	3Z/Sa8x42I7wy0w1D+v7hCe7CdEJwkNxNIzpCbCcV9FOMem+SVFpbMKHwg1SfV+WPL21neeboORkM
	glsZY/CFhgnVbvab7BBEO+evZcbAVJPH+HS4aM0plEGGxeFUWA==;
Message-ID: <fcd7b731d38b256e59edd532e792a00efa4e144e.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David Woodhouse <dwmw2@infradead.org>, David Hildenbrand
 <david@redhat.com>,  Kevin Brodsky <kevin.brodsky@arm.com>,
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
Date: Fri, 24 Oct 2025 17:38:26 +0200
In-Reply-To: <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
		 <20251015082727.2395128-12-kevin.brodsky@arm.com>
		 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
		 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
		 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
	 <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO

On Fri, 2025-10-24 at 16:13 +0100, David Woodhouse wrote:
> On Fri, 2025-10-24 at 16:51 +0200, David Hildenbrand wrote:
> > On 24.10.25 16:47, David Woodhouse wrote:
> > > On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
> > > > On 15.10.25 10:27, Kevin Brodsky wrote:
> > > > > We currently set a TIF flag when scheduling out a task that is in
> > > > > lazy MMU mode, in order to restore it when the task is scheduled
> > > > > again.
> > > > >=20
> > > > > The generic lazy_mmu layer now tracks whether a task is in lazy M=
MU
> > > > > mode in task_struct::lazy_mmu_state. We can therefore check that
> > > > > state when switching to the new task, instead of using a separate
> > > > > TIF flag.
> > > > >=20
> > > > > Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> > > > > ---
> > > >=20
> > > >=20
> > > > Looks ok to me, but I hope we get some confirmation from x86 / xen
> > > > folks.
> > >=20
> > >=20
> > > I know tglx has shouted at me in the past for precisely this reminder=
,
> > > but you know you can test Xen guests under QEMU/KVM now and don't nee=
d
> > > to actually run Xen? Has this been boot tested?
> >=20
> > And after that, boot-testing sparc as well? :D
>=20
> Also not that hard in QEMU, I believe. Although I do have some SPARC
> boxes in the shed...

Please have people test kernel changes on SPARC on real hardware. QEMU does=
 not
emulate sun4v, for example, and therefore testing in QEMU does not cover al=
l
of SPARC hardware.

There are plenty of people on the debian-sparc, gentoo-sparc and sparclinux
LKML mailing lists that can test kernel patches for SPARC. If SPARC-relevan=
t
changes need to be tested, please ask there and don't bury such things in a
deeply nested thread in a discussion which doesn't even have SPARC in the
mail subject.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


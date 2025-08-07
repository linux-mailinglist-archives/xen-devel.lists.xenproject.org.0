Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE6B1DD3C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073641.1436516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5o2-0000Vy-Gk; Thu, 07 Aug 2025 18:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073641.1436516; Thu, 07 Aug 2025 18:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5o2-0000TO-DU; Thu, 07 Aug 2025 18:57:38 +0000
Received: by outflank-mailman (input) for mailman id 1073641;
 Thu, 07 Aug 2025 18:57:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uk5o0-0000TI-VC
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 18:57:37 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e765486-73c0-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 20:57:30 +0200 (CEST)
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
X-Inumbo-ID: 5e765486-73c0-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=iiwm5axhvjcqnm3f4iormuplti.protonmail; t=1754593048; x=1754852248;
	bh=YgxH0Wy0rhS+i07K30j1sLDyMeC8MYHgXyDq64rg0Mg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N9YZKpwwgpAJnfbJoaGiUQZKLxCeF71Kir842XL4S5tCdKvZKHjR7QbEgrVGDB+g2
	 TkiMo5cyX0XZspzW2qhLxWr5TakMXKjz5hkqjPcInAe89YCwGvED1S5e3Uad14PMLm
	 6nVIECYD+TMk2BCQvGo2AjRnc3/5fvilQF1o+ZYT5Upo97IO82pj17v9pfAh2bRlK3
	 OTKFh48zh5jkwY7unuKOHl+9tuMOnOMvh+CR5ibsV+5fgwK9gvTiWzoQV+4DBAyFSS
	 rog4UgPGQe4j/aioNT64hQnzc5HK/DxncnrzyzVVJKaIDt3S4QUpLmfp3lMVIMUx3f
	 Bsug0+gKiLE0g==
Date: Thu, 07 Aug 2025 18:57:23 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 3/8] x86/domain: allocate d->{iomem,irq}_caps before arch-specific initialization
Message-ID: <aJT3D9mPLe7oHkTD@kraken>
In-Reply-To: <aJNoo6s_7CV6tIjy@macbook.local>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-4-dmukhin@ford.com> <aJNoo6s_7CV6tIjy@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0d0161579be9a226da1c1f15a6575303ef1ad271
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2025 at 04:37:23PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jul 31, 2025 at 07:21:54PM +0000, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Move IRQ/IOMEM rangesets allocation before arch_domain_create().
> >
> > That guarantees that arch-specific code could access those rangesets to
> > register traps for emulation.
> >
> > It is necessary for those emulators registering trap handlers and ensur=
ing
> > that emulated IRQs are not shared with the physical IRQs.
> >
> > Move dom0_setup_permissions() call right after I/O rangesets are alloca=
ted.
> >
> > Move pvh_setup_mmcfg() inside dom0_setup_permissions() close to the pla=
ce
> > where MMCFG ranges are initialized.
>=20
> I'm a bit puzzled by this, you don't need I/O permission to setup
> traps.  You can setup traps everywhere, the I/O rangesets control
> whether a domain can access the physical resource, not whether
> accesses can be emulated.

I do not want to setup traps if there's physical I/O range owned by the sam=
e
domain already. Emulator will report a misconfiguration in this case.

>=20
> The dependency between MMCFG registration (pvh_setup_mmcfg()) and
> calling dom0_setup_permissions() is because the later consumes the
> MMCFG ranges added by the former to mark them as not accessible by
> a PVH dom0.
>=20
> I think you don't need this for vUARTS, as the ports are know at build
> time, and hence you can block access to them without requiring the
> actual vUART to be initialized.

Oh, I see now why I have it: that spilled from MMIO-based UART.

What I need is I/O ports and IRQs rangesets allocation before emulator
initialization.

>=20
> Thanks, Roger.



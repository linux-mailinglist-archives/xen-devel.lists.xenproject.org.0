Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270CAAFDBDA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 01:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037482.1410106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZHlN-0002tN-24; Tue, 08 Jul 2025 23:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037482.1410106; Tue, 08 Jul 2025 23:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZHlM-0002rp-Vf; Tue, 08 Jul 2025 23:30:12 +0000
Received: by outflank-mailman (input) for mailman id 1037482;
 Tue, 08 Jul 2025 23:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6HMe=ZV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uZHlL-0002rj-KD
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 23:30:11 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d67e34c-5c53-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 01:30:10 +0200 (CEST)
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
X-Inumbo-ID: 7d67e34c-5c53-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752017409; x=1752276609;
	bh=g+9Diyqte8+FT7BegxWx9rB0eCJf7ZK0d3AR81Esf/0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QrXHFGXa4FOnYY+bSSgABzNUZ6Cf7qqVwSNlJVTSCvRDyKe6scKh1QmHxguoFXqmi
	 nqeQKr/orXWHrnxMNhYAysihS8sf78tDoeZ/JCaxVsLUKUDLDQetmCfSw4h3oxOHgK
	 ynS3HY/yxuuchb4d9/326p6VqIRYOMPP3J/LzQk4D/HYzSBRN7xGjHOfp6WKflUOwr
	 S1j3rVCViixuV9mpsdrYHzpyFZLxWmx95rjqjET4RjRp9Z2lRDQ3RQS2y6wRdi/wqy
	 IlDCTDzLDCLymFENJErolzEgTS+PGBzJOP+IEDTtBIIR+6llLIn6nsmlaHNQupWQbh
	 vK5OyC3SrVEeQ==
Date: Tue, 08 Jul 2025 23:30:03 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <aG2p+MmXdAJObhR8@kraken>
In-Reply-To: <ab1d2b35-2760-436c-8e9d-57f094712012@xen.org>
References: <20250606201102.2414022-1-dmukhin@ford.com> <alpine.DEB.2.22.394.2506111155400.542113@ubuntu-linux-20-04-desktop> <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com> <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop> <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com> <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop> <15db8155-3d3d-41e9-92be-957067a34e5f@suse.com> <alpine.DEB.2.22.394.2506201747530.2978375@ubuntu-linux-20-04-desktop> <ab1d2b35-2760-436c-8e9d-57f094712012@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 56a1010f7cd9a1e881a6d698d7525232c591bccf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 06:26:12PM +0100, Julien Grall wrote:
> Hi Stefano,
>=20
> On 21/06/2025 01:52, Stefano Stabellini wrote:
> >> Widely used or not - _I_ use it all the time in debug configs where se=
rial
> >> is available.
> >
> > Fair enough and your usage is really important for the project. At the
> > same time you know exactly what's going on so you wouldn't be confused
> > by the presence or absence of a (d0) prefix.
> >
> > The main issue is when less familiar users try Xen, or less familiar
> > developers go through the Xen source code to learn from it.
> >
> > I would optimize this choice to make it simpler for users and to make
> > the code simpler. Your use-case is really important as well, but I woul=
d
> > trust you to understand what's going on either way, with or without the
> > (d0) prefix.
>=20
> Thanks for the clarification. I gave a try with and without the series
> to understand a bit more the difference. I think there are some
> imbalance in that setup because when the focus is on Xen, the logs are
> still prefixed with "(XEN)". So naturally the log with no prefix are the
> one for Dom0. So I have to agree with Jan here.
>=20
> I haven't tried the behavior with dom0less. So I am not sure what would
> happen if the focus switch to Xen.
>=20
> Also, when switching focus, I have noticed a very odd behavior with this
> patch. "(d0)" is printed multiple time per line:

Thanks for catching this, will fix.

>=20
> "
> (d0) [    1.344020] v(d0) gaarb: loaded
> (d0) [    1.352808] c(d0) locksource: Swit(d0) ched to clocksou(d0) rce
> arch_sys_cou(d0) nter
> (d0) [    1.367604] V(d0) FS: Disk quotas (d0) dquot_6.6.0
> (d0) [    1.369369] V(d0) FS: Dquot-cache (d0) hash table entri(d0) es:
> 512 (order 0(d0) , 4096 bytes)
> (d0) [    1.376766] p(d0) np: PnP ACPI: di(d0) sabled
> (d0) [    1.619730] N(d0) ET: Registered P(d0) F_INET protocol (d0) famil=
y
> (d0) [    1.623635] I(d0) P idents hash ta(d0) ble entries: 163(d0) 84
> (order: 5, 13(d0) 1072 bytes, line(d0) ar)
> (d0) [    1.636915] t(d0) cp_listen_portad(d0) dr_hash hash tab(d0) le
> entries: 512 (d0) (order: 3, 36864(d0)  bytes, linear)
> (d0) [    1.638331] T(d0) able-perturb has(d0) h table entries:(d0)
> 65536 (order: 6(d0) , 262144 bytes, (d0) linear)
> (d0) [    1.639267] T(d0) CP established h(d0) ash table entrie(d0) s:
> 8192 (order: (d0) 4, 65536 bytes, (d0) linear)
> (d0) [    1.643457] T(d0) CP bind hash tab(d0) le entries: 8192(d0)
> (order: 8, 1179(d0) 648 bytes, linea(d0) r)
> (d0) [    1.652078] T(d0) CP: Hash tables (d0) configured (esta(d0)
> blished 8192 bin(d0) d 8192)
> (d0) [    1.655824] U(d0) DP hash table en(d0) tries: 512 (orde(d0) r:
> 4, 81920 byte(d0) s, linear)
> (d0) [    1.657807] U(d0) DP-Lite hash tab(d0) le entries: 512 (d0)
> (order: 4, 81920(d0)  bytes, linear)
> (d0) [    1.661993] N(d0) ET: Registered P(d0) F_UNIX/PF_LOCAL (d0)
> protocol family
> (d0) [    1.674980] R(d0) PC: Registered n(d0) amed UNIX socket(d0)
> transport modul(d0) e.
> (d0) [    1.676034] R(d0) PC: Registered u(d0) dp transport mod(d0) ule.
> (d0) [    1.677241] R(d0) PC: Registered t(d0) cp transport mod(d0) ule.
> (d0) [    1.677964] R(d0) PC: Registered t(d0) cp-with-tls tran(d0)
> sport module.
> (d0) [    1.678615] R(d0) PC: Registered t(d0) cp NFSv4.1 backc(d0)
> hannel transport(d0)  module.
> "
>=20
> Cheers,
>=20
> --
> Julien Grall
>=20
>=20



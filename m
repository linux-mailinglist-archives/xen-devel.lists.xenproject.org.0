Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEF6B1ABDD
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 02:55:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069894.1433579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj5x3-0006b9-Fs; Tue, 05 Aug 2025 00:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069894.1433579; Tue, 05 Aug 2025 00:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj5x3-0006ZF-C1; Tue, 05 Aug 2025 00:54:49 +0000
Received: by outflank-mailman (input) for mailman id 1069894;
 Tue, 05 Aug 2025 00:54:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=15pZ=2R=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uj5x1-0006Z2-FA
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 00:54:48 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c38920fd-7196-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 02:54:39 +0200 (CEST)
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
X-Inumbo-ID: c38920fd-7196-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=nlfzmj5cnbgtrfqinrkr57pfqy.protonmail; t=1754355277; x=1754614477;
	bh=Gf/gUMS/DL3VWa3qxDAViy/wKvJEWViUk/wKkn4k5IA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K+BLDedy8E0FJazuT6YimuDDqtiFPQoXEmFF7Z1wAUhdKTYT0vvIRtLWNLZ9jRwKK
	 L4hvxajIu/WDptnzN7eT4u/kOYySNl/4X7hRsyWBz3B/O4amx3Ut1//lgOhNCkL+e4
	 V4ivQ4FvriizDIFVwgJSSVRVOn1V8FoMXh39cTKbe89ffwNEQltfUyom3FzxQ9P/nh
	 dqvM+xrjRROnK2r5I40dl2SvrjyNgoVqNTGKSnq7wd4fDdu505GAW6yLPmT+mjW36h
	 b1YS21+2BQzu1k88S1GJSspaY2Lkuz8DThJig2fRmqp5DH3i0LY/5gDoS95OtiYLFP
	 Ld3jKlHdAiA7g==
Date: Tue, 05 Aug 2025 00:54:31 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, oleksii.kurochko@gmail.com, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/8] xen/domain: introduce common emulation flags
Message-ID: <aJFWQByvktADgYKu@kraken>
In-Reply-To: <f2be5a00-63e6-489d-a26a-7d48d6ae41ad@suse.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-2-dmukhin@ford.com> <f2be5a00-63e6-489d-a26a-7d48d6ae41ad@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 832fb489d638f87ab26acd733321aad8886c7034
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

+ Cc: Oleskii

On Mon, Aug 04, 2025 at 11:46:36AM +0200, Jan Beulich wrote:
> On 31.07.2025 21:21, dmkhn@proton.me wrote:
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -652,6 +652,8 @@ struct domain
> >      unsigned int *llc_colors;
> >  #endif
> >
> > +    uint32_t emulation_flags;
>=20
> Just one further remark: The field probably never should have been of thi=
s
> type; unsigned int will do, and imo will want switching to while the fiel=
d
> is being moved. (Before giving an x86 ack, I want to convince myself thou=
gh
> that this is moving us in the right direction.)

Hi Jan,

I can definitely use different mechanism for virt ns16550: add a new field =
in
xen_arch_domainconfig. That will also simplify some of the emulation_flags
checks on x86 and will be more flexible wrt emulator configuration (e.g. I =
can
allow passing I/O ports ranges).

Hi Arm/RISC-V maintainers,

Do you foresee any need in bubbling up emulation_flags to the common `struc=
t
domain`?

--
Denis



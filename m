Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A041B1DCAC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 19:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073444.1436276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4ob-0002MQ-FR; Thu, 07 Aug 2025 17:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073444.1436276; Thu, 07 Aug 2025 17:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4ob-0002Jl-CN; Thu, 07 Aug 2025 17:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1073444;
 Thu, 07 Aug 2025 17:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uk4oZ-0002Jf-O8
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 17:54:07 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 831abf3c-73b7-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 19:54:06 +0200 (CEST)
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
X-Inumbo-ID: 831abf3c-73b7-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mavahywfqnhoxacldwxja6zvwa.protonmail; t=1754589245; x=1754848445;
	bh=2b7MEB+KgVsj9VrjGfGWife5O5w+xkq5MmtJBoPfeKw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iOAfwUqqYjSXc5fY4w0Mrahsm4unTrSnHlQOHu08+5aK0Bhp7cVZ3zoDF6szWuu/a
	 7AU/NWroobbqiTVT3ByIYAxB6q2yfMNgzr1UWdLEVkepI8DzY+aLGTWs6Lo2MjB7YG
	 Yh8zYvNJPMUa9LPh0cnoHqdoC36Gcgly07wHMGweEy6uUw6kCrZcJ8NYbx2GiVUyjH
	 zG6+ZBDf+R2Bma//Dp5i4UlaScLTfb5nD/vgeDpNjyOiCuZyFn1jmt9fZVChD6AgZF
	 KfWn/FT24ql8nzAlga+uLIVRKAbOAY1Zz/QXG3r9rW4snw5RWl/bX+8zy18yAjAfJF
	 3Aeqctbl7wN0Q==
Date: Thu, 07 Aug 2025 17:54:01 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, oleksii.kurochko@gmail.com, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/8] xen/domain: introduce common emulation flags
Message-ID: <aJToNFZ6z49nqAsF@kraken>
In-Reply-To: <aJNfGqiTDH991_8L@macbook.local>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-2-dmukhin@ford.com> <f2be5a00-63e6-489d-a26a-7d48d6ae41ad@suse.com> <aJFWQByvktADgYKu@kraken> <aJNfGqiTDH991_8L@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 675077b39625c45644c3f5e4eab550b65af05a9d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2025 at 03:56:42PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, Aug 05, 2025 at 12:54:31AM +0000, dmkhn@proton.me wrote:
> > + Cc: Oleskii
> >
> > On Mon, Aug 04, 2025 at 11:46:36AM +0200, Jan Beulich wrote:
> > > On 31.07.2025 21:21, dmkhn@proton.me wrote:
> > > > --- a/xen/include/xen/sched.h
> > > > +++ b/xen/include/xen/sched.h
> > > > @@ -652,6 +652,8 @@ struct domain
> > > >      unsigned int *llc_colors;
> > > >  #endif
> > > >
> > > > +    uint32_t emulation_flags;
> > >
> > > Just one further remark: The field probably never should have been of=
 this
> > > type; unsigned int will do, and imo will want switching to while the =
field
> > > is being moved. (Before giving an x86 ack, I want to convince myself =
though
> > > that this is moving us in the right direction.)
> >
> > Hi Jan,
> >
> > I can definitely use different mechanism for virt ns16550: add a new fi=
eld in
> > xen_arch_domainconfig. That will also simplify some of the emulation_fl=
ags
> > checks on x86 and will be more flexible wrt emulator configuration (e.g=
. I can
> > allow passing I/O ports ranges).
>=20
> For the time being, I would leave emulation_flags in
> xen_arch_domainconfig.

Ack; agreed.

>  The set of emulated devices is
> architecture-specific, and pulling it to the generic struct is IMO not
> specially helpful, as you then have the definition of the flags
> decoupled from the field definition.

NS16550 is not an arch-specific device though.
But yes, current implementation _is_ arch-specific.

>=20
> For the emulated UART, I don't think you need a new field in
> xen_arch_domainconfig, just a new bit in emulation_flags? IOW:

I think new field is needed, since there are four legacy PC UART resource
sets selectable by the user. I'm dropping COM port build-time selection
and reworking it to be xl-configurable. That will be more flexible and
there will be less in-hypervisor changes.

>=20
> #define _XEN_X86_EMU_VUART          11
> #define XEN_X86_EMU_VUART           (1U << _XEN_X86_EMU_VUART)
>=20
> Thanks, Roger.



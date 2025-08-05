Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B069B1ABB2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 02:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069881.1433569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj5U1-0002kj-Bg; Tue, 05 Aug 2025 00:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069881.1433569; Tue, 05 Aug 2025 00:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj5U1-0002ih-8t; Tue, 05 Aug 2025 00:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1069881;
 Tue, 05 Aug 2025 00:24:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=15pZ=2R=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uj5Ty-0002iU-80
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 00:24:47 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9535d9a8-7192-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 02:24:43 +0200 (CEST)
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
X-Inumbo-ID: 9535d9a8-7192-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754353482; x=1754612682;
	bh=jmSlZ+nH0HTo+SfNQ5zHTS2TQ6CtRkTRjHZXyfnPl1g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Eyr1sesiqKxrBIG0RmqBFotQDjHzhHIhP7/gGixA5EfSvHeX+Y3cYnBdLr4/0aVdd
	 BxLxf9pZQxWusjeG3K/4CkwYvEcFHXbOHwFT/wt7UNnVTP90M2dqISf2uMZfooTedY
	 yd2QqaQW2tCU8PLGF74gh5tXm/C4payDCoOcnfAzaDTT7CKXbkLbNqwb7mLeugEAQm
	 GFv1xf567xzDaQQ4OaJyfanU4ewTmzDp6S2juh1zBlOnSHkFZyZNr7r/AcVsyeTsbB
	 Rrd0pmc8ciq9TKOqXOHK/IG9USOUNc2AJ1YFH+IMya4U34ibzbru6E33HpLfyDbL4f
	 UUxrMEMgnt5xQ==
Date: Tue, 05 Aug 2025 00:24:38 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 12/16] xen/domain: introduce domain-emu.h
Message-ID: <aJFPQnxla7hzLbZW@kraken>
In-Reply-To: <61efc085-a787-4ca9-82e4-032408532ba6@suse.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-13-dmukhin@ford.com> <33f98fe5-9b29-43e4-a87d-19eafb30f281@suse.com> <aIvYSn2ZwyWTwIzm@kraken> <65e288b7-d8fe-409e-a287-69b4dc29f0c2@suse.com> <aI0V0v0yltODw5bs@kraken> <61efc085-a787-4ca9-82e4-032408532ba6@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f08b396511e3536fd51ca897b7d45d1beacc3ab8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 09:13:07AM +0200, Jan Beulich wrote:
> On 01.08.2025 21:30, dmkhn@proton.me wrote:
> > On Fri, Aug 01, 2025 at 08:02:56AM +0200, Jan Beulich wrote:
> >> On 31.07.2025 22:55, dmkhn@proton.me wrote:
> >>> On Wed, Jul 09, 2025 at 04:57:44PM +0200, Jan Beulich wrote:
> >>>> On 24.06.2025 05:56, dmkhn@proton.me wrote:
> >>>>> @@ -458,16 +459,16 @@ struct arch_domain
> >>>>>  } __cacheline_aligned;
> >>>>>
> >>>>>  #ifdef CONFIG_HVM
> >>>>> -#define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
> >>>>> -#define X86_EMU_HPET     XEN_X86_EMU_HPET
> >>>>> -#define X86_EMU_PM       XEN_X86_EMU_PM
> >>>>> -#define X86_EMU_RTC      XEN_X86_EMU_RTC
> >>>>> -#define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
> >>>>> -#define X86_EMU_PIC      XEN_X86_EMU_PIC
> >>>>> -#define X86_EMU_VGA      XEN_X86_EMU_VGA
> >>>>> -#define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
> >>>>> -#define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
> >>>>> -#define X86_EMU_VPCI     XEN_X86_EMU_VPCI
> >>>>
> >>>> The old code deliberately used values from the public interface.
> >>>
> >>> In next version I am building, I moved all of XEN_X86_EMU_XXX definit=
ions as
> >>> is to a new public header under include/public/xen-emu.h:
> >>>
> >>>   https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/9b0bc5ff=
a5710114df8523ae2aa7680b7c6f0942
> >>>
> >>> That looks less invasive.
> >>>
> >>> Will that work?
> >>>
> >>> There should be a common header with emulation flags somewhere, since
> >>> there will be SBSA and hwdom vUART definitions there.
> >>
> >> Yet will there be a strict need for any constants to be identical (i.e=
.
> >> not only have the same name, but also the same value) across architect=
ures?
> >
> > I don't think there's strict need for identical values across achitectu=
res.
>=20
> That's what I was expecting.
>=20
> > But some of the constants _may_ be reused for non-x86 arches, like VPCI=
 bit
> > and, perhaps, IOMMU, PIRQ and future NS16550 (after adding MMIO).
>=20
> Right, but as you say - they want to use the same name, but they could ea=
sily
> have a different value there. I hope you understand that what I'm questio=
ning
> is the introduction of a single header covering all architectures.

Yes, I understand your point wrt common header and identical values in
emulation flags.

I think I can add missing per-vUART fields to per-arch xen_arch_domainconfi=
g,
populate them by the toolstack and be done for now, i.e. I can drop that
patch.

--
Denis



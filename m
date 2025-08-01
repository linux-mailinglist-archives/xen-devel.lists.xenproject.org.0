Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04CB187C6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 21:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067505.1432229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhvSj-0006ME-PU; Fri, 01 Aug 2025 19:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067505.1432229; Fri, 01 Aug 2025 19:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhvSj-0006JH-Mn; Fri, 01 Aug 2025 19:30:41 +0000
Received: by outflank-mailman (input) for mailman id 1067505;
 Fri, 01 Aug 2025 19:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtvS=2N=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhvSg-0006J0-Vh
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 19:30:39 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5f2a9c-6f0d-11f0-b897-0df219b8e170;
 Fri, 01 Aug 2025 21:30:36 +0200 (CEST)
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
X-Inumbo-ID: ff5f2a9c-6f0d-11f0-b897-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754076634; x=1754335834;
	bh=BXrfkVJajnM8+5TEJnfsv1KbBVPEsL6OqjTqeJBMUWs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Li3PQW1F/zQNKtNNMiAYQjnqJM6NNlPTgPIIEdvdbm+ukl0jyZVPLfR5o2AMZiifY
	 xXtPfIcbhZxrEqRV8PzHnczF19GnrvHsk4xj9t7Cm4R37ZiAASq0nbMFsXBVKw7r1y
	 6opGFcZ1KTx7rfFQUnSvpaiU5NXrcFEa7V9RI7GyqXObs6aPrZEb4F8lgeCxUjWkK0
	 7DwbZa44ZXN7PjKChbhq+HVy4GlTT4rtzCCSIO+N5wNIL7fQAjaSl8LMOt8mwC3Iw1
	 YAoM4ub+HtkeMJwbHE71iuwrem2KqC1iNTOVRlSpT+tnntkAZyqlHA6TC6dw/4BQsL
	 5x68VK1MA1BCA==
Date: Fri, 01 Aug 2025 19:30:30 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 12/16] xen/domain: introduce domain-emu.h
Message-ID: <aI0V0v0yltODw5bs@kraken>
In-Reply-To: <65e288b7-d8fe-409e-a287-69b4dc29f0c2@suse.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-13-dmukhin@ford.com> <33f98fe5-9b29-43e4-a87d-19eafb30f281@suse.com> <aIvYSn2ZwyWTwIzm@kraken> <65e288b7-d8fe-409e-a287-69b4dc29f0c2@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e4490218c319029c70d51aa0e441fc0694d22c6b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2025 at 08:02:56AM +0200, Jan Beulich wrote:
> On 31.07.2025 22:55, dmkhn@proton.me wrote:
> > On Wed, Jul 09, 2025 at 04:57:44PM +0200, Jan Beulich wrote:
> >> On 24.06.2025 05:56, dmkhn@proton.me wrote:
> >>> @@ -458,16 +459,16 @@ struct arch_domain
> >>>  } __cacheline_aligned;
> >>>
> >>>  #ifdef CONFIG_HVM
> >>> -#define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
> >>> -#define X86_EMU_HPET     XEN_X86_EMU_HPET
> >>> -#define X86_EMU_PM       XEN_X86_EMU_PM
> >>> -#define X86_EMU_RTC      XEN_X86_EMU_RTC
> >>> -#define X86_EMU_IOAPIC   XEN_X86_EMU_IOAPIC
> >>> -#define X86_EMU_PIC      XEN_X86_EMU_PIC
> >>> -#define X86_EMU_VGA      XEN_X86_EMU_VGA
> >>> -#define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
> >>> -#define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
> >>> -#define X86_EMU_VPCI     XEN_X86_EMU_VPCI
> >>
> >> The old code deliberately used values from the public interface.
> >
> > In next version I am building, I moved all of XEN_X86_EMU_XXX definitio=
ns as
> > is to a new public header under include/public/xen-emu.h:
> >
> >   https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/9b0bc5ffa5=
710114df8523ae2aa7680b7c6f0942
> >
> > That looks less invasive.
> >
> > Will that work?
> >
> > There should be a common header with emulation flags somewhere, since
> > there will be SBSA and hwdom vUART definitions there.
>=20
> Yet will there be a strict need for any constants to be identical (i.e.
> not only have the same name, but also the same value) across architecture=
s?

I don't think there's strict need for identical values across achitectures.
But some of the constants _may_ be reused for non-x86 arches, like VPCI bit
and, perhaps, IOMMU, PIRQ and future NS16550 (after adding MMIO).



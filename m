Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB40AFF682
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 03:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038908.1411047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZgSO-0006cQ-Gz; Thu, 10 Jul 2025 01:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038908.1411047; Thu, 10 Jul 2025 01:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZgSO-0006Zl-ER; Thu, 10 Jul 2025 01:52:16 +0000
Received: by outflank-mailman (input) for mailman id 1038908;
 Thu, 10 Jul 2025 01:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dti5=ZX=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uZgSN-0006Zf-7q
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 01:52:15 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 801f5923-5d30-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 03:52:14 +0200 (CEST)
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
X-Inumbo-ID: 801f5923-5d30-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752112332; x=1752371532;
	bh=ZcG3brqkNc6FnnG2lOVcw4PCzD10nNs6AdOzJsx4qZI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k6vK3ZtcPBWkbCrIp07z+7qGS3X8ey0WLMvJUsUeN1dC+jRl3nwLb/P5QkdhpZsNL
	 f9FIWjDStC9pOXpX/RRHRJLuOQExFx+wh0P+xL6oTb/+JJ2R7C0uPPeUKAMITbJdme
	 0xfVszYH5PcujmdYoAGLjoO/6X27QenMsFhv1PzjQ5UsdEUCkuYbjHOpMJxikyM+Xs
	 2ssKIE6TmlyM6zIU8/8zay0NGusJ5VqV9leS/ZtzV9yiJ56MmzJU7gamgBJ/P7+dqo
	 bfzf9QLaGNPxe7rAc4cbT3pFxkP9dbjfSLK2zNROdXBYPev5LDin8RZdnx8926gu6+
	 AwRcTSX5Lqbkw==
Date: Thu, 10 Jul 2025 01:52:08 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 14/16] drivers/vuart: move simple MMIO-based UART emulator
Message-ID: <aG8cxNMGSyWWL9m0@kraken>
In-Reply-To: <a63ac9d5-152e-47b0-8169-bf470611c059@suse.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-15-dmukhin@ford.com> <6e6c8664-2ff6-484d-bd47-7ee12c449f9e@suse.com> <aFpViicgGigZPFNv@kraken> <6d33355c-477f-4ef3-8f17-b7f1dd1164ce@suse.com> <aFsssYQu1GcuvjPv@kraken> <a63ac9d5-152e-47b0-8169-bf470611c059@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 72f9f5f798b794bfa13d3df0658068a4c50e6412
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 07:25:29AM +0200, Jan Beulich wrote:
> On 25.06.2025 00:54, dmkhn@proton.me wrote:
> > On Tue, Jun 24, 2025 at 09:40:02AM +0200, Jan Beulich wrote:
> >> On 24.06.2025 09:36, dmkhn@proton.me wrote:
> >>> On Tue, Jun 24, 2025 at 07:53:04AM +0200, Jan Beulich wrote:
> >>>> On 24.06.2025 05:57, dmkhn@proton.me wrote:
> >>>>> --- a/xen/drivers/vuart/Kconfig
> >>>>> +++ b/xen/drivers/vuart/Kconfig
> >>>>> @@ -3,6 +3,15 @@ config HAS_VUART
> >>>>>
> >>>>>  if (ARM_32 || ARM_64)
> >>>>>
> >>>>> +config HAS_VUART_MMIO
> >>>>> +=09bool "Simple MMIO-based emulated UART support"
> >>>>
> >>>> Perhaps in a separate change this should be renamed. HAS_* should ne=
ver
> >>>> have prompts.
> >>>
> >>> Oh, so HAS_ flags are non-interactive selectors by design?
> >>
> >> Well "has" simply by the word means "this is available". Any user-sele=
ctable item
> >> deriving from the mere availability would then have a "depends on HAS_=
...", thus
> >> hiding the option in situation where the functionality isn't available=
 (be it per
> >> arch or for other reasons).
> >
> > I see there's a lot of drivers (UARTs) which are selectable by the user=
 via
> > HAS_ symbols (drivers/char/Kconfig), e.g:
> >
> > CONFIG_HAS_NS16550:
>=20
> Iirc it was prompt-less up to some point. And when the prompt was added, =
the name
> wasn't changed / split. Other UARTs then followed suit (when they shouldn=
't have).

I can submit a separate patch to address the naming, if there are no
objections.

>=20
> Jan
>=20



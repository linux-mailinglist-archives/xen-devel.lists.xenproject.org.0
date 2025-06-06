Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA8ACFD8E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008055.1387274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRaY-0005Bt-5j; Fri, 06 Jun 2025 07:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008055.1387274; Fri, 06 Jun 2025 07:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRaY-00058m-2m; Fri, 06 Jun 2025 07:34:06 +0000
Received: by outflank-mailman (input) for mailman id 1008055;
 Fri, 06 Jun 2025 07:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNRaX-0004a7-Ct
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:34:05 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cd0a1bc-42a8-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 09:34:00 +0200 (CEST)
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
X-Inumbo-ID: 9cd0a1bc-42a8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749195239; x=1749454439;
	bh=0ltrY4YTx1PzxgNm8BeA4OIevlzd0Vv26Vp/6NgNERM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QitM77XUs7G1Kanzggu+daXBgL91Jp/ZWczb4UOG20Cmo92C85TNAH3jdsd+CfEyr
	 HYqOfiklaAr/JLH8u5yNIYZfRLkRHep0JZ0/KfDIHA6i2I1YWZFpW41UkP6z2sN9Yp
	 4pK1U5uo3kpEznO0eBeH5plGQwKunAuKJhRoVtWkWShmbtv16kgg/stn5x7UEciFH6
	 JpKOt/fQQ4KIDgaoOPhWXtdlYRD4ZzfBIOoFigMRJprEtuKvVC9IUwP8iBW7DeLsmr
	 fphDLeC/BCc1G9o6NtXlnyVgPkUh3qN8c/pznW5BsNd+HoGmVAsC7NCvxSkVNkFfy6
	 IHmJOaPTv1IBw==
Date: Fri, 06 Jun 2025 07:33:53 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/2] xen/domain: introduce common hardware emulation flags
Message-ID: <aEKZ22RjdRXpND1U@kraken>
In-Reply-To: <8412c795-610b-416e-8d22-4149d2492517@suse.com>
References: <20250602191717.148361-1-dmukhin@ford.com> <20250602191717.148361-2-dmukhin@ford.com> <093dc85d-ebf3-4982-8888-db4e7cfd0e45@suse.com> <aEDwMrVu+3PVSh+Y@kraken> <8412c795-610b-416e-8d22-4149d2492517@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f8640ee5601bd53ca4592b8645f1708040af78b4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025 at 08:44:30AM +0200, Jan Beulich wrote:
> On 05.06.2025 03:17, dmkhn@proton.me wrote:
> > On Wed, Jun 04, 2025 at 12:36:17PM +0200, Jan Beulich wrote:
> >> On 02.06.2025 21:17, dmkhn@proton.me wrote:
> >>> From: Denis Mukhin <dmukhin@ford.com>
> >>>
> >>> Add common emulation_flags for configuring domain emulation features.
> >>>
> >>> Print d->emulation_flags from 'q' keyhandler for better traceability =
while
> >>> debugging.
> >>>
> >>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>
> >> It's not becoming clear why this would want doing, nor in how far some=
 of
> >> the bits there may gain "common" meaning, too. Imo this kind of change=
 is
> >> meaningful only in a series where later the common-ness is also used.
> >
> > I have a set of upcoming changes here:
> >   https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/vuart-framew=
ork?ref_type=3Dheads
> >
> > Specifically,
> >  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/17f44d23c19=
04374963c4ec839bc8219041b5d26
> >
> > enables the use of emulation_flags on Arm.
> >
> > I can move this patch to the upcoming series, if needed, but looks like=
 it is
> > OK to have it for Arm even now.
>=20
> Prior to that series making it to a ready-to-be-committed state, it'll be
> (effectively) dead code on Arm. Which strictly speaking Misra objects to.
> I wonder if you, Stefano, considered that when giving your R-b.
>=20
> Further - what about PPC and RISC-V?

I have no problem plumbing this patch to the follow on series.
Will re-adjust.

>=20
> Jan
>=20



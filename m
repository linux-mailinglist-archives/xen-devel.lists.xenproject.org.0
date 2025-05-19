Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D010ABC7D8
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 21:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990210.1374153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6Cc-0002n7-4u; Mon, 19 May 2025 19:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990210.1374153; Mon, 19 May 2025 19:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6Cc-0002kj-2I; Mon, 19 May 2025 19:31:10 +0000
Received: by outflank-mailman (input) for mailman id 990210;
 Mon, 19 May 2025 19:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6Cb-0002kc-Jb
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:31:09 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf8abddd-34e7-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 21:31:07 +0200 (CEST)
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
X-Inumbo-ID: cf8abddd-34e7-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747683066; x=1747942266;
	bh=5WtLiQhEqyCqxTfrs3BWG+IdQfpdRybAo/Mk4kZdsAc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=XFVIaqknv5L59a4viFPwggTUz6jPPJc7QTs8tA2Ym2b1k5Y6+CVlBfvn7Y2MPgjDh
	 k0FD95bbWcPcnjvoF/Q2DDuH6wzr1nmZV4DM3ZWRvevt5aY5080xJxyC2inSZ4pStM
	 joRjrvi8rt0c4MBemeMtZ3KlGBQsNGBwNo7lKry2ijxAfiyrfvhzGuhjM8S35Xl9ZV
	 LT5sOyiqEdDnIBl0vb8D9ulB+XNKlhGcbFu0N8RkBYB0Ix4hKeHb6Jl3vRS3SChiM4
	 iId9GwOPvHjJM0T8JSNzwdBufe626v1OpiS0W/PpxnUmhlZ6qR/zlzt26Neb9TaMxq
	 FI1EBWYlSRwbQ==
Date: Mon, 19 May 2025 19:31:02 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/2] xen/domain: unify domain ID allocation
Message-ID: <aCuG8TffcquVYWod@kraken>
In-Reply-To: <98c10f03-c5f9-4e89-9aed-596b5cc3f8fd@suse.com>
References: <20250516020434.1145337-1-dmukhin@ford.com> <20250516020434.1145337-2-dmukhin@ford.com> <98c10f03-c5f9-4e89-9aed-596b5cc3f8fd@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ff79bb8070c29cefbc1de661ba059bb16fec84b9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 10:52:24AM +0200, Jan Beulich wrote:
> On 16.05.2025 04:04, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, hypervisor code has two different non-system domain ID alloc=
ation
> > implementations:
> >
> >   (a) Sequential IDs allocation in dom0less Arm code based on max_init_=
domid;
> >
> >   (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not us=
e
> >       max_init_domid (both Arm and x86).
> >
> > It makes sense to have a common helper code for such task across archit=
ectures
> > (Arm and x86) and between dom0less / toolstack domU allocation.
> >
> > Wrap the domain ID allocation as an arch-independent function domid_all=
oc() in
> > common/domain.c based on rangeset.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and
> >   use it if ID is not used;
> > - Otherwise, perform an exhaustive search starting from the end of the =
used
> >   domain ID range. domid_alloc() guarantees that two subsequent calls w=
ill
> >   result in different IDs allocation.
> While you properly retain original logic now, the above is not an accurat=
e
> description thereof, imo. To search "from the end" usually is understood =
as
> a backwards search. Whereas what you mean is that the search starts off w=
here
> the last one finished, wrapping around when hitting the end of the valid
> range.

I have updated the description in v7:
  https://lore.kernel.org/xen-devel/20250519192306.1364471-2-dmukhin@ford.c=
om/

>=20
> Jan
>=20



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF9B1F581
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 19:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076088.1437803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmxN-0004XS-PI; Sat, 09 Aug 2025 17:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076088.1437803; Sat, 09 Aug 2025 17:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmxN-0004W1-Mf; Sat, 09 Aug 2025 17:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1076088;
 Sat, 09 Aug 2025 17:02:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gHj1=2V=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukmxL-0004Vv-Ox
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 17:02:08 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91e218a9-7542-11f0-b898-0df219b8e170;
 Sat, 09 Aug 2025 19:02:02 +0200 (CEST)
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
X-Inumbo-ID: 91e218a9-7542-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754758921; x=1755018121;
	bh=RNwNYmzfw8F0e9LpcZDYhhMXFutaRzDGYY5yPsTsnYs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WAez2JetV+gSJC4grfP5rkYNZYVw9YtDZrQcVafn/4uBu16gTuun5yYu51Rdgy3Eq
	 AQ+/UCT2m2M49UvDcnj/NWhKx9ZFo7QBr6ydt8BSFDMSGWPJzb8Ph5if82iU+pQxJs
	 FEOOlMxUBZOrVu0YyvWLQ/M6RRZXW1wdFx+N3hGz9ffpj+rDLaXo4Oux2r7UlTwPLT
	 hM2d9vck+2MsMOWE03LacYfaDsbbjBblqATOA5eXId/HEI98rvbykL7zShcjpNMCCm
	 7f2BueLlxkS5H4J3/0gOEaQmooAMGbHJT5K3Pcgr8uN1OC0ST+jBwGEcs6YGqvD5JA
	 pQARw7jFm2ZiA==
Date: Sat, 09 Aug 2025 17:01:57 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v14 1/4] xen/domain: unify domain ID allocation
Message-ID: <aJd/AJ6CicRik55R@kraken>
In-Reply-To: <400bf35e-65cc-40a6-ae7a-3c134e6d9c49@xen.org>
References: <20250808021938.669855-1-dmukhin@ford.com> <20250808021938.669855-2-dmukhin@ford.com> <400bf35e-65cc-40a6-ae7a-3c134e6d9c49@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 48e33562c141b26f2b23e546d24fd92233f868a7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2025 at 06:42:03PM +0100, Julien Grall wrote:
> Hi Denis,
>=20
> On 08/08/2025 03:19, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, there are two different domain ID allocation implementations=
:
> >
> >    1) Sequential IDs allocation in dom0less Arm code based on max_init_=
domid;
> >
> >    2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not us=
e
> >       max_init_domid (both Arm and x86).
> >
> > The domain ID allocation covers dom0 or late hwdom, predefined domains,
> > post-boot domains, excluding Xen system domains (domid >=3D
> > DOMID_FIRST_RESERVED).
> >
> > It makes sense to have a common helper code for such task across archit=
ectures
> > (Arm and x86) and between dom0less / toolstack domU allocation.
> >
> > Note, fixing dependency on max_init_domid is out of scope of this patch=
.
> >
> > Wrap the domain ID allocation as an arch-independent function domid_all=
oc() in
> > new common/domid.c based on the bitmap.
> >
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and use=
 it if
> >    ID is not used;
> > - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERV=
ED-1],
> >    starting from the last used ID.
> >    Implementation guarantees that two consecutive calls will never retu=
rn the
> >    same ID. ID#0 is reserved for the first boot domain (currently, dom0=
) and
> >    excluded from the allocation range.
> >
> > Remove is_free_domid() helper as it is not needed now.
> >
> > No functional change intended.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thank you!

>=20
> Cheers,
>=20
> --
> Julien Grall
>=20
>=20



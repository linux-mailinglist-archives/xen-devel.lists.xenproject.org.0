Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8502AB15624
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 01:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063239.1429026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugu8F-0008Pu-Li; Tue, 29 Jul 2025 23:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063239.1429026; Tue, 29 Jul 2025 23:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugu8F-0008ND-IS; Tue, 29 Jul 2025 23:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1063239;
 Tue, 29 Jul 2025 23:53:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TdY=2K=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugu8D-0008N3-Hz
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 23:53:18 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e81da95-6cd7-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 01:53:10 +0200 (CEST)
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
X-Inumbo-ID: 2e81da95-6cd7-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753833189; x=1754092389;
	bh=3fMo5xri/OCPNS3OllqCf8uxeck4dU97zjMKIF81j/o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iZrom4az+095je+BKY50fzzAx+PZdfFWmdmUjrL9doeJoEbYwZ/aos3k17Y2K5sqk
	 xEkdv+5E8G7hxzJFozQdl3Bw9rPsUi4RqP6XLJ8sCuvOnMTCTu/ysPGhp7F6W6AHpf
	 ipEBn6+3R/ZrdUbbWGo4usi3HPAAAuOFLAxPo7PCFnUnU1Fk6iKuZyISEhGcaT4ql6
	 2oI5lB2cyGdJBDJ/++/kD8pmzqWpgj6L/0gTrvafaeLNpWuhPurR21ws1brSJs9XlY
	 ag49CRdXQaK1Hd5tBmWEG0IyqoGkyl1lddoksFFdejUwNj5V4ufDWm3+ozF+HMOl50
	 D1NSQ+d4bkFUQ==
Date: Tue, 29 Jul 2025 23:53:05 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v11 1/3] xen/domain: unify domain ID allocation
Message-ID: <aIle2z3jJeP5E8qM@kraken>
In-Reply-To: <DBOGZOES2A5Q.20Y3MK677M83D@amd.com>
References: <20250728183427.1013975-1-dmukhin@ford.com> <20250728183427.1013975-2-dmukhin@ford.com> <DBOGZOES2A5Q.20Y3MK677M83D@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6ee7544f3aad9d0592c8f9eccf067be3d23a84a1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 12:34:25PM +0200, Alejandro Vallejo wrote:

Thanks for review!

> On Mon Jul 28, 2025 at 8:34 PM CEST, dmkhn wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Currently, there are two different domain ID allocation implementations=
:
> >
> >   1) Sequential IDs allocation in dom0less Arm code based on max_init_d=
omid;
> >
> >   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
> >      max_init_domid (both Arm and x86).
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
>=20
> I can see why. The console switch code is a bit annoying. It's unfortunat=
e it
> relies on that global for the early wraparound.

Yep, I have a series which removes `max_init_domid` here:
  https://lore.kernel.org/xen-devel/20250530231841.73386-1-dmukhin@ford.com=
/



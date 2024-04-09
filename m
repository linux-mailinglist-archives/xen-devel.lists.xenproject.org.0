Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C1789E52E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 23:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702842.1098451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruJLC-00084D-JX; Tue, 09 Apr 2024 21:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702842.1098451; Tue, 09 Apr 2024 21:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruJLC-00082g-Gv; Tue, 09 Apr 2024 21:49:18 +0000
Received: by outflank-mailman (input) for mailman id 702842;
 Tue, 09 Apr 2024 21:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ECT=LO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ruJLB-00082a-5p
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 21:49:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01b42ca9-f6bb-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 23:49:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 82A0461A33;
 Tue,  9 Apr 2024 21:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811E9C433C7;
 Tue,  9 Apr 2024 21:49:12 +0000 (UTC)
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
X-Inumbo-ID: 01b42ca9-f6bb-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712699353;
	bh=VR5xSj1SeIHvsPlNGU1lnCpdectzy6A1+GhLRPfZ9nA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P+X4HC06w37PZ4nUod707Rt4OWf+eJx8cvFelP+nI0+0fjztY4VLQrWBTyXVQDTAI
	 A2ABKF29TClnmth1khKRAklG0KkIlVu7wmwBkcOCv/WhnmLJpJx/OoTzdPgUvLxRyT
	 A71Q9d4NfVHUqMic06Gx2eDQgeEiGyY2vnX55s5kJgTSvO1Wrm/mxIy1Hhie/U67MH
	 uYDKZDsnY7YGObmWjq03Pb2/cuA8fg6c7kEEYpAOHVEucRztzv/ozHo9LFxIeUx5Kw
	 MJzomiu28Y3ibMl4fs5bZftoQAcGDn8IdYNujdIgDOjRzcnU09vUEua47AJE4hL2Kg
	 OTBGVUz2bh/Yw==
Date: Tue, 9 Apr 2024 14:49:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH V1] x86/ucode: optional amd/intel ucode build &
 load
In-Reply-To: <ae38f758-7894-4098-85dc-04cbf3523393@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404091443140.2245130@ubuntu-linux-20-04-desktop>
References: <20240405103027.2704728-1-Sergiy_Kibrik@epam.com> <33eb77af-2196-40d9-9cdb-a4acf95f221c@citrix.com> <ae38f758-7894-4098-85dc-04cbf3523393@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1525855345-1712699353=:2245130"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1525855345-1712699353=:2245130
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 9 Apr 2024, Sergiy Kibrik wrote:
> 05.04.24 13:57, Andrew Cooper:
> > On 05/04/2024 11:30 am, Sergiy Kibrik wrote:
> > > Introduce configuration variables to make it possible to selectively turn
> > > on/off CPU microcode management code in the build for AMD and Intel CPUs.
> > > 
> > > This is to allow build configuration for a specific CPU, not compile and
> > > load what will not be used anyway.
> > > 
> > > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > 
> > Hmm... Stefano didn't check up with me first.
> > 
> > _https://lore.kernel.org/xen-devel/20231027191926.3283871-1-andrew.cooper3@citrix.com/
> > 
> > I've already got a series out for this, although its blocked on naming
> > and IMO, particularly unhelpful replies.  I've not had time to apply the
> > community-resolution vote on naming issues.  (Also, you should be CC-ing
> > Roger on x86 patches).
> 
> + Stefano & Roger
> 
> should we revisit this series then?

Yes, I replied. I think there are three naming options:

Option-1)
CONFIG_{AMD,INTEL}
nothing else

Option-2)
CONFIG_{AMD,INTEL}_IOMMU
CONFIG_{AMD,INTEL} selects CONFIG_{AMD,INTEL}_IOMMU

Option-3)
CONFIG_{AMD,INTEL}_IOMMU
CONFIG_{AMD,INTEL}_CPU
CONFIG_{AMD,INTEL} selects both CPU and IOMMU options


My preference is Option-1 (best), Option-3, Option-2 (worse)

I am fine with anything but please let move this forward.
--8323329-1525855345-1712699353=:2245130--


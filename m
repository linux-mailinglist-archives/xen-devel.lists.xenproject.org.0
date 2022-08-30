Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86A5A6A63
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 19:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395112.634685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT52A-0006RY-Dy; Tue, 30 Aug 2022 17:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395112.634685; Tue, 30 Aug 2022 17:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT52A-0006Pk-Al; Tue, 30 Aug 2022 17:28:18 +0000
Received: by outflank-mailman (input) for mailman id 395112;
 Tue, 30 Aug 2022 17:28:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Pn=ZC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oT528-0006Pe-VR
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 17:28:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21146f07-2889-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 19:28:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BA5760B37;
 Tue, 30 Aug 2022 17:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9CFC433C1;
 Tue, 30 Aug 2022 17:28:13 +0000 (UTC)
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
X-Inumbo-ID: 21146f07-2889-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661880494;
	bh=uaUAb4vQ8Fs+PVHHdSTzvRCQdUX7F9ORZomJc9MOrgY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y/suOySsSesDM95gMENeDiojsjzfuP8DRffL9XxvvBp4OVLE6LQXQyYfzSMsE0lfm
	 RHMpEXwEF672TqztQ/Af9dZCNqdmlbH/Xlw7vsTpt039qisQw2L57moE8YvXZddXOE
	 /l4dF9stMMCkkRK05Okb+/8y4E4lq3x5aXe2TkGUmhUxnMuioGzOZlPa61a3VTsG4q
	 ZmYBWfbkFXnCIy+uLyeiKqNM9uWKCu4H4OQd/STiuf/3/dwjm21vxofHboFf+KaX6P
	 8QT6mSSSTbQtAfrisWqoextoeLHCTs19nDZnehRRu0BD13znEBzGtIOoew1iRMmFEl
	 3nFTu+5/6XRzA==
Date: Tue, 30 Aug 2022 10:28:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
In-Reply-To: <AS8PR08MB7991780D566C3EEEAD7F5BF092799@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2208301026420.1134492@ubuntu-linux-20-04-desktop>
References: <20220824073127.16762-1-Henry.Wang@arm.com> <20220824073127.16762-3-Henry.Wang@arm.com> <59f69736-a18c-9d08-94dd-791bd264d671@amd.com> <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com> <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
 <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com> <536cad9e-53b5-2eae-0cd4-06f899229470@amd.com> <AS8PR08MB7991C3859BA3BAF913D50E1C92799@AS8PR08MB7991.eurprd08.prod.outlook.com> <c749e3aa-39a2-a4a8-9a21-77a65881dca5@amd.com>
 <AS8PR08MB7991780D566C3EEEAD7F5BF092799@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Aug 2022, Henry Wang wrote:
> > -----Original Message-----
> > From: Michal Orzel <michal.orzel@amd.com>
> > >
> > > Oh I think get your point. Let me try to explain myself and thanks for your
> > > patience :))
> > >
> > > The reserved heap region defined in the device tree should be used for
> > both
> > > Xenheap and domain heap, so if we reserved a too small region (<32M),
> > > an error should pop because the reserved region is not enough for
> > xenheap,
> > > and user should reserve more.
> > > [...]
> > >
> > >> But your check is against heap being to small (less than 32M).
> > >> So basically if the following check fails:
> > >> "( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )"
> > >> it means that the heap region defined by a user is too small (not too large),
> > >> because according to requirements it should be at least 32M.
> > >
> > > [...]
> > > So in that case, printing "Not enough space for xenheap" means the
> > reserved
> > > region cannot satisfy the minimal requirement of the space of xenheap (at
> > least
> > > 32M), and this is in consistent with the check.
> > 
> > Ok, it clearly depends on the way someone understands this sentence.
> > Currently this panic can be triggered if the heap size is too large and
> > should be read as "heap is too large to fit in because there is not enough
> > space
> > within RAM considering modules (e - s < size)". Usually (and also in this case)
> > space refers to a region to contain another one.
> > 
> > You are reusing the same message for different meaning, that is "user
> > defined too
> > small heap and this space (read as size) is not enough".
> 
> Yes, thanks for the explanation. I think maybe rewording the message
> to "Not enough memory for allocating xenheap" would remove the ambiguity
> to some extent? Because the user-defined heap region should cover both
> xenheap and domain heap at the same time, the small user-defined heap
> means "xenheap is too large to fit in the user-defined heap region", which is
> in consistent with your interpretation of the current "xenheap is too large to fit
> in because there is not enough space within RAM considering modules"

I think we should have a separate check specific for the device tree
input parameters to make sure the region is correct, that way we can
have a specific error message, such as:

"xen,static-heap address needs to be 32MB aligned and the size a
multiple of 32MB."


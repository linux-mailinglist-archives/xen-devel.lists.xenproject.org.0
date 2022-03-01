Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D8C4C995F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 00:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281859.480380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPByq-0004dl-A2; Tue, 01 Mar 2022 23:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281859.480380; Tue, 01 Mar 2022 23:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPByq-0004bb-6k; Tue, 01 Mar 2022 23:32:32 +0000
Received: by outflank-mailman (input) for mailman id 281859;
 Tue, 01 Mar 2022 23:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fFui=TM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nPByo-0004bV-Ll
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 23:32:30 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db66cf26-99b7-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 00:32:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 417D0B81E9E;
 Tue,  1 Mar 2022 23:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C45C340EE;
 Tue,  1 Mar 2022 23:32:25 +0000 (UTC)
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
X-Inumbo-ID: db66cf26-99b7-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646177545;
	bh=+SA82CamGfLPzzHxYpYuzMUaSa0MxSu4P4PwkY7jH04=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O3DOvQLN4pclMrpiNvqv9YCAeO8vne6fd42TCWCLuB6T2Ku51vp5155oGPV5ArOAM
	 3ph2RkU69+9eBqb61zhhKNIH3saV7/6OiXRIiQO7PNDJLEkFt5bwkrttHwEuXcb69/
	 Pq+sQL2nth4xala1hM40dGSAWskVi6ODTteSvxn0DQGfR4KAxtEkAdSF2uFA3p+6AA
	 5GiXMRyRGcZinxXrPip8ysfNNDV2FMw6dG7Dioqssx8KiRv+g5Wn8VppmPdz589aS2
	 F5H6lNoZyPSeTdmBq5rCrHgnGrN1xH97bt7U7oHKdEYX9Rvd67VsLxPBInFRoUvMBg
	 FyZ85Q6SykJPA==
Date: Tue, 1 Mar 2022 15:32:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [RFC PATCH 0/2] Introduce reserved Xenheap
In-Reply-To: <PAXPR08MB742081C99F081F5D4E0A74779E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2203011452140.3261@ubuntu-linux-20-04-desktop>
References: <20220224013023.50920-1-Henry.Wang@arm.com> <6269ec3d-039e-d68f-771d-c5e088631410@xen.org> <PA4PR08MB625324910ED4D40383191F9D92019@PA4PR08MB6253.eurprd08.prod.outlook.com> <48a0712c-eff8-dfc1-2136-59317f22321f@xen.org>
 <PA4PR08MB6253D51D60CC4078083D0AAC92029@PA4PR08MB6253.eurprd08.prod.outlook.com> <PAXPR08MB742081C99F081F5D4E0A74779E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Mar 2022, Wei Chen wrote:
> > Hi Julien,
> > 
> > > -----Original Message-----
> > > From: Julien Grall <julien@xen.org>
> > > On 28/02/2022 07:12, Henry Wang wrote:
> > > > Hi Julien,
> > >
> > > Hi Henry,
> > >
> > > >> -----Original Message-----
> > > >> From: Julien Grall <julien@xen.org>
> > > >> Hi Henry,
> > > >>
> > > >> On 24/02/2022 01:30, Henry Wang wrote:
> > > >>> The reserved Xenheap, or statically configured Xenheap, refers to
> > parts
> > > >>> of RAM reserved in the beginning for Xenheap. Like the static memory
> > > >>> allocation, such reserved Xenheap regions are reserved by
> > configuration
> > > >>> in the device tree using physical address ranges.
> > > >>
> > > >> In Xen, we have the concept of domheap and xenheap. For Arm64 and
> > > x86
> > > >> they would be the same. But for Arm32, they would be different:
> > xenheap
> > > >> is always mapped whereas domheap is separate.
> > > >>
> > > >> Skimming through the series, I think you want to use the region for
> > both
> > > >> domheap and xenheap. Is that correct?
> > > >
> > > > Yes I think that would be correct, for Arm32, instead of using the
> > full
> > > > `ram_pages` as the initial value of `heap_pages`, we want to use the
> > > > region specified in the device tree. But we are confused if this is
> > the
> > > > correct (or preferred) way for Arm32, so in this series we only
> > > > implemented the reserved heap for Arm64.
> > >
> > > That's an interesting point. When I skimmed through the series on
> > > Friday, my first thought was that for arm32 it would be only xenheap (so
> > > all the rest of memory is domheap).
> > >
> > > However, Xen can allocate memory from domheap for its own purpose (e.g.
> > > we don't need contiguous memory, or for page-tables).
> > >
> > > In a fully static environment, the domheap and xenheap are both going to
> > > be quite small. It would also be somewhat difficult for a user to size
> > > it. So I think, it would be easier to use the region you introduce for
> > > both domheap and xenheap.
> > >
> > > Stefano, Bertrand, any opionions?
> > >
> > > On a separate topic, I think we need some documentation explaining how a
> > > user can size the xenheap. How did you figure out for your setup?
> > 
> > Not sure if I fully understand the question. I will explain in two parts:
> > I tested
> > this series on a dom0less (static mem) system on FVP_Base.
> > (1) For configuring the system, I followed the documentation I added in
> > the
> > first patch in this series (docs/misc/arm/device-tree/booting.txt). The
> > idea is
> > adding some static mem regions under the chosen node.
> > 
> >      chosen {
> > +        #xen,static-mem-address-cells = <0x2>;
> > +        #xen,static-mem-size-cells = <0x2>;
> > +        xen,static-mem = <0x8 0x80000000 0x0 0x00100000 0x8 0x90000000
> > 0x0 0x08000000>;
> >      [...]
> >      }
> > 
> > (2) For verifying this series, what I did was basically playing with the
> > region size
> > and number of the regions, adding printks and also see if the guests can
> > boot
> > as expected when I change the xenheap size.
> > 
> > >
> > > >>
> > > >> Furthemore, now that we are introducing more static region, it will
> > get
> > > >> easier to overlap the regions by mistakes. I think we want to have
> > some
> > > >> logic in Xen (or outside) to ensure that none of them overlaps. Do
> > you
> > > >> have any plan for that?
> > > >
> > > > Totally agree with this idea, but before we actually implement the
> > code,
> > > > we would like to firstly share our thoughts on this: One option could
> > be to
> > > > add data structures to notes down these static memory regions when the
> > > > device tree is parsed, and then we can check if they are overlapped.
> > >
> > > This should work.
> > 
> > Ack.
> > 
> > >
> > > > Over
> > > > the long term (and this long term option is currently not in our plan),
> > > > maybe we can add something in the Xen toolstack for this usage?
> > >
> > > When I read "Xen toolstack", I read the tools that will run in dom0. Is
> > > it what you meant?
> > 
> > Nonono, sorry for the misleading. I mean a build time tool that can run
> > on host (build machine) to generate/configure the Xen DTS for static
> > allocated memory. But maybe this tool can be placed in Xen tool or it can
> > be a separate tool that out of Xen's scope.
> > 
> > Anyway, this is just an idea as we find it is not easy for users to
> > configure
> > so many static items manually.
> 
> Not only for this one. As v8R64 support code also includes lots of static
> allocated items, it will also encounter this user configuration issue.
> So this would be a long term consideration. We can discuss this topic
> after Xen V8R64 support code upstream work be done.
> 
> And this tool does not necessarily need to be provided by the community.
> Vendors that want to use Xen also can do it. IMO, it would be better if
> community could provide it. Anyway let's defer this topic : ) 

Yes, I agree with you that it would be best if this tool was provided by
the community. I'll continue the conversation on the Armv8-R64 thread.


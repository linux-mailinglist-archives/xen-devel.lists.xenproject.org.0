Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBCB626472
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 23:18:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442723.697175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otcLo-0001oc-1d; Fri, 11 Nov 2022 22:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442723.697175; Fri, 11 Nov 2022 22:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otcLn-0001mB-V4; Fri, 11 Nov 2022 22:18:15 +0000
Received: by outflank-mailman (input) for mailman id 442723;
 Fri, 11 Nov 2022 22:18:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JraP=3L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1otcLm-0001m5-6m
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 22:18:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba99a012-620e-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 23:18:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A2186210D;
 Fri, 11 Nov 2022 22:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F48C433C1;
 Fri, 11 Nov 2022 22:18:08 +0000 (UTC)
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
X-Inumbo-ID: ba99a012-620e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668205090;
	bh=HUmklLsRcj8o4GSmpeB1SyWK5agxHuvDdIr4q87pvdE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZqTRIhJiAOrCpSDm8O3rCCHPz2olP0S5AZmTsMesRn3Ve1aMueJknFlccLMdn8jOg
	 BWhaKpcdZWpBVZAftQmUpE2Q3m+Kp0MJd3qApyFfrtN04ypp3gPFkmpnz6RzvvpR79
	 0bO4T8xiX87U+TQIut6zXSlyx0CQGj5CgI0cRUvclXT1Es8PaIPWkjeDvKLh5/ZcJY
	 cHkNBi0e9ScLxfEOhGdFip2vMLCAi/K012pcbGL1fLCsRw++Xf+SBKcnBXumkcPim7
	 5/mQEF2Xpa6pyep2GeBK3IW5LlH4pQ7T0739KNnHEoRJnKydAfgTcy2E+F3zbNi/HO
	 o4hXI94OCZ/sQ==
Date: Fri, 11 Nov 2022 14:18:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: RE: [XEN PATCH for-4.17 v2 0/6] Fixing some licences issue in public
 headers
In-Reply-To: <AS8PR08MB79910B53B2AF37B02C2C766C92009@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2211111417370.4020@ubuntu-linux-20-04-desktop>
References: <20221103115204.49610-1-anthony.perard@citrix.com> <alpine.DEB.2.22.394.2211101513070.50442@ubuntu-linux-20-04-desktop> <AS8PR08MB79910B53B2AF37B02C2C766C92009@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Nov 2022, Henry Wang wrote:
> Hi Stefano,
> 
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Hi all,
> > 
> > I think if we are going to commit this series for 4.17 then I would
> > suggest to also commit patches 1-3 of my "introduce SPDX" series:
> > 
> > https://marc.info/?l=xen-devel&m=166562222522996
> > 
> > They are already acked/reviewed and are zero risk as they don't actually
> > change any of the headers.
> 
> After some thinking and discussion I would like to follow your suggestion in
> here. So for the first 3 patches from your "introduce SPDX" series:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks, I pushed the first 3 patches.



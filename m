Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1938E829182
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 01:38:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665277.1035424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNMas-0004nI-Rm; Wed, 10 Jan 2024 00:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665277.1035424; Wed, 10 Jan 2024 00:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNMas-0004kM-OU; Wed, 10 Jan 2024 00:37:18 +0000
Received: by outflank-mailman (input) for mailman id 665277;
 Wed, 10 Jan 2024 00:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0rG5=IU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rNMaq-0004kG-DY
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 00:37:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65bf8224-af50-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 01:37:13 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2B4C0B81C53;
 Wed, 10 Jan 2024 00:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07977C433F1;
 Wed, 10 Jan 2024 00:37:10 +0000 (UTC)
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
X-Inumbo-ID: 65bf8224-af50-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704847032;
	bh=ir1ALmMkdeBlyZHBMSn9cZFUoK27iM8L1cV0xtliHls=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fho12tVyhOJKCgFx4ErHVdFBndGYA4BsXxQa6fNpHxnUroPMG7SaQLCyys8ZluqGo
	 eM0l1nkjn+t09PTZcUmA7SKXWPAuKRu7BFeYyLOhnaZLQ8CNABljfoY9IQVrNqxxUK
	 mypCzED0kh7KQwOq//ARUOZgc/Lg7qbxOx2ijnDLIoU49LS5UI2cRnBYr+eGzX6Bak
	 KdzN9uRRxkGwAGAABN6tlNja7WkZRCCFAddeBGDOM9pS0g/36MBfTP/TPIdgwUdxRE
	 llg2eINk+LaNrlxrlSy/ui6+eC0uo7lmFB2Cul9PktIunbH1MiHcBxyJVTm/Ahd5lu
	 GYoShkOci6/Vw==
Date: Tue, 9 Jan 2024 16:37:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Carlo Nonato <carlo.nonato@minervasys.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Marco Solieri <marco.solieri@minervasys.tech>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 09/13] xen: add cache coloring allocator for domains
In-Reply-To: <101c638c-03ee-471b-a6c8-9c2c10772001@suse.com>
Message-ID: <alpine.DEB.2.22.394.2401091636300.3675@ubuntu-linux-20-04-desktop>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech> <20240102095138.17933-10-carlo.nonato@minervasys.tech> <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com> <101c638c-03ee-471b-a6c8-9c2c10772001@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jan 2024, Jan Beulich wrote:
> On 09.01.2024 11:28, Jan Beulich wrote:
> > On 02.01.2024 10:51, Carlo Nonato wrote:
> >> v5:
> >> - Carlo Nonato as the new author
> >> - the colored allocator balances color usage for each domain and it searches
> >>   linearly only in the number of colors (FIXME removed)
> > 
> > While this addresses earlier concerns, meanwhile NUMA work has also
> > been progressing. What's the plan of interaction of coloring with it?
> 
> Thinking of interactions - what about static memory? Is coloring incompatible
> with that? If so, should the two features be excluded to both be used at the
> same time?

Yes the two features are incompatible. It makes sense to reject attempts
to enable both at the same time.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA84177506E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 03:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580647.909010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTY85-0005HI-CC; Wed, 09 Aug 2023 01:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580647.909010; Wed, 09 Aug 2023 01:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTY85-0005F3-7L; Wed, 09 Aug 2023 01:36:53 +0000
Received: by outflank-mailman (input) for mailman id 580647;
 Wed, 09 Aug 2023 01:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTY84-0005Ep-BM
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 01:36:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 361a42c4-3655-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 03:36:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A97B9624E5;
 Wed,  9 Aug 2023 01:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F47AC433C7;
 Wed,  9 Aug 2023 01:36:47 +0000 (UTC)
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
X-Inumbo-ID: 361a42c4-3655-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691545009;
	bh=Hqo0K274CWnED+YLh7Sffcn/xf+hdeJU5GsOxxHi3hA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XBgnvoPflLXaHsIucJ9SrsAXzmnDd6SGSUbjNUPPjgo7J4Sk1uBDHHkzcLSVxKW13
	 VeRvqktDvD901EdTpeCadCzS4qqaKCsBqTwSpLt4MNTLKN650IuflXixv9cqqkhnzH
	 Hot+gjrkQF40ZV8b7OF8XTJ/eXiPfa4CwN9Kt0hz6bH8lyvgXoPGBwnDZKXjp2QZH2
	 +9p445r5mF8PuiF6pevOx99lHjHx9cl6fyDjXf0U4nbEYOOHJFz+ZyhfnFkV7dVGp+
	 h+Ct6wBgtJVsNm+VT3an/D8/FKJBE1fAY56QIYeMsGOUoiNbHDioBWBHl0KokDqeyz
	 ApufED00n95xg==
Date: Tue, 8 Aug 2023 18:36:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [RFC 2/6] roles: provide abstraction for the possible domain
 roles
In-Reply-To: <961664b6-ede3-c803-293a-0aeb5792990d@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308081835570.2127516@ubuntu-linux-20-04-desktop>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com> <20230801202006.20322-3-dpsmith@apertussolutions.com> <alpine.DEB.2.22.394.2308011726170.2127516@ubuntu-linux-20-04-desktop> <c747c66c-a08d-ce0c-5d1c-25b594ac5f5e@apertussolutions.com>
 <alpine.DEB.2.22.394.2308031247430.2127516@ubuntu-linux-20-04-desktop> <119710f3-82b1-2066-5fa0-164bd293836e@apertussolutions.com> <alpine.DEB.2.22.394.2308081629220.2127516@ubuntu-linux-20-04-desktop>
 <961664b6-ede3-c803-293a-0aeb5792990d@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Daniel P. Smith wrote:
> > Thanks for the example, it is finally clear!
> > 
> > I don't think we should add hardware_dom=1 to the command line (I don't
> > know if it was just an example to make it easier to understand for me).
> > Instead it should a property on device tree. hardware_dom=1 is not great
> > because it is tied to the order of domain construction. Instead it
> > should be a device tree property under the specific domain. That way you
> > can clearly specify which one is tradition dom0, or which is
> > hardware_domain and which is control_domain.
> 
> I was describing with today's code, how you would launch a late hardware
> domain. The logic to trigger the hardware transfer from dom0 to the hardware
> domain is triggered by the command line parameter `hardware-dom`. With
> hyperlaunch, this can eventually be retired and separate control domain and
> hardware domain can be constructed at launch as we expose access to
> roles/capabilities through its DT interface.

+1


> > > > which I don't understand
> > > 
> > > Did the above help?
> > 
> > A lot, thanks!
> 
> Your welcome, glad I was able to articulate it better this time.

Thanks for the explanation, it all looks good to me.


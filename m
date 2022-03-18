Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63654DE3DD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 23:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292255.496400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVKgA-0005Wk-CO; Fri, 18 Mar 2022 22:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292255.496400; Fri, 18 Mar 2022 22:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVKgA-0005UU-8r; Fri, 18 Mar 2022 22:02:38 +0000
Received: by outflank-mailman (input) for mailman id 292255;
 Fri, 18 Mar 2022 22:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVKg8-0005UM-Ie
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 22:02:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1def7e68-a707-11ec-a405-831a346695d4;
 Fri, 18 Mar 2022 23:02:35 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AE5E0B825A5;
 Fri, 18 Mar 2022 22:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDB9C340E8;
 Fri, 18 Mar 2022 22:02:32 +0000 (UTC)
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
X-Inumbo-ID: 1def7e68-a707-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647640953;
	bh=E79GiSNFsHYs0WWiDeVnepFK1C3PiN98Rw4IyIZIydc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ixEBYOlyYWZbsniiIGj9UlhicX8KFaXybcHmky4WuOTqeZIZKbyu7fw2O/LQj4O2M
	 E2FXyKOKZECbxjL7OGLtPR2n/TCjp2XVjv7VMh0TMAWtspphavhkztWChTlZLfGRTN
	 yXjcVV3r1BxpVbV1H857kfobd85X9Ul8Oj/hQofr1XCffyKcc+CLHnoGkHUeNgzmo2
	 7InVld91vb1d2XJ2gWPovA7QXJtFdjYntbt7+BpTgDhfkDhoes5Wa/oTrm1lK1IWk/
	 tA6kx5g/VXhX6a/zqQCFP1FFrnZI2akUX2E+NieQI4bDkjzofpXtrGkjohADDBX9JK
	 en/NSEFy7Lexw==
Date: Fri, 18 Mar 2022 15:02:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    nd <nd@arm.com>, Penny Zheng <penzhe01@a011292.shanghai.arm.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: RE: [PATCH v1 02/13] xen/arm: introduce a special domain
 DOMID_SHARED
In-Reply-To: <DU2PR08MB7325E5A3B5A9BC5DA76692C4F7139@DU2PR08MB7325.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2203181459480.2910984@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-3-Penny.Zheng@arm.com> <alpine.DEB.2.22.394.2203171645450.3497@ubuntu-linux-20-04-desktop> <DU2PR08MB7325E5A3B5A9BC5DA76692C4F7139@DU2PR08MB7325.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Mar 2022, Penny Zheng wrote:
> > On Fri, 11 Mar 2022, Penny Zheng wrote:
> > > From: Penny Zheng <penzhe01@a011292.shanghai.arm.com>
> > >
> > > In case to own statically shared pages when owner domain is not
> > > explicitly defined, this commits propose a special domain
> > > DOMID_SHARED, and we assign it 0x7FF5, as one of the system domains.
> > >
> > > Statically shared memory reuses the same way of initialization with
> > > static memory, hence this commits proposes a new Kconfig
> > > CONFIG_STATIC_SHM to wrap related codes, and this option depends on
> > static memory(CONFIG_STATIC_MEMORY).
> > 
> > Why does it depend on CONFIG_STATIC_MEMORY? This is a genuine question,
> > I am not trying to scope-creep the series. Is there an actual technical
> > dependency on CONFIG_STATIC_MEMORY? If not, it would be super useful to
> > be able to share memory statically even between normal dom0less guests (of
> > course it would be responsibility of the user to provide the right addresses and
> > avoid mapping clashes.) I know that some of our users have requested this
> > feature in the past.
> > 
> 
> I may find a proper way to rephrase here. My poor English writing skill...
> When I implemented domain on static allocation, statically configured guest RAM is
> treated as static memory in Xen and I introduced a few helpers to initialize/allocate/free
> static memory, like acquire_staticmem_pages, etc, and all these helpers are guarded with
> CONFIG_STATIC_MEMORY. 
> I want to reuse these helpers on static shared memory, so CONFIG_STATIC_SHM depends
> on CONFIG_STATIC_MEMORY.
> 
> So I'm not restricting sharing static memory between domain on static allocation, current
> Implementation is also useful to normal dom0less guests.

Ah, excellent! That makes sense.


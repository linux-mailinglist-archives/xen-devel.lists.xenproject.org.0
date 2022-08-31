Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76725A8972
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 01:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396113.636127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTWtq-0000AK-4k; Wed, 31 Aug 2022 23:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396113.636127; Wed, 31 Aug 2022 23:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTWtq-00008L-1l; Wed, 31 Aug 2022 23:13:34 +0000
Received: by outflank-mailman (input) for mailman id 396113;
 Wed, 31 Aug 2022 23:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6oq=ZD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oTWto-00008E-W5
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 23:13:32 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87608ee4-2982-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 01:13:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB2BAB823BC;
 Wed, 31 Aug 2022 23:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F93C433B5;
 Wed, 31 Aug 2022 23:13:29 +0000 (UTC)
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
X-Inumbo-ID: 87608ee4-2982-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661987609;
	bh=5Bv+QLX+bVtadIz87jZ5z97iJSiXUjNYlAmxG+CCUJQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nx5n6uKyxhAKXj7mKTX84sPQyWAsqdar4ZmI30R8EJKMSIfxDgV504+WFE7f9Xz5c
	 TjQzguSpI63nVJht0X3WBiBAOdazSVqXCTJLvMUIWRo/HwBF7gPdQfQAuz35x3YauL
	 kxDoJmu9G78RlfcQBXa5mohxhmjjnbAe31nxLeLfFwBzgeMWdfYfNcIrDfavzb1MBZ
	 o/Q9Un45maHN98UdFBCdml7/PxB4SRipXfMwuROJp1Ir3Bk4kCDNHHzWBKMjQjz6rx
	 eaJc4yU/03iFgmPRDh77RdR80vLodf5USJcbZwKXA0ImLi2MGUTAR25dbENn8lE4l0
	 tOeWiOqWwhZgg==
Date: Wed, 31 Aug 2022 16:13:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Long <hack3rcon@yahoo.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: How to isolate vital part of a host with the Xen Hypervisor?
In-Reply-To: <1677353127.432967.1661060142000@mail.yahoo.com>
Message-ID: <alpine.DEB.2.22.394.2208311611050.2375071@ubuntu-linux-20-04-desktop>
References: <1677353127.432967.1661060142000.ref@mail.yahoo.com> <1677353127.432967.1661060142000@mail.yahoo.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 21 Aug 2022, Jason Long wrote:
> Hello,
> Is it possible to install the Xen Hypervisor for just isolate my host OS and disable its Virtualization features (Install guest OS)?

Yes, it is possible. If you are targeting embedded, you might find this
presentation interesting as it comes with examples:

https://www.youtube.com/watch?v=CiELAJCuHJg


Otherwise, if it is for your desktop, you might want to checkout
the Qubes OS and OpenXT projects.


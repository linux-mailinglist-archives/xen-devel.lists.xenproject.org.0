Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28B2DB8EC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 03:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54963.95549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpMWq-0005wU-Ao; Wed, 16 Dec 2020 02:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54963.95549; Wed, 16 Dec 2020 02:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpMWq-0005wC-55; Wed, 16 Dec 2020 02:27:00 +0000
Received: by outflank-mailman (input) for mailman id 54963;
 Wed, 16 Dec 2020 02:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehtw=FU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kpMWo-0005w7-3u
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 02:26:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d707b746-9a37-4fb0-8aed-1f28fdbec66a;
 Wed, 16 Dec 2020 02:26:57 +0000 (UTC)
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
X-Inumbo-ID: d707b746-9a37-4fb0-8aed-1f28fdbec66a
Date: Tue, 15 Dec 2020 18:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608085616;
	bh=9FG24449RUqdNEsOPLPB1M6/QEOSJ0r+dv5iGCISCto=;
	h=From:To:cc:Subject:From;
	b=fA5vTxY+tJtefLLQxBsAXTRhyDN2bkRH/6uKCM5qvzqIAZaN1CcAAYyQT3kS81/Py
	 vyiyy05npY2/G6HTB9e9wwULFagOukDqMamUFFLhB6GwYf2UgtJpyfOlsPWyatB/xO
	 vkBAKwxY/MmPanyfvQkSIbSFMnZJ8QN0ykN0AfUonwUXq9fxQ8fYE/tm8dTS0eMnH5
	 cVMm44QOawIwPzzxsHU56zOIc5a0Fv69ygXbdz0uiOgpOnr0iX+spcFGgvG5PnB4w1
	 bKUNoYme/I6Wh6uA5Vnwep/92thEuKiblEa7XYzUbf8r8rz8Ce0XBbUi4vEIbvS8pq
	 YoDSSbWT5HKfQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: iwj@xenproject.org, anthony.perard@citrix.com, wl@xen.org, 
    dgdegra@tycho.nsa.gov
cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org
Subject: arm32 tools/flask build failure
Message-ID: <alpine.DEB.2.21.2012151823480.4040@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

I am building Xen tools for ARM32 using qemu-user. I am getting the
following error building tools/flask. Everything else works fine. It is
worth noting that make -j1 works fine, it is only make -j4 that fails.

I played with .NOTPARALLEL but couldn't get it to work. Anyone has any
ideas?

Cheers,

Stefano


make[2]: Leaving directory '/build/tools/flask/utils'
make[1]: Leaving directory '/build/tools/flask'
make[1]: Entering directory '/build/tools/flask'
/usr/bin/make -C policy all
make[2]: Entering directory '/build/tools/flask/policy'
make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
/build/tools/flask/policy/Makefile.common:115: *** target pattern contains no '%'.  Stop.
make[2]: Leaving directory '/build/tools/flask/policy'
make[1]: *** [/build/tools/flask/../../tools/Rules.mk:160: subdir-all-policy] Error 2
make[1]: Leaving directory '/build/tools/flask'
make: *** [/build/tools/flask/../../tools/Rules.mk:155: subdirs-all] Error 2



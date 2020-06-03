Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948571ED0C8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 15:29:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgTS7-0005KA-Jz; Wed, 03 Jun 2020 13:29:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/nL=7Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jgTS5-0005Jv-KB
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 13:29:05 +0000
X-Inumbo-ID: 3122cb56-a59e-11ea-ad11-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3122cb56-a59e-11ea-ad11-12813bfff9fa;
 Wed, 03 Jun 2020 13:29:04 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: TPcMrBTyqfwu7Yg3jS+r/X+y+/0BOtVpY4flKzhRZBjZVIen+rtVFe0pQT14WBGPsZRB2oRjkO
 9kDnIDr7rFOFxs0J/65UdIIxUl1GpSK/gUHCWkQMCLiu9hhjgq7tGOcrdOBiOvfZcqoG0c9dgg
 FcYG/dMfwwLsB18xIgsJzIaKHzkjz2hWMGJcIs8+ssqkndQ3Heldm5Z40CO/nGqHPVpJAhyb8y
 JXG/VOQhc5cgKMKWza1Q3QD0ewcQc420shP29nIjyXy0Hz+WZX+kmlEZWElkex/+Q6fbZdJnF0
 +oA=
X-SBRS: 2.7
X-MesageID: 19138435
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19138435"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24279.42394.719346.971506@mariner.uk.xensource.com>
Date: Wed, 3 Jun 2020 14:28:58 +0100
To: Pavel Hrdina <phrdina@redhat.com>
Subject: Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)
In-Reply-To: <20200603103109.GA11390@antique-laptop>
References: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
 <20200603103109.GA11390@antique-laptop>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: libvir-list@redhat.com, xen-devel@lists.xenproject.org,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pavel Hrdina writes ("Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)"):
> To be honest I don't understand why would anyone want to keep track of
> all submodules of all projects for any CI and update it manually every
> time the upstream project changes these submodules. Sounds like a lot
> of unnecessary work but maybe I'm missing something.

Maybe I should answer this.  The short answer is that this can be done
entirely automatically.

> Well, we will break a lot more by switching to Meson build system where
> everyone building libvirt will have to change their scripts as it will
> not be compatible at all.

When that occurs we'll have to change our build rune, of course.

Our CI system (which does bisection and stable tracking and so on)
will wants to build old versions, so it'll have to have both build
runes and look for something in-tree to tell the two methods apart.

Thanks,
Ian.


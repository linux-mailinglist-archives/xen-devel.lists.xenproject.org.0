Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DC21DB8CB
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 17:56:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbR57-0008Fg-8j; Wed, 20 May 2020 15:56:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AW6E=7C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jbR55-0008FS-Cy
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 15:56:31 +0000
X-Inumbo-ID: 78704b60-9ab2-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78704b60-9ab2-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 15:56:30 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: huEG3xWiDCZyS+UsXq1qLYEvn4On/A+8tuklwQxifEsjCpsyoR4RgKAybu41l1kw/ESMuBa/n2
 uWRedc87mXLU3kj/MHcPJcayn5uq93XrsfkCKd6dt8spKJDHxn7P/ChTopgPqJkawdMY5QS8vc
 6vVNOTBRw93PCkozaEQS7lI0nsVN6RSCqItx3zHc73NUXg1QMMieRe3/YzxYfNHQC9bPd0IuaC
 nroz7Gu/0CtK/0/O9zjLiVk2Ds1W4I3E83aMwDprihz/GWitkr6eyACPiBgwCoBaZX4epMKQg8
 TIA=
X-SBRS: 2.7
X-MesageID: 18368514
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18368514"
Date: Wed, 20 May 2020 17:56:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] tools/libxengnttab: correct size of allocated memory
Message-ID: <20200520155621.GN54375@Air-de-Roger>
References: <20200520083501.31704-1-jgross@suse.com>
 <24261.17303.413916.29534@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24261.17303.413916.29534@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 03:49:59PM +0100, Ian Jackson wrote:
> Juergen Gross writes ("[PATCH] tools/libxengnttab: correct size of allocated memory"):
> > The size of the memory allocated for the IOCTL_GNTDEV_MAP_GRANT_REF
> > ioctl() parameters is calculated wrong, which results in too much
> > memory allocated.
> 
> Added Roger to CC.
> 
> Firstly,
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

For the FreeBSD bits:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> Thank you.
> 
> 
> But, looking at this code, why on earth what the ?
> 
> The FreeBSD code checks to see if it's less than a page and if so uses
> malloc and otherwise uses mmap !  Why not unconditionally use malloc ?
> 
> Likewise, the Linux code has its own mmap-based memory-obtainer.  ISTM
> that malloc is probably going to be better.  Often it will be able to
> give out even a substantial amount without making a syscall.
> 
> Essentially, we have two (similar but not identical) tiny custom
> memory allocators here.  Also, the Linux and FreeBSD code are
> remarkably similar which bothers me.

Right. This is due to the FreeBSD file being mostly a clone of the
Linux one. I agree the duplication could be abstracted away.

I really have no idea why malloc or mmap is used, maybe at some point
requesting regions > PAGE_SIZE was considered faster using mmap
directly?

Thanks, Roger.


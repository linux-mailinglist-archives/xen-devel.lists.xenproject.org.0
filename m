Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F32137E9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 11:45:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrIFY-0000PD-NZ; Fri, 03 Jul 2020 09:44:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jrIFY-0000P8-48
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 09:44:52 +0000
X-Inumbo-ID: d643c984-bd11-11ea-8958-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d643c984-bd11-11ea-8958-12813bfff9fa;
 Fri, 03 Jul 2020 09:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593769490;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hQ2tplJfrun6q9GRaPBbaWrbeHkFKi0r2UTOf5iKGy8=;
 b=R0FzuK51z/zvaKlEDAdBSFuSGlBWPX1Bi2+Y2kx4nY616KnroW45g2q2
 FHv5ExGUSbaQbIYJaUa3CcG8d7ESe4tut0Ib+YVKIno/fDwzYSYYCwkEi
 bO15zkw4zORmwDaNsWB6lPhLFUa0/KeoP/kzj1ZZe+ApAeEHrpFuULIJU 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: iI8SD/VCCQ4ZlZX16wkh3zjWWSOwCZgLRk1cV5LagIIOlB8ehZqOE/SvLECDA2isXgOGR2/Moz
 0502YXKR2gVsPQvKy6vK8Cv7ii+e34oYvXxSebsii9HWNadCCa097Hvl2FWuLAHmPq17XU2eaZ
 V2Czcix3/pvqZvRw88Zh5PUm+yXVy58yD33hq0dyuMK3Qi+A9uqDXfxJwtd/fb0ghpIMoLD1ji
 YSltImq092ctcRxhYMvnvkSwTACVpwdwTurG01gKlxDwpLxrvUw7Mh6sQAApr4zllLorLEw/1b
 gkI=
X-SBRS: 2.7
X-MesageID: 21559329
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,307,1589256000"; d="scan'208";a="21559329"
Date: Fri, 3 Jul 2020 11:44:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
Message-ID: <20200703094438.GY735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
 <20200702090047.GX735@Air-de-Roger>
 <1505813895.18300396.1593707008144.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1505813895.18300396.1593707008144.JavaMail.zimbra@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, tamas lengyel <tamas.lengyel@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 02, 2020 at 06:23:28PM +0200, Michał Leszczyński wrote:
> ----- 2 lip 2020 o 11:00, Roger Pau Monné roger.pau@citrix.com napisał(a):
> 
> > On Tue, Jun 30, 2020 at 02:33:46PM +0200, Michał Leszczyński wrote:
> >> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> >> index 59bdc28c89..7b8289d436 100644
> >> --- a/xen/include/public/domctl.h
> >> +++ b/xen/include/public/domctl.h
> >> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
> >>      uint32_t max_evtchn_port;
> >>      int32_t max_grant_frames;
> >>      int32_t max_maptrack_frames;
> >> +    uint8_t vmtrace_pt_order;
> > 
> > I've been thinking about this, and even though this is a domctl (so
> > not a stable interface) we might want to consider using a size (or a
> > number of pages) here rather than an order. IPT also supports
> > TOPA mode (kind of a linked list of buffers) that would allow for
> > sizes not rounded to order boundaries to be used, since then only each
> > item in the linked list needs to be rounded to an order boundary, so
> > you could for example use three 4K pages in TOPA mode AFAICT.
> > 
> > Roger.
> 
> In previous versions it was "size" but it was requested to change it
> to "order" in order to shrink the variable size from uint64_t to
> uint8_t, because there is limited space for xen_domctl_createdomain
> structure.

It's likely I'm missing something here, but I wasn't aware
xen_domctl_createdomain had any constrains regarding it's size. It's
currently 48bytes which seems fairly small.

There might be constrains on struct domain (the hypervisor internal
domain tracking structure), but I think you are already using a size
field there IIRC.

> 
> How should I proceed?

This is an unstable interface, so we could always change it. It seems
like we might want to use a size parameter at some point to take
advantage of non physically contiguous buffers, but if there are other
blockers that prevent such field from being wider ATM I'm fine with
it.

Thanks, Roger.


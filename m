Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D610243590
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 09:54:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k684E-00026D-VG; Thu, 13 Aug 2020 07:54:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k684D-000268-2K
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 07:54:29 +0000
X-Inumbo-ID: ea743536-b65a-4acd-bf17-95a527b6793a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea743536-b65a-4acd-bf17-95a527b6793a;
 Thu, 13 Aug 2020 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597305267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rGN7NkgwAEJ2ZoHEFH2PZFIIR5lqiIJQgzR9gZfV/kA=;
 b=b4lrKXGZjzApp+IYCcVaspaS0N8nfiYHA1uDkR9PBRxMhUoxstYewltn
 k3GdkIamjaQT3ek2w8KpYXLaiNMGPgpNH/nwJnGM6L/9QqNVU7qDxI7J2
 Ko0tNzWpQyuCuK+M0yolR+q//pJMc+oBMO9FZxhYgopb/d3NLfDEG5liS c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CGSiRuy2FL5NWfWVjPwjPdUkwaXeWvnbYbwr1LMb9ijYk9TC1E3fzgAdL3b7/HEUVoIhaFwOcY
 LldZ9H5V7RCULb3EzXbTcKv+9jW4Izfb8ohyOjU/Rzbis8IYyY2I6ssIynObdLwWN6SbOfCx+a
 J+d51tvpvZ93irUqTW2TmiQpr7YQ2OBIlh5tPB2LlNGJTF6MFbUVL4bf+wZdsLjH9FqpEy0zIH
 yEZJki2K7FUIF5I5QW6R0issxNrrro1Hc/n+2ZZLNoFohSszUpeW7S+QZzXY/xuUSGLmrLuv63
 nSQ=
X-SBRS: 2.7
X-MesageID: 25349268
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,307,1592884800"; d="scan'208";a="25349268"
Date: Thu, 13 Aug 2020 09:54:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@infradead.org>
CC: <linux-kernel@vger.kernel.org>, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Dan Carpenter <dan.carpenter@oracle.com>, Wei Liu <wl@xen.org>, "Yan
 Yankovskyi" <yyankovskyi@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <xen-devel@lists.xenproject.org>, <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>, Michal Hocko <mhocko@kernel.org>, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200813075420.GC975@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200813073337.GA16160@infradead.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
> On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
> > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > functionality untangles Xen balloon and RAM hotplug from the usage of
> > unpopulated physical memory ranges to map foreign pages, which is the
> > correct thing to do in order to avoid mappings of foreign pages depend
> > on memory hotplug.
> 
> So please just select ZONE_DEVICE if this is so much better rather
> than maintaining two variants.

We still need to other variant for Arm at least, so both need to be
maintained anyway, even if we force ZONE_DEVICE on x86.

Thanks, Roger.


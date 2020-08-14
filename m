Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486C244789
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 11:57:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6WS3-0004EA-0O; Fri, 14 Aug 2020 09:56:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCCI=BY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k6WS1-0004E5-Ro
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 09:56:41 +0000
X-Inumbo-ID: 04f13d06-eece-4014-83d2-106e55574347
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04f13d06-eece-4014-83d2-106e55574347;
 Fri, 14 Aug 2020 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597398999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M2heJ5UJIi6VeX83HdtsuKbDz3J1W8I/My2z+YBPJbc=;
 b=VMUPhAunCPJYS7U/d4AcTWAUNCTlkb+q/8skt/OUmXKQ4MaqEQAeVgXX
 BMInVCYqVOYrPRmN/H/+cbHAa9l6X4TmLr6fbLeMioVvrAo49N1rgzyyD
 Wym+QZ5mrVnxXlmY+vv1umCugWKy7RBV5iFubSq01LEZGm70YZ8432AjK o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LSUv+nx7tcMiKh/86la0ov2CD6bm0s6I0CZ/3c8oZ8SKd5FBsD9NTk6X+etvRWHGxjQoN4ifLc
 WZkEtigJTsHGqnWNv9UJ60WQsP5kEKf5sFfIOA6zvU9VIklNrxh92Vbu7Lw/zOteb+Zprr9bcz
 EDqmXPpuivFanGkQt/96ZKFaN0KdR0AoyWD2zxgECUj3l8VTghEId76fKUoi3SYFO8M2Otk1Pf
 CYzZj5rDqfvUJsn9+hgY+6CFXoxaN6UM05eSlIPALUijsytQzL+vRPNV5LDNkQ09XoNxVizA79
 cjQ=
X-SBRS: 2.7
X-MesageID: 24845878
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,311,1592884800"; d="scan'208";a="24845878"
Date: Fri, 14 Aug 2020 11:56:29 +0200
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
Message-ID: <20200814095629.GJ975@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
 <20200813075420.GC975@Air-de-Roger>
 <20200814072920.GA6126@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200814072920.GA6126@infradead.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 14, 2020 at 08:29:20AM +0100, Christoph Hellwig wrote:
> On Thu, Aug 13, 2020 at 09:54:20AM +0200, Roger Pau Monn?? wrote:
> > On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
> > > On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
> > > > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > > > functionality untangles Xen balloon and RAM hotplug from the usage of
> > > > unpopulated physical memory ranges to map foreign pages, which is the
> > > > correct thing to do in order to avoid mappings of foreign pages depend
> > > > on memory hotplug.
> > > 
> > > So please just select ZONE_DEVICE if this is so much better rather
> > > than maintaining two variants.
> > 
> > We still need to other variant for Arm at least, so both need to be
> > maintained anyway, even if we force ZONE_DEVICE on x86.
> 
> Well, it still really helps reproducability if you stick to one
> implementation of x86.
> 
> The alternative would be an explicit config option to opt into it,
> but just getting a different implementation based on a random
> kernel option is strange.

Would adding something like the chunk below to the patch be OK?

---8<---
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 018020b91baa..5f321a1319e6 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -328,7 +328,14 @@ config XEN_FRONT_PGDIR_SHBUF
 	tristate
 
 config XEN_UNPOPULATED_ALLOC
-	bool
-	default y if ZONE_DEVICE && !ARM && !ARM64
+	bool "Use unpopulated memory ranges for guest mappings"
+	depends on X86
+	select ZONE_DEVICE
+	default y
+	help
+	  Use unpopulated memory ranges in order to create mappings for guest
+	  memory regions, including grants maps and foreign pages. This avoids
+	  having to balloon out RAM regions in order to obtain physical memory
+	  space to create such mappings.
 
 endmenu



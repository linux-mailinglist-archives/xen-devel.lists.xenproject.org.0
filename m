Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ABA23104C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 18:59:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Sws-0001OH-FA; Tue, 28 Jul 2020 16:59:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWt7=BH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0Swr-0001OC-02
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 16:59:29 +0000
X-Inumbo-ID: b23958f7-d0f3-11ea-a91b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b23958f7-d0f3-11ea-a91b-12813bfff9fa;
 Tue, 28 Jul 2020 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595955569;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tRrG2kIPRmHZl5KYjBZDnpKOe+a1KAifCS6TcraQCvw=;
 b=bsvj2kZHsIsV/VdDQu9Ewf3LB7Ze6qu+aPDlb0qSu42JejEVQH7EPLQZ
 1InNm2Hr85rqkI/aHquXZhV3Sxou5DSCjiracnmcNbDJ/FPkGNiS7a5TU
 DICTBnGAviWnA380nELIgDpLk51v/BCsX+fwnMrimFeKzKFsLk+0sK2ev w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ek+XUNwRJ4Q5p4iyKzYjQH2lwOuZGVQ6Lx+zstg9NwpzzjRk2zB+v1/h9r6kuVVwRRNSCQGoXa
 D8++MW18YDeKCEmXhrvpH1ZyV0JbQvvIgpmIJERE5rrUKGp9cmDKMmPTr4piKhlvofOfDIfJYe
 2rK+680bc67sJoyZee3FTviqXiwfbr0qq0/CqTZ5Z0mVPLSMrngigHlxQVYUtTkhCySNVkupEs
 zSdbmNe7SgW5IpviGcOeDar3EuhU7jdXOS/8qypW3eFImgTAyx5Vym8iTQCHVMYS3dHYj3I2H8
 GeI=
X-SBRS: 2.7
X-MesageID: 23705708
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23705708"
Date: Tue, 28 Jul 2020 18:59:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
Message-ID: <20200728165919.GA7191@Air-de-Roger>
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
 <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 28, 2020 at 05:48:23PM +0100, Julien Grall wrote:
> Hi,
> 
> On 27/07/2020 10:13, Roger Pau Monne wrote:
> > To be used in order to create foreign mappings. This is based on the
> > ZONE_DEVICE facility which is used by persistent memory devices in
> > order to create struct pages and kernel virtual mappings for the IOMEM
> > areas of such devices. Note that on kernels without support for
> > ZONE_DEVICE Xen will fallback to use ballooned pages in order to
> > create foreign mappings.
> > 
> > The newly added helpers use the same parameters as the existing
> > {alloc/free}_xenballooned_pages functions, which allows for in-place
> > replacement of the callers. Once a memory region has been added to be
> > used as scratch mapping space it will no longer be released, and pages
> > returned are kept in a linked list. This allows to have a buffer of
> > pages and prevents resorting to frequent additions and removals of
> > regions.
> > 
> > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > functionality untangles Xen balloon and RAM hotplug from the usage of
> > unpopulated physical memory ranges to map foreign pages, which is the
> > correct thing to do in order to avoid mappings of foreign pages depend
> > on memory hotplug.
> I think this is going to break Dom0 on Arm if the kernel has been built with
> hotplug. This is because you may end up to re-use region that will be used
> for the 1:1 mapping of a foreign map.
> 
> Note that I don't know whether hotplug has been tested on Xen on Arm yet. So
> it might be possible to be already broken.
> 
> Meanwhile, my suggestion would be to make the use of hotplug in the balloon
> code conditional (maybe using CONFIG_ARM64 and CONFIG_ARM)?

Right, this feature (allocation of unpopulated memory separated from
the balloon driver) is currently gated on CONFIG_ZONE_DEVICE, which I
think could be used on Arm.

IMO the right solution seems to be to subtract the physical memory
regions that can be used for the identity mappings of foreign pages
(all RAM on the system AFAICT) from iomem_resource, as that would make
this and the memory hotplug done in the balloon driver safe?

Thanks, Roger.


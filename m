Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9869D24262D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 09:39:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5lLZ-0004Fd-Ur; Wed, 12 Aug 2020 07:38:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOR4=BW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5lLY-0004FY-Ee
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 07:38:52 +0000
X-Inumbo-ID: dac548f9-fe43-4fc6-a964-4157a88b6c7c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dac548f9-fe43-4fc6-a964-4157a88b6c7c;
 Wed, 12 Aug 2020 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597217931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ShS55PgjfRlFMa0DNNlsr2fNiXMtncLBQuylfP4nMGg=;
 b=YguUNolPD2jCAK+7MU0rvIJxQezvWSL2K6zqNjG38/AvlgCZ1IbO+XZd
 wULZOAPMXD2rZ+GM2PgPT5nJNo6M0tRxniuAMbf1TF6tQHNYCMVtvVnNQ
 7qblF+JEXTQXpRYMrol1iQVeSdWlpdLyMUcz1JX2nrWj2d1t/yiG9033O 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Zs2JsfV+aYnUe+nzG0vfzUdX+ziwoLc3xTEPPEd+NVtYmHmJw+DPYdtS53l1QsrvC/Zxz4eN0/
 A0/nYWVhhDhtycBIX5cmj7XnFzCd0Cbb9CH7NwXunAwDyHJJYQcc69T5BEuEcNMl8PWfoSXX+s
 P7nimTSw40cj4SIbcq/qPkr5JpUauoYCGPpqjzp636wYVroZhErGaj15aTi03BxPwveV7Lcj6n
 s5xgeyApZtCvlmTWosFQMCqnPUJNCVpRHE5Lz4/jbls9uJTBhbW/oNcnDDvw5BOIArvG6fykiH
 5D8=
X-SBRS: 2.7
X-MesageID: 25254199
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,303,1592884800"; d="scan'208";a="25254199"
Date: Wed, 12 Aug 2020 09:38:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200812073840.GA975@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <7c9a25fa-c52c-66d2-3b03-14a59e069ab6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c9a25fa-c52c-66d2-3b03-14a59e069ab6@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Daniel
 Vetter <daniel@ffwll.ch>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Aug 12, 2020 at 09:28:45AM +0200, Jürgen Groß wrote:
> On 11.08.20 11:44, Roger Pau Monne wrote:
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
> > 
> > Note the driver is currently not enabled on Arm platforms because it
> > would interfere with the identity mapping required on some platforms.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > Cc: Roger Pau Monne <roger.pau@citrix.com>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: Yan Yankovskyi <yyankovskyi@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: xen-devel@lists.xenproject.org
> > Cc: linux-mm@kvack.org
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Michal Hocko <mhocko@kernel.org>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > ---
> > Changes since v3:
> >   - Introduce a Kconfig option that gates the addition of the
> >     unpopulated alloc driver. This allows to easily disable it on Arm
> >     platforms.
> >   - Dropped Juergen RB due to the addition of the Kconfig option.
> >   - Switched from MEMORY_DEVICE_DEVDAX to MEMORY_DEVICE_GENERIC.
> > 
> > Changes since v2:
> >   - Drop BUILD_BUG_ON regarding PVMMU page sizes.
> >   - Use a SPDX license identifier.
> >   - Call fill with only the minimum required number of pages.
> >   - Include xen.h header in xen_drm_front_gem.c.
> >   - Use less generic function names.
> >   - Exit early from the init function if not a PV guest.
> >   - Don't use all caps for region name.
> > ---
> >   drivers/gpu/drm/xen/xen_drm_front_gem.c |   9 +-
> >   drivers/xen/Kconfig                     |   4 +
> >   drivers/xen/Makefile                    |   1 +
> >   drivers/xen/balloon.c                   |   4 +-
> >   drivers/xen/grant-table.c               |   4 +-
> >   drivers/xen/privcmd.c                   |   4 +-
> >   drivers/xen/unpopulated-alloc.c         | 185 ++++++++++++++++++++++++
> >   drivers/xen/xenbus/xenbus_client.c      |   6 +-
> >   drivers/xen/xlate_mmu.c                 |   4 +-
> >   include/xen/xen.h                       |   9 ++
> >   10 files changed, 215 insertions(+), 15 deletions(-)
> >   create mode 100644 drivers/xen/unpopulated-alloc.c
> > 
> > diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> > index 1d339ef92422..018020b91baa 100644
> > --- a/drivers/xen/Kconfig
> > +++ b/drivers/xen/Kconfig
> > @@ -327,4 +327,8 @@ config XEN_HAVE_VPMU
> >   config XEN_FRONT_PGDIR_SHBUF
> >   	tristate
> > +config XEN_UNPOPULATED_ALLOC
> > +	bool
> > +	default y if ZONE_DEVICE && !ARM && !ARM64
> 
> There is a current effort to enable Xen on RISC-V. Do we expect this
> option to be usable for this architecture?

It will depend on whether the Xen RISC-V implementation mandates an
IOMMU, for example Arm doesn't and hence uses an identity p2m for
dom0. If RISC-V does the same then I would assume this won't be
suitable as-is (not that it couldn't be made to work).

IMO it wasn't clear from the community call what was the RISC-V port
position regarding this, but IIRC the IOMMU spec for RISC-V was behind
the virtualization one, so it's likely that quite a lot of hardware
will have hardware virtualization support but no IOMMU, in which case
I think it's likely the RISC-V port will follow Arm and implement an
identity p2m.

> If yes, I'm fine with the
> exclusion of Arm, otherwise I'd opt for defaulting to yes only for
> X86.
> 
> Either way you can have my:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks. Feel free to change the 'ZONE_DEVICE && !ARM && !ARM64' to
'ZONE_DEVICE && X86' if you think it's safer.

Roger.


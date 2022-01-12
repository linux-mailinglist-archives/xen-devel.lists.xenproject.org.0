Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A648C91D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 18:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256770.440804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7h98-0003dG-Cj; Wed, 12 Jan 2022 17:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256770.440804; Wed, 12 Jan 2022 17:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7h98-0003b4-9c; Wed, 12 Jan 2022 17:10:50 +0000
Received: by outflank-mailman (input) for mailman id 256770;
 Wed, 12 Jan 2022 17:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=156W=R4=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n7h97-0003ay-AU
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 17:10:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 947f60c7-73ca-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 18:10:47 +0100 (CET)
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
X-Inumbo-ID: 947f60c7-73ca-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642007447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O0sshrZGxJgOofBB7Bmnk1/OC7PqJlJcZA7enCLN5dw=;
  b=YXoWyhqi95xGIAqDuI+Wads+oYSVd/Bbkp72N4+vjcEVrWCJTQepf+Dc
   rVI6wWmY3GSgAx6ps4R3CFs1Z2ZaVRHNkCZlW/r859WG0fkfxzGmVvfFo
   WrWe2A6kyxRu+MpiPthYI1ow+064wuMb5WxQ2UmpyOt98L1eBB19fqeL/
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PnzJMG+b1eddQz0NZlkQVk8VS5VS1C9mUEhkv17v7WaFxvY7mqOcoLRIfHo1oWMCny4MO65E2C
 qhX5WKNxAcrA4qjsgcNXmkRA/82EGPCUILOygnOm+IscUprSOgI+zOWwp03nm7EmiBOJGULRjR
 7HTVjCU9J7sLjUXuUcUfw1EtwAxkaKUPI8Hmhk/n9SQ/uu30CvMKRGnsJNRNETvbiXRmdjK2HW
 QysY1VKzc70tZYo8d+J/UUn7zTfV/ODia7fcpmvHW5JS7gKdYw6pl2/lp0wwtN//B6sRdi5AUf
 zSWjppHRyvYYEkWfB76tLQ9t
X-SBRS: 5.2
X-MesageID: 62255310
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:u7vvM6uVsR0GibZ9z5UrP25nvufnVKVZMUV32f8akzHdYApBsoF/q
 tZmKTyCOveCYGP3cookOoXn9hgAu8XSytY3HQttrSo9RiMa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx2ILhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrpGSSCszB/b1tv0gCjBYOnxdN49W0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AP
 ZBENGE2NHwsZTVfZG0ZEpNkkN6MxUOleGJ0k3fFhYYotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMVLtuE0hKe72mhwOTImEvTWogfCbm5/f5Cm0CIyyoYDxh+fVmyp/Wjm1O9c91aI
 k0QvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWORFCc2q2t9gqcIBVMBG8rOAwObxsstoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNs1shDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGGN6bKMN8N4n9hIx5JFVdoBiN2ZDB04WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMoMfOMYvJFfYp3AGiausM4bFyhlEfUYXY
 8bzTCpRJSxCVfQPIMSeGo/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjPHW/2dNNfDgicChqbbir+pc/XrPSfWJb9JQJVqW5LUUJIdI1xsy4V47go
 xmAZ6Ov4AGu2i2cd1TbMyALhXGGdc8XkE/X9BcEZT6As0XPq672hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:69f2cqN6bXnFMMBcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,282,1635220800"; 
   d="scan'208";a="62255310"
Date: Wed, 12 Jan 2022 17:10:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] libxl/PCI: Fix PV hotplug & stubdom coldplug
Message-ID: <Yd8LjA/bO12E19NU@perard>
References: <20220109180436.4112-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220109180436.4112-1-jandryuk@gmail.com>

On Sun, Jan 09, 2022 at 01:04:36PM -0500, Jason Andryuk wrote:
> commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> reflected in the config" broken PCI hotplug (xl pci-attach) for PV
> domains when it moved libxl__create_pci_backend() later in the function.
> 
> This also broke HVM + stubdom PCI passthrough coldplug.  For that, the
> PCI devices are hotplugged to a running PV stubdom, and then the QEMU
> QMP device_add commands are made to QEMU inside the stubdom.
> 
> Are running PV domain calls libxl__wait_for_backend().  With the current
> placement of libxl__create_pci_backend(), the path does not exist and
> the call immediately fails:
> libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
> libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
> libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
> 
> The wait is only relevant when the backend is already present.  num_devs
> is already used to determine if the backend needs to be created.  Re-use
> num_devs to determine if the backend wait is necessary.  The wait is
> necessary to avoid racing with another PCI attachment reconfiguring the
> front/back or changing to some other state like closing. If we are
> creating the backend, then we don't have to worry about the state since
> it is being created.
> 
> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
> reflected in the config")
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Alternative to Jan's patch:
> https://lore.kernel.org/xen-devel/5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com/
> 
> v3:
> Change title & commit message
> 
> v2:
> https://lore.kernel.org/xen-devel/20210812005700.3159-1-jandryuk@gmail.com/
> Add Fixes
> Expand num_devs use in commit message
> ---
>  tools/libs/light/libxl_pci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 4c2d7aeefb..e8fd3bd937 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -157,8 +157,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
>      if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
>          return ERROR_FAIL;
>  
> -    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> -        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
> +    /* wait is only needed if the backend already exists (num_devs != NULL) */
> +    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {

It's kind of weird to check whether the "num_devs" key is present or
not, but I guess that kind of work.

> +        if (libxl__wait_for_backend(gc, be_path,
> +                                    GCSPRINTF("%d", XenbusStateConnected)) < 0)

So there is something in the coding style document, in "error handling",
about how to write this condition.
Could you store the return value of libxl__wait_for_backend() into "rc"
(because it's a libxl function), then check it and return it?

    if (rc) return rc;

Thanks,

-- 
Anthony PERARD


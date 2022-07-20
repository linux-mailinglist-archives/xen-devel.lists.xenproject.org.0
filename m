Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9390457BB0D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 18:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372005.603815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oECAz-0001PS-NJ; Wed, 20 Jul 2022 16:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372005.603815; Wed, 20 Jul 2022 16:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oECAz-0001NU-KD; Wed, 20 Jul 2022 16:03:53 +0000
Received: by outflank-mailman (input) for mailman id 372005;
 Wed, 20 Jul 2022 16:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgt+=XZ=citrix.com=prvs=193804040=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oECAy-0001N8-Hm
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 16:03:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b0f6901-0845-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 18:03:51 +0200 (CEST)
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
X-Inumbo-ID: 8b0f6901-0845-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658333031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iyL2gP3DD/Oi9RpeIZmLJLel87QLp/1xugjUaTuMWtI=;
  b=enJNAPoIaDhzQimOeUARhvcaW1x2x8HTPORyEQ9sz02yNZUJS258loPa
   49w1pbmpb5tLpz7GBDB2XmqluMZc047bVa8QWPfvvBLegxR2440f/vQww
   cjI1HVilT3TNVj9xcC3knbCq61HSPY1hkBKV8J3kTDLdeExMq6N0FvPX9
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 75536602
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mtUm06B889WhGRVW/73jw5YqxClBgxIJ4kV8jS/XYbTApG4i1WQGz
 DAbWD3QbKyKYGD8KN9wPoWz/UkDvJODxoMxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pe31GONgWYuaDpLsfrb8XuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJWyvsnftgM1MQBKIz4PR9X01l9
 MwjAglYO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fvDWOl1IviOKF3Nz9QOCheNoLzmCim
 mvi51/TEE44CISyxm/Qmp6rrrCWxn6qMG4IL5Wj7eJjilCXwm0VCTUVWEG9rP3/jVSxM/pdJ
 FYT4TEGtrUp+QqgSdyVdx+lpH+JuDYMVtwWFPc1gCmHx7DI+Q+fCi4BRyRYdd09nMYsQHoh0
 Vrht+3uATtjobiEU0W3/72frS6xESUNJGpEbigBJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7pckP2qag4UHcgxqjo5HISkg+4QC/dmWh4wBibYipfbu0+EPb5vZNKoWeZlSZt
 X1CkM+bhMgUCoqHjiuKQ+MlE7Sg5vLDOzrZ6XZwG7Ex+jLr/GSsFb28+xkneh0vaJxdP2a0P
 gmD4mu9+aO/IlP6bfF5bb2jLf0F5rLyH4rJffHkVfB3N80ZmBC8wM1+WaKB9zmzzRh2yPtuZ
 c7zndWEVihDV/k+pNaib6JEiOJwmHhjrY/GbcqjpylLx4Zyc5J8pV0tFFKVJt4046qfyOk+2
 4YObpDao/mzvQCXX8U2zWLwBQpTRZTDLcqqw/G7j8baSuacJEkvCuXK3ZQqcJF/kqJem4/gp
 y/gChUFlQqn2CCbeW1mj0yPj5u2B/5CQY8TZ3RwbT5EJVB4CWpQ0EvvX8RuJuR2nACS5fV1U
 +MEa629Pxi7cRyeomx1RcSs8+RfmOGD313m09yNPGdiJPaNhmXhprfZQ+cY3HJQVHTv6ZRk/
 eHIO8GyacNrejmOxf3+MJqHp25dd1BE8A6udyMk+uVuRXg=
IronPort-HdrOrdr: A9a23:cF26XqnybPj3lkY5XDgeYPbnk+DpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.92,286,1650945600"; 
   d="scan'208";a="75536602"
Date: Wed, 20 Jul 2022 17:03:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V11.1 1/3] libxl: Add support for Virtio disk
 configuration
Message-ID: <YtgnVeDwkQdFmM+v@perard.uk.xensource.com>
References: <540d44a5-6966-a9d7-4e62-63ae845c6f62@epam.com>
 <20220716163745.28712-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220716163745.28712-1-olekstysh@gmail.com>

On Sat, Jul 16, 2022 at 07:37:45PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds basic support for configuring and assisting virtio-mmio
> based virtio-disk backend (emulator) which is intended to run out of
> Qemu and could be run in any domain.
> Although the Virtio block device is quite different from traditional
> Xen PV block device (vbd) from the toolstack's point of view:
>  - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>    written to Xenstore are fetched by the frontend currently ("vdev"
>    is not passed to the frontend). But this might need to be revised
>    in future, so frontend data might be written to Xenstore in order to
>    support hotplugging virtio devices or passing the backend domain id
>    on arch where the device-tree is not available.
>  - the ring-ref/event-channel are not used for the backend<->frontend
>    communication, the proposed IPC for Virtio is IOREQ/DM
> it is still a "block device" and ought to be integrated in existing
> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
> logic to deal with Virtio devices as well.
> 
> For the immediate purpose and an ability to extend that support for
> other use-cases in future (Qemu, virtio-pci, etc) perform the following
> actions:
> - Add new disk backend type (LIBXL_DISK_BACKEND_STANDALONE) and reflect
>   that in the configuration
> - Introduce new disk "specification" and "transport" fields to struct
>   libxl_device_disk. Both are written to the Xenstore. The transport
>   field is only used for the specification "virtio" and it assumes
>   only "mmio" value for now.
> - Introduce new "specification" option with "xen" communication
>   protocol being default value.
> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>   one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
> 
> An example of domain configuration for Virtio disk:
> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=standalone, specification=virtio']
> 
> Nothing has changed for default Xen disk configuration.
> 
> Please note, this patch is not enough for virtio-disk to work
> on Xen (Arm), as for every Virtio device (including disk) we need
> to allocate Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree. The subsequent
> patch will add these missing bits. For the current patch,
> the default "irq" and "base" are just written to the Xenstore.
> This is not an ideal splitting, but this way we avoid breaking
> the bisectability.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


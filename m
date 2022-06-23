Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C97C5577CC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 12:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354804.582101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4K0l-0001mn-Vf; Thu, 23 Jun 2022 10:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354804.582101; Thu, 23 Jun 2022 10:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4K0l-0001kd-Ss; Thu, 23 Jun 2022 10:24:31 +0000
Received: by outflank-mailman (input) for mailman id 354804;
 Thu, 23 Jun 2022 10:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Gc7=W6=citrix.com=prvs=166b7d494=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4K0k-0001kW-7G
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 10:24:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8cb4dad-f2de-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 12:24:28 +0200 (CEST)
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
X-Inumbo-ID: a8cb4dad-f2de-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655979868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M8DEYtK+frEuMn0/9L9yy1S4jux0ULsimUgf7YNcTVc=;
  b=AatnuYNiC6tu45f63EEm91DosU37ygrChYRfRiRVfNHVZOdYRgrJGUZ2
   FxHVChdpBuFZAOOfcMKI4WTCam/PejJ0e1B+vCXGZ/duPfXEP/FKLfxwu
   W5ooV/eubDRemRynzuG5rBl+2S7GqWqamRwjaTJ14I+hOLFQp/jwQSvAF
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74264350
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jo2VLaPjc58q7W3vrR1el8FynXyQoLVcMsEvi/4bfWQNrUp0hGQFz
 zdLCzzSM6zZNmGhL9xzaIm38E0P65fTzIU2TQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZn2NQw3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 oRg74aLewkTN7TdieIneBVBFg9fIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRQayAO
 5FEMVKDajz+bxYWYEo+E6gHp9bwpEn5ajcJjHeK8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2nCjnOjUhgvgRZkfUra/85ZCgkCXx2EVIA0bUx28u/bRokSzQc5FI
 koYvC8nt7Ev9VeDR8P4GRa/pRasgBkYXNZBFvwg3yuEwKHU/gWxC3ANS3hKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqYisJThAZ8sLjiI42hxPLCN1kFcadidn4Gir5x
 TyQmzQvnLUYjcMN1KKT8EjOhnSnoZ2hZhQy/Q/NWWWm6Ct2YYekY8qj7l2zxelEBJaUSB+Gp
 ndspiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqQQ+MsM7zAajwXe6bJFW2hpyPUJHE9lRLFcFf
 3TvVRNtCI57ZSX3MP8qO9PhVazG3oC7S427C6m8gs5mJ8EoKVTZpHwGiVu4hTiFraQ6rU0o1
 X53m+6IBG1SN6loxSHeqww1ge5ynXBWKY8+qPnGI/WbPVm2Pif9pU8tagfmUwzAxPrsTP/p2
 9heLdCW7B5UTffzZCLamaZKcw1XfCJhVc+r9JcJHgJmHuaBMDh5Y8I9PJt7I9A190irvr2gE
 o6Btr9wlwOk2CyvxfSiYXF/crL/NatCQYYAFXV0Zz6AgiF7Ca72tft3X8ZnLNEPqb04pdYpH
 qZtRil1KqkWItgx029GNseVQU0LXEnDuD9iyAL+OmllLsU+GlKhFx2NVlKHyRTixxGf7aMWy
 4BMHCuBKXbfb2yO1PrrVc8=
IronPort-HdrOrdr: A9a23:/IhY7a2cvybWOYc/jyC9bQqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74264350"
Date: Thu, 23 Jun 2022 11:24:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V10.1 1/3] libxl: Add support for Virtio disk
 configuration
Message-ID: <YrQ/VrfzScUVK+PK@perard.uk.xensource.com>
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1655482471-16850-1-git-send-email-olekstysh@gmail.com>

On Fri, Jun 17, 2022 at 07:14:31PM +0300, Oleksandr Tyshchenko wrote:
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
> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
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
> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, specification=virtio']
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
> ---
> Changes V10 -> V10.1:
>    - fix small coding style issue in libxl__device_disk_get_path()
>    - drop specification check in main_blockattach() and add
>      required check in libxl__device_disk_setdefault()
>    - update specification check in main_blockdetach()

For this v10.1: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

BTW, the subject of this updated patch still state "v10" instead of
"v10.1", hopefully committers can pick the right version.

Cheers,

-- 
Anthony PERARD


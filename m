Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AFC54F92E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 16:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351469.578108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Cz1-00056P-0n; Fri, 17 Jun 2022 14:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351469.578108; Fri, 17 Jun 2022 14:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2Cz0-00054U-TP; Fri, 17 Jun 2022 14:29:58 +0000
Received: by outflank-mailman (input) for mailman id 351469;
 Fri, 17 Jun 2022 14:29:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rI7C=WY=citrix.com=prvs=160677330=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o2Cyz-00054O-Lo
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 14:29:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3ea4531-ee49-11ec-b725-ed86ccbb4733;
 Fri, 17 Jun 2022 16:29:55 +0200 (CEST)
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
X-Inumbo-ID: f3ea4531-ee49-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655476195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JjLicrjVGNyROkNVZSvGbe9mLPpNbmx/1XVj1eSpmWs=;
  b=bK8+4rvlYWCbw9Nluv2O/LiMyn2pdLba6t/vBPhwYGW/xRcT6w7UJ5Vu
   qW7//Iq3LtdHTRDB2UjBNELBOfxAUzMgn6eCbClPhdcTrFmSfTX0sLKEI
   AOm4TJJw6YggpgVqvs30PiHNicxKKGtGU01wTphGxUvR1xzBTsOAVHJqA
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73706981
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jiiUS6L4kQ9fjtkMFE+RKpUlxSXFcZb7ZxGr2PjKsXjdYENShDxWm
 zAXXTiGPPmCNjGje9klPI+38E4DucfcmNQ1GVNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3Nc22YTR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M9Ev5qgahUxBZ/vhcAkYiJZDyA9A6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQq2BP
 5RIOWMHgBLoQgdgMA9PNawCsb2CoHjnagZjomi2qv9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlquifXIhjjTQ58JGfuz8fsCqF+Owm0eDjUGWF39puO24ma0VshDM
 UUS9mwrpLIr6U2wZtDnWluzp3vsliAbX91cAugr8janw6Df4xuaLmUcRzsHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTSgAQAge/8j4oKk8ixvOSpBoF6vdptrxFDLry
 jaGth8ilq4Ths4G0aa81V3fijfqrZ/MJiYv4R7dRGWi7QVRa4usZoju4l/ehd5fKK6JQ1/Hu
 2IL8/Vy98hXU8vLznbUBrxQQvf5vJ5pLQEwn3Z1FpMn5xe/40WRXp102QBFJVtocfgLLGqBj
 FDohe9B2HNCFCL0MPIrONrrU5lCIbvIToq8CK2NBjZaSt0oLVLconkzDaKF9zq1+HXAh53TL
 ntynSyEKX8BQZpqwzOtLwv2+e96n3turY8/qH2S8vhG7VZ9TCTMIVv9GAHSBt3VFYvdyOkvz
 /5RNtGR1zJUW/Dkby/c/OY7dA5XcCRjWcyr85UKLIZvxzaK/0lwY8I9PJt7I9A190irvrygE
 o6Btr9wlwOk2CyvxfSiYXF/crL/NatCQYYAFXV0Zz6AgiF7Ca72tft3X8ZnLNEPqb04pdYpH
 qZtRil1KqkWItgx029GNseVQU0LXEnDuD9iyAL/MGdjJ8I5H1aTkjImFyO2nBQz4uOMnZNWi
 9WdOsnzHPLvmywK4B7qVc+S
IronPort-HdrOrdr: A9a23:IDmbjaDLfpjixI7lHemq55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG+85rsiMc6QxhPU3I9ursBEDtex/hHNtOkO8s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkGNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; 
   d="scan'208";a="73706981"
Date: Fri, 17 Jun 2022 15:29:25 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Message-ID: <YqyPxd9yNvfd5idJ@perard.uk.xensource.com>
References: <1655143522-14356-1-git-send-email-olekstysh@gmail.com>
 <1655143522-14356-2-git-send-email-olekstysh@gmail.com>
 <YqnrerEAFXJUCRL1@perard.uk.xensource.com>
 <21798651-1254-0c17-5379-224b52a92566@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21798651-1254-0c17-5379-224b52a92566@gmail.com>

On Wed, Jun 15, 2022 at 07:32:54PM +0300, Oleksandr wrote:
> On 15.06.22 17:23, Anthony PERARD wrote:
> > On Mon, Jun 13, 2022 at 09:05:20PM +0300, Oleksandr Tyshchenko wrote:
> > > diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
> > > index 70eed43..f2b0ff5 100644
> > > --- a/tools/xl/xl_block.c
> > > +++ b/tools/xl/xl_block.c
> > > @@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
> > >           return 0;
> > >       }
> > > +    if (disk.specification != LIBXL_DISK_SPECIFICATION_XEN) {
> > > +        fprintf(stderr, "block-attach is only supported for specification xen\n");
> > This check prevents a previously working `block-attach` command line
> > from working.
> > 
> >      # xl -Tvvv block-attach 0 /dev/vg/guest_disk,raw,hda
> >      block-attach is only supported for specification xen
> > 
> > At least, that works by adding ",specification=xen", but it should work
> > without it as "xen" is the default (from the man page).
> 
> yes, you are right. thank you for pointing this out.
> 
> 
> > 
> > Maybe the check is done too soon, or maybe a better place to do it would
> > be in libxl.
> > 
> > libxl__device_disk_setdefault() is called much later, while executing
> > libxl_device_disk_add(), so `xl` can't use the default been done there
> > to "disk.specification".
> 
> I got it.
> 
> 
> > 
> > `xl block-attach` calls libxl_device_disk_add() which I think is only
> > called for hotplug of disk. If I recall correctly, libxl__add_disks() is
> > called instead at guest creation. So maybe it is possible to do
> > something in libxl_device_disk_add(), but that a function defined by a
> > macro, and the macro is using the same libxl__device_disk_add() that
> > libxl_device_disk_add(). On the other hand, there is a "hotplug"
> > parameter to libxl__device_disk_setdefault(), maybe that could be use?
> 
> Thank you for digging into the details here.
> 
> If I understood correctly your suggestion we simply can drop checks in
> main_blockattach() (and likely main_blockdetach() ?) and add it to
> libxl__device_disk_setdefault().
> 
> 
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> index 9e82adb..96ace09 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -182,6 +182,11 @@ static int libxl__device_disk_setdefault(libxl__gc *gc,
> uint32_t domid,
>          disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
>      }
> 
> +    if (hotplug && disk->specification != LIBXL_DISK_SPECIFICATION_XEN) {
> +        LOGD(ERROR, domid, "Hotplug is only supported for specification
> xen");

Maybe check for `specification == VIRTIO` instead, and report that
hotplug isn't supported in virtio's case.

> +        return ERROR_FAIL;
> +    }
> +
>      /* Force Qdisk backend for CDROM devices of guests with a device model.
> */
>      if (disk->is_cdrom != 0 &&
>          libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
> 
> 
> Is my understanding correct?

Yes, that looks correct.

But I didn't look at the block-detach, and it seems that this part only
use generic functions to remove a disk. So there is no easy way to
prevent hotunplug from libxl. But `xl` does have access to a fully
initialised "disk" so can check the value of "specification", I guess
the check can stay in main_blockdetach().

Cheers,

-- 
Anthony PERARD


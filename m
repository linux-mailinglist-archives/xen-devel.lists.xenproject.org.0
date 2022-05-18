Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458D852B821
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331987.555628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHIF-0007MX-LX; Wed, 18 May 2022 10:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331987.555628; Wed, 18 May 2022 10:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHIF-0007Kl-H8; Wed, 18 May 2022 10:52:39 +0000
Received: by outflank-mailman (input) for mailman id 331987;
 Wed, 18 May 2022 10:52:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTh1=V2=citrix.com=prvs=130776dd6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nrHID-0007KU-Lk
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:52:37 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eabc12b-d698-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 12:52:34 +0200 (CEST)
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
X-Inumbo-ID: 9eabc12b-d698-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652871154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LOEEKV17fhboUoAHAlroS7b3W8TzEVY99C1J1TrtWps=;
  b=EQ2GJ5egLKLyFLk+fDFj1cv6UsTgEgU3x68KGp39l2DbsQH4F0uKKu6U
   ia+LkDNBA8Ch3mEdQzhzjY5ZaLcmSRhC6YMO7x/7I9vTfAYcAlprfd5Ll
   KMA1pJGoGH0tzT1x5HN37wbzpcVBjfPQPOQiyKXiaidglAXNzSwCLmh43
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70956091
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nSgNyaBXhTj2DRVW/7Xjw5YqxClBgxIJ4kV8jS/XYbTApD1whjYFz
 WYfCG7TPa6LZWqme95/PY/j8x4AvpOEmNZhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhcz
 NYSm4yzZj11ZI3ChLQGfwBaDSpHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8WTKuAP
 5tAAdZpREzvPCcfYFYlM8IZsMqkmnvkcQdR803A8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt8H22gfTUtTjmQ49UH7q9ntZonVmSy2o7GBAQE1yhrpGRgEOkR8hWL
 UBS/yM0tLUz72SiVNy7VBq9yFa6uRobV8tVAvcNwgiHwarJ4C6UHmEBCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcFYSIHVhcU+NnLr4Q6jxaJRdFmeIayitD2Ajj2z
 yq9sDklh74TgMgI0I225VnCxTmro/DhVAku7B/QWWGjxgx8bY+hIYev7DDz8vJoPIufCF6bs
 xA5d9O2tb5US8vXzWrUHbtLTOrBC+u53CP0rFpsQLcx9BuXpySDc5wA+x1nJlliC5NREdP2W
 3P7tQRU7Z5VGXKla65rfo68Y/gXIbjc+cfNDa6NMIcXCnRlXErepXw1OxbMt4z4uBJ0+ZzTL
 6t3ZipF4ZwyLa18hAS7SO4GuVPA7nBvnDiDLXwXIvnO7FZ/WJJ3YepcWLdtRrpghE9hnOky2
 48GX/ZmMz0FDIXDjtD/qOb/12wiI3khHozRoMdKbOOFKQcOMDh/VqWBmOl9JtU7xPw9egL0E
 paVAx8w9bYCrSefdVXiho5LNtsDoqqTXVpkZHdxbD5EKlAoYJq17bd3SnfEVeJPyQCX9tYtF
 6NtU5zZWpxnE22bkxxAPciVhNEzL3yD2FPRVxdJlRBiJvaMsSSSoYS6FuYunQFTZheKWTwW+
 OP8h1uGG8taHmyPzq/+MZqS8r94hlBF8MoaYqcCCoM7lJnEmGSyFxHMsw==
IronPort-HdrOrdr: A9a23:LvUqKqsPxoOZyB7u9A1vEV4D7skC+IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H4BEDyewKlyXcV2/hYAV7MZniChILFFu9fBM7Zslvd8k7Fh6VgPM
 VbAsxD4bTLZDAX4voSojPIdOrIq+PmzEncv5a9854bd3AIV0gP1WZEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue72a7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhiM0llWjoKi+quGRi+erN/b8yvT97Q+cyTpAUb4RFYFqegpF4t1Hpmxa1e
 Uk6C1QRPibo0mhBF1d5yGdkTUImQxelkPK2BuVnGCLm72IeBsqT8VGno5XaR3f9g4pu8x9yr
 tC2yaDu4NQFg6oplWL2zHkbWAeqqOPmwtXrQfTtQ0vbaIOLLtK6YAP9kJcF5kNWCr89YA8Ce
 FrSMXR/uxff1+WZ23Q+jAH+q3kYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdq5oiLZNRMkLar8VPpZ2feKnTmjWBR7cOmObJlrqUKkBJnLWspbypK444em7EaZ4vqfaWK
 6xI2+wmVRCBH4GU/f+oKGj2iq9PlmAYQ==
X-IronPort-AV: E=Sophos;i="5.91,234,1647316800"; 
   d="scan'208";a="70956091"
Date: Wed, 18 May 2022 11:52:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V8 1/2] libxl: Add support for Virtio disk configuration
Message-ID: <YoTP44zc9jzGGYJf@perard.uk.xensource.com>
References: <1651598763-12162-1-git-send-email-olekstysh@gmail.com>
 <1651598763-12162-2-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1651598763-12162-2-git-send-email-olekstysh@gmail.com>

On Tue, May 03, 2022 at 08:26:02PM +0300, Oleksandr Tyshchenko wrote:
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

Is this still an issue? Since v5, the "disk/vbd" kind is used. Also see
my comment about libxl_device_disk_get_path() regarding this.


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
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> index a5ca778..7fd98ce 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -163,6 +163,19 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
>      rc = libxl__resolve_domid(gc, disk->backend_domname, &disk->backend_domid);
>      if (rc < 0) return rc;
>  
> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_UNKNOWN)
> +        disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
> +
> +    /*
> +     * The transport field is only used for the specification "virtio" and
> +     * it assumes only "mmio" value for now. When there will be a need to add
> +     * "pci" support, we will need to remove the enforcement here and
> +     * respective assert(s) down the code and let the toolstack to decide
> +     * the transport to use.
> +     */
> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
> +        disk->transport = LIBXL_DISK_TRANSPORT_MMIO;

Could you check that `disk->transport` is unset when
`specification==xen` ? And probably return ERROR_INVAL in this case.

Also, I don't think you should overwrite the value set by an application
in _setdefault(). If `specification==virtio`, check first that
`transport` as a supported value (unknown or mmio) then you can then you
can set the `transport` value expected by virtio if it wasn't set by the
application. ( An example of this is done the function already when
enforcing qdisk for cdroms. )

> +
>      /* Force Qdisk backend for CDROM devices of guests with a device model. */
>      if (disk->is_cdrom != 0 &&
>          libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
> @@ -317,6 +334,11 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
>              goto out;
>          }
>  
> +        assert((disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO &&
> +                disk->backend == LIBXL_DISK_BACKEND_OTHER) ||
> +               (disk->specification != LIBXL_DISK_SPECIFICATION_VIRTIO &&
> +                disk->backend != LIBXL_DISK_BACKEND_OTHER));

I'm not sure whether this assert() is useful. The value should already
be correct as we call _setdefault(). It seems like an unnecessary
potential crash at this point.

>          switch (disk->backend) {
>              case LIBXL_DISK_BACKEND_PHY:
>                  dev = disk->pdev_path;
> @@ -330,7 +352,14 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
>  
>                  assert(device->backend_kind == LIBXL__DEVICE_KIND_VBD);
>                  break;
> +            case LIBXL_DISK_BACKEND_OTHER:
> +                dev = disk->pdev_path;
> +
> +                flexarray_append(back, "params");
> +                flexarray_append(back, dev);
>  
> +                assert(device->backend_kind == LIBXL__DEVICE_KIND_VIRTIO_DISK);
> +                break;
>              case LIBXL_DISK_BACKEND_TAP:
>                  LOG(ERROR, "blktap is not supported");
>                  rc = ERROR_FAIL;
> @@ -386,6 +415,15 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
>          flexarray_append_pair(back, "discard-enable",
>                                libxl_defbool_val(disk->discard_enable) ?
>                                "1" : "0");
> +        flexarray_append(back, "specification");
> +        flexarray_append(back, libxl__device_disk_string_of_specification(disk->specification));
> +        if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> +            assert(disk->transport == LIBXL_DISK_TRANSPORT_MMIO);

I don't think this is a good assert(). If an application sets the wrong
"transport" for virtio, it should get an error, not crash. But I believe
in this case that _setdefault() could already check that "transport" is
correct, so there's probably no need to check the transport value here.

> +            flexarray_append(back, "transport");
> +            flexarray_append(back, libxl__device_disk_string_of_transport(disk->transport));
> +            flexarray_append_pair(back, "base", GCSPRINTF("%"PRIu64, disk->base));
> +            flexarray_append_pair(back, "irq", GCSPRINTF("%u", disk->irq));
> +        }
>  
>          flexarray_append(front, "backend-id");
>          flexarray_append(front, GCSPRINTF("%d", disk->backend_domid));
> @@ -532,6 +570,49 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
>      }
>      libxl_string_to_backend(ctx, tmp, &(disk->backend));
>  
> +    tmp = libxl__xs_read(gc, XBT_NULL,
> +                         GCSPRINTF("%s/specification", libxl_path));
> +    if (!tmp) {
> +        LOG(ERROR, "Missing xenstore node %s/specification", libxl_path);

This mean that we introduce an hard error if we deal with a previous
version of libxl that didn't write this path. But we know that it meant
specification=xen, so could we default to "xen" when the node is
missing, rather than return an error? (It's mostly useful for developper
at this point as creating a vm with one version of libxl and keep
managing it with a newer version isn't really possible for now.)

> +        goto cleanup;
> +    }
> +    if (!strcmp(tmp, "xen"))
> +        disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
> +    else if (!strcmp(tmp, "virtio"))
> +        disk->specification = LIBXL_DISK_SPECIFICATION_VIRTIO;
> +    else
> +        disk->specification = LIBXL_DISK_SPECIFICATION_UNKNOWN;

That's a reimplementation of a generated function,
libxl_disk_specification_from_string() I believe ;-)

> +
> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> +        tmp = libxl__xs_read(gc, XBT_NULL,
> +                             GCSPRINTF("%s/transport", libxl_path));
> +        if (!tmp) {
> +            LOG(ERROR, "Missing xenstore node %s/transport", libxl_path);
> +            goto cleanup;
> +        }
> +        if (!strcmp(tmp, "mmio"))
> +            disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
> +        else
> +            disk->transport = LIBXL_DISK_TRANSPORT_UNKNOWN;

That's libxl_disk_transport_from_string() I think.

> +        assert(disk->transport == LIBXL_DISK_TRANSPORT_MMIO);

Could you return an error instead of assert() here?

> +
> +        tmp = libxl__xs_read(gc, XBT_NULL,
> +                             GCSPRINTF("%s/base", libxl_path));
> +        if (!tmp) {
> +            LOG(ERROR, "Missing xenstore node %s/base", libxl_path);
> +            goto cleanup;
> +        }
> +        disk->base = strtoul(tmp, NULL, 10);
> +
> +        tmp = libxl__xs_read(gc, XBT_NULL,
> +                             GCSPRINTF("%s/irq", libxl_path));
> +        if (!tmp) {
> +            LOG(ERROR, "Missing xenstore node %s/irq", libxl_path);
> +            goto cleanup;
> +        }
> +        disk->irq = strtoul(tmp, NULL, 10);
> +    }
> +
>      disk->vdev = xs_read(ctx->xsh, XBT_NULL,
>                           GCSPRINTF("%s/dev", libxl_path), &len);
>      if (!disk->vdev) {
> @@ -575,6 +656,41 @@ cleanup:
>      return rc;
>  }
>  
> +static int libxl_device_disk_get_path(libxl__gc *gc, uint32_t domid,

FYI, "libxl_" prefix is for functions exported by the library. You could
use "libxl__" for functions used within the library or no prefix in this
case as it is static.

> +                                      char **path)
> +{
> +    const char *dir;
> +    int rc;
> +
> +    /*
> +     * As we don't know exactly what device kind to be used here, guess it
> +     * by checking the presence of the corresponding path in Xenstore.
> +     * First, try to read path for vbd device (default) and if not exists
> +     * read path for virtio_disk device. This will work as long as both Xen PV
> +     * and Virtio disk devices are not assigned to the same guest.
> +     */

That mean, we can't have both virtio-disk and pv-disk, and there's going
to be weird error with device disappearing if one try to add a pv-disk
after adding a virtio-disk.

Also, I don't know whether the function is called before a first device
is added, but it could be a potential issue as it would return an error
in that case.

The path generated here are path that are only used by libxl, so it
probably doesn't matter which path is used, as long as there's a unique
path for a device implementation. (The different path might have been
useful in v4 of the series when there was a libxl-virtio-disk
implementation.)

So, is there a reason to have different path? Can we simply get rid of
this function?

Maybe this is related to the path that a frontend would see, and we
probably don't want to have a pv-disk front-end trying to connect to a
virtio backend as it doesn't going to work. I wonder if the
"/libxl/*/device/" needs to use the same "device kind" name as the ones
seen by a guest. I didn't investigated that.

> +    *path = GCSPRINTF("%s/device/%s",
> +                      libxl__xs_libxl_path(gc, domid),
> +                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VBD));
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
> +    if (rc)
> +        return rc;
> +
> +    if (dir)
> +        return 0;
> +
> +    *path = GCSPRINTF("%s/device/%s",
> +                      libxl__xs_libxl_path(gc, domid),
> +                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
> +    if (rc)
> +        return rc;
> +
> +    return 0;
> +}
> +
>  int libxl_vdev_to_device_disk(libxl_ctx *ctx, uint32_t domid,
>                                const char *vdev, libxl_device_disk *disk)
>  {
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 2a42da2..f783cac 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -704,6 +716,10 @@ libxl_device_disk = Struct("device_disk", [
>      ("is_cdrom", integer),
>      ("direct_io_safe", bool),
>      ("discard_enable", libxl_defbool),
> +    ("specification", libxl_disk_specification),
> +    ("transport", libxl_disk_transport),

Could you add a comment here about "irq" and "base", that say that they
are for internal use by libxl and can't be modified? Is it possible
that in the future, an application like libvirt could potentially change
those two values and have libxl use them?

> +    ("irq", uint32),
> +    ("base", uint64),
>      # Note that the COLO configuration settings should be considered unstable.
>      # They may change incompatibly in future versions of Xen.
>      ("colo_enable", libxl_defbool),

Thanks,

-- 
Anthony PERARD


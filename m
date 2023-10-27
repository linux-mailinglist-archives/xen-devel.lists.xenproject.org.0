Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8E7D8FDC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624257.972668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHIi-0007xR-MG; Fri, 27 Oct 2023 07:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624257.972668; Fri, 27 Oct 2023 07:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHIi-0007vT-JZ; Fri, 27 Oct 2023 07:30:36 +0000
Received: by outflank-mailman (input) for mailman id 624257;
 Fri, 27 Oct 2023 07:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwHIh-0007vN-5z
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:30:35 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4fa52b5-749a-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 09:30:31 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so26637881fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 00:30:30 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b003fefaf299b6sm929618wmb.38.2023.10.27.00.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 00:30:29 -0700 (PDT)
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
X-Inumbo-ID: b4fa52b5-749a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698391830; x=1698996630; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IMWdKJMTkLqEzJi2MXWMaJpxcEwSEMD/Scl3L0GwHoE=;
        b=YPI6swtwUXKy7r4EB9WClr+TND4k5HJ1aQv0jAW6UEO8NROyNocAeuXqJ5MvenT44l
         rOMj8uAldYzbXy44rUqvXO24IAnm4vQXXy1yPGCvv61oVOSnlX5nA7VLOw9Qldm2y3Xo
         8pw/9wttoWX1/OCYhJnSlYJHZwWmuh2+9bWHfZ6uxBzRNiAdkpVnbUo87XCfBxn9aWlE
         dCyqMX3vhDpo7OIfkgBtD0uTr3SlZbt3tWqRj95Rd0uw8zwgoQEy9AXcbzPn9UCBbkvm
         mcZUU1qvT3MQlckBJ3tE0Kh0sd8A0I1GL9CQOYduatR7f3WQawmR3h4Ghm9QIhfXy9D0
         bU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698391830; x=1698996630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMWdKJMTkLqEzJi2MXWMaJpxcEwSEMD/Scl3L0GwHoE=;
        b=eHZ7nVErTRhuiabxdXIDCnJcaHdqw7NsMRtSA9nGQl1HVilfZjKU5Kobtdp/hL06uE
         aMbrvEC2QrQQUeYOI5QD33u4ACmX8Hd5/k0rj9EgoNEcaSUF1jT6ycFdBXz3ccI0Tj+f
         jpe/e23D3YECh0L8eZRXdxbuVPaUeLpjVxCa+zvEKeSFALGquv8f8nzyD17iQO0IYKij
         4DM3B3t9gyYnb4ol/DJkGMgAdTvg2GQ6duG+/A0ZS4NID0kMQXfV+FKyvUiwmo6MvjEr
         hSKkroMZz+YJqd6itvTBUH5zjXHqxG28c+5UY6XuMQjeHWLYsLg/9XyjIrdBCdNI2YyP
         mmCA==
X-Gm-Message-State: AOJu0YySPQfbjFvmZdvMGEjgRIDr98wRcjqdUe8hMoeWG2LK/jsFhNuk
	vZAWsl5c43bnU2DPumYkJ4o=
X-Google-Smtp-Source: AGHT+IF5RLZXmSPAwPQGTeQf9qBkoPlsrm6rJnN6VcwysPeYpD+ud4M5ztCgJgOqX6IOIBtV1Fqwvg==
X-Received: by 2002:a2e:6e19:0:b0:2c5:1915:9824 with SMTP id j25-20020a2e6e19000000b002c519159824mr1406966ljc.9.1698391829723;
        Fri, 27 Oct 2023 00:30:29 -0700 (PDT)
Message-ID: <74e54da5-9c35-485d-a13c-efac3f81dec2@gmail.com>
Date: Fri, 27 Oct 2023 08:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 13/28] hw/xen: automatically assign device index to
 block devices
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-14-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-14-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There's no need to force the user to assign a vdev. We can automatically
> assign one, starting at xvda and searching until we find the first disk
> name that's unused.
> 
> This means we can now allow '-drive if=xen,file=xxx' to work without an
> explicit separate -driver argument, just like if=virtio.
> 
> Rip out the legacy handling from the xenpv machine, which was scribbling
> over any disks configured by the toolstack, and didn't work with anything
> but raw images.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Acked-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   blockdev.c                          | 15 +++++++++---
>   hw/block/xen-block.c                | 38 +++++++++++++++++++++++++++++
>   hw/xen/xen_devconfig.c              | 28 ---------------------
>   hw/xenpv/xen_machine_pv.c           |  9 -------
>   include/hw/xen/xen-legacy-backend.h |  1 -
>   5 files changed, 50 insertions(+), 41 deletions(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index a01c62596b..5d9f2e5395 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -255,13 +255,13 @@ void drive_check_orphaned(void)
>            * Ignore default drives, because we create certain default
>            * drives unconditionally, then leave them unclaimed.  Not the
>            * users fault.
> -         * Ignore IF_VIRTIO, because it gets desugared into -device,
> -         * so we can leave failing to -device.
> +         * Ignore IF_VIRTIO or IF_XEN, because it gets desugared into
> +         * -device, so we can leave failing to -device.
>            * Ignore IF_NONE, because leaving unclaimed IF_NONE remains
>            * available for device_add is a feature.
>            */
>           if (dinfo->is_default || dinfo->type == IF_VIRTIO
> -            || dinfo->type == IF_NONE) {
> +            || dinfo->type == IF_XEN || dinfo->type == IF_NONE) {
>               continue;
>           }
>           if (!blk_get_attached_dev(blk)) {
> @@ -977,6 +977,15 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
>           qemu_opt_set(devopts, "driver", "virtio-blk", &error_abort);
>           qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
>                        &error_abort);
> +    } else if (type == IF_XEN) {
> +        QemuOpts *devopts;
> +        devopts = qemu_opts_create(qemu_find_opts("device"), NULL, 0,
> +                                   &error_abort);
> +        qemu_opt_set(devopts, "driver",
> +                     (media == MEDIA_CDROM) ? "xen-cdrom" : "xen-disk",
> +                     &error_abort);
> +        qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
> +                     &error_abort);
>       }
>   
>       filename = qemu_opt_get(legacy_opts, "file");
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 64470fc579..5011fe9430 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -27,6 +27,7 @@
>   #include "sysemu/block-backend.h"
>   #include "sysemu/iothread.h"
>   #include "dataplane/xen-block.h"
> +#include "hw/xen/interface/io/xs_wire.h"
>   #include "trace.h"
>   
>   static char *xen_block_get_name(XenDevice *xendev, Error **errp)
> @@ -34,6 +35,43 @@ static char *xen_block_get_name(XenDevice *xendev, Error **errp)
>       XenBlockDevice *blockdev = XEN_BLOCK_DEVICE(xendev);
>       XenBlockVdev *vdev = &blockdev->props.vdev;
>   
> +    if (blockdev->props.vdev.type == XEN_BLOCK_VDEV_TYPE_INVALID) {
> +        XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
> +        char fe_path[XENSTORE_ABS_PATH_MAX + 1];
> +        char *value;
> +        int disk = 0;
> +        unsigned long idx;
> +
> +        /* Find an unoccupied device name */

Not sure this is going to work is it? What happens if 'hda' or 'sda', or 
'd0' exists? I think you need to use the core of the code in 
xen_block_set_vdev() to generate names and search all possible encodings 
for each disk.

   Paul

> +        while (disk < (1 << 20)) {
> +            if (disk < (1 << 4)) {
> +                idx = (202 << 8) | (disk << 4);
> +            } else {
> +                idx = (1 << 28) | (disk << 8);
> +            }
> +            snprintf(fe_path, sizeof(fe_path),
> +                     "/local/domain/%u/device/vbd/%lu",
> +                     xendev->frontend_id, idx);
> +            value = qemu_xen_xs_read(xenbus->xsh, XBT_NULL, fe_path, NULL);
> +            if (!value) {
> +                if (errno == ENOENT) {
> +                    vdev->type = XEN_BLOCK_VDEV_TYPE_XVD;
> +                    vdev->partition = 0;
> +                    vdev->disk = disk;
> +                    vdev->number = idx;
> +                    goto found;
> +                }
> +                error_setg(errp, "cannot read %s: %s", fe_path,
> +                           strerror(errno));
> +                return NULL;
> +            }
> +            free(value);
> +            disk++;
> +        }
> +        error_setg(errp, "cannot find device vdev for block device");
> +        return NULL;
> +    }
> + found:
>       return g_strdup_printf("%lu", vdev->number);
>   }
>   
> diff --git a/hw/xen/xen_devconfig.c b/hw/xen/xen_devconfig.c
> index 9b7304e544..3f77c675c6 100644
> --- a/hw/xen/xen_devconfig.c
> +++ b/hw/xen/xen_devconfig.c
> @@ -46,34 +46,6 @@ static int xen_config_dev_all(char *fe, char *be)
>   
>   /* ------------------------------------------------------------- */
>   
> -int xen_config_dev_blk(DriveInfo *disk)
> -{
> -    char fe[256], be[256], device_name[32];
> -    int vdev = 202 * 256 + 16 * disk->unit;
> -    int cdrom = disk->media_cd;
> -    const char *devtype = cdrom ? "cdrom" : "disk";
> -    const char *mode    = cdrom ? "r"     : "w";
> -    const char *filename = qemu_opt_get(disk->opts, "file");
> -
> -    snprintf(device_name, sizeof(device_name), "xvd%c", 'a' + disk->unit);
> -    xen_pv_printf(NULL, 1, "config disk %d [%s]: %s\n",
> -                  disk->unit, device_name, filename);
> -    xen_config_dev_dirs("vbd", "qdisk", vdev, fe, be, sizeof(fe));
> -
> -    /* frontend */
> -    xenstore_write_int(fe, "virtual-device",  vdev);
> -    xenstore_write_str(fe, "device-type",     devtype);
> -
> -    /* backend */
> -    xenstore_write_str(be, "dev",             device_name);
> -    xenstore_write_str(be, "type",            "file");
> -    xenstore_write_str(be, "params",          filename);
> -    xenstore_write_str(be, "mode",            mode);
> -
> -    /* common stuff */
> -    return xen_config_dev_all(fe, be);
> -}
> -
>   int xen_config_dev_nic(NICInfo *nic)
>   {
>       char fe[256], be[256];
> diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
> index 17cda5ec13..1533f5dfb4 100644
> --- a/hw/xenpv/xen_machine_pv.c
> +++ b/hw/xenpv/xen_machine_pv.c
> @@ -32,7 +32,6 @@
>   
>   static void xen_init_pv(MachineState *machine)
>   {
> -    DriveInfo *dinfo;
>       int i;
>   
>       setup_xen_backend_ops();
> @@ -64,14 +63,6 @@ static void xen_init_pv(MachineState *machine)
>           vga_interface_created = true;
>       }
>   
> -    /* configure disks */
> -    for (i = 0; i < 16; i++) {
> -        dinfo = drive_get(IF_XEN, 0, i);
> -        if (!dinfo)
> -            continue;
> -        xen_config_dev_blk(dinfo);
> -    }
> -
>       /* configure nics */
>       for (i = 0; i < nb_nics; i++) {
>           if (!nd_table[i].model || 0 != strcmp(nd_table[i].model, "xen"))
> diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
> index 6c307c5f2c..fc42146bc2 100644
> --- a/include/hw/xen/xen-legacy-backend.h
> +++ b/include/hw/xen/xen-legacy-backend.h
> @@ -81,7 +81,6 @@ extern struct XenDevOps xen_usb_ops;          /* xen-usb.c         */
>   
>   /* configuration (aka xenbus setup) */
>   void xen_config_cleanup(void);
> -int xen_config_dev_blk(DriveInfo *disk);
>   int xen_config_dev_nic(NICInfo *nic);
>   int xen_config_dev_vfb(int vdev, const char *type);
>   int xen_config_dev_vkbd(int vdev);



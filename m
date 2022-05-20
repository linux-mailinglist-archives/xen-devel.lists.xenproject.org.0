Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7EA52F1A6
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 19:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334476.558498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns6Qj-00033Z-NN; Fri, 20 May 2022 17:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334476.558498; Fri, 20 May 2022 17:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns6Qj-00031k-KB; Fri, 20 May 2022 17:28:49 +0000
Received: by outflank-mailman (input) for mailman id 334476;
 Fri, 20 May 2022 17:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvDE=V4=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ns6Qi-00031e-2L
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 17:28:48 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d9d6917-d862-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 19:28:46 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id r3so3531320ljd.7
 for <xen-devel@lists.xenproject.org>; Fri, 20 May 2022 10:28:46 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 v20-20020ac25594000000b00477cdd77ac0sm475702lfg.175.2022.05.20.10.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 10:28:43 -0700 (PDT)
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
X-Inumbo-ID: 4d9d6917-d862-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NWNUaA41yaQWJiq/W0Tib8y24DO7hyxO1VVhuKdkKxY=;
        b=mQIKg8tBkJU+FbTnQk5BIt6dMPfj3EPpOk0KgQTES74IPyBTQeb1GxsM0lx9pNDZnm
         bjLjMm0liEoy5YlL8R0c8Ded7Sw7ScFbaeapd/QFkHjWJYTzJ82aTZLpu7L7jPv05Ex5
         fVq5K6BifqL+wUHgPLzr1vrrMkv74zcODeAolf7XkPwc4SBeAZxUplJDWlMsK680JhDi
         VTCd1N4HW5ub/1HZRH4awbBug3o9hm36UV0lLMh/MeyEEV0AEmjYNMSTSskpeHazfadj
         uHbusEFqudDz1PEmm4OicXBnCHLIoxWW5jL9JuP/+gwGSX7aE3Y6NHtN2y/fg62p9+xb
         dAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NWNUaA41yaQWJiq/W0Tib8y24DO7hyxO1VVhuKdkKxY=;
        b=A3X5IMQSys9wCGVXHDrGEnXhfX3sGbuQlg1xb4Oq8EmcHz4VN+Kp8XdXAxLm+dC4gY
         K0IhOHDL/lYAW2IAGxBa2KPyJGW8Zsgf64fSBIIPoKWqCRcCEvFXGIVie8bbqwcwYDRr
         5cwA8xJbStiIm33UtpoZOY15j9LWPhqiKVoKHLLk+SpZkABkuSLsW/12YLY3NpFy9dtm
         xONMjK2Wpt5B0Q3EFWXl/RLNXjX+uM0XwWbACqzFD5SQyuJnv556As8QzYFSoYad69bc
         WnaM4DN7ar7FvLUZoqIjVMZY34swpQvxloeK8s/GoJT4PwT11pYmz3ARjSAVZE4hNpf2
         gJRw==
X-Gm-Message-State: AOAM532iBn7i1i02y/9ryMT0ws9D4y+cQZ40whwJ1pe5YpE9GmWtw6np
	Y8b+E4uC+ZJzcX9TxXSXS0hm5AcRyiM=
X-Google-Smtp-Source: ABdhPJwQ57iVP+QXbigt6TSa0K5uRpYg6zIB4wuK15rt9gy/Q5TPe8zFuNF2UnyLfDihl4RHyJ+Ocw==
X-Received: by 2002:a2e:9ad5:0:b0:250:9be1:cc95 with SMTP id p21-20020a2e9ad5000000b002509be1cc95mr6148661ljj.79.1653067724073;
        Fri, 20 May 2022 10:28:44 -0700 (PDT)
Subject: Re: [PATCH V8 1/2] libxl: Add support for Virtio disk configuration
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1651598763-12162-1-git-send-email-olekstysh@gmail.com>
 <1651598763-12162-2-git-send-email-olekstysh@gmail.com>
 <YoTP44zc9jzGGYJf@perard.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bbf1562b-d646-a789-140e-bc0a61dad76a@gmail.com>
Date: Fri, 20 May 2022 20:28:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YoTP44zc9jzGGYJf@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 18.05.22 13:52, Anthony PERARD wrote:


Hello Anthony


> On Tue, May 03, 2022 at 08:26:02PM +0300, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds basic support for configuring and assisting virtio-mmio
>> based virtio-disk backend (emulator) which is intended to run out of
>> Qemu and could be run in any domain.
>> Although the Virtio block device is quite different from traditional
>> Xen PV block device (vbd) from the toolstack's point of view:
>>   - as the frontend is virtio-blk which is not a Xenbus driver, nothing
>>     written to Xenstore are fetched by the frontend currently ("vdev"
>>     is not passed to the frontend). But this might need to be revised
>>     in future, so frontend data might be written to Xenstore in order to
>>     support hotplugging virtio devices or passing the backend domain id
>>     on arch where the device-tree is not available.
>>   - the ring-ref/event-channel are not used for the backend<->frontend
>>     communication, the proposed IPC for Virtio is IOREQ/DM
>> it is still a "block device" and ought to be integrated in existing
>> "disk" handling. So, re-use (and adapt) "disk" parsing/configuration
>> logic to deal with Virtio devices as well.
>>
>> For the immediate purpose and an ability to extend that support for
>> other use-cases in future (Qemu, virtio-pci, etc) perform the following
>> actions:
>> - Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
>>    that in the configuration
>> - Introduce new disk "specification" and "transport" fields to struct
>>    libxl_device_disk. Both are written to the Xenstore. The transport
>>    field is only used for the specification "virtio" and it assumes
>>    only "mmio" value for now.
>> - Introduce new "specification" option with "xen" communication
>>    protocol being default value.
>> - Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
>>    one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model
> Is this still an issue?


Yes, it is.

Both LIBXL__DEVICE_KIND_VBD and LIBXL__DEVICE_KIND_VIRTIO_DISK are for 
disk devices, but they are quite different from toolstack PoV.

They use different specifications/transports. The latter is for 
virtio-blk driver which is not xenbus driver. The way how both Virtio 
backend and frontend get configuration and communicate with each

are completely different from Xen PV drivers.


>   Since v5, the "disk/vbd" kind is used. Also see
> my comment about libxl_device_disk_get_path() regarding this.

ok


>
>
>> An example of domain configuration for Virtio disk:
>> disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, specification=virtio']
>>
>> Nothing has changed for default Xen disk configuration.
>>
>> Please note, this patch is not enough for virtio-disk to work
>> on Xen (Arm), as for every Virtio device (including disk) we need
>> to allocate Virtio MMIO params (IRQ and memory region) and pass
>> them to the backend, also update Guest device-tree. The subsequent
>> patch will add these missing bits. For the current patch,
>> the default "irq" and "base" are just written to the Xenstore.
>> This is not an ideal splitting, but this way we avoid breaking
>> the bisectability.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
>> index a5ca778..7fd98ce 100644
>> --- a/tools/libs/light/libxl_disk.c
>> +++ b/tools/libs/light/libxl_disk.c
>> @@ -163,6 +163,19 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
>>       rc = libxl__resolve_domid(gc, disk->backend_domname, &disk->backend_domid);
>>       if (rc < 0) return rc;
>>   
>> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_UNKNOWN)
>> +        disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
>> +
>> +    /*
>> +     * The transport field is only used for the specification "virtio" and
>> +     * it assumes only "mmio" value for now. When there will be a need to add
>> +     * "pci" support, we will need to remove the enforcement here and
>> +     * respective assert(s) down the code and let the toolstack to decide
>> +     * the transport to use.
>> +     */
>> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
>> +        disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
> Could you check that `disk->transport` is unset when
> `specification==xen` ? And probably return ERROR_INVAL in this case.

yes, will do


>
> Also, I don't think you should overwrite the value set by an application
> in _setdefault(). If `specification==virtio`, check first that
> `transport` as a supported value (unknown or mmio) then you can then you
> can set the `transport` value expected by virtio if it wasn't set by the
> application. ( An example of this is done the function already when
> enforcing qdisk for cdroms. )

I got it, will do


I transform to something like that:


     if (disk->specification == LIBXL_DISK_SPECIFICATION_XEN &&
         disk->transport != LIBXL_DISK_TRANSPORT_UNKNOWN) {
         LOGD(ERROR, domid, "Transport is only supported for 
specification virtio");
         return ERROR_FAIL;
     }

     /* Force transport mmio for specification virtio for now */
     if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
         if (!(disk->transport == LIBXL_DISK_TRANSPORT_UNKNOWN ||
               disk->transport == LIBXL_DISK_TRANSPORT_MMIO)) {
             LOGD(ERROR, domid, "Unsupported transport for specification 
virtio");
             return ERROR_FAIL;
         }
         disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
     }


>
>> +
>>       /* Force Qdisk backend for CDROM devices of guests with a device model. */
>>       if (disk->is_cdrom != 0 &&
>>           libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
>> @@ -317,6 +334,11 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
>>               goto out;
>>           }
>>   
>> +        assert((disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO &&
>> +                disk->backend == LIBXL_DISK_BACKEND_OTHER) ||
>> +               (disk->specification != LIBXL_DISK_SPECIFICATION_VIRTIO &&
>> +                disk->backend != LIBXL_DISK_BACKEND_OTHER));
> I'm not sure whether this assert() is useful. The value should already
> be correct as we call _setdefault(). It seems like an unnecessary
> potential crash at this point.

agree, will drop


>
>>           switch (disk->backend) {
>>               case LIBXL_DISK_BACKEND_PHY:
>>                   dev = disk->pdev_path;
>> @@ -330,7 +352,14 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
>>   
>>                   assert(device->backend_kind == LIBXL__DEVICE_KIND_VBD);
>>                   break;
>> +            case LIBXL_DISK_BACKEND_OTHER:
>> +                dev = disk->pdev_path;
>> +
>> +                flexarray_append(back, "params");
>> +                flexarray_append(back, dev);
>>   
>> +                assert(device->backend_kind == LIBXL__DEVICE_KIND_VIRTIO_DISK);
>> +                break;
>>               case LIBXL_DISK_BACKEND_TAP:
>>                   LOG(ERROR, "blktap is not supported");
>>                   rc = ERROR_FAIL;
>> @@ -386,6 +415,15 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
>>           flexarray_append_pair(back, "discard-enable",
>>                                 libxl_defbool_val(disk->discard_enable) ?
>>                                 "1" : "0");
>> +        flexarray_append(back, "specification");
>> +        flexarray_append(back, libxl__device_disk_string_of_specification(disk->specification));
>> +        if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
>> +            assert(disk->transport == LIBXL_DISK_TRANSPORT_MMIO);
> I don't think this is a good assert(). If an application sets the wrong
> "transport" for virtio, it should get an error, not crash. But I believe
> in this case that _setdefault() could already check that "transport" is
> correct, so there's probably no need to check the transport value here.

ok, I can drop this. The reason why I put this assert is to draw 
developer's attention (who will implement pci transport in future) to 
the need

to update code below.


>
>> +            flexarray_append(back, "transport");
>> +            flexarray_append(back, libxl__device_disk_string_of_transport(disk->transport));
>> +            flexarray_append_pair(back, "base", GCSPRINTF("%"PRIu64, disk->base));
>> +            flexarray_append_pair(back, "irq", GCSPRINTF("%u", disk->irq));
>> +        }
>>   
>>           flexarray_append(front, "backend-id");
>>           flexarray_append(front, GCSPRINTF("%d", disk->backend_domid));
>> @@ -532,6 +570,49 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
>>       }
>>       libxl_string_to_backend(ctx, tmp, &(disk->backend));
>>   
>> +    tmp = libxl__xs_read(gc, XBT_NULL,
>> +                         GCSPRINTF("%s/specification", libxl_path));
>> +    if (!tmp) {
>> +        LOG(ERROR, "Missing xenstore node %s/specification", libxl_path);
> This mean that we introduce an hard error if we deal with a previous
> version of libxl that didn't write this path. But we know that it meant
> specification=xen, so could we default to "xen" when the node is
> missing, rather than return an error? (It's mostly useful for developper
> at this point as creating a vm with one version of libxl and keep
> managing it with a newer version isn't really possible for now.)

agree, will do. But maybe it is worth leaving debug print here?

LOG(DEBUG, "Missing xenstore node %s/specification, assuming 
specification xen", libxl_path);


>
>> +        goto cleanup;
>> +    }
>> +    if (!strcmp(tmp, "xen"))
>> +        disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
>> +    else if (!strcmp(tmp, "virtio"))
>> +        disk->specification = LIBXL_DISK_SPECIFICATION_VIRTIO;
>> +    else
>> +        disk->specification = LIBXL_DISK_SPECIFICATION_UNKNOWN;
> That's a reimplementation of a generated function,
> libxl_disk_specification_from_string() I believe ;-)

indeed, will reuse


Taking into the account both comments, the resulting code can look 
something like that:

     tmp = libxl__xs_read(gc, XBT_NULL,
                          GCSPRINTF("%s/specification", libxl_path));
     if (!tmp) {
         LOG(DEBUG, "Missing xenstore node %s/specification, assuming 
specification xen", libxl_path);
         disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
     } else {
         rc = libxl_disk_specification_from_string(tmp, 
&disk->specification);
         if (rc) {
             LOG(ERROR, "Unable to parse xenstore node 
%s/specification", libxl_path);
             goto cleanup;
         }
     }



>
>> +
>> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
>> +        tmp = libxl__xs_read(gc, XBT_NULL,
>> +                             GCSPRINTF("%s/transport", libxl_path));
>> +        if (!tmp) {
>> +            LOG(ERROR, "Missing xenstore node %s/transport", libxl_path);
>> +            goto cleanup;
>> +        }
>> +        if (!strcmp(tmp, "mmio"))
>> +            disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
>> +        else
>> +            disk->transport = LIBXL_DISK_TRANSPORT_UNKNOWN;
> That's libxl_disk_transport_from_string() I think.

indeed, will reuse


>
>> +        assert(disk->transport == LIBXL_DISK_TRANSPORT_MMIO);
> Could you return an error instead of assert() here?

yes, will do


>
>> +
>> +        tmp = libxl__xs_read(gc, XBT_NULL,
>> +                             GCSPRINTF("%s/base", libxl_path));
>> +        if (!tmp) {
>> +            LOG(ERROR, "Missing xenstore node %s/base", libxl_path);
>> +            goto cleanup;
>> +        }
>> +        disk->base = strtoul(tmp, NULL, 10);
>> +
>> +        tmp = libxl__xs_read(gc, XBT_NULL,
>> +                             GCSPRINTF("%s/irq", libxl_path));
>> +        if (!tmp) {
>> +            LOG(ERROR, "Missing xenstore node %s/irq", libxl_path);
>> +            goto cleanup;
>> +        }
>> +        disk->irq = strtoul(tmp, NULL, 10);
>> +    }
>> +
>>       disk->vdev = xs_read(ctx->xsh, XBT_NULL,
>>                            GCSPRINTF("%s/dev", libxl_path), &len);
>>       if (!disk->vdev) {
>> @@ -575,6 +656,41 @@ cleanup:
>>       return rc;
>>   }
>>   
>> +static int libxl_device_disk_get_path(libxl__gc *gc, uint32_t domid,
> FYI, "libxl_" prefix is for functions exported by the library. You could
> use "libxl__" for functions used within the library or no prefix in this
> case as it is static.

I got it, will do


>
>> +                                      char **path)
>> +{
>> +    const char *dir;
>> +    int rc;
>> +
>> +    /*
>> +     * As we don't know exactly what device kind to be used here, guess it
>> +     * by checking the presence of the corresponding path in Xenstore.
>> +     * First, try to read path for vbd device (default) and if not exists
>> +     * read path for virtio_disk device. This will work as long as both Xen PV
>> +     * and Virtio disk devices are not assigned to the same guest.
>> +     */
> That mean, we can't have both virtio-disk and pv-disk, and there's going
> to be weird error with device disappearing if one try to add a pv-disk
> after adding a virtio-disk.

I was thinking this wouldn't be a big issue (at least on production). I 
might be wrong, but what is a reason to assign to the guest the virtual 
devices of the *same* type (block device) using different virtualization 
techniques (Xen PV and Virtio)?


>
> Also, I don't know whether the function is called before a first device
> is added, but it could be a potential issue as it would return an error
> in that case.
>
> The path generated here are path that are only used by libxl, so it
> probably doesn't matter which path is used, as long as there's a unique
> path for a device implementation. (The different path might have been
> useful in v4 of the series when there was a libxl-virtio-disk
> implementation.)
>
> So, is there a reason to have different path?


I think, the completely different guest's view of the virtualized device 
is a reason. If virtio-disk and pv-disk was only different in software 
implementation of the backend, I would reuse LIBXL__DEVICE_KIND_VBD for 
virtio-disk. But their frontends are completely different. Or I really 
misunderstood the idea of device_kind?


>   Can we simply get rid of
> this function?

Without it, libxl_vdev_to_device_disk() won't work for virtio-disk.


>
> Maybe this is related to the path that a frontend would see, and we
> probably don't want to have a pv-disk front-end trying to connect to a
> virtio backend as it doesn't going to work.

Yes, exactly



>   I wonder if the
> "/libxl/*/device/" needs to use the same "device kind" name as the ones
> seen by a guest. I didn't investigated that.
>
>> +    *path = GCSPRINTF("%s/device/%s",
>> +                      libxl__xs_libxl_path(gc, domid),
>> +                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VBD));
>> +
>> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
>> +    if (rc)
>> +        return rc;
>> +
>> +    if (dir)
>> +        return 0;
>> +
>> +    *path = GCSPRINTF("%s/device/%s",
>> +                      libxl__xs_libxl_path(gc, domid),
>> +                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));
>> +
>> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
>> +    if (rc)
>> +        return rc;
>> +
>> +    return 0;
>> +}
>> +
>>   int libxl_vdev_to_device_disk(libxl_ctx *ctx, uint32_t domid,
>>                                 const char *vdev, libxl_device_disk *disk)
>>   {
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>> index 2a42da2..f783cac 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -704,6 +716,10 @@ libxl_device_disk = Struct("device_disk", [
>>       ("is_cdrom", integer),
>>       ("direct_io_safe", bool),
>>       ("discard_enable", libxl_defbool),
>> +    ("specification", libxl_disk_specification),
>> +    ("transport", libxl_disk_transport),
> Could you add a comment here about "irq" and "base", that say that they
> are for internal use by libxl and can't be modified?

yes, will do


>   Is it possible
> that in the future, an application like libvirt could potentially change
> those two values and have libxl use them?

I am not sure I understand that the libvirt is for, but I don't see a 
need for any external application to touch these fields. These are 
allocated internally in libxl_arm.c.


>
>> +    ("irq", uint32),
>> +    ("base", uint64),
>>       # Note that the COLO configuration settings should be considered unstable.
>>       # They may change incompatibly in future versions of Xen.
>>       ("colo_enable", libxl_defbool),
> Thanks,
>
-- 
Regards,

Oleksandr Tyshchenko



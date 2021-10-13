Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C0D42B89A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 09:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207953.363950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYPp-00029G-93; Wed, 13 Oct 2021 07:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207953.363950; Wed, 13 Oct 2021 07:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYPp-00027Q-5f; Wed, 13 Oct 2021 07:11:05 +0000
Received: by outflank-mailman (input) for mailman id 207953;
 Wed, 13 Oct 2021 07:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmSx=PB=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1maYPn-00027K-6I
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 07:11:03 +0000
Received: from mail-io1-xd2c.google.com (unknown [2607:f8b0:4864:20::d2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b076813f-9614-4a15-8cb7-a20874ef10d4;
 Wed, 13 Oct 2021 07:11:02 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id q205so1667133iod.8
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 00:11:01 -0700 (PDT)
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
X-Inumbo-ID: b076813f-9614-4a15-8cb7-a20874ef10d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PuD4x/quwdKwmCZMAPno27Mt5WkSyZcD2cupRATIQmA=;
        b=hUpeBm07ZhmU+R92qTIFSrBL14OeFHZ6uD4IZbV6GtgXTzhgOqStOEWSiPJEWuGj4t
         4zuWiSkqFTm3AGGU2NR38KTYSKWPxOtEcdS4Ai/3r1akHkT61Jp+XPc9Zl1qrzwNyPwA
         TnX/xusNsfu2j+x4p6dymMk+gwlKDmH0z9qb8RZ1yOpGX8JaH+u2u3i10cFfQzzpQZKA
         gzhXJSBzjJDyKX/O/RiXSwFRjlfOrTHayIFv4RaRpmQwTkqpQYJmnggmAwOE8fiqTWjc
         lItwI007UCAJqN+GP5GKmGAqMrKlXFHSwRjzOn5t6E5+kri8uC+0X+pm6KhlPDRrs3ON
         wktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PuD4x/quwdKwmCZMAPno27Mt5WkSyZcD2cupRATIQmA=;
        b=NcV3jJegfe6hKWDUMYA1LoS8Q11mPnQlRU8+p9Cty/g8HW9P51Sa+VUPMXcsG/SJVa
         1PPQ/45FkH4uKoyETD5OPawKG056GVhwoJNxpoVcJbUo+dIOMhTkZ0e4/cDEjuJkVsEP
         kFR+nR9M3pahRH6nqbqH04SVMabMYTc/eaomnTqTYh7rVLM3lzc04+VI9vmOX4xk506D
         NjwrC79a4w5oOigJKGMMqcjfhcRU9flG2UO9gmRIiVgnODfLLrK+Ri8Z9JGqP84h1sLB
         i43IBJbca5J45Aup5ejlMVIJ3zTY/Nov9VmLai9DeCzWky1VHuvEV7sSHyYMoYbBUr1J
         uj4A==
X-Gm-Message-State: AOAM530TcDmt4QutRZl9uBqITkLsFB3TQUxqXOKS4dN0d36/6oOvDv8j
	fxuIOoIxCISfZwF1uIxsIgiKdOk/kmw8Stz+MJmJv5jlhHNQPw==
X-Google-Smtp-Source: ABdhPJzyNaV6p60H1ka7FNoMSrAfpLbPjQqSVej3WyYM+u5LpMnq8d8d2K/hoKgv951cKI2obB3JFtyY4qhuLjUoOBw=
X-Received: by 2002:a05:6638:9a:: with SMTP id v26mr11895732jao.18.1634109061530;
 Wed, 13 Oct 2021 00:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-5-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-5-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 17:10:35 +1000
Message-ID: <CAKmqyKNWBYpq8CbhtGyw9=1Gt_LujZZrtD7J_Ye2FyyVA6eqcw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/16] softmmu/qdev-monitor: add error handling in qdev_set_id
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eric Blake <eblake@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:29 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> qdev_set_id() is mostly used when the user adds a device (using
> -device cli option or device_add qmp command). This commit adds
> an error parameter to handle the case where the given id is
> already taken.
>
> Also document the function and add a return value in order to
> be able to capture success/failure: the function now returns the
> id in case of success, or NULL in case of failure.
>
> The commit modifies the 2 calling places (qdev-monitor and
> xen-legacy-backend) to add the error object parameter.
>
> Note that the id is, right now, guaranteed to be unique because
> all ids came from the "device" QemuOptsList where the id is used
> as key. This addition is a preparation for a future commit which
> will relax the uniqueness.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/monitor/qdev.h      | 25 +++++++++++++++++++++++-
>  hw/xen/xen-legacy-backend.c |  3 ++-
>  softmmu/qdev-monitor.c      | 38 +++++++++++++++++++++++++++----------
>  3 files changed, 54 insertions(+), 12 deletions(-)
>
> diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
> index eaa947d73a..23c31f5296 100644
> --- a/include/monitor/qdev.h
> +++ b/include/monitor/qdev.h
> @@ -9,6 +9,29 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
>
>  int qdev_device_help(QemuOpts *opts);
>  DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
> -void qdev_set_id(DeviceState *dev, const char *id);
> +
> +/**
> + * qdev_set_id: parent the device and set its id if provided.
> + * @dev: device to handle
> + * @id: id to be given to the device, or NULL.
> + *
> + * Returns: the id of the device in case of success; otherwise NULL.
> + *
> + * @dev must be unrealized, unparented and must not have an id.
> + *
> + * If @id is non-NULL, this function tries to setup @dev qom path as
> + * "/peripheral/id". If @id is already taken, it fails. If it succeeds,
> + * the id field of @dev is set to @id (@dev now owns the given @id
> + * parameter).
> + *
> + * If @id is NULL, this function generates a unique name and setups @dev
> + * qom path as "/peripheral-anon/name". This name is not set as the id
> + * of @dev.
> + *
> + * Upon success, it returns the id/name (generated or provided). The
> + * returned string is owned by the corresponding child property and must
> + * not be freed by the caller.
> + */
> +const char *qdev_set_id(DeviceState *dev, const char *id, Error **errp);
>
>  #endif
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index dd8ae1452d..f541cfa0e9 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -276,7 +276,8 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
>      xendev = g_malloc0(ops->size);
>      object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
>      OBJECT(xendev)->free = g_free;
> -    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev));
> +    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
> +                &error_fatal);
>      qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
>      object_unref(OBJECT(xendev));
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 25275984bd..0007698ff3 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -578,22 +578,34 @@ static BusState *qbus_find(const char *path, Error **errp)
>      return bus;
>  }
>
> -void qdev_set_id(DeviceState *dev, const char *id)
> +const char *qdev_set_id(DeviceState *dev, const char *id, Error **errp)
>  {
> +    ObjectProperty *prop;
> +
> +    assert(!dev->id && !dev->realized);
> +
> +    /*
> +     * object_property_[try_]add_child() below will assert the device
> +     * has no parent
> +     */
>      if (id) {
> -        dev->id = id;
> -    }
> -
> -    if (dev->id) {
> -        object_property_add_child(qdev_get_peripheral(), dev->id,
> -                                  OBJECT(dev));
> +        prop = object_property_try_add_child(qdev_get_peripheral(), id,
> +                                             OBJECT(dev), NULL);
> +        if (prop) {
> +            dev->id = id;
> +        } else {
> +            error_setg(errp, "Duplicate device ID '%s'", id);
> +            return NULL;
> +        }
>      } else {
>          static int anon_count;
>          gchar *name = g_strdup_printf("device[%d]", anon_count++);
> -        object_property_add_child(qdev_get_peripheral_anon(), name,
> -                                  OBJECT(dev));
> +        prop = object_property_add_child(qdev_get_peripheral_anon(), name,
> +                                         OBJECT(dev));
>          g_free(name);
>      }
> +
> +    return prop->name;
>  }
>
>  DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
> @@ -677,7 +689,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>          }
>      }
>
> -    qdev_set_id(dev, qemu_opts_id(opts));
> +    /*
> +     * set dev's parent and register its id.
> +     * If it fails it means the id is already taken.
> +     */
> +    if (!qdev_set_id(dev, qemu_opts_id(opts), errp)) {
> +        goto err_del_dev;
> +    }
>
>      /* set properties */
>      if (qemu_opt_foreach(opts, set_property, dev, errp)) {
> --
> 2.33.0
>
>


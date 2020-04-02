Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEAB19C0B4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 14:10:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJydE-0001sb-8d; Thu, 02 Apr 2020 12:07:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qk0=5S=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jJydD-0001sW-6J
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 12:07:35 +0000
X-Inumbo-ID: 8934e4cc-74da-11ea-b58d-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8934e4cc-74da-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 12:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585829253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GH9ZctDlOJVXlePIEy/7t69vRL4BBSn3UAVlOi0YVIE=;
 b=bnDDKk50p8DxaYPE1/q/Ij5J1PTiRpQJ6O3nIksZBPSWBTQSTf/g2l+FGlgevS9cuegwTt
 T1Q8jw8BjtUUMsrg1okQRGGT1XGwlKA+Jno9/uzsiXL2iQ0C5x3QwzsxWTqIzo4VVQDGJi
 QBN6UaJ8SnwrimxOYKXy0cncI2xPT1s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-6E7ADdhYOCKMgTys_FIdiQ-1; Thu, 02 Apr 2020 08:07:26 -0400
X-MC-Unique: 6E7ADdhYOCKMgTys_FIdiQ-1
Received: by mail-ed1-f69.google.com with SMTP id a3so2548527edy.8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2020 05:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IvvY/ezh+A+md7a0w8aybV+mbPJAV/52y9KvRJMvL7U=;
 b=uhzJCZIq45pDtDrl9N8B4AjmFNQxba2z9fFq8uIrAw2hH6OqcKCZpuBQ2dY4QxrNH/
 cGFx+jlpTkuYILpq2u36DSac3Pu1TbHnVwP7gqUO+860ijGFTGvWAV8yXYhOK1g7YK3b
 BLW7SZTuoQdDykyThPnfUC1tDn8QOiVU4DAYipq2hhZgE3koVLy/GQRvQbUXHnRCUUCd
 77KgLi4GhrkDRz9/LWdvPl2Gfta0m9jxKE6fvwL4Gv9ik3j4Fxjxg3w+RDQD42LDF8VZ
 jGUuYNIYrn00vm9Tc1WYNjbs1GEkJYWhDCejPnmPkkSPxROlq3k3Amk6kU3qw5xhLxHg
 8ynQ==
X-Gm-Message-State: AGi0Pub9SHLkS2SxHS6Np1qRL/dmkO08We6R3IOCUWRWSlcEJNwMgtcN
 L4eka56PqVwaWg59cupEh6exvFsuhu1Kj+Up6qPX0ygKDJEOF6jsC/ukSTK5Xdi34lb1lm/vV+N
 PQlrTl5OSiYw6M+Gbm94AMoqZIFw=
X-Received: by 2002:a17:906:5003:: with SMTP id
 s3mr2829101ejj.266.1585829244901; 
 Thu, 02 Apr 2020 05:07:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypJLDm9ZnfHA6wKQOZciX7wwCPmBDqT1nlQfHJMQNrxnzwDeBgppafryQKmrd2XqzYIdc24Wsg==
X-Received: by 2002:a17:906:5003:: with SMTP id
 s3mr2829072ejj.266.1585829244579; 
 Thu, 02 Apr 2020 05:07:24 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id e14sm906098edy.84.2020.04.02.05.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 05:07:23 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL 06/25] xen: create xenstore areas for
 XenDevice-s
To: paul@xen.org, 'Anthony PERARD' <anthony.perard@citrix.com>,
 qemu-devel@nongnu.org
References: <20190114135154.16826-1-anthony.perard@citrix.com>
 <20190114135154.16826-7-anthony.perard@citrix.com>
 <772fab5a-59ab-050f-9fef-f3b050cfc5cd@redhat.com>
 <001001d608d4$0e7b9f40$2b72ddc0$@xen.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5f7e6e45-bf73-8a64-81a6-a41cc7b9d747@redhat.com>
Date: Thu, 2 Apr 2020 14:07:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <001001d608d4$0e7b9f40$2b72ddc0$@xen.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, 'Markus Armbruster' <armbru@redhat.com>,
 'Peter Maydell' <peter.maydell@linaro.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 4/2/20 11:49 AM, Paul Durrant wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Sent: 01 April 2020 17:14
>> To: Anthony PERARD <anthony.perard@citrix.com>; qemu-devel@nongnu.org
>> Cc: xen-devel@lists.xenproject.org; Peter Maydell <peter.maydell@linaro.=
org>; Paul Durrant
>> <paul@xen.org>; Markus Armbruster <armbru@redhat.com>
>> Subject: Re: [Qemu-devel] [PULL 06/25] xen: create xenstore areas for Xe=
nDevice-s
>>
>> Hi Anthony, Paul.
>>
>> Cc'ing Markus too.
>>
>> On 1/14/19 2:51 PM, Anthony PERARD wrote:
>>> From: Paul Durrant <paul.durrant@citrix.com>
>>>
>>> This patch adds a new source module, xen-bus-helper.c, which builds on
>>> basic libxenstore primitives to provide functions to create (setting
>>> permissions appropriately) and destroy xenstore areas, and functions to
>>> 'printf' and 'scanf' nodes therein. The main xen-bus code then uses
>>> these primitives [1] to initialize and destroy the frontend and backend
>>> areas for a XenDevice during realize and unrealize respectively.
>>>
>>> The 'xen-block' implementation is extended with a 'get_name' method tha=
t
>>> returns the VBD number. This number is required to 'name' the xenstore
>>> areas.
>>>
>>> NOTE: An exit handler is also added to make sure the xenstore areas are
>>>         cleaned up if QEMU terminates without devices being unrealized.
>>>
>>> [1] The 'scanf' functions are actually not yet needed, but they will be
>>>       needed by code delivered in subsequent patches.
>>>
>>> Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
>>> Reviewed-by: Anthony Perard <anthony.perard@citrix.com>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>> ---
>>>    hw/block/xen-block.c            |   9 +
>>>    hw/xen/Makefile.objs            |   2 +-
>>>    hw/xen/trace-events             |  12 +-
>>>    hw/xen/xen-bus-helper.c         | 150 +++++++++++++++
>>>    hw/xen/xen-bus.c                | 321 ++++++++++++++++++++++++++++++=
+-
>>>    include/hw/xen/xen-bus-helper.h |  39 ++++
>>>    include/hw/xen/xen-bus.h        |  12 ++
>>>    7 files changed, 540 insertions(+), 5 deletions(-)
>>>    create mode 100644 hw/xen/xen-bus-helper.c
>>>    create mode 100644 include/hw/xen/xen-bus-helper.h
>>>
>> [...]
>>> +static void xen_device_exit(Notifier *n, void *data)
>>> +{
>>> +    XenDevice *xendev =3D container_of(n, XenDevice, exit);
>>> +
>>> +    xen_device_unrealize(DEVICE(xendev), &error_abort);
>>>    }
>>>
>>>    static void xen_device_realize(DeviceState *dev, Error **errp)
>>>    {
>>>        XenDevice *xendev =3D XEN_DEVICE(dev);
>>>        XenDeviceClass *xendev_class =3D XEN_DEVICE_GET_CLASS(xendev);
>>> +    XenBus *xenbus =3D XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
>>>        const char *type =3D object_get_typename(OBJECT(xendev));
>>>        Error *local_err =3D NULL;
>>>
>>> -    trace_xen_device_realize(type);
>>> +    if (xendev->frontend_id =3D=3D DOMID_INVALID) {
>>> +        xendev->frontend_id =3D xen_domid;
>>> +    }
>>> +
>>> +    if (xendev->frontend_id >=3D DOMID_FIRST_RESERVED) {
>>> +        error_setg(errp, "invalid frontend-id");
>>> +        goto unrealize;
>>> +    }
>>> +
>>> +    if (!xendev_class->get_name) {
>>> +        error_setg(errp, "get_name method not implemented");
>>> +        goto unrealize;
>>> +    }
>>> +
>>> +    xendev->name =3D xendev_class->get_name(xendev, &local_err);
>>> +    if (local_err) {
>>> +        error_propagate_prepend(errp, local_err,
>>> +                                "failed to get device name: ");
>>> +        goto unrealize;
>>> +    }
>>> +
>>> +    trace_xen_device_realize(type, xendev->name);
>>> +
>>> +    xen_device_backend_create(xendev, &local_err);
>>> +    if (local_err) {
>>> +        error_propagate(errp, local_err);
>>> +        goto unrealize;
>>> +    }
>>> +
>>> +    xen_device_frontend_create(xendev, &local_err);
>>> +    if (local_err) {
>>> +        error_propagate(errp, local_err);
>>> +        goto unrealize;
>>> +    }
>>>
>>>        if (xendev_class->realize) {
>>>            xendev_class->realize(xendev, &local_err);
>>> @@ -72,18 +364,43 @@ static void xen_device_realize(DeviceState *dev, E=
rror **errp)
>>>            }
>>>        }
>>>
>>> +    xen_device_backend_printf(xendev, "frontend", "%s",
>>> +                              xendev->frontend_path);
>>> +    xen_device_backend_printf(xendev, "frontend-id", "%u",
>>> +                              xendev->frontend_id);
>>> +    xen_device_backend_printf(xendev, "online", "%u", 1);
>>> +    xen_device_backend_printf(xendev, "hotplug-status", "connected");
>>> +
>>> +    xen_device_backend_set_state(xendev, XenbusStateInitWait);
>>> +
>>> +    xen_device_frontend_printf(xendev, "backend", "%s",
>>> +                               xendev->backend_path);
>>> +    xen_device_frontend_printf(xendev, "backend-id", "%u",
>>> +                               xenbus->backend_id);
>>> +
>>> +    xen_device_frontend_set_state(xendev, XenbusStateInitialising);
>>> +
>>> +    xendev->exit.notify =3D xen_device_exit;
>>> +    qemu_add_exit_notifier(&xendev->exit);
>>>        return;
>>>
>>>    unrealize:
>>>        xen_device_unrealize(dev, &error_abort);
>>
>> It seems if unrealize() fails, the error stored in &local_err is never
>> reported. Not sure if this can be improved although.
>=20
> In this case that's essentially a "don't care". We want to know why the r=
ealize failed but if the unrealize fails something is probably pretty serio=
usly screwed (hence the error_abort).

OK. I was surprised by the singular pattern (which confuses Coccinelle=20
semantic transformations), but it works.

Thanks for the quick feedback Paul!

Regards,

Phil.

>=20
>    Paul
>=20



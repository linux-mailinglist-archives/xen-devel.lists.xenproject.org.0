Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE419AF8B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 18:18:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJg0S-0006Xd-VN; Wed, 01 Apr 2020 16:14:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTHm=5R=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jJg0R-0006XW-8y
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 16:14:19 +0000
X-Inumbo-ID: d6c43aaa-7433-11ea-83d8-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d6c43aaa-7433-11ea-83d8-bc764e2007e4;
 Wed, 01 Apr 2020 16:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585757658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ao7dCKGnlZKFlEK7iPffU2e9tqVZy7nJlMRwqLi4mW4=;
 b=HbAAIFlG7BOyvOvcZZTq9ptpJUGV6U8QSiJsMhY3SJOcllHoviUkK80hIJL802OymtOERn
 TbnrGjohIpgohKcdhCDpEtgAf47yUg4DBsJAsHEqf0ullfnl9k4NfEp01Ae1fPv88ZS9xW
 4FhJEdnhJidBHB1N9BvC8bm/ZSwnAt8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-DjObJuqsPiOgmloFrihLlQ-1; Wed, 01 Apr 2020 12:14:14 -0400
X-MC-Unique: DjObJuqsPiOgmloFrihLlQ-1
Received: by mail-ed1-f70.google.com with SMTP id i61so383886edc.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2020 09:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ao7dCKGnlZKFlEK7iPffU2e9tqVZy7nJlMRwqLi4mW4=;
 b=EEmSAHzgZkawh/2nHVrS0U01d19ysPXjY8A4iWooBT//jGlsM0GBP1rdA+2mTvYw91
 wnbcAvNS5hzIhhtCOzxYqH3P4V/StZPAKC9O4zbv5fMSP7htA4e+XYeCRldvR6VxutyB
 njkE47hMKYoDDhzc7SyTLNyXd/komZAhVVXulkBnZgNc0vNSzunwp9zGolbnf2u6H/Zn
 FVGWXh2ai5M9KVDypdXR6z+GtQyhVUdHroBiLBt3zk4uskaMqXUZW3yi1hwTWgLIPi5S
 9rPZqt+rTEZXXOpkP0IwHLnhlwLCXVWgsXh0Z6bDYMeNTz6ovDDBMD/5XdwVcqkSk0R7
 6WJA==
X-Gm-Message-State: ANhLgQ03Lb2vZg4pKaVH32Yts7Zqsf1/WY3M3M8yIS1oC7cGahI/3r+R
 aEBisOic2YKX15sqsATB8SKJuLgJaJ0wVxDXC/CRKIFfCjw2pbViqZWf7rHoVvwZYw2UiUvxvhZ
 TsnL+DH9msTA1iwIxWZc2hNWpCu0=
X-Received: by 2002:a17:906:e4a:: with SMTP id
 q10mr21678241eji.371.1585757653160; 
 Wed, 01 Apr 2020 09:14:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsjnTYrLetXganFy1+x4jIgAoh3U67ltaGOBxp9JVwwaj8Mw4R++cOP/Du2iwlYwz1vPgCOVQ==
X-Received: by 2002:a17:906:e4a:: with SMTP id
 q10mr21678214eji.371.1585757652855; 
 Wed, 01 Apr 2020 09:14:12 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f5sm634783ejc.70.2020.04.01.09.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2020 09:14:12 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL 06/25] xen: create xenstore areas for
 XenDevice-s
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20190114135154.16826-1-anthony.perard@citrix.com>
 <20190114135154.16826-7-anthony.perard@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <772fab5a-59ab-050f-9fef-f3b050cfc5cd@redhat.com>
Date: Wed, 1 Apr 2020 18:14:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20190114135154.16826-7-anthony.perard@citrix.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Anthony, Paul.

Cc'ing Markus too.

On 1/14/19 2:51 PM, Anthony PERARD wrote:
> From: Paul Durrant <paul.durrant@citrix.com>
> 
> This patch adds a new source module, xen-bus-helper.c, which builds on
> basic libxenstore primitives to provide functions to create (setting
> permissions appropriately) and destroy xenstore areas, and functions to
> 'printf' and 'scanf' nodes therein. The main xen-bus code then uses
> these primitives [1] to initialize and destroy the frontend and backend
> areas for a XenDevice during realize and unrealize respectively.
> 
> The 'xen-block' implementation is extended with a 'get_name' method that
> returns the VBD number. This number is required to 'name' the xenstore
> areas.
> 
> NOTE: An exit handler is also added to make sure the xenstore areas are
>        cleaned up if QEMU terminates without devices being unrealized.
> 
> [1] The 'scanf' functions are actually not yet needed, but they will be
>      needed by code delivered in subsequent patches.
> 
> Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
> Reviewed-by: Anthony Perard <anthony.perard@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>   hw/block/xen-block.c            |   9 +
>   hw/xen/Makefile.objs            |   2 +-
>   hw/xen/trace-events             |  12 +-
>   hw/xen/xen-bus-helper.c         | 150 +++++++++++++++
>   hw/xen/xen-bus.c                | 321 +++++++++++++++++++++++++++++++-
>   include/hw/xen/xen-bus-helper.h |  39 ++++
>   include/hw/xen/xen-bus.h        |  12 ++
>   7 files changed, 540 insertions(+), 5 deletions(-)
>   create mode 100644 hw/xen/xen-bus-helper.c
>   create mode 100644 include/hw/xen/xen-bus-helper.h
> 
[...]
> +static void xen_device_exit(Notifier *n, void *data)
> +{
> +    XenDevice *xendev = container_of(n, XenDevice, exit);
> +
> +    xen_device_unrealize(DEVICE(xendev), &error_abort);
>   }
>   
>   static void xen_device_realize(DeviceState *dev, Error **errp)
>   {
>       XenDevice *xendev = XEN_DEVICE(dev);
>       XenDeviceClass *xendev_class = XEN_DEVICE_GET_CLASS(xendev);
> +    XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
>       const char *type = object_get_typename(OBJECT(xendev));
>       Error *local_err = NULL;
>   
> -    trace_xen_device_realize(type);
> +    if (xendev->frontend_id == DOMID_INVALID) {
> +        xendev->frontend_id = xen_domid;
> +    }
> +
> +    if (xendev->frontend_id >= DOMID_FIRST_RESERVED) {
> +        error_setg(errp, "invalid frontend-id");
> +        goto unrealize;
> +    }
> +
> +    if (!xendev_class->get_name) {
> +        error_setg(errp, "get_name method not implemented");
> +        goto unrealize;
> +    }
> +
> +    xendev->name = xendev_class->get_name(xendev, &local_err);
> +    if (local_err) {
> +        error_propagate_prepend(errp, local_err,
> +                                "failed to get device name: ");
> +        goto unrealize;
> +    }
> +
> +    trace_xen_device_realize(type, xendev->name);
> +
> +    xen_device_backend_create(xendev, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        goto unrealize;
> +    }
> +
> +    xen_device_frontend_create(xendev, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        goto unrealize;
> +    }
>   
>       if (xendev_class->realize) {
>           xendev_class->realize(xendev, &local_err);
> @@ -72,18 +364,43 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
>           }
>       }
>   
> +    xen_device_backend_printf(xendev, "frontend", "%s",
> +                              xendev->frontend_path);
> +    xen_device_backend_printf(xendev, "frontend-id", "%u",
> +                              xendev->frontend_id);
> +    xen_device_backend_printf(xendev, "online", "%u", 1);
> +    xen_device_backend_printf(xendev, "hotplug-status", "connected");
> +
> +    xen_device_backend_set_state(xendev, XenbusStateInitWait);
> +
> +    xen_device_frontend_printf(xendev, "backend", "%s",
> +                               xendev->backend_path);
> +    xen_device_frontend_printf(xendev, "backend-id", "%u",
> +                               xenbus->backend_id);
> +
> +    xen_device_frontend_set_state(xendev, XenbusStateInitialising);
> +
> +    xendev->exit.notify = xen_device_exit;
> +    qemu_add_exit_notifier(&xendev->exit);
>       return;
>   
>   unrealize:
>       xen_device_unrealize(dev, &error_abort);

It seems if unrealize() fails, the error stored in &local_err is never 
reported. Not sure if this can be improved although.

>   }
>   
> +static Property xen_device_props[] = {
> +    DEFINE_PROP_UINT16("frontend-id", XenDevice, frontend_id,
> +                       DOMID_INVALID),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>   static void xen_device_class_init(ObjectClass *class, void *data)
>   {
>       DeviceClass *dev_class = DEVICE_CLASS(class);
>   
>       dev_class->realize = xen_device_realize;
>       dev_class->unrealize = xen_device_unrealize;
> +    dev_class->props = xen_device_props;
>       dev_class->bus_type = TYPE_XEN_BUS;
>   }
>   
[...]



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973BB7D53AD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622015.969071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvI7S-0004Oo-50; Tue, 24 Oct 2023 14:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622015.969071; Tue, 24 Oct 2023 14:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvI7S-0004Mh-2H; Tue, 24 Oct 2023 14:10:54 +0000
Received: by outflank-mailman (input) for mailman id 622015;
 Tue, 24 Oct 2023 14:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvI7P-0004Mb-NY
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:10:51 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2203dc1f-7277-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 16:10:49 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507ac66a969so6088501e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 07:10:49 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a7bcbcf000000b004060f0a0fdbsm16824685wmi.41.2023.10.24.07.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 07:10:47 -0700 (PDT)
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
X-Inumbo-ID: 2203dc1f-7277-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698156649; x=1698761449; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4Y3NJJxZnet/u/+ClOIVYQTH9XNjb8AeBmOgUc+Wdk=;
        b=hqC2LzxkDFfR0UwDy/POlaqDLzyiLofc+A/xZo2cKg/O+sKZWmRe2tQhhr+J+owYZF
         Bw08A4Lgf2VmsOa1ZoPegnPTC017CAcPudwVXBFIj5iY60vD7X909BqtDMwphGqV1W5V
         7bx5JQ961AyZxRGbL6ovvE+jPPyUiONKKto/KwGFo48JhlMM3fkZRuuwv66pYlGso2uR
         BgNTMaMYlKwsbjtTGoRnJ4zRCUrJHCjWl9U9Ctz7Pxim8oV6Jk8y1p2G+vw3opTdFpdi
         Vz1admoaNW5My4e2vniHKRedJ1stReEcp20EbBlz1OgGul+oTNsHP3Uk0HaY2tpjp9vd
         jY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698156649; x=1698761449;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4Y3NJJxZnet/u/+ClOIVYQTH9XNjb8AeBmOgUc+Wdk=;
        b=pSaQWcgPW4zNT9LBARZPpboytoBMDLNUAw2dgH6Vc1A+G7cOtPtrYv2FAbQUN56IPw
         V0dKAIzU3Dwk2hxtDO4JS9Zy4qRbTMUGBjm0alVTor8xlp73637cbhMP9id+40+57tbm
         0W6gEsxJpb9OLafWtYv46cK2z8xzHgmNqL8+yoVirHySHkuBzvfHwefgbchQhFsJ9R41
         fj8B7Jxxj15SPECRNZrROgLjD8t0v/fBr5M+fjINNC0v8RWQ943TRsJ3MAGP2Nqlxg+G
         gD4SCUyVz/yfdeJMZHrL6KuLFSJlLYszGJUdwocPl6AFG6bqf88TzX9QIlzsMrMCI8TR
         bDTw==
X-Gm-Message-State: AOJu0YxX3yhw+uAgVL8+4fOJMFAitvv/2xQubs1va3UuvWkwWH66Bx2Z
	XEHhzxBKuSQZyOZIUHRJV3o=
X-Google-Smtp-Source: AGHT+IHszHDLVtShMAkzRbGqalZC2ZdGiWC/tPXrcM+mvjAw5eIWwjZ5DaBiH9KKgD4DF1MNxjUmSQ==
X-Received: by 2002:ac2:5398:0:b0:506:8d2a:5653 with SMTP id g24-20020ac25398000000b005068d2a5653mr8824946lfh.47.1698156648053;
        Tue, 24 Oct 2023 07:10:48 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <0e169b58-f481-4b77-8385-6a1a58b57df1@xen.org>
Date: Tue, 24 Oct 2023 15:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 09/12] hw/xen: prevent duplicate device registrations
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-10-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231016151909.22133-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:19, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Ensure that we have a XenBackendInstance for every device regardless
> of whether it was "discovered" in XenStore or created directly in QEMU.
> 
> This allows the backend_list to be a source of truth about whether a
> given backend exists, and allows us to reject duplicates.
> 
> This also cleans up the fact that backend drivers were calling
> xen_backend_set_device() with a XenDevice immediately after calling
> qdev_realize_and_unref() on it, when it wasn't theirs to play with any
> more.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/block/xen-block.c         |  1 -
>   hw/char/xen_console.c        |  2 +-
>   hw/xen/xen-backend.c         | 78 ++++++++++++++++++++++++++----------
>   hw/xen/xen-bus.c             |  8 ++++
>   include/hw/xen/xen-backend.h |  3 ++
>   5 files changed, 69 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index a07cd7eb5d..9262338535 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -975,7 +975,6 @@ static void xen_block_device_create(XenBackendInstance *backend,
>           goto fail;
>       }
>   
> -    xen_backend_set_device(backend, xendev);
>       return;
>   
>   fail:
> diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> index bd20be116c..2825b8c511 100644
> --- a/hw/char/xen_console.c
> +++ b/hw/char/xen_console.c
> @@ -468,7 +468,7 @@ static void xen_console_device_create(XenBackendInstance *backend,
>       Chardev *cd = NULL;
>       struct qemu_xs_handle *xsh = xenbus->xsh;
>   
> -    if (qemu_strtoul(name, NULL, 10, &number)) {
> +    if (qemu_strtoul(name, NULL, 10, &number) || number >= INT_MAX) {
>           error_setg(errp, "failed to parse name '%s'", name);
>           goto fail;
>       }
I don't think this hunk belongs here, does it? Seems like it should be 
in patch 7.

> diff --git a/hw/xen/xen-backend.c b/hw/xen/xen-backend.c
> index b9bf70a9f5..dcb4329258 100644
> --- a/hw/xen/xen-backend.c
> +++ b/hw/xen/xen-backend.c
> @@ -101,22 +101,28 @@ static XenBackendInstance *xen_backend_list_find(XenDevice *xendev)
>       return NULL;
>   }
>   
> -bool xen_backend_exists(const char *type, const char *name)
> +static XenBackendInstance *xen_backend_lookup(const XenBackendImpl *impl, const char *name)

This name is a little close to xen_backend_table_lookup()... perhaps 
that one should be renamed xen_backend_impl_lookup() for clarity.

>   {
> -    const XenBackendImpl *impl = xen_backend_table_lookup(type);
>       XenBackendInstance *backend;
>   
> -    if (!impl) {
> -        return false;
> -    }
> -
>       QLIST_FOREACH(backend, &backend_list, entry) {
>           if (backend->impl == impl && !strcmp(backend->name, name)) {
> -            return true;
> +            return backend;
>           }
>       }
>   
> -    return false;
> +    return NULL;
> +}
> +
> +bool xen_backend_exists(const char *type, const char *name)
> +{
> +    const XenBackendImpl *impl = xen_backend_table_lookup(type);
> +
> +    if (!impl) {
> +        return false;
> +    }
> +
> +    return !!xen_backend_lookup(impl, name);
>   }
>   
>   static void xen_backend_list_remove(XenBackendInstance *backend)
> @@ -138,11 +144,10 @@ void xen_backend_device_create(XenBus *xenbus, const char *type,
>       backend = g_new0(XenBackendInstance, 1);
>       backend->xenbus = xenbus;
>       backend->name = g_strdup(name);
> -
> -    impl->create(backend, opts, errp);
> -
>       backend->impl = impl;
>       xen_backend_list_add(backend);
> +
> +    impl->create(backend, opts, errp);
>   }
>   
>   XenBus *xen_backend_get_bus(XenBackendInstance *backend)
> @@ -155,13 +160,6 @@ const char *xen_backend_get_name(XenBackendInstance *backend)
>       return backend->name;
>   }
>   
> -void xen_backend_set_device(XenBackendInstance *backend,
> -                            XenDevice *xendev)
> -{
> -    g_assert(!backend->xendev);
> -    backend->xendev = xendev;
> -}
> -

The declaration also needs removing from xen-backend.h presumably.

>   XenDevice *xen_backend_get_device(XenBackendInstance *backend)
>   {
>       return backend->xendev;
> @@ -178,9 +176,7 @@ bool xen_backend_try_device_destroy(XenDevice *xendev, Error **errp)
>       }
>   
>       impl = backend->impl;
> -    if (backend->xendev) {
> -        impl->destroy(backend, errp);
> -    }
> +    impl->destroy(backend, errp);
>   
>       xen_backend_list_remove(backend);
>       g_free(backend->name);
> @@ -188,3 +184,43 @@ bool xen_backend_try_device_destroy(XenDevice *xendev, Error **errp)
>   
>       return true;
>   }
> +
> +bool xen_backend_device_realized(XenDevice *xendev, Error **errp)
> +{
> +    XenDeviceClass *xendev_class = XEN_DEVICE_GET_CLASS(xendev);
> +    const char *type = xendev_class->backend ? : object_get_typename(OBJECT(xendev));
> +    const XenBackendImpl *impl = xen_backend_table_lookup(type);
> +    XenBackendInstance *backend;
> +
> +    if (!impl) {
> +        return false;
> +    }
> +
> +    backend = xen_backend_lookup(impl, xendev->name);
> +    if (backend) {
> +        if (backend->xendev && backend->xendev != xendev) {
> +            error_setg(errp, "device %s/%s already exists", type, xendev->name);
> +            return false;
> +        }
> +        backend->xendev = xendev;
> +        return true;
> +    }
> +
> +    backend = g_new0(XenBackendInstance, 1);
> +    backend->xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
> +    backend->xendev = xendev;
> +    backend->name = g_strdup(xendev->name);
> +    backend->impl = impl;
> +
> +    xen_backend_list_add(backend);
> +    return true;
> +}

Not sure I'm getting my head around this. How does this play with the 
legacy backend code? The point about having the impl list was so that 
the newer xenbus code didn't conflict with the legacy backend code, 
which thinks it has carte blanche ownership of a class.

   Paul

> +
> +void xen_backend_device_unrealized(XenDevice *xendev)
> +{
> +    XenBackendInstance *backend = xen_backend_list_find(xendev);
> +
> +    if (backend) {
> +        backend->xendev = NULL;
> +    }
> +}
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index 0da2aa219a..0b232d1f94 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -359,6 +359,8 @@ static void xen_bus_realize(BusState *bus, Error **errp)
>   
>       g_free(type);
>       g_free(key);
> +
> +    xen_bus_enumerate(xenbus);
>       return;
>   
>   fail:
> @@ -958,6 +960,8 @@ static void xen_device_unrealize(DeviceState *dev)
>   
>       trace_xen_device_unrealize(type, xendev->name);
>   
> +    xen_backend_device_unrealized(xendev);
> +
>       if (xendev->exit.notify) {
>           qemu_remove_exit_notifier(&xendev->exit);
>           xendev->exit.notify = NULL;
> @@ -1024,6 +1028,10 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
>           goto unrealize;
>       }
>   
> +    if (!xen_backend_device_realized(xendev, errp)) {
> +        goto unrealize;
> +    }
> +
>       trace_xen_device_realize(type, xendev->name);
>   
>       xendev->xsh = qemu_xen_xs_open();
> diff --git a/include/hw/xen/xen-backend.h b/include/hw/xen/xen-backend.h
> index 0f01631ae7..3f1e764c51 100644
> --- a/include/hw/xen/xen-backend.h
> +++ b/include/hw/xen/xen-backend.h
> @@ -38,4 +38,7 @@ void xen_backend_device_create(XenBus *xenbus, const char *type,
>                                  const char *name, QDict *opts, Error **errp);
>   bool xen_backend_try_device_destroy(XenDevice *xendev, Error **errp);
>   
> +bool xen_backend_device_realized(XenDevice *xendev, Error **errp);
> +void xen_backend_device_unrealized(XenDevice *xendev);
> +
>   #endif /* HW_XEN_BACKEND_H */



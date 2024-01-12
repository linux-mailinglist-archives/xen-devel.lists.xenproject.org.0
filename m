Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9CB82C414
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 17:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666944.1037908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOKoZ-0007J4-H2; Fri, 12 Jan 2024 16:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666944.1037908; Fri, 12 Jan 2024 16:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOKoZ-0007GR-Dh; Fri, 12 Jan 2024 16:55:27 +0000
Received: by outflank-mailman (input) for mailman id 666944;
 Fri, 12 Jan 2024 16:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UAL2=IW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rOKoY-0007GL-CJ
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 16:55:26 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61775d39-b16b-11ee-98f1-6d05b1d4d9a1;
 Fri, 12 Jan 2024 17:55:25 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e5a5b0fb5so27742635e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 08:55:25 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c4fd500b0040e34ca648bsm6466686wmq.0.2024.01.12.08.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 08:55:23 -0800 (PST)
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
X-Inumbo-ID: 61775d39-b16b-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705078524; x=1705683324; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s8+1LVx/LS7Q7kV71hnu0RtkCDp1L/JfIrlZR7un8Qg=;
        b=EJuhEMy6gb0uEkHpgqCla664sgG5dycP1pJ4J9+8I98ljIuDAR60VYQVK5MnJnAhYa
         rZ8waNYRY/XNFCpRDfJ4zB0HERicB47RCsKzGThTmI7IRU2bASv4lx3d9Gvvw4ygelZ0
         IYozSWHszL7p6RFPsfPbg2ACHFBYgr/CeAuTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705078524; x=1705683324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8+1LVx/LS7Q7kV71hnu0RtkCDp1L/JfIrlZR7un8Qg=;
        b=Onae0d2dTzMZlOO0vAsRLvyA0xX39QuYDdIgFap9Syfpa8vURSbnrr2iktny5TKsVV
         QlEl5nCURsTjqaZrxGaKdzQ9K8zsiUzfqcl8i+U8r1RzhhhceXAWqar6nYe64gn4SVY2
         YR8rGKN4HgicqUSa391zxxTKhCpSHAyoqMB8k1e9FLIf8ElxVrRsgoEFQgoKQLt5GTmk
         WlU1fKk3s++gx+kTmBcgjb5RPeh+9eJulaWqVE45qadW5MrggWTQeCAWFD7Z6W4RXtJg
         W6qeDQ75+Us6cETi6PZioQwyJrc8hFLFYa1YSWAYjhAqLlia1NLoXwBVqXc93wpSZAwK
         2t0A==
X-Gm-Message-State: AOJu0Yw9e/9WLfcRBbBqJ4FeOMIoEYOIhkpZDGz907YzIyazB/NiUTpy
	w6KnbRlNJxoSyogBfZ+Pi5SWMrh8dp427w==
X-Google-Smtp-Source: AGHT+IFM4AZWENnVELrVSK/nLRpXdWDxuSQpbqaLs5pcIz9361GjDvNaJph2EcM30ZAm8oa2QUdUaQ==
X-Received: by 2002:a05:600c:19d2:b0:40e:5a80:7e7c with SMTP id u18-20020a05600c19d200b0040e5a807e7cmr1038330wmq.7.1705078524507;
        Fri, 12 Jan 2024 08:55:24 -0800 (PST)
Date: Fri, 12 Jan 2024 16:55:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v3 16/33] tools/libs/light: add backend type for 9pfs PV
 devices
Message-ID: <2a2f50d3-f065-4b03-b75d-401a40fcb6fd@perard>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-17-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104090055.27323-17-jgross@suse.com>

On Thu, Jan 04, 2024 at 10:00:38AM +0100, Juergen Gross wrote:
> diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
> index 5ab0d3aa21..486bc4326e 100644
> --- a/tools/libs/light/libxl_9pfs.c
> +++ b/tools/libs/light/libxl_9pfs.c
> @@ -33,20 +33,159 @@ static int libxl__set_xenstore_p9(libxl__gc *gc, uint32_t domid,
>  
>      flexarray_append_pair(front, "tag", p9->tag);
>  
> +    if (p9->type == LIBXL_P9_TYPE_XEN_9PFSD) {
> +        flexarray_append_pair(back, "max-space",
> +                              GCSPRINTF("%u", p9->max_space));
> +        flexarray_append_pair(back, "max-files",
> +                              GCSPRINTF("%u", p9->max_files));
> +        flexarray_append_pair(back, "max-open-files",
> +                              GCSPRINTF("%u", p9->max_open_files));
> +        flexarray_append_pair(back, "auto-delete",
> +                              p9->auto_delete ? "1" : "0");
> +    }
> +
> +    return 0;
> +}
> +
> +static int libxl__device_from_p9(libxl__gc *gc, uint32_t domid,
> +                                 libxl_device_p9 *type, libxl__device *device)
> +{
> +    device->backend_devid   = type->devid;
> +    device->backend_domid   = type->backend_domid;
> +    device->backend_kind    = type->type == LIBXL_P9_TYPE_QEMU
> +                              ? LIBXL__DEVICE_KIND_9PFS
> +                              : LIBXL__DEVICE_KIND_XEN_9PFS;
> +    device->devid           = type->devid;
> +    device->domid           = domid;
> +    device->kind            = LIBXL__DEVICE_KIND_9PFS;
> +
>      return 0;
>  }
>  
> -#define libxl__add_p9s NULL
> +static int libxl_device_p9_dm_needed(void *e, unsigned domid)

Prefix of the function should be "libxl__" as it's only internal to
libxl.

> +{
> +    libxl_device_p9 *elem = e;
> +
> +    return elem->type == LIBXL_P9_TYPE_QEMU && elem->backend_domid == domid;
> +}
> +
> +typedef struct libxl__aop9_state libxl__aop9_state;
> +
> +struct libxl__aop9_state {
> +    libxl__spawn_state spawn;
> +    libxl__ao_device *aodev;
> +    libxl_device_p9 *p9;
> +    uint32_t domid;
> +    void (*callback)(libxl__egc *, libxl__aop9_state *, int);
> +};
> +
> +static void xen9pfsd_spawn_outcome(libxl__egc *egc, libxl__aop9_state *aop9,
> +                                   int rc)
> +{
> +    aop9->aodev->rc = rc;
> +    if (rc)
> +        aop9->aodev->callback(egc, aop9->aodev);
> +    else
> +        libxl__device_add_async(egc, aop9->domid, &libxl__p9_devtype,
> +                                aop9->p9, aop9->aodev);
> +}
> +
> +static void xen9pfsd_confirm(libxl__egc *egc, libxl__spawn_state *spawn,
> +                             const char *xsdata)
> +{
> +    STATE_AO_GC(spawn->ao);
> +
> +    if (!xsdata)
> +        return;
> +
> +    if (strcmp(xsdata, "running"))
> +        return;
> +
> +    libxl__spawn_initiate_detach(gc, spawn);
> +}
> +
> +static void xen9pfsd_failed(libxl__egc *egc, libxl__spawn_state *spawn, int rc)
> +{
> +    libxl__aop9_state *aop9 = CONTAINER_OF(spawn, *aop9, spawn);
> +
> +    xen9pfsd_spawn_outcome(egc, aop9, rc);
> +}
> +
> +static void xen9pfsd_detached(libxl__egc *egc, libxl__spawn_state *spawn)
> +{
> +    libxl__aop9_state *aop9 = CONTAINER_OF(spawn, *aop9, spawn);
> +
> +    xen9pfsd_spawn_outcome(egc, aop9, 0);
> +}
> +
> +static int xen9pfsd_spawn(libxl__egc *egc, uint32_t domid, libxl_device_p9 *p9,
> +                         libxl__ao_device *aodev)
> +{
> +    STATE_AO_GC(aodev->ao);
> +    struct libxl__aop9_state *aop9;
> +    int rc;
> +    char *args[] = { "xen-9pfsd", NULL };
> +    char *path = GCSPRINTF("/local/domain/%u/libxl/xen-9pfs",
> +                           p9->backend_domid);
> +
> +    if (p9->type != LIBXL_P9_TYPE_XEN_9PFSD ||
> +        libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/state", path)))

I feel like this check and this function might not work as expected.
What happen if we try to add more than one 9pfs "device"? libxl I think
is going to try to start several xen-9pfs daemon before the first one
have had time to write the "*/state" path.
What about two different libxl process trying to spawn that daemon? Is
xen-9pfs going to behave well and have one giveup? But that would
probably mean that libxl is going to have an error due to the process
exiting early, maybe.

> +        return 0;
> +
> +    GCNEW(aop9);
> +    aop9->aodev = aodev;
> +    aop9->p9 = p9;
> +    aop9->domid = domid;
> +    aop9->callback = xen9pfsd_spawn_outcome;
> +
> +    aop9->spawn.ao = aodev->ao;
> +    aop9->spawn.what = "xen-9pfs daemon";
> +    aop9->spawn.xspath = GCSPRINTF("%s/state", path);
> +    aop9->spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
> +    aop9->spawn.pidpath = GCSPRINTF("%s/pid", path);
> +    aop9->spawn.midproc_cb = libxl__spawn_record_pid;
> +    aop9->spawn.confirm_cb = xen9pfsd_confirm;
> +    aop9->spawn.failure_cb = xen9pfsd_failed;
> +    aop9->spawn.detached_cb = xen9pfsd_detached;
> +    rc = libxl__spawn_spawn(egc, &aop9->spawn);
> +    if (rc < 0)
> +        return rc;
> +    if (!rc) {
> +        setsid();
> +        libxl__exec(gc, -1, -1, -1, LIBEXEC_BIN "/xen-9pfsd", args, NULL);
> +    }
> +
> +    return 1;
> +}

Could you reorder the file, to make it easier to follow the code of
the async style? "xen9pfsd_spawn()" should be first, followed by
_confirm() _failed and _detached() and finally xen9pfsd_spawn_outcome().

> +
> +static void libxl__device_p9_add(libxl__egc *egc, uint32_t domid,
> +                                 libxl_device_p9 *p9,
> +                                 libxl__ao_device *aodev)
> +{
> +    int rc;
> +
> +    rc = xen9pfsd_spawn(egc, domid, p9, aodev);
> +    if (rc == 1)

I'd like a comment about what's different about rc==1 vs rc==0, here or
in the function xen9pfsd_spawn. These functions that sometime setup a
callback (or actually call it) and sometime don't, make things harder to
follow.

Or maybe we could rewrite things a bit so that there's only one function
that calls libxl__device_add_async(). But the current
libxl__device_p9_add() is kind of ok, with additional comments.

> +        return;
> +
> +    if (rc == 0)
> +        libxl__device_add_async(egc, domid, &libxl__p9_devtype, p9, aodev);
> +
> +    aodev->rc = rc;
> +    if (rc)
> +        aodev->callback(egc, aodev);
> +}
> +
>  #define libxl_device_p9_list NULL
>  #define libxl_device_p9_compare NULL
>  
>  static LIBXL_DEFINE_UPDATE_DEVID(p9)
> -static LIBXL_DEFINE_DEVICE_FROM_TYPE(p9)
> +static LIBXL_DEFINE_DEVICES_ADD(p9)
>  
>  LIBXL_DEFINE_DEVICE_REMOVE(p9)
>  
>  DEFINE_DEVICE_TYPE_STRUCT(p9, 9PFS, p9s,
> -    .skip_attach = 1,
>      .set_xenstore_config = (device_set_xenstore_config_fn_t)
>                             libxl__set_xenstore_p9,
> +    .dm_needed = libxl_device_p9_dm_needed,
>  );
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 7d8bd5d216..82565c4c10 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -150,6 +150,12 @@ libxl_nic_type = Enumeration("nic_type", [
>      (2, "VIF"),
>      ])
>  
> +libxl_p9_type = Enumeration("p9_type", [
> +    (0, "unknown"),
> +    (1, "qemu"),
> +    (2, "xen_9pfsd"),
> +    ])
> +
>  libxl_action_on_shutdown = Enumeration("action_on_shutdown", [
>      (1, "DESTROY"),
>  
> @@ -942,6 +948,11 @@ libxl_device_p9 = Struct("device_p9", [
>      ("path",             string),
>      ("security_model",   string),
>      ("devid",            libxl_devid),
> +    ("type",             libxl_p9_type),
> +    ("max_space",        integer),
> +    ("max_files",        integer),
> +    ("max_open_files",   integer),
> +    ("auto_delete",      bool),

These additional fields and options probably a
LIBXL_HAVE_XEN_9PFS macro in libxl.h.


Thanks,

-- 
Anthony PERARD


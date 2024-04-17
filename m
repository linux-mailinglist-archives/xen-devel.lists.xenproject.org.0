Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175978A885D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 18:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707646.1105738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx7ik-0007cp-DB; Wed, 17 Apr 2024 16:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707646.1105738; Wed, 17 Apr 2024 16:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx7ik-0007aO-A1; Wed, 17 Apr 2024 16:01:14 +0000
Received: by outflank-mailman (input) for mailman id 707646;
 Wed, 17 Apr 2024 16:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pjj4=LW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rx7ii-0007aH-O9
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 16:01:12 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4d931e5-fcd3-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 18:01:09 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d87660d5c9so58631021fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 09:01:09 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b0041892c774bcsm3269269wmo.2.2024.04.17.09.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 09:01:08 -0700 (PDT)
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
X-Inumbo-ID: b4d931e5-fcd3-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713369669; x=1713974469; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5LEesBevK3Svg+8c4iMkBKuSdAkbQUCOodDiRqQFiCA=;
        b=i/dwziPI+hPXDPvMM/vfPl87VeZEyFq+WUumE0H61Dnp8ZItUCZEctAyl3hxB5ylzo
         cXdF/PcxwLMqW3y/9atD921XylfKTHAkADjSgbGqvnmCNUxTZNpk/3RKlZZmKKPBiKZh
         3fnrDa/sZKHie7o8zJcJ5x5qhokZOkqv62/cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713369669; x=1713974469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LEesBevK3Svg+8c4iMkBKuSdAkbQUCOodDiRqQFiCA=;
        b=Dmqezw/q/P7t4brKAY6h/fnABUj88iljiUMD83xyJCDbSYK/YWJbQw29SuubmgX4uo
         ENKkhjGQK9Gklq5irReqjmBOGS7YP9wDWae1lRa/xf/oLBEjE45N0lqvlwGxX1ZIoPPl
         28UNtUh39gLWm78PM1UlZWPW+Eei+hi9ueG0hoZ71/dsZte2ppxK49c9u/d6o7g0rS2b
         3AhPXEMvJmXvJ6Pwe4pgokNte1T8nWZ/4sIPoBzN0MtFhQ64B/coqtH+3/vp7ygOkZdS
         FWdisZR6Bb4dH/IBv0hk34j0aTdAmbXBZWCMELw6hRhIeuI3f5A0xlHVbskwfBR3KvWx
         3Ofw==
X-Gm-Message-State: AOJu0Yybq4/qxgM8w8UL9OnZNk4olV+Han85922srwguQmf6CHOVKmiz
	MX4EkNkwN82AHTWMOVVgprZNNhVUOMEm3LhmQk8GtZBy9kpSpgUyHe1QbfDUJ0A=
X-Google-Smtp-Source: AGHT+IGzJkFW1Wbe4aJhEmRt6plDOt015knV4s00C4ESKU7RnkLYbM6+fMisEPi9oYJkNmpG45GjXQ==
X-Received: by 2002:a2e:8350:0:b0:2d9:fb60:9afa with SMTP id l16-20020a2e8350000000b002d9fb609afamr12585145ljh.40.1713369669058;
        Wed, 17 Apr 2024 09:01:09 -0700 (PDT)
Date: Wed, 17 Apr 2024 17:01:07 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2] libxl: Enable stubdom cdrom changing
Message-ID: <b8c488ab-c557-4567-a454-96baac284504@perard>
References: <20240407143633.24108-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407143633.24108-1-jandryuk@gmail.com>

On Sun, Apr 07, 2024 at 10:36:33AM -0400, Jason Andryuk wrote:
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> index fa7856f28c..819d34933b 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -829,21 +829,122 @@ int libxl_device_disk_getinfo(libxl_ctx *ctx, uint32_t domid,
>      return rc;
>  }
>  
> +/*
> + * Search through the query-fdsets JSON looking for a matching devid.
> + *
> + * If found, return the fdset-id integer (>=0).
> + *
> + * If not found, return ERROR_NOTFOUND.
> + *
> + * On error, return libxl ERROR_*.
> + */
> +static int query_fdsets_find_fdset(libxl__gc *gc,
> +                                   const libxl__json_object *response,
> +                                   int devid)
> +{
> +    const libxl__json_object *fdset;
> +    const char *needle = GCSPRINTF("stub-devid:%d", devid);
> +    int i, j, rc;
> +
> +    /* query-fdsets returns:
> +     * [
> +     *   { "fds": [
> +     *       { "fd": 30,
> +     *         "opaque": "stub-devid:2080"
> +     *       }
> +     *     ],
> +     *     "fdset-id": 1
> +     *   }
> +     * ]
> +     */
> +    for (i = 0; (fdset = libxl__json_array_get(response, i)); i++) {
> +        const libxl__json_object *fdset_id;
> +        const libxl__json_object *fds;
> +        const libxl__json_object *fd;
> +
> +        fdset_id = libxl__json_map_get("fdset-id", fdset, JSON_INTEGER);
> +        if (!fdset_id) {
> +            rc = ERROR_QEMU_API;
> +            goto out;
> +        }
> +        LOG(DEBUG, "fdset-id=%lld", libxl__json_object_get_integer(fdset_id));

This feels like we are going to have a log of logging about information
that isn't going to be used by libxl. Also, an fdset-id is also logged
by the caller of this function. (But even there, it might not be
useful).

When debugging, it might be more helpful to run `query-fdset` by hand
than having libxl listing every possible fdset.

> +        fds = libxl__json_map_get("fds", fdset, JSON_ARRAY);
> +        if (!fds) {
> +            rc = ERROR_QEMU_API;
> +            goto out;
> +        }
> +        for (j = 0; (fd = libxl__json_array_get(fds, j)); j++) {
> +            const libxl__json_object *fd_num;
> +            const libxl__json_object *opaque;
> +            const char *opaque_str;
> +
> +            fd_num = libxl__json_map_get("fd", fd, JSON_INTEGER);
> +            if (!fd_num) {
> +                rc = ERROR_QEMU_API;
> +                goto out;
> +            }
> +            opaque = libxl__json_map_get("opaque", fd, JSON_STRING);
> +            if (!opaque) {
> +                continue;
> +            }
> +
> +            opaque_str = libxl__json_object_get_string(opaque);
> +            LOG(DEBUG, "fd=%lld opaque='%s'",
> +                libxl__json_object_get_integer(fd_num), opaque_str);

This logging is also probably too verbose. First, libxl never care about
which fd QEMU is using, second, if the opaque doesn't match, it is
probably not the one we want, and the needed one is just missing.

By the way, there's a big hammer that can pottentiolly be used when
debuging QMP interaction, rebuild libxl with -DDEBUG_QMP_CLIENT, this will
log every QMP command sent and received.

> +            if (strcmp(opaque_str, needle) == 0) {
> +                return libxl__json_object_get_integer(fdset_id);
> +            }
> +        }
> +    }
> +    rc = ERROR_NOTFOUND;
> +
> + out:
> +    return rc;
> +}
> +
>  typedef struct {
>      libxl__ao *ao;
> +    libxl__ao_device aodev;
>      libxl_domid domid;
> +    libxl_domid disk_domid;
>      libxl_device_disk *disk;
>      libxl_device_disk disk_saved;
>      libxl__ev_slowlock qmp_lock;
>      int dm_ver;
>      libxl__ev_time time;
> +    libxl__ev_time timeout_retry;

`timeout_retry` sounds to me that we are adding a timeout for a retry,
but it is used the opposite way, as a timer to wait until we retry. How
about naming this filed "retry_timer" instead?

Ah, I see you've added a similar field named "timeout_retries" in
libxl_pci.c in the past, but I did introduce a "retry_timer" field in
that same file before. So either is fine even if I've got a preference.

>      libxl__ev_qmp qmp;
> +    int retries;
> +    int stubdom_fdset;
>  } libxl__cdrom_insert_state;
>  
>  static void cdrom_insert_lock_acquired(libxl__egc *, libxl__ev_slowlock *,
>                                         int rc);
>  static void cdrom_insert_qmp_connected(libxl__egc *, libxl__ev_qmp *,
>                                         const libxl__json_object *, int rc);
> +static void cdrom_insert_stubdom_query_fdset_rm(libxl__egc *egc,
> +                                                libxl__ev_qmp *qmp,
> +                                                const libxl__json_object *resp,
> +                                                int rc);
> +static void cdrom_insert_stubdom_parse_fdset_rm(libxl__egc *egc,
> +                                                libxl__ev_qmp *qmp,
> +                                                const libxl__json_object *resp,
> +                                                int rc);
> +static void cdrom_insert_stubdom_ejected(libxl__egc *egc, libxl__ev_qmp *,
> +                                         const libxl__json_object *, int rc);
> +static void cdrom_insert_stubdom_disk_remove_cb(libxl__egc *egc,
> +                                                 libxl__ao_device *aodev);
> +static void cdrom_insert_stubdom_disk_add_cb(libxl__egc *egc,
> +                                             libxl__ao_device *aodev);
> +static void cdrom_insert_stubdom_query_fdset(libxl__egc *egc,
> +                                             libxl__ev_time *ev,
> +                                             const struct timeval *abs,
> +                                             int rc);
> +static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
> +                                             libxl__ev_qmp *qmp,
> +                                             const libxl__json_object *response,
> +                                             int rc);
>  static void cdrom_insert_ejected(libxl__egc *egc, libxl__ev_qmp *,
>                                   const libxl__json_object *, int rc);
>  static void cdrom_insert_addfd_cb(libxl__egc *egc, libxl__ev_qmp *,
> @@ -865,6 +966,7 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
>      libxl_device_disk *disks = NULL;
>      int rc;
>      libxl__cdrom_insert_state *cis;
> +    libxl_domid stubdomid;
>  
>      GCNEW(cis);
>      cis->ao = ao;
> @@ -876,6 +978,8 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
>      cis->qmp_lock.ao = ao;
>      cis->qmp_lock.domid = domid;
>      libxl__ev_time_init(&cis->time);
> +    libxl__ev_time_init(&cis->timeout_retry);
> +    cis->retries = 0;

Could you initialise `stubdom_fdset` as well? It's looks like it's
possible to have an fdset==0, so initialising it to -1 would be helpful.

(And technically, retries is already init to 0, because GCNEW() fill do
that for us, by using zallloc.)

>      libxl__ev_qmp_init(&cis->qmp);
>      cis->qmp.ao = ao;
>      cis->qmp.domid = domid;
> @@ -1002,6 +1120,224 @@ out:
>      cdrom_insert_done(egc, cis, rc); /* must be last */
>  }
>  
> +static void cdrom_insert_stubdom_query_fdset_rm(libxl__egc *egc,
> +                                                libxl__ev_qmp *qmp,
> +                                                const libxl__json_object *resp,
> +                                                int rc)
> +{
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
> +    STATE_AO_GC(cis->ao);

It doesn't looks like we need to call STATE_AO_GC() here, nothing uses
an `ao` or a `gc`, and nothing needs an allocation that needs to exist
after this function returns.

> +    if (rc) goto out;
> +
> +    /* Only called for qemu-xen/linux stubdom. */
> +    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> +
> +    cis->qmp.callback = cdrom_insert_stubdom_parse_fdset_rm;
> +
> +    rc = libxl__ev_qmp_send(egc, &cis->qmp, "query-fdsets", NULL);
> +    if (rc) goto out;
> +
> +    return;
> +
> + out:
> +    cdrom_insert_done(egc, cis, rc); /* must be last */
> +}
> +
> +static void cdrom_insert_stubdom_parse_fdset_rm(libxl__egc *egc,
> +                                                libxl__ev_qmp *qmp,
> +                                                const libxl__json_object *resp,
> +                                                int rc)
> +{
> +    EGC_GC;
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
> +    int devid;
> +    int fdset;
> +
> +    if (rc) goto out;
> +
> +    /* Only called for qemu-xen/linux stubdom. */
> +    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> +
> +    devid = libxl__device_disk_dev_number(cis->disk->vdev, NULL, NULL);
> +    fdset = query_fdsets_find_fdset(gc, resp, devid);
> +    if (fdset >= 0) goto found;

Could you try to reorder the function to avoid this goto? It's fine to
have goto for the out/error path because you can write one exit path for
the function, but otherwise, I think it's rare that goto make the code
easier to understand.

> +    if (fdset != ERROR_NOTFOUND) {
> +        rc = fdset;
> +        goto out;
> +    }
> +
> +    LOGD(DEBUG, cis->domid, "No fdset found - skipping remove-fd");
> +    cdrom_insert_stubdom_ejected(egc, qmp, resp, 0);
> +
> +    return;
> +
> + found:
> +    cis->stubdom_fdset = fdset;

Is this value in `cis->stubdom_fdset` used anywhere? We are calling
"remove-fd" on it so I don't think we are going to use it. So better not
to keep it.

> +    LOGD(DEBUG, cis->domid, "Found fdset %d", cis->stubdom_fdset);
> +
> +    libxl__json_object *args = NULL;
> +
> +    libxl__qmp_param_add_integer(gc, &args, "fdset-id", cis->stubdom_fdset);
> +
> +    cis->qmp.callback = cdrom_insert_stubdom_ejected;
> +
> +    rc = libxl__ev_qmp_send(egc, &cis->qmp, "remove-fd", args);
> +    if (rc) goto out;
> +
> +    return;
> +
> + out:
> +    cdrom_insert_done(egc, cis, rc); /* must be last */
> +}
> +
> +static void cdrom_insert_stubdom_disk_add_cb(libxl__egc *egc,
> +                                             libxl__ao_device *aodev)
> +{
> +    EGC_GC;
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(aodev, *cis, aodev);
> +
> +    if (aodev->rc) {
> +        LOGD(ERROR, aodev->dev->domid, "Unable to insert stubdom PV disk id %u",
> +             aodev->dev->devid);
> +        goto out;
> +    }
> +
> +    cdrom_insert_stubdom_query_fdset(egc, &cis->timeout_retry, NULL, aodev->rc);

Last parameter here could just be ERROR_TIMEDOUT, as this would be the
expected rc by the function anyway. And `aodev->rc` should be 0 here
anyway.

> +    return;
> +
> + out:
> +    cdrom_insert_done(egc, cis, aodev->rc);
> +}
> +
> +static void cdrom_insert_stubdom_query_fdset(libxl__egc *egc,
> +                                             libxl__ev_time *ev,
> +                                             const struct timeval *abs,
> +                                             int rc)
> +{
> +    EGC_GC;
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(ev, *cis, timeout_retry);
> +
> +    /* When called as an ev_time callback, rc will be ERROR_TIMEDOUT.*/

This comment isn't really useful. Also, we could just rewrite the error
check to expect ERROR_TIMEDOUT, or it's an error.

Looking at libxl__ev_time_callback typedef in libxl_internal.c, the only
value `rc` should have are ERROR_TIMEDOUT or ERROR_ABORTED.

> +    if (rc && rc != ERROR_TIMEDOUT) goto out;
> +
> +    /* Only called for qemu-xen/linux stubdom. */
> +    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> +
> +    cis->qmp.callback = cdrom_insert_stubdom_parse_fdset;
> +
> +    rc = libxl__ev_qmp_send(egc, &cis->qmp, "query-fdsets", NULL);
> +    if (rc) goto out;
> +
> +    return;
> +
> + out:
> +    cdrom_insert_done(egc, cis, rc); /* must be last */
> +}
> +
> +static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
> +                                             libxl__ev_qmp *qmp,
> +                                             const libxl__json_object *response,
> +                                             int rc)
> +{
> +    EGC_GC;
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
> +    int devid;
> +    int fdset;
> +
> +    if (rc) goto out;
> +
> +    /* Only called for qemu-xen/linux stubdom. */
> +    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> +
> +    devid = libxl__device_disk_dev_number(cis->disk->vdev, NULL, NULL);
> +    fdset = query_fdsets_find_fdset(gc, response, devid);
> +    if (fdset >= 0) goto found;

Like before, would it be possible to rewrite the function without this
`goto found`?

> +    if (fdset != ERROR_NOTFOUND) {
> +        rc = fdset;
> +        goto out;
> +    }
> +
> +    if (cis->retries++ > 10) {

Looking at this number, and the retry timer set to 200ms, it looks like
libxl will wait for only about 2 second, is that enough? We could just
rely on the general cdrom insert timeout `cis->time`, or is that too
long?

> +        LOGD(DEBUG, cis->domid, "Out of query-fdsets retries");

It this useful? Also, an error message might be more useful, and an
error message that say something about stubdom not doing its part of the
job and libxl gave up waiting.

> +        rc = ERROR_TIMEDOUT;
> +        goto out;
> +    }
> +
> +    LOGD(DEBUG, cis->domid, "Scheduling query-fdsets retry %d", cis->retries);

That just going to spam the console, I don't think it's useful. We
already have logging about a "query-fdsets" command been ran.

> +    rc = libxl__ev_time_register_rel(cis->ao, &cis->timeout_retry,
> +                                     cdrom_insert_stubdom_query_fdset,
> +                                     200);
> +    if (rc) goto out;
> +
> +    return;
> +
> + found:
> +    cis->stubdom_fdset = fdset;
> +
> +    LOGD(DEBUG, cis->domid, "Found fdset %d", cis->stubdom_fdset);
> +    cdrom_insert_ejected(egc, &cis->qmp, NULL, rc);
> +    return;
> +
> + out:
> +    cdrom_insert_done(egc, cis, rc); /* must be last */
> +}
> +
>  static void cdrom_insert_ejected(libxl__egc *egc,
>                                   libxl__ev_qmp *qmp,
>                                   const libxl__json_object *response,
> @@ -1081,10 +1417,13 @@ static void cdrom_insert_ejected(libxl__egc *egc,
>      rc = libxl__dm_check_start(gc, &d_config, domid);
>      if (rc) goto out;
>  
> +    /* A linux stubdom will perform add-fd with calculated stubdom_fdset. */

Left over comment?

>      if (cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN &&
> +        libxl_get_stubdom_id(CTX, cis->domid) == 0 &&
>          disk->format != LIBXL_DISK_FORMAT_EMPTY) {
>          libxl__json_object *args = NULL;
>  
> +        LOGD(DEBUG, cis->domid, "Doing QMP add-fd path");

I don't think this logging is useful.

>          assert(qmp->payload_fd == -1);
>          qmp->payload_fd = open(disk->pdev_path, O_RDONLY);
>          if (qmp->payload_fd < 0) {
> @@ -1094,7 +1433,11 @@ static void cdrom_insert_ejected(libxl__egc *egc,
>              goto out;
>          }
>  
> -        /* This free form parameter is not use by QEMU or libxl. */
> +        /*
> +         * This free form parameter is not used by QEMU or non-stubdom libxl.
> +         * For a linux stubdom, opaque is set to "stub-devid:$devid" to
> +         * identify the fdset.
> +         */

Nothing is going to use this particular "opaque" value, right? The
comment say that for stubdom, the value is set to a particular value,
but it's not done so here. A comment about "stub-devid:$devid" might be
useful in query_fdsets_find_fdset(), but not here.

>          QMP_PARAMETERS_SPRINTF(&args, "opaque", "%s:%s",
>                                 libxl_disk_format_to_string(disk->format),
>                                 disk->pdev_path);
> @@ -1103,6 +1446,7 @@ static void cdrom_insert_ejected(libxl__egc *egc,
>          if (rc) goto out;
>          has_callback = true;
>      } else {
> +        LOGD(DEBUG, cis->domid, "Skipping QMP add-fd path");

I think we can found out about that because "add-fd" isn't called. It
doesn't feel like a useful logging.

>          has_callback = false;
>      }
>  
> @@ -1115,8 +1459,16 @@ out:
>      if (rc) {
>          cdrom_insert_done(egc, cis, rc); /* must be last */
>      } else if (!has_callback) {
> -        /* Only called if no asynchronous callback are set. */

This comment should still apply, even if we run for a stubdom,
otherwise, `has_callback` is badly named.

> -        cdrom_insert_inserted(egc, qmp, NULL, 0); /* must be last */
> +        if (libxl_get_stubdom_id(CTX, cis->domid) &&
> +            disk->format != LIBXL_DISK_FORMAT_EMPTY) {
> +            LOGD(DEBUG, cis->domid,
> +                 "stubdom %d needs to perform add-fd internally",
> +                 libxl_get_stubdom_id(CTX, cis->domid));
> +            cdrom_insert_addfd_cb(egc, qmp, NULL, 0); /* must be last */
> +        } else  {
> +            /* Only called if no asynchronous callback are set. */
> +            cdrom_insert_inserted(egc, qmp, NULL, 0); /* must be last */
> +        }
>      }
>  }
>  
> @@ -1135,17 +1487,22 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
>      /* convenience aliases */
>      libxl_device_disk *disk = cis->disk;
>  
> -    close(qmp->payload_fd);
> -    qmp->payload_fd = -1;

I think I'd rather keep this here, before the error check. Just call
close() conditionally on the value of payload_fd? The thing is, if
payload_fd is still set, libxl__ev_qmp* is going to try to submit the fd
again, and closing the fd earlier is better.

>      if (rc) goto out;
>  
> -    o = libxl__json_map_get("fdset-id", response, JSON_INTEGER);
> -    if (!o) {
> -        rc = ERROR_FAIL;
> -        goto out;
> +    /* response non-NULL only for non-stubdom */
> +    if (response) {

I'm not comfortable with checking the value of `response` to find out if
we are on the linux stubdom path. It could be missing for other reason
(probably on programming error). There's `cis->stubdom_fdset` that
should have a correct value in the linux stubdom case, can we rely on
that instead? (Which also refer to why I asked early to init this field)

> +        close(qmp->payload_fd);
> +        qmp->payload_fd = -1;
> +
> +        o = libxl__json_map_get("fdset-id", response, JSON_INTEGER);
> +        if (!o) {
> +            rc = ERROR_FAIL;
> +            goto out;
> +        }
> +        fdset = libxl__json_object_get_integer(o);
> +    } else {
> +        fdset = cis->stubdom_fdset;
>      }
> -    fdset = libxl__json_object_get_integer(o);
>  
>      devid = libxl__device_disk_dev_number(disk->vdev, NULL, NULL);
>      qmp->callback = cdrom_insert_inserted;

Thanks,

-- 
Anthony PERARD


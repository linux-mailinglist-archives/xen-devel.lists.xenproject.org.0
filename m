Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091A7852F98
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 12:36:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679852.1057582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZr4o-00060A-TT; Tue, 13 Feb 2024 11:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679852.1057582; Tue, 13 Feb 2024 11:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZr4o-0005wy-Q3; Tue, 13 Feb 2024 11:35:50 +0000
Received: by outflank-mailman (input) for mailman id 679852;
 Tue, 13 Feb 2024 11:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnrE=JW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZr4n-0005wr-Ev
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:35:49 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07f686aa-ca64-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 12:35:47 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-561f8b8c058so732430a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:35:47 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 st10-20020a170907c08a00b00a3c5e6515d0sm1202894ejc.24.2024.02.13.03.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:35:46 -0800 (PST)
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
X-Inumbo-ID: 07f686aa-ca64-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707824147; x=1708428947; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UflNTsRNumGC6EKCakxsXONmRQPRfVLwHRKxdQ7Uasw=;
        b=LhPByerq4w9KIHi4FBH2UjLEO2W2ebqjSlgBYMMrqJy8U0Io9CF8ETIHz8F4S79W84
         kdhrchjNwMA2ACbsChEiH5nrtRulQefDo66SSqT4RTtO1I0kQsUZ7kbru6azbPqeXySn
         Mny+0qArMoN+ReT9IUTYblLmCze2sQ1yXxqiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824147; x=1708428947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UflNTsRNumGC6EKCakxsXONmRQPRfVLwHRKxdQ7Uasw=;
        b=Qg7dpao1DzuHpnHUgV2LOct2FdikhrZJ8bc+9TeN5o7RoIwte7JN1bW+E2D2mPurkM
         Ih3Jk4JOmmlU19KQEgyuaALWgE3m+Ft+Vh+9pZJJYD+SIPShnigFZ03a0esPE5cYlq7N
         Z5l0oPSpAZ0J0gxIWr6JuOVzxXcwZXvIKbWobcmP6C9vT0LteGh2WlOEH/phu6HPgdbf
         SHL2Fk3tR3lZP85QFOv5sPKmp7EGPw5mFW6l6zQghalPB5w390g6hnteZ1Rhsev2pby6
         WwVDFhqRa7qSuGVWqpMFwpuFo8hTKKucdyoOPl/tG+mhsSAnFr1VHD4i2K9XWaaw5pvw
         cvow==
X-Gm-Message-State: AOJu0YwUF6z915EFpIJrv+6EGnzF/vI7zOCKb2Z+yLBVR+inBTphBbwc
	zevOllIcy4oMP/n+ZvDdA8O8NwRjYj13+xKKzrSKhxEgBvTMDc99cky6QpqYpRk=
X-Google-Smtp-Source: AGHT+IFyCtpkFk8rlXxzlthUKOlmGfwl/2FIK71k6UD/iRyd7h7yu0CVCqNe7aiSJZIBbHnk3VgAhg==
X-Received: by 2002:a17:906:eb57:b0:a3d:20eb:1ee8 with SMTP id mc23-20020a170906eb5700b00a3d20eb1ee8mr122655ejb.2.1707824146907;
        Tue, 13 Feb 2024 03:35:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3o1s2Mw2xAHUVK1yPKXDz/wb3yK0/qKKBdbwYakl85/erl6/nbep4p25Z3l9fS4f6U3v3EUGrw0HMtZWum7yWtVjYFRbRiYLl+PTAvRbOAMGDSkLIQLx0b3GHHPTzDD1WTe0JPd4lfOeK8klB/3/IDC41qkayH8eM1I+N9BbnjHcyCgnmcbhKgWwPEQJHzsSNEbkzBSopSvgEW1le4Z27YE4+BUrDBYku0h+UXudIP3re1TEBw+3qwU/y6R1d4fw3IKeLERvo2/KHoIoaCcBc0JYi/VBoEn/u1TMG
Date: Tue, 13 Feb 2024 11:35:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 3/3] libxl: Enable stubdom cdrom changing
Message-ID: <ff5f5321-5cb2-4a39-9a68-d5465098a7ff@perard>
References: <20240201214004.238858-1-jandryuk@gmail.com>
 <20240201214004.238858-4-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201214004.238858-4-jandryuk@gmail.com>

On Thu, Feb 01, 2024 at 04:40:04PM -0500, Jason Andryuk wrote:
> To change the cd-rom medium, libxl will:
>  - QMP eject the medium from QEMU
>  - block-detach the old PV disk
>  - block-attach the new PV disk
>  - QMP change the medium to the new PV disk by fdset-id
> 
> The QMP code is reused, and remove and attach are implemented here.
> 
> The stubdom must internally handle adding /dev/xvdc to the appropriate
> fdset.  libxl in dom0 doesn't see the result of adding to the fdset as
> that is internal to the stubdom, so a delay and retries are added to
> around calling cdrom_insert_addfd_cb().

Why do you use "fdset" in linux stubdom, can't QEMU open /dev/xvdc
directly? And so why don't libxl tell QEMU to open /dev/xvdc?

I think the only reason I've implemented cd-insert via fdset in libxl
was because that was the only way to have libxl open a file on behalf of
QEMU when it's deprivileged and don't have access to any file. But that
doesn't mean we need to use an fdset with the stubdom.


And BTW, there's a "query-fdsets" command that could be used to findout
when and fdset is available, there's even an "opaque" field that could
be used to communicate which fdset to use instead of needing to rely on
a static fdset-id.

> For cd-eject, we still need to attach the empty vbd.  This is necessary
> since xenstore is used to determine that hdc exists.  Otherwise after
> eject, hdc would be gone and the cd-insert would fail to find the drive
> to insert new media.
> 
> The ERROR_JSON_CONFIG_EMPTY check in cdrom_insert_inserted() is because
> a stubdom don't have a json config.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> index 09082ffb58..6354982c05 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -905,6 +938,18 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
>          disk->format = LIBXL_DISK_FORMAT_EMPTY;
>      }
>  
> +#define STUBDOM_FDSET_CD 8000
> +    if (strncmp(disk->vdev, "hd", 2) == 0) {
> +        cis->stubdom_fdset = STUBDOM_FDSET_CD + disk->vdev[2] - 'a';
> +    } else if (strncmp(disk->vdev, "xvd", 3) == 0) {
> +        cis->stubdom_fdset = STUBDOM_FDSET_CD + disk->vdev[3] - 'a';

Currently, cd-rom eject/insert also works if one use "sdc", so we
probably want to check for "sd".

Also, you could use device_virtdisk_matches() like
libxl__device_disk_dev_number(). I'm not sure if having vdev been
something like "xvdaa" is going to work well, and that case isn't going
to produce the expected fdset. (Without the patch, "xvdaa" produce a
warning when trying to generate QEMU's command line, so maybe it's fine
to not handle this case.)

> +    } else {
> +        LOGD(ERROR, cis->domid, "disk->vdev \"%s\" isn't hdX or xvdY",
> +             disk->vdev);
> +        rc = ERROR_FAIL;
> +        goto out;
> +    }
> +
>  out:
>      libxl__device_list_free(&libxl__disk_devtype, disks, num);
>      if (rc) {
> @@ -923,6 +968,7 @@ static void cdrom_insert_lock_acquired(libxl__egc *egc,
>      libxl__cdrom_insert_state *cis = CONTAINER_OF(lock, *cis, qmp_lock);
>      STATE_AO_GC(cis->ao);
>  
> +    LOGD(DEBUG, cis->domid, "rc=%d", rc);

Left over debug logging? The new one in cdrom_insert_done() might be
enough? Also, I think libxl__ao_complete() does log this rc value as
well.

>      if (rc) goto out;
>  
>      rc = libxl__ev_time_register_rel(ao, &cis->time,


> +static void cdrom_insert_stubdom_ejected(libxl__egc *egc, libxl__ev_qmp *qmp,
> +                                         const libxl__json_object *response,
> +                                         int rc)
> +{
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
> +    libxl__device *device;
> +    STATE_AO_GC(cis->ao);
> +    domid_t stubdomid = libxl_get_stubdom_id(CTX, cis->domid);

cis->disk_domid?

> +
> +    LOGD(DEBUG, cis->domid, "rc=%d", rc);
> +    /* cis->stubdom_fdset is initially empty, so remove-fd fails the first
> +     * call with:
> +     * {"error": {"class": "GenericError",
> +     *            "desc": "File descriptor named 'fdset-id:8675' not found"}}
> +     * Carry on in that case. */
> +    if (rc && rc != ERROR_QMP_GENERIC_ERROR) goto out;
> +
> +    GCNEW(device);
> +    rc = libxl__device_from_disk(gc, stubdomid, cis->disk, device);
> +    if (rc != 0) goto out;

If (rc) is more common without "!= 0".


> +
> +    /* block dev eject */
> +    /* Below is basically an open coding of:
> +     * libxl_device_disk__remove(CTX, cis->domid, cis->disk, 0);

One too many '_'?

> +     * ...since we can't call it from within libxl.

Well, not exactly, we also need to set our own callback and own struct
here.

> +     */
> +    libxl__prepare_ao_device(ao, &cis->aodev_del);
> +    cis->aodev_del.action = LIBXL__DEVICE_ACTION_REMOVE;
> +    cis->aodev_del.dev = device;
> +    cis->aodev_del.callback = cdrom_insert_stubdom_disk_ejected_aocomplete;
> +    cis->aodev_del.force.flag = LIBXL__FORCE_OFF;
> +    libxl__initiate_device_generic_remove(egc, &cis->aodev_del);

It doesn't looks like you need an extra `aodev_del` field, and you can
probably reuse the same `aodev` field twice.

> +    return;
> +
> + out:
> +    cdrom_insert_done(egc, cis, rc); /* must be last */
> +}
> +
> +static void cdrom_insert_stubdom_disk_ejected_aocomplete(libxl__egc *egc,
> +                                                         libxl__ao_device *aodev)
> +{
> +    STATE_AO_GC(aodev->ao);
> +    libxl__cdrom_insert_state *cis = CONTAINER_OF(aodev, *cis, aodev_del);
> +
> +    LOGD(DEBUG, cis->domid, "rc=%d", aodev->rc);
> +    if (aodev->rc) {
> +        if (aodev->dev) {

I'm pretty sure "aodev->dev" should be set, so this if doesn't seems
needed.

> +            LOGD(ERROR, aodev->dev->domid, "Unable to %s %s with id %u",
> +                        libxl__device_action_to_string(aodev->action),

We already know the action is "remove".

> +                        libxl__device_kind_to_string(aodev->dev->kind),
> +                        aodev->dev->devid);

This whole message could be personalised to what we are trying to
achieve, that is, remove the cd-rom from the stubdomain.

> +        } else {
> +            LOG(ERROR, "unable to %s device",
> +                       libxl__device_action_to_string(aodev->action));
> +        }
> +        goto out;
> +    }
> +
> +    cdrom_insert_stubdom_disk_ejected(egc, &cis->qmp, NULL, aodev->rc);
> +    return;
> +
> + out:
> +    cdrom_insert_done(egc, cis, aodev->rc);
> +}
> +
> +static void cdrom_insert_stubdom_disk_ejected(libxl__egc *egc,
> +                                              libxl__ev_qmp *qmp,
> +                                              const libxl__json_object *response,
> +                                              int rc)

This functions prototype looks like a ev_qmp callback but it's never
used like that. Also, it could be merged into the previous function.


>  static void cdrom_insert_inserted(libxl__egc *egc,
>                                    libxl__ev_qmp *qmp,
>                                    const libxl__json_object *response,
>                                    int rc)
>  {
> -    EGC_GC;
>      libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
> +    STATE_AO_GC(cis->ao);

Why do you replace EGC_GC by AO_GC ? Is there an allocation that need to
last longer in the current function? If it's just to have "ao" in the
current scope, you can use "cis->ao" below.

>      libxl__flock *data_lock = NULL;
>      libxl_domain_config d_config;
>      flexarray_t *insert = NULL;
> @@ -1171,9 +1401,22 @@ static void cdrom_insert_inserted(libxl__egc *egc,
>  
>      libxl_domain_config_init(&d_config);
>  
> -    if (rc) goto out;
> +    LOGD(DEBUG, cis->domid, "rc=%d", rc);
> +
> +    if (rc) {
> +        if (cis->retries++ < 10 ) {
> +            LOGD(DEBUG, qmp->domid, "Retrying QMP cdrom change\n");
> +            rc = libxl__ev_time_register_rel(ao, &cis->timeout_retry,
> +                                             cdrom_insert_addfd_retry, 100);
> +            if (rc) goto out;
>  
> -    rc = libxl__device_from_disk(gc, domid, disk, &device);
> +            return;
> +        } else {
> +            goto out;
> +        }
> +    }
> +
> +    rc = libxl__device_from_disk(gc, cis->disk_domid, disk, &device);
>      if (rc) goto out;
>      be_path = libxl__device_backend_path(gc, &device);
>      libxl_path = libxl__device_libxl_path(gc, &device);
> @@ -1257,7 +1500,10 @@ static void cdrom_insert_done(libxl__egc *egc,
>  {
>      EGC_GC;
>  
> +    LOGD(DEBUG, cis->domid, "rc=%d", rc);

I don't think this is useful because libxl__ao_complete() will print rc
as well.

>      libxl__ev_time_deregister(gc, &cis->time);
> +    libxl__ev_time_deregister(gc, &cis->timeout_retry);
>      libxl__ev_qmp_dispose(gc, &cis->qmp);
>      if (cis->qmp.payload_fd >= 0) close(cis->qmp.payload_fd);
>      libxl__ev_slowlock_unlock(gc, &cis->qmp_lock);

-- 
Anthony PERARD


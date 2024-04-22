Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC368AD210
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 18:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710129.1109195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rywhB-0003Zy-69; Mon, 22 Apr 2024 16:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710129.1109195; Mon, 22 Apr 2024 16:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rywhB-0003Wy-1b; Mon, 22 Apr 2024 16:39:09 +0000
Received: by outflank-mailman (input) for mailman id 710129;
 Mon, 22 Apr 2024 16:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rywh9-00038T-Io
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 16:39:07 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5646bff-00c6-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 18:39:05 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41a523e2888so8679745e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 09:39:05 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b0041a81cd9e94sm2248386wmo.13.2024.04.22.09.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:39:04 -0700 (PDT)
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
X-Inumbo-ID: d5646bff-00c6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713803945; x=1714408745; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rcIRQC7r/MzYV1RXyTlj9R1kBJ/7AIy5VEN+YfixeLo=;
        b=Cudtek5tUyQzWtV7ingRd5HLF3/LhtTU45MtbJ25jueXYSwAupgNxxyN3ZQiHf+9sJ
         +Rl8mq2mKfElc57N1pCCxSx4KTs/KQ9UyWM5M7r1tXgy7rM6aASirT3Y/SBK7LxZpEbs
         z8VM9SZyPsVNrCNUzW4X+D95I38HbbCmr3hvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713803945; x=1714408745;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcIRQC7r/MzYV1RXyTlj9R1kBJ/7AIy5VEN+YfixeLo=;
        b=Yavcbl923P+fD5w+fl7LEYCiciZRdNPdm+BjPJwQumm9ufLHzZse09KP3qtlhm+XvW
         TRCDdWoQvV40KoIRkgERr3XaGa7Lr2RgvBfRa/5yoPsTfAth6Zw34PqdnRnBvO5pmO2W
         5UllOBx/Pmc1mvG1XLTwQojmG3mKw+t7A+C0fSHQr4EjjEjM2nQTeXas3zpsTVWfJACd
         PD0BrbI3LxjlKxjw7RN+copSisqFK0NTXMajLqvaz6977dMPMiB9ewAAUkwsCrPUVz/x
         F/eBQLXsRi1gkDFwiZfrgUywVBHZ1atAvfyrmz5dhlo7jCPit7+zzbHdQUlLLTCmYJdi
         51BQ==
X-Gm-Message-State: AOJu0YxYD9L5wXO3LKEd6WRgRFo2yqjIaCIcuREjaeyKkrBY+/1Eo/+L
	N9hbsvFOlkgb22oRht3gSfK3djFkZmYxq/r13JhSVqGbFCUhrb8jRb7mAjgvrRQ=
X-Google-Smtp-Source: AGHT+IFo2/KVxI7TI5nijf2FW7OAv0BkKC3gloRNEFR+phEwlrd+ESxVnsJy3+HPsVResI+0SVwSrA==
X-Received: by 2002:a05:600c:b85:b0:41a:5de5:85f2 with SMTP id fl5-20020a05600c0b8500b0041a5de585f2mr2388521wmb.39.1713803944990;
        Mon, 22 Apr 2024 09:39:04 -0700 (PDT)
Date: Mon, 22 Apr 2024 17:39:03 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v2 1/2] libs/light: add device model start timeout
 env var
Message-ID: <86e7327e-0a3c-4e50-bd62-720e986efdaa@perard>
References: <cover.1712837961.git.manos.pitsidianakis@linaro.org>
 <334b5a46e31dbf3e8114e9ea8bafd92cf060f2af.1712837961.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <334b5a46e31dbf3e8114e9ea8bafd92cf060f2af.1712837961.git.manos.pitsidianakis@linaro.org>

On Thu, Apr 11, 2024 at 03:28:19PM +0300, Manos Pitsidianakis wrote:
> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> index bed8393473..c159877094 100644
> --- a/docs/man/xl.1.pod.in
> +++ b/docs/man/xl.1.pod.in
> @@ -1993,6 +1993,17 @@ Otherwise the build time default in LIBXL_BOOTLOADER_TIMEOUT will be used.
>  If defined the value must be an unsigned integer between 0 and INT_MAX,
>  otherwise behavior is undefined.  Setting to 0 disables the timeout.

I don't think a value of "0" would disable timeouts, did you try?
It's more likely that the timeout will fire immediately. I'll had some
comment later about this on case-by-case basis.

>  
> +=item LIBXL_DEVICE_MODEL_START_TIMEOUT
> +
> +Timeout in seconds for starting the device model process. Useful in case the
> +device model takes an unusual amount of time to start— for example in case of

Could you use only ASCII characters,               here ^
It's looks like it's the first UTF-8 chr in this document, and we can do
without it. I just want to avoid find out later that something break
because of that chr.

> +very slow I/O, in case of slow performance due to memory sanitizer usage, etc.
> +
> +If undefined, the default hard-coded value of 60 seconds is used.
> +
> +If defined, the value must be an unsigned integer between 0 and INT_MAX,
> +otherwise behaviour is undefined.  Setting the value to 0 disables the timeout.
> +
>  =back
>  
>  =head1 SEE ALSO
> diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
> index 48f894f070..950a464b45 100644
> --- a/tools/libs/light/libxl_9pfs.c
> +++ b/tools/libs/light/libxl_9pfs.c
> @@ -132,7 +132,7 @@ static int xen9pfsd_spawn(libxl__egc *egc, uint32_t domid, libxl_device_p9 *p9,
>      aop9->spawn.ao = aodev->ao;
>      aop9->spawn.what = "xen-9pfs daemon";
>      aop9->spawn.xspath = GCSPRINTF("%s/state", path);
> -    aop9->spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
> +    aop9->spawn.timeout_ms = __libxl_device_model_start_timeout() * 1000;

So this value is going to be used by libxl__spawn_spawn() then
libxl__xswait_start(), and it's looks like a timeout of "0" will have
the timeout fire immediately. Instead, a value of "-1" might disable the
timeout, but I don't know how well it would work without a timeout.

Timeout is setup with libxl__ev_time_register_rel().

>      aop9->spawn.pidpath = GCSPRINTF("%s/pid", path);
>      aop9->spawn.midproc_cb = libxl__spawn_record_pid;
>      aop9->spawn.confirm_cb = xen9pfsd_confirm;
> diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
> index 6f0100d05e..452e55ba23 100644
> --- a/tools/libs/light/libxl_device.c
> +++ b/tools/libs/light/libxl_device.c
> @@ -1436,7 +1436,7 @@ int libxl__wait_for_device_model_deprecated(libxl__gc *gc,
>  
>      path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
>      return libxl__xenstore_child_wait_deprecated(gc, domid,
> -                                     LIBXL_DEVICE_MODEL_START_TIMEOUT,
> +                                     __libxl_device_model_start_timeout(),

This function will return an error immediately, without trying, with a
timeout of "0", and "-1" isn't an option (well I guess it might be
INT_MAX because it an unsigned value).

>                                       "Device Model", path, state, spawning,
>                                       check_callback, check_callback_userdata);
>  }
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 0b03a7c747..4369fef161 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2629,7 +2629,7 @@ static void spawn_qmp_proxy(libxl__egc *egc,
>      sdss->qmp_proxy_spawn.pidpath = GCSPRINTF("%s/image/qmp-proxy-pid", dom_path);
>      sdss->qmp_proxy_spawn.xspath = DEVICE_MODEL_XS_PATH(gc, LIBXL_TOOLSTACK_DOMID,
>                                                          dm_domid, "/qmp-proxy-state");
> -    sdss->qmp_proxy_spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
> +    sdss->qmp_proxy_spawn.timeout_ms = __libxl_device_model_start_timeout() * 1000;

That's used by libxl__spawn_spawn(). Already commented on it.

>      sdss->qmp_proxy_spawn.midproc_cb = libxl__spawn_record_pid;
>      sdss->qmp_proxy_spawn.confirm_cb = qmp_proxy_confirm;
>      sdss->qmp_proxy_spawn.failure_cb = qmp_proxy_startup_failed;
> @@ -3011,7 +3011,7 @@ retry_transaction:
>      spawn->what = GCSPRINTF("domain %d device model", domid);
>      spawn->xspath = DEVICE_MODEL_XS_PATH(gc, LIBXL_TOOLSTACK_DOMID, domid,
>                                           "/state");
> -    spawn->timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
> +    spawn->timeout_ms = __libxl_device_model_start_timeout() * 1000;

That's used by libxl__spawn_spawn(). Already commented on it.

>      spawn->pidpath = GCSPRINTF("%s/image/device-model-pid", dom_path);
>      spawn->midproc_cb = libxl__spawn_record_pid;
>      spawn->confirm_cb = device_model_confirm;
> @@ -3435,7 +3435,7 @@ void libxl__spawn_qdisk_backend(libxl__egc *egc, libxl__dm_spawn_state *dmss)
>  
>      dmss->spawn.what = GCSPRINTF("domain %u Qdisk backend", domid);
>      dmss->spawn.xspath = GCSPRINTF("device-model/%u/state", domid);
> -    dmss->spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
> +    dmss->spawn.timeout_ms = __libxl_device_model_start_timeout() * 1000;

That's used by libxl__spawn_spawn(). Already commented on it.

>      /*
>       * We cannot save Qemu pid anywhere in the xenstore guest dir,
>       * because we will call this from unprivileged driver domains,
> diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
> index 6091a5f3f6..29e51f6c40 100644
> --- a/tools/libs/light/libxl_dom_suspend.c
> +++ b/tools/libs/light/libxl_dom_suspend.c
> @@ -517,7 +517,7 @@ void libxl__dm_resume(libxl__egc *egc,
>      rc = libxl__ev_time_register_rel(dmrs->ao,
>                                       &dmrs->time,
>                                       dm_resume_timeout,
> -                                     LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000);
> +                                     __libxl_device_model_start_timeout() * 1000);

libxl__ev_time_register_rel() just setup a timer, and I think with a
timeout of 0, dm_resume_timeout() would be call immediately as soon as
the current function returns, resulting in a failure.

>      if (rc) goto out;
>  
>      switch (libxl__device_model_version_running(gc, domid)) {
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index 803dbc1a03..684390f822 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -97,6 +97,12 @@
>  /* QEMU may be slow to load and start due to a bug in Linux where the I/O
>   * subsystem sometime produce high latency under load. */
>  #define LIBXL_DEVICE_MODEL_START_TIMEOUT 60
> +static inline int __libxl_device_model_start_timeout(void)

Could you rename that function? Probably:
    libxl__device_model_start_timeout()

No leading '_', this is usually reserved, by glibc or C, I forgot the
details.

Also, internal libxl function have two '_', so full prefix is "libxl__".


> +{
> +  const char *timeout_env = getenv("LIBXL_DEVICE_MODEL_START_TIMEOUT");
> +  return timeout_env ? atoi(timeout_env)

That usage of atoi() isn't good, because on conversion error, 0 is
returned, which disable the timeout. I would rather fallback when we
don't have a number.

One case that might be more problematic than other might be:
    LIBXL_DEVICE_MODEL_START_TIMEOUT= xl create
I think we would have a timeout of 0, instead of a fallback to the
default.

> +    : LIBXL_DEVICE_MODEL_START_TIMEOUT;
> +}
>  #define LIBXL_DEVICE_MODEL_SAVE_FILE XEN_LIB_DIR "/qemu-save" /* .$domid */
>  #define LIBXL_DEVICE_MODEL_RESTORE_FILE XEN_LIB_DIR "/qemu-resume" /* .$domid */
>  #define LIBXL_QMP_CMD_TIMEOUT 10
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 96cb4da079..7bdd9f6c3b 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1157,7 +1157,7 @@ static void do_pci_add(libxl__egc *egc,
>                  pas->xswait.what = "Device Model";
>                  pas->xswait.path = DEVICE_MODEL_XS_PATH(gc,
>                      libxl_get_stubdom_id(CTX, domid), domid, "/state");
> -                pas->xswait.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
> +                pas->xswait.timeout_ms = __libxl_device_model_start_timeout() * 1000;

That used by libxl__xswait_start(), and "0" seems to result in a
failure.

>                  pas->xswait.callback = pci_add_qemu_trad_watch_state_cb;
>                  rc = libxl__xswait_start(gc, &pas->xswait);
>                  if (rc) goto out;
> @@ -1719,7 +1719,7 @@ static void device_pci_add_stubdom_wait(libxl__egc *egc,
>      rc = libxl__ev_devstate_wait(ao, &pas->pciback_ds,
>              device_pci_add_stubdom_ready,
>              state_path, XenbusStateConnected,
> -            LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000);
> +            __libxl_device_model_start_timeout() * 1000);

That value will be use by libxl__xswait_start().

>      if (rc) goto out;
>      return;
>  out:
> @@ -1976,7 +1976,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
>              prs->xswait.what = "Device Model";
>              prs->xswait.path = DEVICE_MODEL_XS_PATH(gc,
>                  libxl_get_stubdom_id(CTX, domid), domid, "/state");
> -            prs->xswait.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
> +            prs->xswait.timeout_ms = __libxl_device_model_start_timeout() * 1000;

That value will be use by libxl__xswait_start().

>              prs->xswait.callback = pci_remove_qemu_trad_watch_state_cb;
>              rc = libxl__xswait_start(gc, &prs->xswait);
>              if (rc) goto out_fail;

So, overall, I'm fine with been able to change the timeout via env var,
but disabling the timeout might not be easy or possible, even if "-1"
might be an option, or -1000 in most case.

So, you change the man page to only allow value>0 ? And a timeout of 0
might be best to revert to the default.

Thanks,

-- 
Anthony PERARD


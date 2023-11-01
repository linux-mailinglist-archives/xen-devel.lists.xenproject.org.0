Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA1E7DE65A
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 20:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626627.977054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGmg-0006RK-Up; Wed, 01 Nov 2023 19:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626627.977054; Wed, 01 Nov 2023 19:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGmg-0006OD-S6; Wed, 01 Nov 2023 19:21:46 +0000
Received: by outflank-mailman (input) for mailman id 626627;
 Wed, 01 Nov 2023 19:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8ij=GO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qyGme-000558-RR
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 19:21:44 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3dc3a3a-78eb-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 20:21:43 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5431614d90eso202267a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Nov 2023 12:21:43 -0700 (PDT)
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
X-Inumbo-ID: e3dc3a3a-78eb-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698866502; x=1699471302; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM6NSJbEOt/BWPfPXXP/ZRQsx7UC5F6txXiOpzlIsus=;
        b=jh6NYUwqd4xqHVByD39ukbUai0yy3b+pP0JYzddCDk1zygr1bCn6YVjwcItF7VrZ3+
         lWqQofIh54leW4jwTitSNry6d4q/MJDPAhl8l/HoSlC0Dxlg0HoqjToJYKVEmk0o94H2
         eKzIzYBya0XbrqjgNEKvE48oXYqwELqFFnXjGPJflgx+BYNh1Wlt3HaxP3qfvVotJxW/
         Xemax0QHKlULbEsCxRReXRh5c3kP0D0fKGp8Zoym1XwQICL/vnt2B1ld4hza1TDi6SXj
         iuPzQpaF0Yu9vO4brfh4RMEID9cUx1P2YrSBm1r+XeDYGdUMb7/BYck0oHD5Xx3RMB3i
         LeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698866502; x=1699471302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PM6NSJbEOt/BWPfPXXP/ZRQsx7UC5F6txXiOpzlIsus=;
        b=RsS/7RNQZzwB+8pkMwcA6StTB1g6WBKYWbZHnzmuU+SrANgWV9b7lrxjwO8RtBqh/+
         sTBHXkDfjQOam5CmAVU9bJ72xB+bmhNshPND+D2sSKW7VFR+K5SJepT1n40dTOG8xELP
         DChLFMzyNOVVmbhrpp9rUMvNLUecoRm0Jen0i5UwIWkKQeQXBslEXLb+pSSuuq8F5286
         6MJHZlUBHFFW9xW3HXZI6RuYMPDlQSFGxEVuv2Ua4e46yu6GEyqYXirxP0mGwv7xFrHG
         vjYgQmYQy4U1suJqAeC0JUmQWaHVWKNs4mEgdSKdDjXeiEZdq1/O2L8LMtOwYAZVA8aT
         YNNA==
X-Gm-Message-State: AOJu0YxHycWerCtpbVb67l9+fHDrFpg3UwOP6hvIzGx48DUgN46qfkdF
	RvDyLc9mRgpn4ifwfEjd6NAkR/a7hmGTa2Hw24LugH2AxIM=
X-Google-Smtp-Source: AGHT+IHEcOa31KFeqYTGei+JGVgjKavwUcDjmUd7n6zhdQJX9pieWlPPP2XGb2hfQ4Fnd1xeUkXZf+su5NhZA5x1TV0=
X-Received: by 2002:a50:8d12:0:b0:543:5886:71c3 with SMTP id
 s18-20020a508d12000000b00543588671c3mr5141648eds.25.1698866502340; Wed, 01
 Nov 2023 12:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-4-jgross@suse.com>
In-Reply-To: <20231101093325.30302-4-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 1 Nov 2023 15:21:29 -0400
Message-ID: <CAKf6xptkUPBSTsij=CAWaiYxTCtGH4zpZWiLuvb=teX3i_sjrA@mail.gmail.com>
Subject: Re: [PATCH 03/29] tools/xenlogd: connect to frontend
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:34=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the code for connecting to frontends to xenlogd.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

> diff --git a/tools/xenlogd/xenlogd.c b/tools/xenlogd/xenlogd.c
> index 792d1026a3..da0a09a122 100644
> --- a/tools/xenlogd/xenlogd.c
> +++ b/tools/xenlogd/xenlogd.c

> +static void connect_device(device *device)
> +{
> +    unsigned int val;
> +    xenevtchn_port_or_error_t evtchn;
1.> +
> +    val =3D read_frontend_node_uint(device, "version", 0);
> +    if ( val !=3D 1 )
> +        return connect_err(device, "frontend specifies illegal version")=
;
> +    val =3D read_frontend_node_uint(device, "num-rings", 0);
> +    if ( val !=3D 1 )
> +        return connect_err(device, "frontend specifies illegal ring numb=
er");

Linux uses 2 rings (XEN_9PFS_NUM_RINGS), and it doesn't connect when
max-rings is less than that.

max_rings =3D xenbus_read_unsigned(dev->otherend, "max-rings", 0);
if (max_rings < XEN_9PFS_NUM_RINGS)
    return -EINVAL;

new_device() writes max-rings as 1.  So this works for mini-os, but
not Linux.  I'm not requesting you to change it - just noting it.

> +
> +    val =3D read_frontend_node_uint(device, "event-channel-0", 0);
> +    if ( val =3D=3D 0 )
> +        return connect_err(device, "frontend specifies illegal evtchn");
> +    evtchn =3D xenevtchn_bind_interdomain(xe, device->domid, val);
> +    if ( evtchn < 0 )
> +        return connect_err(device, "could not bind to event channel");
> +    device->evtchn =3D evtchn;
> +
> +    val =3D read_frontend_node_uint(device, "ring-ref0", 0);
> +    if ( val =3D=3D 0 )
> +        return connect_err(device, "frontend specifies illegal grant for=
 ring");
> +    device->intf =3D xengnttab_map_grant_ref(xg, device->domid, val,
> +                                           PROT_READ | PROT_WRITE);
> +    if ( !device->intf )
> +        return connect_err(device, "could not map interface page");
> +    device->ring_order =3D device->intf->ring_order;
> +    if ( device->ring_order > 9 || device->ring_order < 1 )
> +        return connect_err(device, "frontend specifies illegal ring orde=
r");
> +    device->ring_size =3D XEN_FLEX_RING_SIZE(device->ring_order);
> +    device->data.in =3D xengnttab_map_domain_grant_refs(xg,
> +                                                      1 << device->ring_=
order,
> +                                                      device->domid,
> +                                                      device->intf->ref,
> +                                                      PROT_READ | PROT_W=
RITE);
> +    if ( !device->data.in )
> +        return connect_err(device, "could not map ring pages");
> +    device->data.out =3D device->data.in + device->ring_size;
> +
> +    if ( pthread_create(&device->thread, NULL, io_thread, device) )
> +       return connect_err(device, "could not start I/O thread");
> +    device->thread_active =3D true;
> +
> +    write_backend_state(device, XenbusStateConnected);
> +}
> +

> @@ -122,6 +669,11 @@ int main(int argc, char *argv[])
>      int syslog_mask =3D LOG_MASK(LOG_WARNING) | LOG_MASK(LOG_ERR) |
>                        LOG_MASK(LOG_CRIT) | LOG_MASK(LOG_ALERT) |
>                        LOG_MASK(LOG_EMERG);
> +    char **watch;
> +    struct pollfd p[2] =3D {
> +        { .events =3D POLLIN, .revents =3D POLLIN },

Are you intentionally setting revents to enter the loop initially?
Shouldn't the watch registration trigger it to fire anyway?

> +        { .events =3D POLLIN }
> +    };
>
>      umask(027);
>      if ( getenv("XENLOGD_VERBOSE") )
> @@ -134,9 +686,26 @@ int main(int argc, char *argv[])
>
>      xen_connect();
>
> +    if ( !xs_watch(xs, "backend/xen_9pfs", "main") )
> +        do_err("xs_watch() in main thread failed");
> +    p[0].fd =3D xs_fileno(xs);
> +    p[1].fd =3D xenevtchn_fd(xe);
> +
> +    scan_backend();
> +
>      while ( !stop_me )
>      {
> -        sleep(60);
> +        while ( (p[0].revents & POLLIN) &&
> +                (watch =3D xs_check_watch(xs)) !=3D NULL )
> +        {
> +            handle_watch(watch[XS_WATCH_PATH], watch[XS_WATCH_TOKEN]);
> +            free(watch);
> +        }
> +
> +        if ( p[1].revents & POLLIN )
> +            handle_event();
> +
> +        poll(p, 2, 10000);

Can you just use an infinite timeout and rely on the signal
interrupting the system call?

Regards,
Jason


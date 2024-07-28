Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D46B93E976
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jul 2024 22:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766190.1176697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYAs4-00014F-W8; Sun, 28 Jul 2024 20:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766190.1176697; Sun, 28 Jul 2024 20:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYAs4-000114-TK; Sun, 28 Jul 2024 20:52:00 +0000
Received: by outflank-mailman (input) for mailman id 766190;
 Sun, 28 Jul 2024 20:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q4sB=O4=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1sYAs3-00010y-7s
 for xen-devel@lists.xenproject.org; Sun, 28 Jul 2024 20:51:59 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3958f3d5-4d23-11ef-8776-851b0ebba9a2;
 Sun, 28 Jul 2024 22:51:55 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5a10835480bso4369815a12.2
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jul 2024 13:51:55 -0700 (PDT)
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
X-Inumbo-ID: 3958f3d5-4d23-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722199915; x=1722804715; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeLS4wZZDHXd4WtWxolh7E5Rm8nNRZwiEQOp6tPVS+4=;
        b=Vh2MEjaFKO54+9r+hW5SokFZUV7HSYC7Io4rbsRMuVnnuv2UTcwJhWoPKuKm6dlx7Z
         iczdAmFchDlZytREmpO/RIuCq+XEvTHf7JbmT/+dUgMK2v3D9mOvkd4nVI+5qfH8XtSE
         iGCHgGJBSr7eMwW0WIDIYzKtzrP5Sart/orjgCK5Lf5CforbSmeRHa2CLW3NtXKxV02T
         hKf3Fc7WwuHebOg5KC360ojrkn0bL2+ct4THtjsN+f0w5QrjjrhJSt212ClOjr2UY0Yf
         kBdz4XUpgsVCjrWywxHbMXVMgbg0W3+eqyvRQUTY5fdDs1e5h4Ex6I5dmkzgPmkv5Id/
         4A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722199915; x=1722804715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeLS4wZZDHXd4WtWxolh7E5Rm8nNRZwiEQOp6tPVS+4=;
        b=C/lxlKDkkcJY0Vrvlqg+mhpYKYoGKPhqisSV9JaUvNFG3XmfnyVb6u3hucM3bYziC8
         7KKjqSlm72qxXbTCjjCWPbiH2HftOjfRPGjrNSC+orBfiTEeQVQhJckFFF42L72f38Wa
         XYEUEuOIFKvk1ydKd0uw5y+FfFcA/QtQkn7yw8MFs8iUHncZGeT1IMelrclZoSN2Pks3
         snqg7ERVvE++OI4aAUXHws4iz3S+ULBHI2G6mOVwqSkT86bdtHturW5Z4kJmk/ww46Kv
         GvCdy4h6W//HTaM9OWFpfrdQbkUL93OlkcErqbbV2qHXxpEXaJCNY9LLNboDBiPYMQXD
         7Jyg==
X-Gm-Message-State: AOJu0YzYuJG+B3DQluhhdJ5nydRkuRfOZVFUsgvnBMXQjq3nJRMrKjps
	ywMTW93yksN1w/MpjZEtD6432YZKtyzbTTH04bJ1T99C3Aa1p5qyQtdd25MG3PeMfDIPzfLQyF1
	ZICJoRO1c+ARP4JwZyg8qmZsoiWY=
X-Google-Smtp-Source: AGHT+IHy0qgVNDHTAdcxW/ih3YW9C2HclFAl+M4UR/jWwBLAD6pewJf96jof4INMTBYZjpclc+9oa18y6+oGwGEfdn0=
X-Received: by 2002:a50:ab11:0:b0:57d:2659:9141 with SMTP id
 4fb4d7f45d1cf-5b022003c65mr3344497a12.24.1722199914595; Sun, 28 Jul 2024
 13:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240516021010.3783-1-jandryuk@gmail.com> <ZqJv3rflSUC0Iv1d@l14>
In-Reply-To: <ZqJv3rflSUC0Iv1d@l14>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 28 Jul 2024 16:51:42 -0400
Message-ID: <CAKf6xpshMJH=kgS+f0ahLqATdLY=J-Ex0nJk97LoU0Q_JntTNQ@mail.gmail.com>
Subject: Re: [PATCH v3] libxl: Enable stubdom cdrom changing
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 11:31=E2=80=AFAM Anthony PERARD
<anthony.perard@vates.tech> wrote:
>
> On Wed, May 15, 2024 at 10:10:10PM -0400, Jason Andryuk wrote:
> > +static void cdrom_insert_stubdom_parse_fdset_rm(libxl__egc *egc,
> > +                                                libxl__ev_qmp *qmp,
> > +                                                const libxl__json_obje=
ct *resp,
> > +                                                int rc)
> > +{
> > +    EGC_GC;
> > +    libxl__cdrom_insert_state *cis =3D CONTAINER_OF(qmp, *cis, qmp);
> > +    int devid;
> > +    int fdset;
> > +
> > +    if (rc) goto out;
> > +
> > +    /* Only called for qemu-xen/linux stubdom. */
> > +    assert(cis->dm_ver =3D=3D LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> > +
> > +    devid =3D libxl__device_disk_dev_number(cis->disk->vdev, NULL, NUL=
L);
> > +    fdset =3D query_fdsets_find_fdset(gc, resp, devid);
> > +    if (fdset < 0) {
> > +        rc =3D fdset;
> > +        goto out;
> > +    }
> > +
> > +    LOGD(DEBUG, cis->domid, "Found fdset %d", fdset);
> > +
> > +    libxl__json_object *args =3D NULL;
> > +
> > +    libxl__qmp_param_add_integer(gc, &args, "fdset-id", fdset);
> > +
> > +    cis->qmp.callback =3D cdrom_insert_stubdom_ejected;
> > +
> > +    rc =3D libxl__ev_qmp_send(egc, &cis->qmp, "remove-fd", args);
> > +    if (rc) goto out;
> > +
> > +    return;
> > +
> > + out:
> > +    if (rc =3D=3D ERROR_NOTFOUND) {
> > +        LOGD(DEBUG, cis->domid, "No fdset found - skipping remove-fd")=
;
> > +        cdrom_insert_stubdom_ejected(egc, qmp, resp, 0);
>
> I think technically, cdrom_insert_stubdom_ejected also "must be last",
> like cdrom_insert_done, for one thing it actually call cdrom_insert_done
> in some cases. I think we used "/* must be last */" to indicate that
> resources used by the current chain of callback could be freed,
> including `egc`, `gc`, `ao`. There's quite a few more calls in this
> patch that would benefit from the annotation. But we can live without
> those.

Thanks for the explanation.  I'll add it here, and also in
cdrom_insert_stubdom_disk_add_cb().

> > +    } else {
> > +        cdrom_insert_done(egc, cis, rc); /* must be last */
> > +    }
> > +}
> [...]
> > +static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
> > +                                             libxl__ev_qmp *qmp,
> > +                                             const libxl__json_object =
*response,
> > +                                             int rc)
> > +{
> > +    EGC_GC;
> > +    libxl__cdrom_insert_state *cis =3D CONTAINER_OF(qmp, *cis, qmp);
> > +    int devid;
> > +    int fdset;
> > +
> > +    if (rc) goto out;
> > +
> > +    /* Only called for qemu-xen/linux stubdom. */
> > +    assert(cis->dm_ver =3D=3D LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
> > +
> > +    devid =3D libxl__device_disk_dev_number(cis->disk->vdev, NULL, NUL=
L);
> > +    fdset =3D query_fdsets_find_fdset(gc, response, devid);
> > +    if (fdset < 0) {
> > +        rc =3D fdset;
> > +        goto out;
> > +    }
> > +
> > +    cis->stubdom_fdset =3D fdset;
> > +
> > +    LOGD(DEBUG, cis->domid, "Found fdset %d", cis->stubdom_fdset);
> > +    cdrom_insert_ejected(egc, &cis->qmp, NULL, rc);
> > +    return;
> > +
> > + out:
> > +    if (rc =3D=3D ERROR_NOTFOUND) {
>
> While in the previous function it seems ok to deal with the NOTFOUND
> error in the "out:" path, I don't think it's a good idea here as it is
> an expected part of the workflow of this callback, and not an error.
>
> Could you move setting this timer above again? I guess something like
> that would work fine:
>
>   fdset =3D query_fdsets_find_fdset()
>   if (fdset =3D=3D ERROR_NOTFOUND) {
>     // doesn't exist yet, wait a bit
>     rc =3D libxl__ev_time_register_rel()
>     if (rc) goto out;
>     return
>   }
>   if (fdset < 0) {

I'll go with this approach, and that means ...

>
> > +        rc =3D libxl__ev_time_register_rel(cis->ao, &cis->retry_timer,
> > +                                         cdrom_insert_stubdom_query_fd=
set,
> > +                                         200);
> > +        if (rc) goto out;
>
> That "goto out" after the "out" label makes this even stranger and even
> a potential infinite loop if `rc` would happen to be set to
> ERROR_NOTFOUND again, which I don't think can happen right now.

...this will go away.  I must have re-organized without really
thinking through the result.

> > +        return;
> > +    }
> > +
> > +    cdrom_insert_done(egc, cis, rc); /* must be last */
> > +}
>
>
> Otherwise patch looks good, with just the comment in
> cdrom_insert_stubdom_parse_fdset
> act on: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

I'll refrain from adding this, since I am making a few more changes.

Thanks for the review.

-Jason


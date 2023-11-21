Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8317F2B18
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 11:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637734.993734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5OSu-00007A-Vc; Tue, 21 Nov 2023 10:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637734.993734; Tue, 21 Nov 2023 10:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5OSu-0008W3-Rj; Tue, 21 Nov 2023 10:58:48 +0000
Received: by outflank-mailman (input) for mailman id 637734;
 Tue, 21 Nov 2023 10:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dasP=HC=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1r5OSt-0008U3-3K
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 10:58:47 +0000
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0e67ae5-885c-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 11:58:46 +0100 (CET)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-41feb963f60so45035011cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 02:58:46 -0800 (PST)
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
X-Inumbo-ID: f0e67ae5-885c-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700564325; x=1701169125; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEaONqdOt2Eyq+HE+uFwNnlWxug0GrbxQFhqUJNirOQ=;
        b=cuEQyQgfbCZlOkfkZNjeuWWN7MrQRUuorRUWKxYbic7yeIe7gv/UsekaQDx6u//QpL
         L3CCKTahNNDqxddkvlMBtHWihTFvW7jq+BtHy4NgUG3cKJ/GRB9v+jMs3FSfk9PD333v
         uCuSd6v1mQRvwyWBQk4vbkhS/Us1E2JEfZ3PkaNL1T5LZ4tgGwECeZwb+XJzv4MpLyuB
         tGhbhRzTwO/YFDLdtXRi2ou+LrJtuTMm0qJ1V4RgC93kmEOEp4enfiaQCMfUAW5tlBT5
         KCGdODCkDUYLzcc/n2znzXvc/rezISGeev5WB1eb8te4EkhACBjL4DvYUMrTbHi/AvYv
         xVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564325; x=1701169125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEaONqdOt2Eyq+HE+uFwNnlWxug0GrbxQFhqUJNirOQ=;
        b=Y3La1wnrh6lQkeQXRft+GmKkqIv9n2ZVIP+nw0TuPglZj9lWATBM+MN4vUO6zN1FYz
         mMiSuWBmrG+ars6iXe08oBoFmn2JeGaw1z/r00o/Djejs8QOQA1UjmgiMMsDAVkQwud8
         EbQCUwgcwADZvcYtXUA5K+iWMRERRTSCT2UAIeoG9yo59KGpfeR/WCi4s+sShwRFq23e
         IypcjB/rkSZG4zaKF8nCy1SE90ZcP5ZAMIC9+LHJKqhV9KHfiX5NG2ScSj4AzpMar8SS
         nCjRqWDa1Qk7NK0bj0UWWklw2uH6MRH9sr8xyuOJQIxlSVkDTTbmuEXl+NQHn1vcl3mv
         Htrw==
X-Gm-Message-State: AOJu0YwOEFLyCsk8GIO9Gb/PNJxMT2MHduumEsaIN790gN13F9XB1oWi
	EgM9SELMfJdqOsxbWi8LqHN1VclaBfPHKFpTZzosqtaFO7N8QA==
X-Google-Smtp-Source: AGHT+IHBbREzLOIE6nFdzvpoaPkUDaqOq3VkvAP3+FMAblmioHciJ9MM77weoABuaqSRzDWhDYmGJ0HvV+WwDJlHN7A=
X-Received: by 2002:ac8:4655:0:b0:423:7637:149c with SMTP id
 f21-20020ac84655000000b004237637149cmr92946qto.4.1700564325006; Tue, 21 Nov
 2023 02:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20231115172723.1161679-1-dwmw2@infradead.org> <20231115172723.1161679-3-dwmw2@infradead.org>
 <CAJ+F1C+3UQoEEvFgg8ENjR0xv-LTiPckx4XkCjVqOe2Jnx1EeA@mail.gmail.com>
In-Reply-To: <CAJ+F1C+3UQoEEvFgg8ENjR0xv-LTiPckx4XkCjVqOe2Jnx1EeA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Nov 2023 14:58:33 +0400
Message-ID: <CAJ+F1CLA-gxmwuMqzjF-dhVqoTqpx1dsC5zNtoh4geLUzpbbVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] vl: disable default serial when xen-console is enabled
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Nov 21, 2023 at 2:57=E2=80=AFPM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Nov 15, 2023 at 9:28=E2=80=AFPM David Woodhouse <dwmw2@infradead.=
org> wrote:
> >
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >
> > If a Xen console is configured on the command line, do not add a defaul=
t
> > serial port.
> >
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > ---
> >  system/vl.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/system/vl.c b/system/vl.c
> > index 5af7ced2a1..8109231834 100644
> > --- a/system/vl.c
> > +++ b/system/vl.c
> > @@ -198,6 +198,7 @@ static const struct {
> >      const char *driver;
> >      int *flag;
> >  } default_list[] =3D {
> > +    { .driver =3D "xen-console",          .flag =3D &default_serial   =
 },
> >      { .driver =3D "isa-serial",           .flag =3D &default_serial   =
 },
> >      { .driver =3D "isa-parallel",         .flag =3D &default_parallel =
 },
> >      { .driver =3D "isa-fdc",              .flag =3D &default_floppy   =
 },
>
> Consistent with the rest of the lines (no conditional compilation nor
> driver #define..)
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> btw, while quickly testing this (do we have any test for xen-console?):
>
> $ qemu --accel kvm,xen-version=3D0x40011,kernel-irqchip=3Dsplit -device
> xen-console,chardev=3Dfoo -chardev stdio,id=3Dfoo
> (and close gtk window)
>
> Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
> 0x0000555555c11695 in qemu_free_net_client (nc=3D0x0) at ../net/net.c:387
> 387        if (nc->incoming_queue) {
> (gdb) bt
> #0  0x0000555555c11695 in qemu_free_net_client (nc=3D0x0) at ../net/net.c=
:387
> #1  0x0000555555c11a14 in qemu_del_nic (nic=3D0x555558b6f930) at ../net/n=
et.c:459
> #2  0x00005555559e398b in xen_netdev_unrealize (xendev=3D0x555558b6b510)
> at ../hw/net/xen_nic.c:550
> #3  0x0000555555b6e22f in xen_device_unrealize (dev=3D0x555558b6b510) at
> ../hw/xen/xen-bus.c:973
> #4  0x0000555555b6e351 in xen_device_exit (n=3D0x555558b6b5e0, data=3D0x0=
)
> at ../hw/xen/xen-bus.c:1002
> #5  0x00005555560bc3fc in notifier_list_notify (list=3D0x5555570b5fc0
> <exit_notifiers>, data=3D0x0) at ../util/notify.c:39
> #6  0x0000555555ba1d49 in qemu_run_exit_notifiers () at ../system/runstat=
e.c:800

Ok, I found related "[PATCH 1/3] net: do not delete nics in net_cleanup()"



--=20
Marc-Andr=C3=A9 Lureau


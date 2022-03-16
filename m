Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B9E4DB18C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 14:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291202.494103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTmq-0000r9-Na; Wed, 16 Mar 2022 13:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291202.494103; Wed, 16 Mar 2022 13:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTmq-0000p4-Ka; Wed, 16 Mar 2022 13:34:00 +0000
Received: by outflank-mailman (input) for mailman id 291202;
 Wed, 16 Mar 2022 13:33:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsVq=T3=redhat.com=mlureau@srs-se1.protection.inumbo.net>)
 id 1nUTmp-0000oy-AG
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 13:33:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb0e8ae5-a52d-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 14:33:58 +0100 (CET)
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-_NNioYcIP9WhOQ01ANdRPA-1; Wed, 16 Mar 2022 09:33:51 -0400
Received: by mail-yb1-f200.google.com with SMTP id
 x11-20020a5b0f0b000000b0062277953037so1908597ybr.21
 for <xen-devel@lists.xenproject.org>; Wed, 16 Mar 2022 06:33:51 -0700 (PDT)
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
X-Inumbo-ID: bb0e8ae5-a52d-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647437637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVXhblBb5SreSeVVw+xb8VxFfEeV/tL7QjK64epniIU=;
	b=Co1NkUC+oaAH1AYatBzwwIcWCFZ/ThoOaWcAqJaOuGyvpKRYVKFyIrL6qgAPG2W1NmGOXl
	CIEgP/+OEDSw47YRhHU2k15aARR9VG/MKwMNjNiiFSnDEd7izjsL4IR2P2MlP4Gzjj0Wgg
	CFXTpGI/u0gf+9WhNHt6GphQNu+hYkA=
X-MC-Unique: _NNioYcIP9WhOQ01ANdRPA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tVXhblBb5SreSeVVw+xb8VxFfEeV/tL7QjK64epniIU=;
        b=cJRa5Df755zqaZ/8IfhzUZbh+UPrjJma/umddfzCaLIGhn5mI/aAUefYB8SIyfnA2S
         XWpBJbWPf9MOT6vpmDnMHC7XmfLU1scGbbe2lO1I+EItLvsDG6ZMr1WGQka6n9N71Mf5
         a1q7NfD9LanbfkSERgEWv9fkBiW/tiYuZMFkVbYCtmd5QP7jppiEUqJFDkfYkJSD4jTj
         EYtUAp7PYo0evlGIaxusdu+ke/Pln7/eusTjW8Lmn5eHyM+lFqbTac4baHB4+4JJ0H1W
         GGmGlYt5vzVV9hadJrs7RZt42fP4kQtVIp9Kc3eKfH1VFprMeG0vubfJ63QbGnuhSDk/
         EkOQ==
X-Gm-Message-State: AOAM532HA5eRaWIwDvFXnuAyh9YAlncnUSS+IAJ/tvoDpZ/apY1fD4Zb
	Pua/HBc+O8nDgLcLsV8t3qeoeAYQN6yKxlqre8b3DaOZgfv0XIxiONuWhfejHsr1nNl6WQTjglL
	AxlF/fyAdaU6zcjJ/68L8OyVgy2g1SgQ82yiaBPGjoq0=
X-Received: by 2002:a05:690c:10f:b0:2e0:f11a:b3fc with SMTP id bd15-20020a05690c010f00b002e0f11ab3fcmr29274341ywb.267.1647437630865;
        Wed, 16 Mar 2022 06:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd+fGnhMwpIXXBVeuxcYAvCN4MAT6xHvnnj/sg34jGu9nhEMsL2aZ6KJPJIR+r76H9SnkTm8FmDanqg/NI+b4=
X-Received: by 2002:a05:690c:10f:b0:2e0:f11a:b3fc with SMTP id
 bd15-20020a05690c010f00b002e0f11ab3fcmr29274278ywb.267.1647437630545; Wed, 16
 Mar 2022 06:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com> <YjHmLTI+geU4S9Wq@redhat.com>
In-Reply-To: <YjHmLTI+geU4S9Wq@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 17:33:39 +0400
Message-ID: <CAMxuvaz=+wsAA5QXkV8TmgPpXZJxwGYk1HXoCwQH2u9i2dGaqA@mail.gmail.com>
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Thomas Huth <huth@tuxfamily.org>, Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>, Warner Losh <imp@bsdimp.com>, 
	Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Jiri Pirko <jiri@resnulli.us>, 
	Jason Wang <jasowang@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, 
	Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, "open list:blkverify" <qemu-block@nongnu.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 16, 2022 at 5:30 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Mar 16, 2022 at 01:52:48PM +0400, marcandre.lureau@redhat.com wro=
te:
> > diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> > index 3baa5e3790f7..f2bd050e3b9a 100644
> > --- a/include/qemu/compiler.h
> > +++ b/include/qemu/compiler.h
> > @@ -79,19 +79,12 @@
> >  #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x))=
 - \
> >                                     sizeof(QEMU_BUILD_BUG_ON_STRUCT(x))=
)
> >
> > -#if defined(__clang__)
> > -/* clang doesn't support gnu_printf, so use printf. */
> > -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> > -#else
> > -/* Use gnu_printf (qemu uses standard format strings). */
> > -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> > -# if defined(_WIN32)
> > +#if !defined(__clang__) && defined(_WIN32)
> >  /*
> >   * Map __printf__ to __gnu_printf__ because we want standard format st=
rings even
> >   * when MinGW or GLib include files use __printf__.
> >   */
> > -#  define __printf__ __gnu_printf__
> > -# endif
> > +# define __printf__ __gnu_printf__
> >  #endif
>
> I'm not convinced we shold have this remaining define, even
> before your patch.
>
> For code we've implemented, we should have used __gnu_printf__
> already if we know it uses GNU format on Windows.
>
> For code in GLib, its header file uses __gnu_printf__ for anything
> that relies on its portable printf replacement, which is basically
> everything in GLib.
>
> For anything else we should honour whatever they declare, and not
> assume their impl is the GNU one.
>
>
> I guess it is easy enough to validate by deleting this and seeing
> if we get any warnings from the mingw CI jobs about printf/gnu_printf
> mismatch.

Please comment on that thread:
https://patchew.org/QEMU/20220224183701.608720-1-marcandre.lureau@redhat.co=
m/20220224183701.608720-6-marcandre.lureau@redhat.com/

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>



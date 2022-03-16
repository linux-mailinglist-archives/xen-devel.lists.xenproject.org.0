Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A584DB908
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 20:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291270.494272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUZeL-0001kK-GI; Wed, 16 Mar 2022 19:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291270.494272; Wed, 16 Mar 2022 19:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUZeL-0001hl-DB; Wed, 16 Mar 2022 19:49:37 +0000
Received: by outflank-mailman (input) for mailman id 291270;
 Wed, 16 Mar 2022 19:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsVq=T3=redhat.com=mlureau@srs-se1.protection.inumbo.net>)
 id 1nUZeK-0001hf-5R
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 19:49:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3392e318-a562-11ec-853c-5f4723681683;
 Wed, 16 Mar 2022 20:49:34 +0100 (CET)
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-5k3ZlA9gPBWd8pTW0v7EAA-1; Wed, 16 Mar 2022 15:49:29 -0400
Received: by mail-yb1-f200.google.com with SMTP id
 a18-20020a25bad2000000b0063360821ea7so2749376ybk.15
 for <xen-devel@lists.xenproject.org>; Wed, 16 Mar 2022 12:49:29 -0700 (PDT)
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
X-Inumbo-ID: 3392e318-a562-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647460173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HmPkR8F5cUuO9WSmmjvcC0eujKaJVhXkybKoNOXuAPc=;
	b=KUlevViYkFywSJJnf3W/3OsLBpt4QckKJVUvhFZEyfRczXPmCU4JKGDkSrFpTt1a1env7U
	iT3cpLVZ/yaYnvd1tGGbPDWhzqOYMIxP13MPBZPGw3gf3mS5IkiO8905ke4WKztfpMjAWR
	qCHbefnk/5MWTDrlZCKIWcUIfJfKcM4=
X-MC-Unique: 5k3ZlA9gPBWd8pTW0v7EAA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HmPkR8F5cUuO9WSmmjvcC0eujKaJVhXkybKoNOXuAPc=;
        b=fH2dWtoz4+Ny3UAseaIV8X2aFLdZ/YFAy/t2D8IZ/8LPNYtzZu+7RRHkVZeyKVBM6m
         CU1c6m75HLO1zMkvQoAickrcwwSPLGZTCohTPh69K6q01Q/yxgCXFrdNYxjDw9q6rGRR
         axLsgKgUOtJSeIqXLAKKZ1TDOKTdVAbzQTeXpY0n4DNvIptc1UAxQ8RXwFOVHWUDwGVd
         Nql7owW7SHu8kWqnMLXZ23iLBvU9bHyhISovj8+ndJjZ1MLsWatkmsdhvDjucychN5yY
         GAxU5ECp23xgNGx38tyq2NQ71CT2HIqT/5rvYsA1fhkrk9n03h72AzMCf8r2J5XSUR+y
         4Bgg==
X-Gm-Message-State: AOAM5328xrmM8Vbx671/XCDP/ZyKSHoqGx/48LlzsYgdjeU4+roDg1Mb
	6+QP+oBxq9jZUzkn+ko16nk93MAyPZkrapxbZYTcDWEEWNkJmv9qPxVzuNl7waLs9lf3/esQjgF
	Ha6JvmUt4pX8ck8Mb0Gm6h9wtBdmdbMhypCyRsEJIbWI=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id r204-20020a815dd5000000b002dc19cf17acmr2000989ywb.312.1647460169191;
        Wed, 16 Mar 2022 12:49:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs4vlxPHCmvEL+QLl58POsRAsEEFv0xU2PEoCp4EY5TZRS202MXzdEQ/4+iJ8gmvsW+OKdw3ICcTS33kiccxg=
X-Received: by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr2000957ywb.312.1647460168968; Wed, 16
 Mar 2022 12:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
 <dce310d7-35a6-d3df-734a-c9d184fc282c@gmail.com> <617011dd-6d19-cb2d-c98d-747e1821d545@redhat.com>
In-Reply-To: <617011dd-6d19-cb2d-c98d-747e1821d545@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 23:49:17 +0400
Message-ID: <CAMxuvawgFL4w73ZUmk9ib5FOmU5Wc05=7gga2ZJqpWpF=VkWFw@mail.gmail.com>
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
	qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
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
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
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

On Wed, Mar 16, 2022 at 5:28 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 16/03/2022 14.16, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 16/3/22 10:52, marcandre.lureau@redhat.com wrote:
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> One less qemu-specific macro. It also helps to make some headers/units
> >> only depend on glib, and thus moved in standalone projects eventually.
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> ---
> >>   audio/audio.h                           |  4 +--
> >>   block/qcow2.h                           |  2 +-
> >>   bsd-user/qemu.h                         |  2 +-
> >>   hw/display/qxl.h                        |  2 +-
> >>   hw/net/rocker/rocker.h                  |  2 +-
> >>   hw/xen/xen_pt.h                         |  2 +-
> >>   include/chardev/char-fe.h               |  2 +-
> >>   include/disas/dis-asm.h                 |  2 +-
> >>   include/hw/acpi/aml-build.h             | 12 +++----
> >>   include/hw/core/cpu.h                   |  2 +-
> >>   include/hw/hw.h                         |  2 +-
> >>   include/hw/virtio/virtio.h              |  2 +-
> >>   include/hw/xen/xen-bus-helper.h         |  4 +--
> >>   include/hw/xen/xen-bus.h                |  4 +--
> >>   include/hw/xen/xen_common.h             |  2 +-
> >>   include/hw/xen/xen_pvdev.h              |  2 +-
> >>   include/monitor/monitor.h               |  4 +--
> >>   include/qapi/error.h                    | 20 ++++++------
> >>   include/qapi/qmp/qjson.h                |  8 ++---
> >>   include/qemu/buffer.h                   |  2 +-
> >>   include/qemu/compiler.h                 | 11 ++-----
> >>   include/qemu/error-report.h             | 24 +++++++-------
> >>   include/qemu/log-for-trace.h            |  2 +-
> >>   include/qemu/log.h                      |  2 +-
> >>   include/qemu/qemu-print.h               |  8 ++---
> >>   include/qemu/readline.h                 |  2 +-
> >>   qga/guest-agent-core.h                  |  2 +-
> >>   qga/vss-win32/requester.h               |  2 +-
> >>   scripts/cocci-macro-file.h              |  2 +-
> >>   tests/qtest/libqos/libqtest.h           | 42 ++++++++++++-----------=
--
> >>   tests/qtest/libqtest-single.h           |  2 +-
> >>   tests/qtest/migration-helpers.h         |  6 ++--
> >>   audio/alsaaudio.c                       |  4 +--
> >>   audio/dsoundaudio.c                     |  4 +--
> >>   audio/ossaudio.c                        |  4 +--
> >>   audio/paaudio.c                         |  2 +-
> >>   audio/sdlaudio.c                        |  2 +-
> >>   block/blkverify.c                       |  2 +-
> >>   block/ssh.c                             |  4 +--
> >>   fsdev/9p-marshal.c                      |  2 +-
> >>   fsdev/virtfs-proxy-helper.c             |  2 +-
> >>   hw/9pfs/9p.c                            |  2 +-
> >>   hw/acpi/aml-build.c                     |  4 +--
> >>   hw/mips/fuloong2e.c                     |  2 +-
> >>   hw/mips/malta.c                         |  2 +-
> >>   hw/net/rtl8139.c                        |  2 +-
> >>   hw/virtio/virtio.c                      |  2 +-
> >>   io/channel-websock.c                    |  2 +-
> >>   monitor/hmp.c                           |  4 +--
> >>   nbd/server.c                            | 10 +++---
> >>   qemu-img.c                              |  4 +--
> >>   qemu-io.c                               |  2 +-
> >>   qobject/json-parser.c                   |  2 +-
> >>   softmmu/qtest.c                         |  4 +--
> >>   tests/qtest/libqtest.c                  |  2 +-
> >>   tests/unit/test-qobject-input-visitor.c |  4 +--
> >>   audio/coreaudio.m                       |  4 +--
> >>   scripts/checkpatch.pl                   |  2 +-
> >>   58 files changed, 130 insertions(+), 137 deletions(-)
> >
> >> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> >> index 3baa5e3790f7..f2bd050e3b9a 100644
> >> --- a/include/qemu/compiler.h
> >> +++ b/include/qemu/compiler.h
> >> @@ -79,19 +79,12 @@
> >>   #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x=
)) - \
> >>                                      sizeof(QEMU_BUILD_BUG_ON_STRUCT(x=
)))
> >> -#if defined(__clang__)
> >> -/* clang doesn't support gnu_printf, so use printf. */
> >> -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> >> -#else
> >> -/* Use gnu_printf (qemu uses standard format strings). */
> >> -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> >> -# if defined(_WIN32)
> >> +#if !defined(__clang__) && defined(_WIN32)
> >>   /*
> >>    * Map __printf__ to __gnu_printf__ because we want standard format
> >> strings even
> >>    * when MinGW or GLib include files use __printf__.
> >>    */
> >> -#  define __printf__ __gnu_printf__
> >> -# endif
> >> +# define __printf__ __gnu_printf__
> >>   #endif
> >
> > Can we also poison GCC_FMT_ATTR? Maybe split in 2 patches, 1 converting
> > and another removing unused & poisoning?
>
> I don't think that poisoning is required here since this macro is not use=
d
> in "#ifdef" statements - so the compiler will complain to you if you stil=
l
> try to use it after the removal.

Yes (same for other macros in this series)
thanks



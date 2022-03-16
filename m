Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE54DB0D4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 14:16:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291190.494070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTVc-0005jq-KQ; Wed, 16 Mar 2022 13:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291190.494070; Wed, 16 Mar 2022 13:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUTVc-0005i1-HO; Wed, 16 Mar 2022 13:16:12 +0000
Received: by outflank-mailman (input) for mailman id 291190;
 Wed, 16 Mar 2022 13:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cw/8=T3=gmail.com=philippe.mathieu.daude@srs-se1.protection.inumbo.net>)
 id 1nUTVa-0005hv-Sh
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 13:16:10 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ea3c16e-a52b-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 14:16:09 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso2525389wms.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Mar 2022 06:16:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm1699775wrw.57.2022.03.16.06.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:16:08 -0700 (PDT)
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
X-Inumbo-ID: 3ea3c16e-a52b-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4JyIZgrE4P1Kn4wn07mmEvGGdYL63aqq7IDLnDUN0K4=;
        b=jU1+7OR0KHqAMwZSSC/AcyyfNbvez9kPQm09bYq4lrlWZsb0JAXV8pFTYoGRmngNft
         wJVP/QRVBGT+zv4eB7b9kU3ehp5LKO0WZ241yTPHIFn23dA8DNQyDwwq6TTIaAucarMx
         cCZEjICjiQ1nMgKmycyXt3ZIUCZ7jCx4yEFukj3M5rc2dCO1w1nqxGMYzD666z5c2biF
         AsVuyY0vGpjDnccH35/Y61O1IYfAkXZVlhVqWKvtWrHjwED0ttkaPnOgPke7EOw/tEzy
         O5DNRh+0bmuNwiDRZM4zCec1pjoaHyA2Fc8ZeODmMFP21dvx3i6g6cFJJDUN3+FiAJJv
         ZG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4JyIZgrE4P1Kn4wn07mmEvGGdYL63aqq7IDLnDUN0K4=;
        b=ABNrlgB4g7+lIDnwqRrPAJCPy3KLhO0Blt0426hAEzFfU9eSf/SGoJvARAE6k4kqc2
         lvp5FwJJCsyLnpfb5FxBltJd62t3m0lMws3YnNwNoWE9phgDQCFZtRqCeIicx5CB8pti
         9T/ZYom7ofjbrpOzD0oTcBmu1gQYSJ71O56DyN7BKN/KYFl0n9EunkVUvhzguJro2WYu
         YFedP42aVz3FKSXh6IClM2yn+kURpKytzOOueX53PVgsZzeSAMU/ar4a0blYwDm4HpZw
         l+9dMezgmLhEZvsOqkq36RPe4/munZ53CV9nPswoR5bSXUcWpTdZvXMPGT7QvsjWogFq
         efNA==
X-Gm-Message-State: AOAM531r86YX5vd7MTK46BJsrk0Nj2qxUJ61IzAQkYWLpOMNnB85HJmC
	DVUKM9Td6KqfmvmuNZM8jXg=
X-Google-Smtp-Source: ABdhPJxZB6EkbrGbgbe1OHgAv3zK0P0DzBIxwvVRDujT7ZmPCtls8E9A1Qp3gQmydUuyyzx17yk30Q==
X-Received: by 2002:a05:600c:35ce:b0:38c:7457:425 with SMTP id r14-20020a05600c35ce00b0038c74570425mr484570wmq.200.1647436569158;
        Wed, 16 Mar 2022 06:16:09 -0700 (PDT)
Message-ID: <dce310d7-35a6-d3df-734a-c9d184fc282c@gmail.com>
Date: Wed, 16 Mar 2022 14:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <huth@tuxfamily.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiri Pirko <jiri@resnulli.us>,
 Jason Wang <jasowang@redhat.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, "open list:blkverify" <qemu-block@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/3/22 10:52, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> One less qemu-specific macro. It also helps to make some headers/units
> only depend on glib, and thus moved in standalone projects eventually.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.h                           |  4 +--
>   block/qcow2.h                           |  2 +-
>   bsd-user/qemu.h                         |  2 +-
>   hw/display/qxl.h                        |  2 +-
>   hw/net/rocker/rocker.h                  |  2 +-
>   hw/xen/xen_pt.h                         |  2 +-
>   include/chardev/char-fe.h               |  2 +-
>   include/disas/dis-asm.h                 |  2 +-
>   include/hw/acpi/aml-build.h             | 12 +++----
>   include/hw/core/cpu.h                   |  2 +-
>   include/hw/hw.h                         |  2 +-
>   include/hw/virtio/virtio.h              |  2 +-
>   include/hw/xen/xen-bus-helper.h         |  4 +--
>   include/hw/xen/xen-bus.h                |  4 +--
>   include/hw/xen/xen_common.h             |  2 +-
>   include/hw/xen/xen_pvdev.h              |  2 +-
>   include/monitor/monitor.h               |  4 +--
>   include/qapi/error.h                    | 20 ++++++------
>   include/qapi/qmp/qjson.h                |  8 ++---
>   include/qemu/buffer.h                   |  2 +-
>   include/qemu/compiler.h                 | 11 ++-----
>   include/qemu/error-report.h             | 24 +++++++-------
>   include/qemu/log-for-trace.h            |  2 +-
>   include/qemu/log.h                      |  2 +-
>   include/qemu/qemu-print.h               |  8 ++---
>   include/qemu/readline.h                 |  2 +-
>   qga/guest-agent-core.h                  |  2 +-
>   qga/vss-win32/requester.h               |  2 +-
>   scripts/cocci-macro-file.h              |  2 +-
>   tests/qtest/libqos/libqtest.h           | 42 ++++++++++++-------------
>   tests/qtest/libqtest-single.h           |  2 +-
>   tests/qtest/migration-helpers.h         |  6 ++--
>   audio/alsaaudio.c                       |  4 +--
>   audio/dsoundaudio.c                     |  4 +--
>   audio/ossaudio.c                        |  4 +--
>   audio/paaudio.c                         |  2 +-
>   audio/sdlaudio.c                        |  2 +-
>   block/blkverify.c                       |  2 +-
>   block/ssh.c                             |  4 +--
>   fsdev/9p-marshal.c                      |  2 +-
>   fsdev/virtfs-proxy-helper.c             |  2 +-
>   hw/9pfs/9p.c                            |  2 +-
>   hw/acpi/aml-build.c                     |  4 +--
>   hw/mips/fuloong2e.c                     |  2 +-
>   hw/mips/malta.c                         |  2 +-
>   hw/net/rtl8139.c                        |  2 +-
>   hw/virtio/virtio.c                      |  2 +-
>   io/channel-websock.c                    |  2 +-
>   monitor/hmp.c                           |  4 +--
>   nbd/server.c                            | 10 +++---
>   qemu-img.c                              |  4 +--
>   qemu-io.c                               |  2 +-
>   qobject/json-parser.c                   |  2 +-
>   softmmu/qtest.c                         |  4 +--
>   tests/qtest/libqtest.c                  |  2 +-
>   tests/unit/test-qobject-input-visitor.c |  4 +--
>   audio/coreaudio.m                       |  4 +--
>   scripts/checkpatch.pl                   |  2 +-
>   58 files changed, 130 insertions(+), 137 deletions(-)

> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 3baa5e3790f7..f2bd050e3b9a 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -79,19 +79,12 @@
>   #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
>                                      sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
>   
> -#if defined(__clang__)
> -/* clang doesn't support gnu_printf, so use printf. */
> -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> -#else
> -/* Use gnu_printf (qemu uses standard format strings). */
> -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> -# if defined(_WIN32)
> +#if !defined(__clang__) && defined(_WIN32)
>   /*
>    * Map __printf__ to __gnu_printf__ because we want standard format strings even
>    * when MinGW or GLib include files use __printf__.
>    */
> -#  define __printf__ __gnu_printf__
> -# endif
> +# define __printf__ __gnu_printf__
>   #endif

Can we also poison GCC_FMT_ATTR? Maybe split in 2 patches, 1 converting
and another removing unused & poisoning?


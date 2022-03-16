Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97DB4DB172
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 14:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291194.494081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUThJ-0007Hh-Of; Wed, 16 Mar 2022 13:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291194.494081; Wed, 16 Mar 2022 13:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUThJ-0007EH-Kv; Wed, 16 Mar 2022 13:28:17 +0000
Received: by outflank-mailman (input) for mailman id 291194;
 Wed, 16 Mar 2022 13:28:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H0j4=T3=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1nUThH-0007Ds-VD
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 13:28:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee142e00-a52c-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 14:28:14 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-8wrryEzXNdW42AT0M0hL5Q-1; Wed, 16 Mar 2022 09:28:11 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 h127-20020a1c2185000000b0038c6f7e22a4so785317wmh.9
 for <xen-devel@lists.xenproject.org>; Wed, 16 Mar 2022 06:28:11 -0700 (PDT)
Received: from [192.168.42.76] (tmo-065-170.customers.d1-online.com.
 [80.187.65.170]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d548c000000b001f1f99e7792sm1611088wrv.111.2022.03.16.06.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:28:09 -0700 (PDT)
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
X-Inumbo-ID: ee142e00-a52c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647437293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZC7G6AJDV2FZQS3DCTZOZRK0y7+mf4m3fLbuWOiH0EY=;
	b=YpILD2rIuaA/aFHAUW7QGPNZBJ5GMY3k5pllp8qTRs69/jx5//CyiozE76DvonHX3kqETH
	ys9992E9QVmQ1YUgcF7opH4y1BGiFOA9x3LyAdA+RTMMmTuSVkvwHbVzQ0vLKEmYaG1V0m
	uxG0DyefuM2OlY7n7dMGlm3z4zv6C0g=
X-MC-Unique: 8wrryEzXNdW42AT0M0hL5Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZC7G6AJDV2FZQS3DCTZOZRK0y7+mf4m3fLbuWOiH0EY=;
        b=tpEVdefcZzQG+w0IWpJq8UJwkVMv6IddA7d93uf/RkflmePLEFwo4r6/X2jJsmio0M
         1bXlvfVKxBptg0uJQHRTBMqitD38RPpzE5Fz4K5QQjatOxW2m9OaYFxCx4AC23UUE72X
         ub4DDACoxWWUeo7slUKFBhmgcbP8SHZJLYVr+ja1Z1pJr6nkG9OCujs+jARao8B6PDiP
         pG5dcstFDUEQAouDSqKjLfpJaiZnjVogt+lMl8Rps/mUkGT/2YLRov4qAaddpZFvULzY
         PLt80f+12QtsM1IrmyWbwwZDxEJXUYT7hMPt6MHqWab4lq7xDPcecNezE8hvdqvB6D+j
         tuBA==
X-Gm-Message-State: AOAM532Tr7EjlPJ2KXhRD3J3311BpP9RNjY0oLelsm10q1c70VZQ9vjH
	NKzwDD1ROKjJ9kcXPkciJwG9PnXW2iohtxoQIsy/aB//TOqxf59kynYC95vChRVmVkpx/tt5sFz
	I0c5gLgFYbpRUVhQVa5T/n5J/0ZU=
X-Received: by 2002:a5d:6244:0:b0:1e7:686d:41e7 with SMTP id m4-20020a5d6244000000b001e7686d41e7mr23735539wrv.491.1647437290681;
        Wed, 16 Mar 2022 06:28:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhkthpk8CALWRyrP6UeSAiyc5PyjeBcZW4vlkIsrNdk9/MSR23usQzwXkariPWi5l9c/S4aw==
X-Received: by 2002:a5d:6244:0:b0:1e7:686d:41e7 with SMTP id m4-20020a5d6244000000b001e7686d41e7mr23735511wrv.491.1647437290396;
        Wed, 16 Mar 2022 06:28:10 -0700 (PDT)
Message-ID: <617011dd-6d19-cb2d-c98d-747e1821d545@redhat.com>
Date: Wed, 16 Mar 2022 14:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, marcandre.lureau@redhat.com,
 qemu-devel@nongnu.org
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
 <dce310d7-35a6-d3df-734a-c9d184fc282c@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <dce310d7-35a6-d3df-734a-c9d184fc282c@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/03/2022 14.16, Philippe Mathieu-Daudé wrote:
> On 16/3/22 10:52, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> One less qemu-specific macro. It also helps to make some headers/units
>> only depend on glib, and thus moved in standalone projects eventually.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   audio/audio.h                           |  4 +--
>>   block/qcow2.h                           |  2 +-
>>   bsd-user/qemu.h                         |  2 +-
>>   hw/display/qxl.h                        |  2 +-
>>   hw/net/rocker/rocker.h                  |  2 +-
>>   hw/xen/xen_pt.h                         |  2 +-
>>   include/chardev/char-fe.h               |  2 +-
>>   include/disas/dis-asm.h                 |  2 +-
>>   include/hw/acpi/aml-build.h             | 12 +++----
>>   include/hw/core/cpu.h                   |  2 +-
>>   include/hw/hw.h                         |  2 +-
>>   include/hw/virtio/virtio.h              |  2 +-
>>   include/hw/xen/xen-bus-helper.h         |  4 +--
>>   include/hw/xen/xen-bus.h                |  4 +--
>>   include/hw/xen/xen_common.h             |  2 +-
>>   include/hw/xen/xen_pvdev.h              |  2 +-
>>   include/monitor/monitor.h               |  4 +--
>>   include/qapi/error.h                    | 20 ++++++------
>>   include/qapi/qmp/qjson.h                |  8 ++---
>>   include/qemu/buffer.h                   |  2 +-
>>   include/qemu/compiler.h                 | 11 ++-----
>>   include/qemu/error-report.h             | 24 +++++++-------
>>   include/qemu/log-for-trace.h            |  2 +-
>>   include/qemu/log.h                      |  2 +-
>>   include/qemu/qemu-print.h               |  8 ++---
>>   include/qemu/readline.h                 |  2 +-
>>   qga/guest-agent-core.h                  |  2 +-
>>   qga/vss-win32/requester.h               |  2 +-
>>   scripts/cocci-macro-file.h              |  2 +-
>>   tests/qtest/libqos/libqtest.h           | 42 ++++++++++++-------------
>>   tests/qtest/libqtest-single.h           |  2 +-
>>   tests/qtest/migration-helpers.h         |  6 ++--
>>   audio/alsaaudio.c                       |  4 +--
>>   audio/dsoundaudio.c                     |  4 +--
>>   audio/ossaudio.c                        |  4 +--
>>   audio/paaudio.c                         |  2 +-
>>   audio/sdlaudio.c                        |  2 +-
>>   block/blkverify.c                       |  2 +-
>>   block/ssh.c                             |  4 +--
>>   fsdev/9p-marshal.c                      |  2 +-
>>   fsdev/virtfs-proxy-helper.c             |  2 +-
>>   hw/9pfs/9p.c                            |  2 +-
>>   hw/acpi/aml-build.c                     |  4 +--
>>   hw/mips/fuloong2e.c                     |  2 +-
>>   hw/mips/malta.c                         |  2 +-
>>   hw/net/rtl8139.c                        |  2 +-
>>   hw/virtio/virtio.c                      |  2 +-
>>   io/channel-websock.c                    |  2 +-
>>   monitor/hmp.c                           |  4 +--
>>   nbd/server.c                            | 10 +++---
>>   qemu-img.c                              |  4 +--
>>   qemu-io.c                               |  2 +-
>>   qobject/json-parser.c                   |  2 +-
>>   softmmu/qtest.c                         |  4 +--
>>   tests/qtest/libqtest.c                  |  2 +-
>>   tests/unit/test-qobject-input-visitor.c |  4 +--
>>   audio/coreaudio.m                       |  4 +--
>>   scripts/checkpatch.pl                   |  2 +-
>>   58 files changed, 130 insertions(+), 137 deletions(-)
> 
>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>> index 3baa5e3790f7..f2bd050e3b9a 100644
>> --- a/include/qemu/compiler.h
>> +++ b/include/qemu/compiler.h
>> @@ -79,19 +79,12 @@
>>   #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
>>                                      sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
>> -#if defined(__clang__)
>> -/* clang doesn't support gnu_printf, so use printf. */
>> -# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
>> -#else
>> -/* Use gnu_printf (qemu uses standard format strings). */
>> -# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
>> -# if defined(_WIN32)
>> +#if !defined(__clang__) && defined(_WIN32)
>>   /*
>>    * Map __printf__ to __gnu_printf__ because we want standard format 
>> strings even
>>    * when MinGW or GLib include files use __printf__.
>>    */
>> -#  define __printf__ __gnu_printf__
>> -# endif
>> +# define __printf__ __gnu_printf__
>>   #endif
> 
> Can we also poison GCC_FMT_ATTR? Maybe split in 2 patches, 1 converting
> and another removing unused & poisoning?

I don't think that poisoning is required here since this macro is not used 
in "#ifdef" statements - so the compiler will complain to you if you still 
try to use it after the removal.

  Thomas



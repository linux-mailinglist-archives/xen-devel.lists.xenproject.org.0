Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4AE61097D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 07:05:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431403.684285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooHXl-0000PZ-2z; Fri, 28 Oct 2022 05:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431403.684285; Fri, 28 Oct 2022 05:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooHXk-0000Me-Uh; Fri, 28 Oct 2022 05:04:32 +0000
Received: by outflank-mailman (input) for mailman id 431403;
 Fri, 28 Oct 2022 05:04:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aLI4=25=redhat.com=jasowang@srs-se1.protection.inumbo.net>)
 id 1ooHXj-0000MY-BS
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 05:04:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffd29ac5-567d-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 07:04:29 +0200 (CEST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-1GfdpKXBP2iOMuaxLrVIBg-1; Fri, 28 Oct 2022 01:04:26 -0400
Received: by mail-pj1-f70.google.com with SMTP id
 om10-20020a17090b3a8a00b002108b078ab1so5008704pjb.9
 for <xen-devel@lists.xenproject.org>; Thu, 27 Oct 2022 22:04:26 -0700 (PDT)
Received: from [10.72.13.50] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 e16-20020aa79810000000b0056b6c7a17c6sm2062169pfl.12.2022.10.27.22.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 22:04:23 -0700 (PDT)
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
X-Inumbo-ID: ffd29ac5-567d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666933467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okMdc+KhJjKXcis0bcDj5EWl2UnVMQS0OzmNUP9xDbI=;
	b=FN1oK56umF6F/gA5ejdQPewR8WZSeLaMwD/DirCaOADVkAbP5CKeVNKrBS+ATvRsB5A8Jz
	lVFBaz1tyQL8xfp87HfXniuthou+nWtMfJalq2BgcL83WNKoSZgulbvF36A/fLKsbozMTw
	F9XEZ7remiI47CefLmfekXAEqpqVe5w=
X-MC-Unique: 1GfdpKXBP2iOMuaxLrVIBg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okMdc+KhJjKXcis0bcDj5EWl2UnVMQS0OzmNUP9xDbI=;
        b=uZZW7wgjehQLdgPvn0tewlr+U+inu3SSCtJ3asrgkJU1CpxRPOQJAiJOPDnYX62u4r
         Wtui8AHCuC72xhDrC1LAax3QOHPuvqgxStUVgS4snUqeNbFG2bHlwJJF/CJto9H+ZRxJ
         VvYopLgFOeRhtGfcjn4MZKI2kVzEB0gjtUV/oD1boucTHDAju+AUQb7Ha1IhALyBFt6c
         dpnfKhOkZCh+1J48ieI6se1zEAnRHNW4NkTYCCFgXfIjvh67UPWZmmRnvowgdE55f/GS
         +umZKITgkpJs1XoRm3bMJUtXHSiuj8b51kWbEh03Y04OJzSY0YjWHNiAIsbWkNFuHaEv
         J/5w==
X-Gm-Message-State: ACrzQf2TCj67BxCiTxGCIkBDkbMkBKW6mnU3c+laTR3ZKlroGaAUz+b1
	Ztd8ZkRzr2hm4YIETL+Yj+dU3X+h0cutaSfq0ogK5fvQOfN9d/WUxJbMtl7JGiTR6KOxu6IU22p
	iccKeVxbV5SQzBMimI49u2MRjgBE=
X-Received: by 2002:a17:90b:1649:b0:20d:2d96:6b05 with SMTP id il9-20020a17090b164900b0020d2d966b05mr14284810pjb.9.1666933465303;
        Thu, 27 Oct 2022 22:04:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM763cM40Ox4h2hsO44kzlRFkLDSF93C9SC1IIjEwDsaISVB67+Ka9W6ONBS2A+3fnGisQJaow==
X-Received: by 2002:a17:90b:1649:b0:20d:2d96:6b05 with SMTP id il9-20020a17090b164900b0020d2d966b05mr14284755pjb.9.1666933464749;
        Thu, 27 Oct 2022 22:04:24 -0700 (PDT)
Message-ID: <700ef645-6cb6-66e6-00a9-3db187be0c43@redhat.com>
Date: Fri, 28 Oct 2022 13:04:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-17-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221021090922.170074-17-lvivier@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/10/21 17:09, Laurent Vivier 写道:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---


I got this:

63/63 ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
assertion failed (resp == expect): ("st0: index=0,type=stream,connection 
error\r\n" == "st0: index=0,type=stream,tcp:::1:40389\r\n") ERROR
63/63 qemu:qtest+qtest-x86_64 / 
qtest-x86_64/netdev-socket                  ERROR 5.29s   killed by 
signal 6 SIGABRT
 >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 
MALLOC_PERTURB_=96 
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
/home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
✀ 
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
**
ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
assertion failed (resp == expect): ("st0: index=0,type=stream,connection 
error\r\n" == "st0: index=0,type=stream,tcp:::1:40389\r\n")

(test program exited with status code -6)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

The base is:

commit 344744e148e6e865f5a57e745b02a87e5ea534ad (HEAD -> master, 
origin/master, origin/HEAD)
Merge: 08a5d04606 e38c24cb58
Author: Stefan Hajnoczi <stefanha@redhat.com>
Date:   Wed Oct 26 10:53:48 2022 -0400

     Merge tag 'dump-pull-request' of 
https://gitlab.com/marcandre.lureau/qemu into staging

So I dropped this patch from the queue and we can add it back after 
soft-freeze.

Thanks


>   tests/qtest/meson.build     |   1 +
>   tests/qtest/netdev-socket.c | 420 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 421 insertions(+)
>   create mode 100644 tests/qtest/netdev-socket.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c07a5b1a5f43..6953797e4e3e 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -27,6 +27,7 @@ qtests_generic = [
>     'test-hmp',
>     'qos-test',
>     'readconfig-test',
> +  'netdev-socket',
>   ]
>   if config_host.has_key('CONFIG_MODULES')
>     qtests_generic += [ 'modules-test' ]
> diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
> new file mode 100644
> index 000000000000..b24c0819b9ac
> --- /dev/null
> +++ b/tests/qtest/netdev-socket.c
> @@ -0,0 +1,420 @@
> +/*
> + * QTest testcase for netdev stream and dgram
> + *
> + * Copyright (c) 2022 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +
> +#define CONNECTION_TIMEOUT    5
> +
> +#define EXPECT_STATE(q, e, t)                             \
> +do {                                                      \
> +    char *resp = qtest_hmp(q, "info network");            \
> +    if (t) {                                              \
> +        strrchr(resp, t)[0] = 0;                          \
> +    }                                                     \
> +    g_test_timer_start();                                 \
> +    while (g_test_timer_elapsed() < CONNECTION_TIMEOUT) { \
> +        if (strcmp(resp, e) == 0) {                       \
> +            break;                                        \
> +        }                                                 \
> +        g_free(resp);                                     \
> +        resp = qtest_hmp(q, "info network");              \
> +        if (t) {                                          \
> +            strrchr(resp, t)[0] = 0;                      \
> +        }                                                 \
> +    }                                                     \
> +    g_assert_cmpstr(resp, ==, e);                         \
> +    g_free(resp);                                         \
> +} while (0)
> +
> +static int inet_get_free_port_socket(int sock)
> +{
> +    struct sockaddr_in addr;
> +    socklen_t len;
> +
> +    memset(&addr, 0, sizeof(addr));
> +    addr.sin_family = AF_INET;
> +    addr.sin_addr.s_addr = INADDR_ANY;
> +    addr.sin_port = 0;
> +    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
> +        return -1;
> +    }
> +
> +    len = sizeof(addr);
> +    if (getsockname(sock,  (struct sockaddr *)&addr, &len) < 0) {
> +        return -1;
> +    }
> +
> +    return ntohs(addr.sin_port);
> +}
> +
> +static int inet_get_free_port_multiple(int nb, int *port)
> +{
> +    int sock[nb];
> +    int i;
> +
> +    for (i = 0; i < nb; i++) {
> +        sock[i] = socket(AF_INET, SOCK_STREAM, 0);
> +        if (sock[i] < 0) {
> +            break;
> +        }
> +        port[i] = inet_get_free_port_socket(sock[i]);
> +    }
> +
> +    nb = i;
> +    for (i = 0; i < nb; i++) {
> +        closesocket(sock[i]);
> +    }
> +
> +    return nb;
> +}
> +
> +static int inet_get_free_port(void)
> +{
> +    int nb, port;
> +
> +    nb = inet_get_free_port_multiple(1, &port);
> +    g_assert_cmpint(nb, ==, 1);
> +
> +    return port;
> +}
> +
> +static void test_stream_inet_ipv4(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int port;
> +
> +    port = inet_get_free_port();
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=true,addr.type=inet,"
> +                       "addr.ipv4=on,addr.ipv6=off,"
> +                       "addr.host=localhost,addr.port=%d", port);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,server=false,id=st0,addr.type=inet,"
> +                       "addr.ipv4=on,addr.ipv6=off,"
> +                       "addr.host=localhost,addr.port=%d", port);
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,tcp:127.0.0.1:%d\r\n",
> +                             port);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);
> +
> +    /* the port is unknown, check only the address */
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:127.0.0.1", ':');
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_stream_inet_ipv6(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int port;
> +
> +    port = inet_get_free_port();
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=true,addr.type=inet,"
> +                       "addr.ipv4=off,addr.ipv6=on,"
> +                       "addr.host=localhost,addr.port=%d", port);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,server=false,id=st0,addr.type=inet,"
> +                       "addr.ipv4=off,addr.ipv6=on,"
> +                       "addr.host=localhost,addr.port=%d", port);
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,tcp:::1:%d\r\n",
> +                             port);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);
> +
> +    /* the port is unknown, check only the address */
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:::1", ':');
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_stream_unix(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    gchar *path;
> +    int ret;
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=true,"
> +                       "addr.type=unix,addr.path=%s,",
> +                       path);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=false,"
> +                       "addr.type=unix,addr.path=%s",
> +                       path);
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,unix:%s\r\n", path);
> +    EXPECT_STATE(qts1, expect, 0);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +    unlink(path);
> +    g_free(path);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_stream_unix_abstract(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    gchar *path;
> +    int ret;
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=true,"
> +                       "addr.type=unix,addr.path=%s,"
> +                       "addr.abstract=on",
> +                       path);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=false,"
> +                       "addr.type=unix,addr.path=%s,addr.abstract=on",
> +                       path);
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,unix:%s\r\n", path);
> +    EXPECT_STATE(qts1, expect, 0);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +    unlink(path);
> +    g_free(path);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_stream_fd(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int ret, sock0, sock1;
> +    struct sockaddr_un addr;
> +    gchar *path;
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +    addr.sun_family = AF_UNIX;
> +    strcpy(addr.sun_path, path);
> +
> +    unlink(addr.sun_path);
> +    sock0 = socket(AF_LOCAL, SOCK_STREAM, 0);
> +    g_assert_cmpint(sock0, !=, -1);
> +
> +    ret = bind(sock0, (struct sockaddr *)&addr, sizeof(addr));
> +    g_assert_cmpint(ret, !=, -1);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=true,"
> +                       "addr.type=fd,addr.str=%d",
> +                       sock0);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    sock1 = socket(AF_LOCAL, SOCK_STREAM, 0);
> +    g_assert_cmpint(sock1, !=, -1);
> +
> +    ret = connect(sock1, (struct sockaddr *)&addr, sizeof(addr));
> +    g_assert_cmpint(ret, !=, -1);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=false,addr.type=fd,addr.str=%d",
> +                       sock1);
> +
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,unix:%s\r\n", path);
> +    EXPECT_STATE(qts1, expect, 0);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +
> +    closesocket(sock0);
> +    closesocket(sock1);
> +
> +    g_free(path);
> +}
> +
> +static void test_dgram_inet(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int port[2];
> +    int nb;
> +
> +    nb = inet_get_free_port_multiple(2, port);
> +    g_assert_cmpint(nb, ==, 2);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,"
> +                       "local.type=inet,local.host=localhost,local.port=%d,"
> +                       "remote.type=inet,remote.host=localhost,remote.port=%d",
> +                        port[0], port[1]);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,"
> +                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n",
> +                             port[0], port[1]);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,"
> +                       "local.type=inet,local.host=localhost,local.port=%d,"
> +                       "remote.type=inet,remote.host=localhost,remote.port=%d",
> +                        port[1], port[0]);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,"
> +                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n",
> +                             port[1], port[0]);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_dgram_mcast(void)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,"
> +                       "remote.type=inet,remote.host=230.0.0.1,remote.port=1234");
> +
> +    EXPECT_STATE(qts, "st0: index=0,type=dgram,mcast=230.0.0.1:1234\r\n", 0);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_dgram_unix(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    gchar *path0, *path1;
> +    int ret;
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path0, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path1, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,local.type=unix,local.path=%s,"
> +                       "remote.type=unix,remote.path=%s",
> +                       path0, path1);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,udp=%s:%s\r\n",
> +                             path0, path1);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,local.type=unix,local.path=%s,"
> +                       "remote.type=unix,remote.path=%s",
> +                       path1, path0);
> +
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,udp=%s:%s\r\n",
> +                             path1, path0);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);
> +
> +    unlink(path0);
> +    g_free(path0);
> +    unlink(path1);
> +    g_free(path1);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_dgram_fd(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int ret;
> +    int sv[2];
> +
> +    ret = socketpair(PF_UNIX, SOCK_DGRAM, 0, sv);
> +    g_assert_cmpint(ret, !=, -1);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,local.type=fd,local.str=%d",
> +                       sv[0]);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,fd=%d unix\r\n", sv[0]);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,local.type=fd,local.str=%d",
> +                       sv[1]);
> +
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,fd=%d unix\r\n", sv[1]);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +
> +    closesocket(sv[0]);
> +    closesocket(sv[1]);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
> +    qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
> +    qtest_add_func("/netdev/stream/unix", test_stream_unix);
> +    qtest_add_func("/netdev/stream/unix/abstract", test_stream_unix_abstract);
> +    qtest_add_func("/netdev/stream/fd", test_stream_fd);
> +    qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
> +    qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
> +    qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
> +    qtest_add_func("/netdev/dgram/fd", test_dgram_fd);
> +
> +    ret = g_test_run();
> +
> +    return ret;
> +}



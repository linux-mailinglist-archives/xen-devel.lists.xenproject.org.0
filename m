Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A38760762D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 13:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427627.676897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olqFl-0001RM-J9; Fri, 21 Oct 2022 11:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427627.676897; Fri, 21 Oct 2022 11:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olqFl-0001Oa-FS; Fri, 21 Oct 2022 11:31:53 +0000
Received: by outflank-mailman (input) for mailman id 427627;
 Fri, 21 Oct 2022 11:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i13X=2W=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1olqFk-0001OU-F9
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 11:31:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4448adf-5133-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 13:31:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-L3yhJ8jiMyK3C_XSd5RBOw-1; Fri, 21 Oct 2022 07:31:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F77138012DC;
 Fri, 21 Oct 2022 11:31:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C12FC10DF8;
 Fri, 21 Oct 2022 11:31:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A2B0821E675B; Fri, 21 Oct 2022 13:31:46 +0200 (CEST)
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
X-Inumbo-ID: f4448adf-5133-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666351909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p9dg7OvxbchOZSWhRuiUBoYJ1VdXWRMHMPlqUTGmjY4=;
	b=B7xvkFAkWDKlQfGJ4cMhjtVtIyAYVt/eAO4bBY4LgNJbjdEpIlr/+yFBnWMC9Ol01QlnBp
	vcYJvTcoCVvQN7gy8PNXoMShLdSPzJp3fIHoeF4sCGyQsb6FxC3kmgtkfxACCBzhPOQbbX
	RpAs/CnZXMUM7lw68+fluxLdEcYfRcM=
X-MC-Unique: L3yhJ8jiMyK3C_XSd5RBOw-1
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
  qemu-devel@nongnu.org,
  Thomas Huth <thuth@redhat.com>,  xen-devel@lists.xenproject.org,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Anthony Perard
 <anthony.perard@citrix.com>,  Stefan Weil <sw@weilnetz.de>,  David Gibson
 <david@gibson.dropbear.id.au>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Paul Durrant <paul@xen.org>,  Eric Blake
 <eblake@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Samuel
 Thibault <samuel.thibault@ens-lyon.org>,  Greg Kurz <groug@kaod.org>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v14 15/17] net: stream: move to QIO to enable additional
 parameters
References: <20221021090922.170074-1-lvivier@redhat.com>
	<20221021090922.170074-16-lvivier@redhat.com>
	<1f769d00-cf50-abaf-f078-f301959156b9@linaro.org>
	<87tu3x1n2m.fsf@pond.sub.org>
	<881f1b6d-ac9f-a144-0e13-622981f02130@redhat.com>
Date: Fri, 21 Oct 2022 13:31:46 +0200
In-Reply-To: <881f1b6d-ac9f-a144-0e13-622981f02130@redhat.com> (Laurent
	Vivier's message of "Fri, 21 Oct 2022 12:43:49 +0200")
Message-ID: <871qr11kgt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Laurent Vivier <lvivier@redhat.com> writes:

> On 10/21/22 12:35, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> On 21/10/22 11:09, Laurent Vivier wrote:
>>>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>>>> This allows net/stream to use all the available parameters provided by
>>>> SocketAddress.
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>>    net/stream.c    | 492 +++++++++++++++++----------------------------=
---
>>>>    qemu-options.hx |   4 +-
>>>>    2 files changed, 178 insertions(+), 318 deletions(-)
>>>
>>>> -static void net_stream_accept(void *opaque)
>>>> +static void net_stream_server_listening(QIOTask *task, gpointer opaqu=
e)
>>>>    {
>>>>        NetStreamState *s =3D opaque;
>>>> -    struct sockaddr_storage saddr;
>>>> -    socklen_t len;
>>>> -    int fd;
>>>> -
>>>> -    for (;;) {
>>>> -        len =3D sizeof(saddr);
>>>> -        fd =3D qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &=
len);
>>>> -        if (fd < 0 && errno !=3D EINTR) {
>>>> -            return;
>>>> -        } else if (fd >=3D 0) {
>>>> -            qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
>>>> -            break;
>>>> -        }
>>>> -    }
>>>> +    QIOChannelSocket *listen_sioc =3D QIO_CHANNEL_SOCKET(s->listen_io=
c);
>>>> +    SocketAddress *addr;
>>>> +    int ret;
>>>> -    s->fd =3D fd;
>>>> -    s->nc.link_down =3D false;
>>>> -    net_stream_connect(s);
>>>> -    switch (saddr.ss_family) {
>>>> -    case AF_INET: {
>>>> -        struct sockaddr_in *saddr_in =3D (struct sockaddr_in *)&saddr;
>>>> -
>>>> -        qemu_set_info_str(&s->nc, "connection from %s:%d",
>>>> -                          inet_ntoa(saddr_in->sin_addr),
>>>> -                          ntohs(saddr_in->sin_port));
>>>> -        break;
>>>> +    if (listen_sioc->fd < 0) {
>>>> +        qemu_set_info_str(&s->nc, "connection error");
>>>> +        return;
>>>>        }
>>>> -    case AF_UNIX: {
>>>> -        struct sockaddr_un saddr_un;
>>>> -        len =3D sizeof(saddr_un);
>>>> -        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
>>>> -        qemu_set_info_str(&s->nc, "connect from %s", saddr_un.sun_pat=
h);
>>>> -        break;
>>>> -    }
>>>> -    default:
>>>> -        g_assert_not_reached();
>>>> +    addr =3D qio_channel_socket_get_local_address(listen_sioc, NULL);
>>>> +    g_assert(addr !=3D NULL);
>>>
>>> Missing propagating Error* (observed in v12).
>>=20
>> *If* this is really a programming error: what about &error_abort?
>
> assert() informs the compiler that following code will not use addr with =
a NULL value, I=20
> don't think &error_abort does that. This could avoid an error report in c=
ode static analyzer.

I'd expect Coverity to see right through it.

Static analyzers with a less global view won't, of course.

For what it's worth, there are about a thousand uses of &error_abort
outside tests/.  I'm not aware of them confusing static analyzers we
care about.

I like &error_abort, because it makes the program crash when we try to
put the error into &error_abort, with an informative message.  This is
often right where things go wrong[*].  I personally don't care much
about the better message, but others do.  The better stack backtrace has
been quite useful to me.

Let's use &error_abort, and throw in the assert when a static analyzer
we care about needs it.


[*] error_propagate() messes this up.  That's why the comments in
error.h ask you to do without when practical.



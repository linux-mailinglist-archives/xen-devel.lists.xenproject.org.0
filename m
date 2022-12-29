Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B4658B15
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 10:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469690.729100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pApJZ-0004GG-4M; Thu, 29 Dec 2022 09:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469690.729100; Thu, 29 Dec 2022 09:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pApJZ-0004DZ-0C; Thu, 29 Dec 2022 09:35:05 +0000
Received: by outflank-mailman (input) for mailman id 469690;
 Thu, 29 Dec 2022 09:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4oVf=43=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pApJX-0004DN-5t
 for xen-devel@lists.xenproject.org; Thu, 29 Dec 2022 09:35:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 111ff439-875c-11ed-91b6-6bf2151ebd3b;
 Thu, 29 Dec 2022 10:35:02 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-isnhInbeOISEfblQAbzqug-1; Thu, 29 Dec 2022 04:34:59 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 p34-20020a05600c1da200b003d990064285so3265825wms.8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Dec 2022 01:34:59 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003c6f1732f65sm28144375wmm.38.2022.12.29.01.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:34:57 -0800 (PST)
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
X-Inumbo-ID: 111ff439-875c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672306501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcdrvCqNGjGHU9f/3dmKHzhrW9q3ylvLAkxtIJNUh5k=;
	b=evdJoGFknbkEDR44YzS8Uqd34y4CJwDbAaa6Q8tPxoaaUUZlXKDzK2WktUWPbOaaeXC1La
	nm5nRfdQMydTYM5rFA03GsoiqhEKaISXf7CnWT9fod8dXlFaOIYKRI6q/+n2CljaNbWRcm
	HZ7uQpIUIbU5HDLJ4f+jL/Y3nlE930Y=
X-MC-Unique: isnhInbeOISEfblQAbzqug-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcdrvCqNGjGHU9f/3dmKHzhrW9q3ylvLAkxtIJNUh5k=;
        b=7WwWDXOsYZEB0XdBnIuTI80F0DAFSxg8F2eLnqgnDBPAbgZ1u4wJmS08ePwqUUTu9h
         MxzQPzONWLKHHVuymOtOthkrWeNtEZiY/eEQMkF+KXKRawkk3x07rzyBjOZG6eL26tzT
         V9HvM4S5sCoWnu89GxkyTVEQqzispzx/f9P7f0LDaNenVf4JqUbpD3Vst2cQvtLB7Cce
         OTtAkAnz7VDAJtrVDBQz9u1fba0BmaSDNJPkrnfZBlYyKz9Cw0jrYaLvFRC7GQhwVmD6
         GSsmUnUd6IPrdE7oYKM+HPXPL+ovzdmVqGtcQp4iqvUuVB0IgkI1O3fRAJ0WGwQUtd6U
         859Q==
X-Gm-Message-State: AFqh2kouovE1lLK/IfhtBehbwAtQwIz8p5O77V4iDvqxC+WiknuR6nWQ
	FO/GLBKHmEGsq7Q9rGoKn5SrBm/IEYkdGxsR1YlT2bHl64BEuN9H/Xmo7702bG2TV5hrYV0Nq+w
	CQndF4+nXRHEWHuQkkxKBaguBHXM=
X-Received: by 2002:a05:600c:41d1:b0:3d2:3d7b:6118 with SMTP id t17-20020a05600c41d100b003d23d7b6118mr19542860wmh.24.1672306498380;
        Thu, 29 Dec 2022 01:34:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt/4j8QTHWJSp160KylJKNWsBz1Vjettg8tniYVzZJu5Uz2eF3E4HoK9vYXUf1BDQV84SkA2g==
X-Received: by 2002:a05:600c:41d1:b0:3d2:3d7b:6118 with SMTP id t17-20020a05600c41d100b003d23d7b6118mr19542844wmh.24.1672306498196;
        Thu, 29 Dec 2022 01:34:58 -0800 (PST)
Message-ID: <27da4d93-38e6-1c40-4a60-92f3343f380f@redhat.com>
Date: Thu, 29 Dec 2022 10:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 5/6] tests: add G_GNUC_PRINTF for various functions
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221219130205.687815-6-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/12/2022 14.02, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/ahci-test.c           |  3 +++
>   tests/qtest/arm-cpu-features.c    |  1 +
>   tests/qtest/erst-test.c           |  2 +-
>   tests/qtest/ide-test.c            |  3 ++-
>   tests/qtest/ivshmem-test.c        |  4 ++--
>   tests/qtest/libqmp.c              |  2 +-
>   tests/qtest/libqos/libqos-pc.h    |  6 ++++--
>   tests/qtest/libqos/libqos-spapr.h |  6 ++++--
>   tests/qtest/libqos/libqos.h       |  6 ++++--
>   tests/qtest/libqos/virtio-9p.c    |  1 +
>   tests/qtest/migration-helpers.h   |  1 +
>   tests/qtest/rtas-test.c           |  2 +-
>   tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
>   tests/unit/test-qmp-cmds.c        | 13 +++++++++----
>   14 files changed, 36 insertions(+), 18 deletions(-)
...
> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> index 2373cd64cb..6d52b4e5d8 100644
> --- a/tests/unit/test-qmp-cmds.c
> +++ b/tests/unit/test-qmp-cmds.c
> @@ -138,6 +138,7 @@ void qmp___org_qemu_x_command(__org_qemu_x_EnumList *a,
>   }
>   
>   
> +G_GNUC_PRINTF(2, 3)
>   static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
>   {
>       va_list ap;
> @@ -160,6 +161,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
>       return ret;
>   }
>   
> +G_GNUC_PRINTF(3, 4)
>   static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
>                                     const char *template, ...)
>   {
> @@ -269,7 +271,7 @@ static void test_dispatch_cmd_io(void)
>   
>   static void test_dispatch_cmd_deprecated(void)
>   {
> -    const char *cmd = "{ 'execute': 'test-command-features1' }";
> +    #define cmd "{ 'execute': 'test-command-features1' }"
>       QDict *ret;

That looks weird, why is this required?

  Thomas



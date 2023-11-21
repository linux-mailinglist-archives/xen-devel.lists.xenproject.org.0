Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A0F7F2B17
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 11:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637731.993723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ORp-0007QW-In; Tue, 21 Nov 2023 10:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637731.993723; Tue, 21 Nov 2023 10:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ORp-0007On-FM; Tue, 21 Nov 2023 10:57:41 +0000
Received: by outflank-mailman (input) for mailman id 637731;
 Tue, 21 Nov 2023 10:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dasP=HC=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1r5ORo-0007NR-6k
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 10:57:40 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c835c077-885c-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 11:57:37 +0100 (CET)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-77891c236fcso354791385a.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 02:57:37 -0800 (PST)
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
X-Inumbo-ID: c835c077-885c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700564256; x=1701169056; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJ+WDl7ap9d4Irav98OxABBWtmFBGJ/2Lqy/4Q7WP2A=;
        b=PqSvbztLPAGvi/zIw9kekwmi27dZIHSJNKJX8Wu2XwS3FOFunbzA/rjeNVoZse4TyX
         TBP3AONhorFLUrQvmrdw8ex03TVwEaCuQnmzdqE5oUm57dFJJ5BzjHRcJ0DRhwwNR+Y3
         /g+gq+26iI410itsPwAudaNXvE8ZLf7q1HxnRji0DzXPxueXtHolvnLsHjSn5tUqVWRt
         NtvKPBM50ntsa1tyeq5ywN19y9E4P+Z9fBnhKyDlmq9ui4+8NxMgHiJE6wKKWjIt+95T
         CNEy3D7wJuAef+ix0BYLuaGwSfraAUEE1zXYrwENSSGij+sPZ9uQ0TxukkjsQkervl6e
         AicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564257; x=1701169057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJ+WDl7ap9d4Irav98OxABBWtmFBGJ/2Lqy/4Q7WP2A=;
        b=izx3wlcaCb7L4T0Nkkn2swfc+KOKv+xqgNON8F+WzZgp/d/k2PSyUUKWa0rb87HBtT
         OJCJr2Cw0Hryr5MrfOGE1a2zkTEYlh9DrcZODjeGLQ/JCXqci/A4AeUHLXbU3nmmICK/
         hwID8lcTxpwANojFZXnqAgwLYqstkibLzCJBEusLEcijNHOsHr55NwRwfJwaHffY3Ij9
         H/7a4uFXZkldJNDYeenucYOvXs4P3Os2y0qNF3fz4kRaFKcoFCUej4VLvMFQqGOtDVCU
         4/Uod3RNB04TKYhffyhUrVmAmBb952CqAcmIQv5g1APEbOfP2O+hbyMJrft6SufovThg
         FxhQ==
X-Gm-Message-State: AOJu0YypbcBTf/iOS1Q0z0XHjpRL7uh3RB9BlRVXXewlK/EebGgHKe6Z
	JUrkUgK4ZecHqwwYsEgjWkW9L5DznFP83EpTgew=
X-Google-Smtp-Source: AGHT+IG+itVYM+AUOUqIeSoVw3MEvxDfAeTADoEcqgXVo4VkDVOdQ4BHWwfgSF73Uec0ZBPWnWk4VjPJcH4sqs7rtw0=
X-Received: by 2002:a05:620a:8388:b0:778:9ac2:5a9f with SMTP id
 pb8-20020a05620a838800b007789ac25a9fmr12609093qkn.11.1700564256669; Tue, 21
 Nov 2023 02:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20231115172723.1161679-1-dwmw2@infradead.org> <20231115172723.1161679-3-dwmw2@infradead.org>
In-Reply-To: <20231115172723.1161679-3-dwmw2@infradead.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Nov 2023 14:57:25 +0400
Message-ID: <CAJ+F1C+3UQoEEvFgg8ENjR0xv-LTiPckx4XkCjVqOe2Jnx1EeA@mail.gmail.com>
Subject: Re: [PATCH 2/3] vl: disable default serial when xen-console is enabled
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Nov 15, 2023 at 9:28=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> If a Xen console is configured on the command line, do not add a default
> serial port.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  system/vl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/system/vl.c b/system/vl.c
> index 5af7ced2a1..8109231834 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -198,6 +198,7 @@ static const struct {
>      const char *driver;
>      int *flag;
>  } default_list[] =3D {
> +    { .driver =3D "xen-console",          .flag =3D &default_serial    }=
,
>      { .driver =3D "isa-serial",           .flag =3D &default_serial    }=
,
>      { .driver =3D "isa-parallel",         .flag =3D &default_parallel  }=
,
>      { .driver =3D "isa-fdc",              .flag =3D &default_floppy    }=
,

Consistent with the rest of the lines (no conditional compilation nor
driver #define..)
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

btw, while quickly testing this (do we have any test for xen-console?):

$ qemu --accel kvm,xen-version=3D0x40011,kernel-irqchip=3Dsplit -device
xen-console,chardev=3Dfoo -chardev stdio,id=3Dfoo
(and close gtk window)

Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
0x0000555555c11695 in qemu_free_net_client (nc=3D0x0) at ../net/net.c:387
387        if (nc->incoming_queue) {
(gdb) bt
#0  0x0000555555c11695 in qemu_free_net_client (nc=3D0x0) at ../net/net.c:3=
87
#1  0x0000555555c11a14 in qemu_del_nic (nic=3D0x555558b6f930) at ../net/net=
.c:459
#2  0x00005555559e398b in xen_netdev_unrealize (xendev=3D0x555558b6b510)
at ../hw/net/xen_nic.c:550
#3  0x0000555555b6e22f in xen_device_unrealize (dev=3D0x555558b6b510) at
../hw/xen/xen-bus.c:973
#4  0x0000555555b6e351 in xen_device_exit (n=3D0x555558b6b5e0, data=3D0x0)
at ../hw/xen/xen-bus.c:1002
#5  0x00005555560bc3fc in notifier_list_notify (list=3D0x5555570b5fc0
<exit_notifiers>, data=3D0x0) at ../util/notify.c:39
#6  0x0000555555ba1d49 in qemu_run_exit_notifiers () at ../system/runstate.=
c:800



--
Marc-Andr=C3=A9 Lureau


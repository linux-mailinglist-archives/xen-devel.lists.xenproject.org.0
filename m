Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE92760F30E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430943.683268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyj5-0003bt-7i; Thu, 27 Oct 2022 08:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430943.683268; Thu, 27 Oct 2022 08:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyj5-0003Yn-52; Thu, 27 Oct 2022 08:58:59 +0000
Received: by outflank-mailman (input) for mailman id 430943;
 Thu, 27 Oct 2022 08:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uk3A=24=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1onyj4-0003Yh-8l
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 08:58:58 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 965a1505-55d5-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 10:58:56 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id o4so1038462wrq.6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Oct 2022 01:58:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b003a5f3f5883dsm4481191wmq.17.2022.10.27.01.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:58:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F8721FFB7;
 Thu, 27 Oct 2022 09:58:54 +0100 (BST)
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
X-Inumbo-ID: 965a1505-55d5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlK9CJNg/9rsUzm71jPR98pXYeeVDstCpBqW8I8CNA4=;
        b=YlBXV8QXZlvjUNP3tQKPHYVepyIjaF5Ovz4hkGV6jofMtO534xsxbsnmq6f+9bBqyd
         3RjepHNx//neEJS3lSvYWkgnSl/ktz4y4m+m6LkbFuLEaYl5Qh/9+EonuCS4zxLcGNdc
         2c9mpfGEN1ETOTQyg4pjyKL7qbQjn0I5lQMVSolifACzLyERYo71Kp+6q3ZQZPvfdmFi
         jhska+a4iIZIo/WweOmG/+ryJ4B/VlslraCZ38sOBZ2GQgf9OXmBXUgluNA/O7ajMnjh
         OwH4dxDl1T1z9MOoJE89gqhlsJLL7SgpytBP+i8mmw4yar70tD/yMvLd6CceMozyvQqa
         LObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HlK9CJNg/9rsUzm71jPR98pXYeeVDstCpBqW8I8CNA4=;
        b=ox9seih/K2f5BstFLIFP0aOk4e/UN66G7h6I8GzrOCkLknpkS8DI6Fj0Dn0fpv2EJo
         bd0aLTCcVl91sYs/Sk1ntgCZrL6c5puIAnm1XXh6bZ8jLQLwHRcym8HmwxiqTYFu0F/2
         pVG+7fj5w1ry10hd8Y6oNHqEurbK1HD6ZRvYI7dmwIzzv7BNW6/5MOVcYUDdQ3zLnHP5
         nt3a6FuOW6GGYSE8dTWKe6Ls+wQYM7ub5sMGEF7i1kbKt1hzBPxBoMTyBAyeUxxHWEV4
         p12TbHA1a/Rt2DDkc/bLbWxYPWXz5Yr4VtgwDr5kyWaMZPPFLeJiuaNjwTMwyXhgZQ/x
         Oz7A==
X-Gm-Message-State: ACrzQf1kRHf25uakcyJAEfi4Q6AZi+hFO+77ZQYw9UnnrQ/Nobk7/2mE
	jg1z+zrSxES9DVxeC/jLtWNnqA==
X-Google-Smtp-Source: AMsMyM77tWKKcuvcrigafDwCzk9KcKoAesgG7RQROTl8z9x/JYo0weCt44sLmZ+v0mNPt8YKddDXpQ==
X-Received: by 2002:adf:d843:0:b0:236:6231:113b with SMTP id k3-20020adfd843000000b002366231113bmr17057263wrl.42.1666861135337;
        Thu, 27 Oct 2022 01:58:55 -0700 (PDT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-9-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
  Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 08/12] hw/xen/xen-hvm-common: skip ioreq creation on
 ioreq registration failure
Date: Thu, 27 Oct 2022 09:46:47 +0100
In-reply-to: <20221015050750.4185-9-vikram.garhwal@amd.com>
Message-ID: <87bkpx3anl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails conti=
nue
> to the PV backends initialization.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  hw/xen/xen-hvm-common.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index f848f9e625..7bccf595fc 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -777,7 +777,11 @@ void xen_register_ioreq(XenIOState *state, unsigned =
int max_cpus,
>          goto err;
>      }
>=20=20
> -    xen_create_ioreq_server(xen_domid, &state->ioservid);
> +    rc =3D xen_create_ioreq_server(xen_domid, &state->ioservid);
> +    if (rc) {
> +        DPRINTF("xen: failed to create ioreq server\n");

This should be a warn_report to properly inform the user.

> +        goto no_ioreq;

Maybe pushing the rest of this function into a local subroutine would
reduce the amount of goto messing about. Other candidates for cleaning
up/modernising:

  - g_malloc to g_new0
  - perror -> error_setg_errno

> +    }
>=20=20
>      state->exit.notify =3D xen_exit_notifier;
>      qemu_add_exit_notifier(&state->exit);
> @@ -842,6 +846,7 @@ void xen_register_ioreq(XenIOState *state, unsigned i=
nt max_cpus,
>      QLIST_INIT(&state->dev_list);
>      device_listener_register(&state->device_listener);
>=20=20
> +no_ioreq:
>      xen_bus_init();
>=20=20
>      /* Initialize backend core & drivers */


--=20
Alex Benn=C3=A9e


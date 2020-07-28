Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE8230685
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 11:27:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0LtH-0002cT-Hp; Tue, 28 Jul 2020 09:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaET=BH=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1k0LtG-0002cN-QH
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 09:27:18 +0000
X-Inumbo-ID: 87b73d30-d0b4-11ea-8b20-bc764e2007e4
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87b73d30-d0b4-11ea-8b20-bc764e2007e4;
 Tue, 28 Jul 2020 09:27:17 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id u63so5140777oie.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 02:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0jlqF1vNQDLT4jtpLs7LnhRZhztTYxX9+FwYb5e1cXw=;
 b=eRqUuFEncWn7FuFUnXBers8AJ9XN0eRqhILUyjbnliu64xB8yyByOZvCMI8cIVmplA
 ym5Oxrcg+dSpxd2RBRjREgyV/ymKJDz8B4vMzGuXGq3h5dIOW0dUitokRqDa9tEBn+Sj
 Zag69kqe1yR3RsBzVRNoHcGdu9bU7JANw0ruGcMwpI7Z0oL0IEXLyGn+XzCt2qEFHn9t
 MOmppHvcvytbbG3ruItt/Tone39XjHwj5rIRgK+PHa+G0cjBsGDrx57lgtIob0Zr/z+m
 k2T5DMBv0uxS2s1jdwvMvoC90YECmFkKNcebLbdwSdUuA7PrFdI6hOhdbPO3KdnlCFxJ
 y8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0jlqF1vNQDLT4jtpLs7LnhRZhztTYxX9+FwYb5e1cXw=;
 b=Zrx806uwfvhymbfnl4xsBrHAhe2RZscjxBYi6x7pl52foNrEUXBNSe/kFN6KZWPnYV
 i8TCjAyEUAHDREw8uvyvCHoi+KrzBQQriZDQIOL4PSDeJAoztJeQnd4LbtKL2xjvDuD9
 SqGuaH8mIHslO76XMzZCUXDoP4G+iuCnCYFyW+OGVneF1kcqtC4YvRxlInWt2YtXqSAg
 qU/GtyjQo+XbBPr/IWUK3dmqlMvg0lVdIp4hTa/4x+hTR7KlZitPs/RVQst5DNrzNx2W
 wJUqVh6ru9UVlEynncvHvt1+T9apAKWLsQ8pkxXjRxJAjmzDYuU9AnHgQT5nOj6Tv0dP
 TKTw==
X-Gm-Message-State: AOAM533EV9qsWGrYUKfLlfH6C3ZS9jOdt1Xu0FpzSqGDOjTp4dynakHp
 WFnJhIqqQBd5lsSK3hgpWuxW30PzZXhuFktkM2f7Dg==
X-Google-Smtp-Source: ABdhPJx7pJQRRKQTwke8VyQeZ02E0pIOiXvGYB2MeLNmSe8kmmcIflbUUPw95KHqQOILTAurpITPfgKIJUh6zSV6dIo=
X-Received: by 2002:aca:4a96:: with SMTP id x144mr2689821oia.163.1595928437503; 
 Tue, 28 Jul 2020 02:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200728091828.21702-1-paul@xen.org>
In-Reply-To: <20200728091828.21702-1-paul@xen.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 10:27:06 +0100
Message-ID: <CAFEAcA_wKTFWk9Uk5HMabqfa6QkkTAdzBotmnrA_EH1BR4XjYg@mail.gmail.com>
Subject: Re: [PATCH] configure: define CONFIG_XEN when Xen is enabled
To: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <pdurrant@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 28 Jul 2020 at 10:19, Paul Durrant <paul@xen.org> wrote:
>
> From: Paul Durrant <pdurrant@amazon.com>
>
> The recent commit da278d58a092 "accel: Move Xen accelerator code under
> accel/xen/" introduced a subtle semantic change, making xen_enabled() alw=
ays
> return false unless CONFIG_XEN is defined prior to inclusion of sysemu/xe=
n.h,
> which appears to be the normal case. This causes various use-cases of QEM=
U
> with Xen to break.
>
> This patch makes sure that CONFIG_XEN is defined if --enable-xen is passe=
d
> to configure.
>
> Fixes: da278d58a092 ("accel: Move Xen accelerator code under accel/xen/")
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configure b/configure
> index 2acc4d1465..f1b9d129fd 100755
> --- a/configure
> +++ b/configure
> @@ -7434,6 +7434,7 @@ if test "$virglrenderer" =3D "yes" ; then
>    echo "VIRGL_LIBS=3D$virgl_libs" >> $config_host_mak
>  fi
>  if test "$xen" =3D "yes" ; then
> +  echo "CONFIG_XEN=3Dy" >> $config_host_mak
>    echo "CONFIG_XEN_BACKEND=3Dy" >> $config_host_mak
>    echo "CONFIG_XEN_CTRL_INTERFACE_VERSION=3D$xen_ctrl_version" >> $confi=
g_host_mak
>  fi

Configure already defines CONFIG_XEN as a target-specific
config define in config-target.mak for the specific targets
that Xen will work for (ie if you build --enable-xen for
x86_64-softmmu and ppc64-softmmu then CONFIG_XEN is set for
the former and not the latter). This patch makes it a
build-wide config setting by putting it in config-host.mak.

We should figure out which of those two is correct and do
just one of them, not do both at the same time.

Since CONFIG_HAX, CONFIG_KVM and other accelerator-type
config defines are also per-target, I suspect that the
correct fix for this bug is not in configure but elsewhere.

thanks
-- PMM


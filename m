Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708DD60F1D4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 10:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430913.683195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onxu1-0003cv-4R; Thu, 27 Oct 2022 08:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430913.683195; Thu, 27 Oct 2022 08:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onxu1-0003ZZ-1U; Thu, 27 Oct 2022 08:06:13 +0000
Received: by outflank-mailman (input) for mailman id 430913;
 Thu, 27 Oct 2022 08:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uk3A=24=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1onxtz-0003ZT-79
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 08:06:11 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32ac2419-55ce-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 10:06:02 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so3525703wmr.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Oct 2022 01:06:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a05600c42d500b003b492753826sm739610wme.43.2022.10.27.01.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:06:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 919ED1FFB7;
 Thu, 27 Oct 2022 09:06:00 +0100 (BST)
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
X-Inumbo-ID: 32ac2419-55ce-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1uurC34g6Qf9FWFyk2KxYKzqdHfrq68bhaSqBXYo5I=;
        b=voqhycX7azc3qkNmoaEI47DED1JheWSB5FvAWFHrw81a6fImlbnNBRSDIcvG9BExml
         26iN6aGZtpUIqliBs2HcdUXiCK9sCNgqejR09ardAtqfe1ldJOqYwTYhsy66h6AT59DR
         2e9VtXnRyyT2pb8OfQeq7gsEohoR/Vuh4xOVtgr4vsfmd6t55TrG2HE8urDAq/rk8hgy
         wnI0sfFjkvjadU1fAiW6KhI9kYv2eZsWFxUr9poXziE8F1XELnifCJiNpvsWne4sR0td
         2jDP3QSSJUfIwV5Wy0IznPBzh+7wPiFSIaFSWUWKoMtV23j+WIeqoVnVlMVQHW6rGVUI
         yRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1uurC34g6Qf9FWFyk2KxYKzqdHfrq68bhaSqBXYo5I=;
        b=cTZnfoI5t7azEMmCfBeRZhVWGRBa0vEyg9Ns5ZjgUzBkFlnQE6YG28Ye6GiI94mCVp
         7yACdVAO4EjIc1B/GxXqlQZrYeZmeSIIqvECJy3NDzqNQFnd9kZfVhjcd4a6xHeDDM5L
         PZQmTHi41r/ufyRrPKfYH4F2vdox7A/3E8toE1Lg/n571lyIsnb8YRpiaD540J1XAZEN
         iUSe1EEIWj07alzX+/9HgUIUZ6eEN+g+yVxtaU/LzRy7vLruTeEP/5W0vnOuq4ZN5CXb
         FZWiVKafp9Gkf7BMgm9nTiGWMKP9EDDrVY6PWAeRArydzZY0drXeHIygCEUY0euarraW
         D7ZQ==
X-Gm-Message-State: ACrzQf3wSbN7twdjz1lewJ3yRbH6sCnA9lm/gHdXPH+Tj467ao8NLGX1
	YX7KleR7An+2Gyshx/rb0hFSSA==
X-Google-Smtp-Source: AMsMyM5GL4qb1MFYnFCbiDZDc7xYJjB+hmZlm/UCDT+/BW/Bb1iQZ3miWz9BLFpOIdi8TqX2va0aTw==
X-Received: by 2002:a1c:25c1:0:b0:3cf:4dc4:5a97 with SMTP id l184-20020a1c25c1000000b003cf4dc45a97mr3556803wml.147.1666857961556;
        Thu, 27 Oct 2022 01:06:01 -0700 (PDT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Date: Thu, 27 Oct 2022 09:02:54 +0100
In-reply-to: <20221015050750.4185-11-vikram.garhwal@amd.com>
Message-ID: <87wn8l3d3r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

<snip>
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, a=
dds a
> TPM emulator and connects to swtpm running on host machine via chardev so=
cket
> and support TPM functionalities for a guest domain.
>
> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>     -chardev socket,id=3Dchrtpm,path=3D/tmp/myvtpm2/swtpm-sock \
>     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
>
> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpm=
s and
> provides access to TPM functionality over socket, chardev and CUSE interf=
ace.
> Github repo: https://github.com/stefanberger/swtpm
> Example for starting swtpm on host machine:
>     mkdir /tmp/vtpm2
>     swtpm socket --tpmstate dir=3D/tmp/vtpm2 \
>     --ctrl type=3Dunixio,path=3D/tmp/vtpm2/swtpm-sock &

<snip>
> +static void xen_enable_tpm(void)
> +{
> +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
> +#ifdef CONFIG_TPM
> +    Error *errp =3D NULL;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
> +
> +    TPMBackend *be =3D qemu_find_tpm_be("tpm0");
> +    if (be =3D=3D NULL) {
> +        DPRINTF("Couldn't fine the backend for tpm0\n");
> +        return;
> +    }
> +    dev =3D qdev_new(TYPE_TPM_TIS_SYSBUS);
> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> +    busdev =3D SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(busdev, &error_fatal);
> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);

I'm not sure what has gone wrong here but I'm getting:

  ../../hw/arm/xen_arm.c: In function =E2=80=98xen_enable_tpm=E2=80=99:
  ../../hw/arm/xen_arm.c:120:32: error: =E2=80=98GUEST_TPM_BASE=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98GUEST_RAM_BASE=
=E2=80=99?
    120 |     sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
        |                                ^~~~~~~~~~~~~~
        |                                GUEST_RAM_BASE
  ../../hw/arm/xen_arm.c:120:32: note: each undeclared identifier is report=
ed only once for each function it appears in

In my cross build:

  # Configured with: '../../configure' '--disable-docs' '--target-list=3Daa=
rch64-softmmu' '--disable-kvm' '--enable-xen' '--disable-opengl' '--disable=
-libudev' '--enable-tpm' '--disable-xen-pci-passthrough' '--cross-prefix=3D=
aarch64-linux-gnu-' '--skip-meson'

which makes me wonder if this is a configure failure or a confusion
about being able to have host swtpm implementations during emulation but
needing target tpm for Xen?

--=20
Alex Benn=C3=A9e


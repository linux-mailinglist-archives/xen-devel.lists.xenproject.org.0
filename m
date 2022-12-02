Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6596408D8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 15:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452081.709912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p17UM-0000Or-Jh; Fri, 02 Dec 2022 14:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452081.709912; Fri, 02 Dec 2022 14:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p17UM-0000MG-GJ; Fri, 02 Dec 2022 14:58:06 +0000
Received: by outflank-mailman (input) for mailman id 452081;
 Fri, 02 Dec 2022 14:58:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ddoq=4A=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1p17UK-0000MA-Ik
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 14:58:04 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8793410-7251-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 15:58:03 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 125-20020a1c0283000000b003d076ee89d6so3978614wmc.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Dec 2022 06:58:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 he10-20020a05600c540a00b003b4a699ce8esm11985654wmb.6.2022.12.02.06.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 06:58:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E05CD1FFB7;
 Fri,  2 Dec 2022 14:58:00 +0000 (GMT)
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
X-Inumbo-ID: b8793410-7251-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9T3B6rMs0ButiAJjIKG3bej1pIqckOwF5PkZjO6q1PQ=;
        b=X/FxytkHR8G+Azsb5LrhgL2Q7ZZrONjwZdRFMY0obvUvz5ZP8YHc4HHqIIb/P6stFt
         wB4vWm57UDWbne5Xh3lmM0bZbBFXWbIizAOoGHcRzHC4nVsLrwi3I98qiVoX9kmFTnB3
         Fq5u2s4X4dP1QEmWzMbDBIfM/lC9Jw35QhLrQotiBHD85Zlmpqo9TNOXItywrzm24a01
         QWf8o83Kif8rJnxCbQA9RmLiQajGjDOSOW1Uu7+kfhzFGBYrrKLe6g4QYlH8lQkTN1Sq
         5jd5LHm4AAWboXRIcA5Ufk+4PEzE94Pd4zn32X675f+3Wpj/HY7Maf7ppaRI2PIUvGXF
         Bx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9T3B6rMs0ButiAJjIKG3bej1pIqckOwF5PkZjO6q1PQ=;
        b=W8AtPywNnf0OHjH9oZ3rOrdQQ+S8cWZvucnhigR9O4TNzWmT54zSZK0EXy4P8DP1z2
         YVLQikuejk042aGm2Pw9mGW9+BduF9ij7a9VQIlPv4+2OVktOZgxb1ZW+q1M/272Gk03
         uuq9YJzwijt58C9JgSBK0XHpXn8mmM3M54EFdareV62LI1XYju+oGUD0feATEpWU9o3j
         sWYua/Df47fNXwNTCPvEq4zyLKYX/ccIxM3O0aZc6KJcIw1PeM4fo6sZ+NzRTACWAfZ5
         C2dKOkOdLJlf7tGF9ZZSq6Nq9h3xwFxk9TTek9oqiKFhUVjRWCaS9h8TFJBfVaoMBEJe
         Mn6g==
X-Gm-Message-State: ANoB5pmuDHYUZhFiPW+50F7aBUeXEkVjlWCE4hxmEX8ucydTNetB2zfy
	w7S4G7wbHODUXdRkU/NZkmL9JQ==
X-Google-Smtp-Source: AA0mqf4bITizXiqiJ1J0Fq/83aD9ON7/Jlg/4/W0Rd59Iq+0yZacUwx5owU3Ax192CkHYEVaj7AIsQ==
X-Received: by 2002:a05:600c:288:b0:3cf:758f:161f with SMTP id 8-20020a05600c028800b003cf758f161fmr49201899wmk.54.1669993082793;
        Fri, 02 Dec 2022 06:58:02 -0800 (PST)
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul  Durrant <paul@xen.org>, "open list:ARM
 TCG CPUs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Date: Fri, 02 Dec 2022 14:52:41 +0000
In-reply-to: <20221202030003.11441-11-vikram.garhwal@amd.com>
Message-ID: <871qphc0p3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Add a new machine xenpv which creates a IOREQ server to register/connect =
with
> Xen Hypervisor.
>
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
> +
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

Still fails on my aarch64 Debian machine:

  FAILED: libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.o=20
  cc -Ilibqemu-aarch64-softmmu.fa.p -I. -I../.. -Itarget/arm -I../../target=
/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 -I/usr/local/i=
nclude -I/usr/include/capstone -I/usr/include/spice-server -I/usr/include/s=
pice-1 -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/includ=
e -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -=
g -isystem /home/alex/lsrc/qemu.git/linux-headers -isystem linux-headers -i=
quote . -iquote /home/alex/lsrc/qemu.git -iquote /home/alex/lsrc/qemu.git/i=
nclude -iquote /home/alex/lsrc/qemu.git/tcg/aarch64 -pthread -U_FORTIFY_SOU=
RCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFI=
LE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wm=
issing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-decl=
aration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k=
 -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-lab=
els -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-=
dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -i=
system../../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARG=
ET=3D"aarch64-softmmu-config-target.h"' '-DCONFIG_DEVICES=3D"aarch64-softmm=
u-config-devices.h"' -MD -MQ libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.=
o -MF libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.o.d -o libqemu-aarch64-=
softmmu.fa.p/hw_arm_xen_arm.c.o -c ../../hw/arm/xen_arm.c
  ../../hw/arm/xen_arm.c: In function =E2=80=98xen_enable_tpm=E2=80=99:
  ../../hw/arm/xen_arm.c:126:32: error: =E2=80=98GUEST_TPM_BASE=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98GUEST_RAM_BASE=
=E2=80=99?
    126 |     sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
        |                                ^~~~~~~~~~~~~~
        |                                GUEST_RAM_BASE
  ../../hw/arm/xen_arm.c:126:32: note: each undeclared identifier is report=
ed only once for each function it appears in
  [2082/3246] Compiling C object libqemu-aarch64-softmmu.fa.p/hw_xen_xen-ma=
pcache.c.o
  [2083/3246] Compiling C object libqemu-aarch64-softmmu.fa.p/hw_xen_xen-hv=
m-common.c.o
  ninja: build stopped: subcommand failed.
  make: *** [Makefile:165: run-ninja] Error 1

> +
> +    DPRINTF("Connected tpmdev at address 0x%lx\n", GUEST_TPM_BASE);
> +#endif
> +}

If there is a minimum required version for TPM then it needs to be
picked up by configure.

--=20
Alex Benn=C3=A9e


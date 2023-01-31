Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D4682B55
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 12:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487544.755214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMohM-0001hk-5W; Tue, 31 Jan 2023 11:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487544.755214; Tue, 31 Jan 2023 11:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMohM-0001ed-1r; Tue, 31 Jan 2023 11:21:12 +0000
Received: by outflank-mailman (input) for mailman id 487544;
 Tue, 31 Jan 2023 11:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fq0=54=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMohK-0001eT-M9
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 11:21:10 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 580956ae-a159-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 12:21:02 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id k4so35108814eje.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 03:21:02 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 rh16-20020a17090720f000b0087329ff593fsm8283408ejb.144.2023.01.31.03.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:21:01 -0800 (PST)
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
X-Inumbo-ID: 580956ae-a159-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1EU17L5Dv+ou0u3yO5I2dlzjouARcKMNMmRCwy0uBFE=;
        b=I1j7JHYX6G3zWQ2g6WpFnUJgdfNCGg6Dlox3OeMLJbcRAWv2ed+C3ztCLd5iK4PMB9
         znSBv9MUrpQupiFlqJwZ2+CyGN1MDNF9hWTvVrbz6QkSfKCQut3IR61uJot6Db3tRA6N
         w0jUGuXZg/26Y5xErRe05gM7dQ67elUtf+OEdOmiUgrSZakQgy8L5e0k0ruGGOBdaMcH
         1J4/yrt+WX9rXmwtJqY3nYJ0aBedk6FO1HUVOA6WBf5BDjX8pv2oOz0amWB8RjEB8+kF
         BMwOdPq/JhyMJJWGOq95XWFFWFWCD4adDW0UPmII2dqakO1cjNCXagD7z84oBoNdGsG1
         zHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1EU17L5Dv+ou0u3yO5I2dlzjouARcKMNMmRCwy0uBFE=;
        b=YpL4W9FDfuWBCSoKu1NKWclzdKaBln/HpaHlgccE9R9R9YJ+cKZqoij+nfZgKkzN0u
         awZeW26vFDKtLrL6HA+Dx9yERZbjUTKl3GzdalYs65b4ol0h/rAQK4Mhtc1ciby4zZ4H
         1r2mY/Mpd76skza0/pxKxtyMR/movQlAvtb+L2eVaR1/gT1p+3ESk2zGUQpkNIaj8+mG
         aRvowEfTUneUX53axQNBIJ5UiTHCsQA8ixd3a3sM1HDI/8rfZNFrBS5Sh5HBr75/BRgo
         x3XoUIPYTQr5Q+8yPFvgLFmYYNwlsiE8sFu4VpPWM64+SHqpRIZx6T8iL5H+YDoUTGQ6
         qofA==
X-Gm-Message-State: AO0yUKUfHaeHkHjkbl2UyeJjOAT3HGL5olzg73y7k42CTE2e4r+b/UWZ
	a0EFzih38PIcP+YfG3jebdQ=
X-Google-Smtp-Source: AK7set+7i1iruwlpsuqr6KpszXv55af3TSVc6M9tdGBSSp+zMStA9mJyUhAB7FjTr3NcVW9KQkGHqQ==
X-Received: by 2002:a17:906:4793:b0:87b:db62:d659 with SMTP id cw19-20020a170906479300b0087bdb62d659mr18063417ejc.19.1675164061688;
        Tue, 31 Jan 2023 03:21:01 -0800 (PST)
Message-ID: <2d0bcfe525ff26f9487efc906b0db29e4ff7a6b3.camel@gmail.com>
Subject: Re: [PATCH v7 2/2] automation: add RISC-V smoke test
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Gianluca
 Guida <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>, Alistair
 Francis <alistair.francis@wdc.com>
Date: Tue, 31 Jan 2023 13:21:00 +0200
In-Reply-To: <alpine.DEB.2.22.394.2301271013460.1978264@ubuntu-linux-20-04-desktop>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
	 <e2d722a5f3fffc5708c1cc99efad63ab04d25ec3.1674819203.git.oleksii.kurochko@gmail.com>
	 <alpine.DEB.2.22.394.2301271013460.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-27 at 10:14 -0800, Stefano Stabellini wrote:
> On Fri, 27 Jan 2023, Oleksii Kurochko wrote:
> > Add check if there is a message 'Hello from C env' presents
> > in log file to be sure that stack is set and C part of early printk
> > is working.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > Changes in V7:
> > =C2=A0- Fix dependecy for qemu-smoke-riscv64-gcc job
> > ---
> > Changes in V6:
> > =C2=A0- Rename container name in test.yaml for .qemu-riscv64.
> > ---
> > Changes in V5:
> > =C2=A0 - Nothing changed
> > ---
> > Changes in V4:
> > =C2=A0 - Nothing changed
> > ---
> > Changes in V3:
> > =C2=A0 - Nothing changed
> > =C2=A0 - All mentioned comments by Stefano in Xen mailing list will be
> > =C2=A0=C2=A0=C2=A0 fixed as a separate patch out of this patch series.
> > ---
> > =C2=A0automation/gitlab-ci/test.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++++++++++++
> > =C2=A0automation/scripts/qemu-smoke-riscv64.sh | 20 +++++++++++++++++++=
+
> > =C2=A02 files changed, 40 insertions(+)
> > =C2=A0create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
> >=20
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-
> > ci/test.yaml
> > index afd80adfe1..4dbe1b8af7 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -54,6 +54,19 @@
> > =C2=A0=C2=A0 tags:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - x86_64
> > =C2=A0
> > +.qemu-riscv64:
> > +=C2=A0 extends: .test-jobs-common
> > +=C2=A0 variables:
> > +=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> > +=C2=A0=C2=A0=C2=A0 LOGFILE: qemu-smoke-riscv64.log
> > +=C2=A0 artifacts:
> > +=C2=A0=C2=A0=C2=A0 paths:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - smoke.serial
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - '*.log'
> > +=C2=A0=C2=A0=C2=A0 when: always
> > +=C2=A0 tags:
> > +=C2=A0=C2=A0=C2=A0 - x86_64
> > +
> > =C2=A0.yocto-test:
> > =C2=A0=C2=A0 extends: .test-jobs-common
> > =C2=A0=C2=A0 script:
> > @@ -234,6 +247,13 @@ qemu-smoke-x86-64-clang-pvh:
> > =C2=A0=C2=A0 needs:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - debian-unstable-clang-debug
> > =C2=A0
> > +qemu-smoke-riscv64-gcc:
> > +=C2=A0 extends: .qemu-riscv64
> > +=C2=A0 script:
> > +=C2=A0=C2=A0=C2=A0 - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 |=
 tee
> > ${LOGFILE}
> > +=C2=A0 needs:
> > +=C2=A0=C2=A0=C2=A0 - .gcc-riscv64-cross-build
>=20
> This is wrong, I think it should be: archlinux-current-gcc-riscv64 ?
>=20
Thanks for noticing.

You are right.
I changed it to archlinux-current-gcc-riscv64-debug as
CONFIG_EARLY_PRINTK is available only when CONFIG_DEBUG is enabled.

Please look at new version of the patch series:
https://lore.kernel.org/xen-devel/cover.1675163330.git.oleksii.kurochko@gma=
il.com/T/#t
>=20
> > =C2=A0# Yocto test jobs
> > =C2=A0yocto-qemuarm64:
> > =C2=A0=C2=A0 extends: .yocto-test-arm64
> > diff --git a/automation/scripts/qemu-smoke-riscv64.sh
> > b/automation/scripts/qemu-smoke-riscv64.sh
> > new file mode 100755
> > index 0000000000..e0f06360bc
> > --- /dev/null
> > +++ b/automation/scripts/qemu-smoke-riscv64.sh
> > @@ -0,0 +1,20 @@
> > +#!/bin/bash
> > +
> > +set -ex
> > +
> > +# Run the test
> > +rm -f smoke.serial
> > +set +e
> > +
> > +timeout -k 1 2 \
> > +qemu-system-riscv64 \
> > +=C2=A0=C2=A0=C2=A0 -M virt \
> > +=C2=A0=C2=A0=C2=A0 -smp 1 \
> > +=C2=A0=C2=A0=C2=A0 -nographic \
> > +=C2=A0=C2=A0=C2=A0 -m 2g \
> > +=C2=A0=C2=A0=C2=A0 -kernel binaries/xen \
> > +=C2=A0=C2=A0=C2=A0 |& tee smoke.serial
> > +
> > +set -e
> > +(grep -q "Hello from C env" smoke.serial) || exit 1
> > +exit 0
> > --=20
> > 2.39.0
> >=20



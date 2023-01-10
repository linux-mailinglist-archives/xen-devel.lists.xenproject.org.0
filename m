Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B9663A95
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474387.735534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9hW-0006DP-NE; Tue, 10 Jan 2023 08:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474387.735534; Tue, 10 Jan 2023 08:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9hW-0006Aa-Jk; Tue, 10 Jan 2023 08:09:42 +0000
Received: by outflank-mailman (input) for mailman id 474387;
 Tue, 10 Jan 2023 08:09:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pF9hV-0006AM-47
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:09:41 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 213f1f2f-90be-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:09:39 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id hw16so14615723ejc.10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 00:09:39 -0800 (PST)
Received: from 2a02.2378.1014.d6d9.ip.kyivstar.net
 ([2a02:2378:1014:d6d9:98bb:6889:a785:5d8c])
 by smtp.gmail.com with ESMTPSA id
 14-20020a170906308e00b0084d3acda5fasm3165190ejv.189.2023.01.10.00.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 00:09:38 -0800 (PST)
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
X-Inumbo-ID: 213f1f2f-90be-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1wqDTBTYa0JxVyZO5wjAE7AZ1AFSwlVaPJIYsCDPwwE=;
        b=LB+V2D1ACwno6eZ0473SRU+SA1WtKlU85/d5U6OJO+5P0QYajaCNkpekazAruO6cJm
         uHGWIaBYAFxDPJpwxnrJuEemYwqtKFJziDMfEwbeV3yqt62xfqBIvnW21LBiXI7ee7gq
         1CS5IIBF3nnj5IsM8y6IhTqCUXw/+mqmXXw0TvmfySZZo7IUWGO9qq+G54/hv/XQpvD7
         JTG96E8qh/3wJpiPpvAChKBG4E7omT/y9B/JoL0k7QcizfD0GZg82JGO0RjqFrIR60cv
         Z3ZTlOtcuj4ofHR3lq/5vBVR7NY961dWPOZ0ss7TIj8WSfzoThlQNyLyeQjO8WsVqFML
         HJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wqDTBTYa0JxVyZO5wjAE7AZ1AFSwlVaPJIYsCDPwwE=;
        b=GDfz3HaILMOHRynyjbnCmWhLq9WG/bsUi8wQvJ0OxqGxlP+0mACGkervbHn/M1qxY9
         yXZyeDewZ1Hzm2Bs0DUawkdPb8AVfk4ATH/A2lBO1OHM9nYs5rjMlfFf5t/Xnb465k7R
         flJVBbuSC2Mi9TBrS2yci4nAr8JrrZQLxLBgmTC/Z+d68+U3/U7IztYZELduVzc2mRw2
         TLD9fSV2f/z7jV3N/LTJijnamf1pQ6TJ60EHWQ1rMpcPsksTF9qq5sYtWIUbmz5U3ZLb
         2MhuQZeDm6NAJtFLXouf9PL6BwvQDCDanowFEkLcsWabwXNZDkcy+T2hMLZDAer7FKHb
         qASw==
X-Gm-Message-State: AFqh2kpUSe6pqhzkRNTln2Wy+IkIyL1UDpRmywXefAVaXsabxJMfDuOc
	93MUTwnrLCWcBYguKzaimU0=
X-Google-Smtp-Source: AMrXdXs4j6+OHvVyZWiZxdSan/h33AzijSxyP2fAtJ+jxhDsyI/qow+wWYt7uGbXC5vU4ngVJ8O9KA==
X-Received: by 2002:a17:906:8492:b0:7c1:6b46:a722 with SMTP id m18-20020a170906849200b007c16b46a722mr59135972ejx.56.1673338179013;
        Tue, 10 Jan 2023 00:09:39 -0800 (PST)
Message-ID: <8488a52b2e15944b8882c9c93344fb1ced171056.camel@gmail.com>
Subject: Re: [PATCH v2 8/8] automation: add RISC-V smoke test
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Gianluca
 Guida <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Tue, 10 Jan 2023 10:09:37 +0200
In-Reply-To: <alpine.DEB.2.22.394.2301091820580.1342743@ubuntu-linux-20-04-desktop>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
	 <494c2fd1e046de20c2fa24be3989cc6adde8fdbe.1673278109.git.oleksii.kurochko@gmail.com>
	 <alpine.DEB.2.22.394.2301091820580.1342743@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-09 at 18:21 -0800, Stefano Stabellini wrote:
> On Mon, 9 Jan 2023, Oleksii Kurochko wrote:
> > Add check if there is a message 'Hello from C env' presents
> > in log file to be sure that stack is set and C part of early printk
> > is working.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0=C2=A0=C2=A0 - Move changes in the dockerfile to separate patch a=
nd=C2=A0 send it
> > to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mailing list separately:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH] automation: add qemu=
-system-riscv to
> > riscv64.dockerfile
> > =C2=A0=C2=A0=C2=A0 - Update test.yaml to wire up smoke test
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
> > index afd80adfe1..64f47a0ab9 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -54,6 +54,19 @@
> > =C2=A0=C2=A0 tags:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - x86_64
> > =C2=A0
> > +.qemu-riscv64:
> > +=C2=A0 extends: .test-jobs-common
> > +=C2=A0 variables:
> > +=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:riscv64
>=20
> I realize that it is committed now, but following the arm32
> convention
> the name of the arch container (currently archlinux:riscv64) would
> be:
>=20
> CONTAINER: archlinux:current-riscv64
>=20
> I know this is not related to this patch, but I am taking the
> opportunity to mention it now in case we get an opportunity to fix it
> in
> the future for consistency.
>=20
>=20
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
> > +=C2=A0=C2=A0=C2=A0 - riscv64-cross-gcc
>=20
> Similarly here the "needs" dependency should be called
> arch-current-gcc-riscv for consistency with arm32.
>=20
> Basically we already have a crossbuild and crosstest environment up
> and
> running in gitlab-ci and it is the one for arm32. You can just base
> all
> the naming convention on that.
>=20
> I realize that riscv64-cross-gcc is also already exported by
> build.yaml,
> but I am mentioning it in case we get an opportunity to fix it in the
> future.
>=20
> Nonetheless this patch on its own is OK so
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
Thanks for the comments.

I think it will be nice to fix that from the start so I will do a
separete patch out of this patch series (when it will be merged) which
will fix all this names related to RISCV.
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
> > 2.38.1
> >=20
~Oleksii


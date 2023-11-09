Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1ED7E6E69
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 17:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629747.982145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17gy-0002XO-M4; Thu, 09 Nov 2023 16:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629747.982145; Thu, 09 Nov 2023 16:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17gy-0002VG-JM; Thu, 09 Nov 2023 16:15:40 +0000
Received: by outflank-mailman (input) for mailman id 629747;
 Thu, 09 Nov 2023 16:15:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrbJ=GW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r17gx-0002VA-Bk
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 16:15:39 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 386b0382-7f1b-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 17:15:38 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507a3b8b113so1299538e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 08:15:38 -0800 (PST)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05651206c600b00507aced147esm1098506lff.203.2023.11.09.08.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 08:15:36 -0800 (PST)
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
X-Inumbo-ID: 386b0382-7f1b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699546538; x=1700151338; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oMj6jHWPONAxjLho5hftQw27Ron7OZWj5Jytnd1rl4Y=;
        b=iba1ubMr+Ez00rwuQ2Ha0DB6HkldOtWzlB6O326EZR2n1Lu+TLaqjiMkn6jnqY+A5C
         OQeBYgeRNJBfKlR8NaIZFpV/71ntGkQ5rqmJbr8NYyHQz7AXMTPuYp1/V9piC+erTVWx
         buHZyjzhXFgbJMSAokPtE7Wkj4kbO0eMUL1PvySbKJ0dqQAt2xjANaKnMgPCd9JKiGCf
         AYmFWHzFZj3UUDVW71kjU8mYyxj+JXYuyPVx4S/reeUR7DUnFdBspGhIyZV1CR8XKMJS
         V4VIvVMcqo6WtH/73ceXXv81gifgxC925Od+pFTRIohh8RPCYmVkq/854XXf89dmpby7
         w8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699546538; x=1700151338;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMj6jHWPONAxjLho5hftQw27Ron7OZWj5Jytnd1rl4Y=;
        b=VoSvATNbe+k56Jznpb9fq4Gv+H9q5oS2PjQPcPNwUwyoxwENTWbLW/DxBSUQAliZ0+
         IRT+EFqP0E+1F2C3HC/2Oy48Csj1h3IF41B0ZRtTIHwlvhogL2pNb/VMkqR3mg4QdHI/
         mY0bY3gPzqFgG0bxEAds4DjtDRlxAQQCS6oCf0TtrlxZ5Jk2iXmJF7cCdoc1dUMrB5NZ
         DUuWur1siS+cGDBauhLoNgoS38iysw28KZOdVKxHS952WZd1/GE44d47jOf0abpOciO/
         8qmNkk4qUErIjt9fQyakdxY1/GQDF6LRYiuaj62gBJrrJPZM31r6zXFDi3X0ifP3EbjE
         UGZA==
X-Gm-Message-State: AOJu0YzcPx1bbUfb3Na8hXOV6IEWeuGpG4p3pBRq56QVIygMWp3B/1e2
	m0H4lzVM/4sX9EGMrpEWHho=
X-Google-Smtp-Source: AGHT+IGhjfJN7KdtgU7MXypI3zYkMgPHMqioL2wdLaCxEopxbspNx3XIcfeweE6lnMrOzJcm9WjT9w==
X-Received: by 2002:a05:6512:3490:b0:509:43ec:dd4c with SMTP id v16-20020a056512349000b0050943ecdd4cmr1641946lfr.3.1699546537420;
        Thu, 09 Nov 2023 08:15:37 -0800 (PST)
Message-ID: <65d56dd930b77ac57e2f3a1bfc771fb4bf856eb0.camel@gmail.com>
Subject: Re: [XEN PATCH] CI: Rework RISCV smoke test
From: Oleksii <oleksii.kurochko@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>
Date: Thu, 09 Nov 2023 18:15:36 +0200
In-Reply-To: <20231109154922.49118-1-anthony.perard@citrix.com>
References: <20231109154922.49118-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hello Anthony,

On Thu, 2023-11-09 at 15:49 +0000, Anthony PERARD wrote:
> Currently, the test rely on QEMU and Xen finishing the boot in under
> two seconds. That's both very long and very short. Xen usually
> managed
> to print "All set up" under a second. Unless for some reason we try
> to
> run the test on a machine that's busy doing something else.
>=20
> Rework the test to exit as soon as Xen is done.
>=20
> There's two `tail -f`, the first one is there simply to monitor test
> progress in GitLab console. The second one is used to detect the test
> result as soon as QEMU add it to the file. Both `tail` exit as soon
> as
> QEMU exit.
>=20
> If QEMU fails at start, and exit early, both `tail` will simply exit,
> resulting in a failure.
>=20
> If the line we are looking for is never printed, the `timeout` on the
> second `tail` will force the test to exit with an error.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 The "machine might be busy" bits refere to having a gi=
tlab-runner
> =C2=A0=C2=A0=C2=A0 running two jobs, one been a build with no restriction=
 on CPU
> resource use.
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 We could use "-daemonize" with "-pidfile" to more easl=
y detect
> qemu's
> =C2=A0=C2=A0=C2=A0 initialisation failure, but needs "-display none" inst=
ead of
> =C2=A0=C2=A0=C2=A0 "-nographic"
>=20
> =C2=A0automation/scripts/qemu-smoke-riscv64.sh | 32 ++++++++++++++++++---=
-
> --
> =C2=A01 file changed, 24 insertions(+), 8 deletions(-)
>=20
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh
> b/automation/scripts/qemu-smoke-riscv64.sh
> index 4008191302..ba7b61db8b 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -2,19 +2,35 @@
> =C2=A0
> =C2=A0set -ex
> =C2=A0
> -# Run the test
> -rm -f smoke.serial
> -set +e
> +# Truncate or create serial output file
> +echo -n > smoke.serial
> =C2=A0
> -timeout -k 1 2 \
> +# cleanup: kill QEMU when the script exit for any reason
> +qemu_pid=3D
> +cleanup() {
> +=C2=A0=C2=A0=C2=A0 if [ "$qemu_pid" ]; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kill -s SIGKILL "$qemu_pid"
> +=C2=A0=C2=A0=C2=A0 fi
> +}
> +
> +trap 'cleanup' EXIT
> +
> +# Run the test
> =C2=A0qemu-system-riscv64 \
> =C2=A0=C2=A0=C2=A0=C2=A0 -M virt \
> =C2=A0=C2=A0=C2=A0=C2=A0 -smp 1 \
> =C2=A0=C2=A0=C2=A0=C2=A0 -nographic \
> =C2=A0=C2=A0=C2=A0=C2=A0 -m 2g \
> +=C2=A0=C2=A0=C2=A0 -monitor none \
> +=C2=A0=C2=A0=C2=A0 -chardev file,id=3Dserial-out,path=3Dsmoke.serial \
> +=C2=A0=C2=A0=C2=A0 -serial chardev:serial-out \
> =C2=A0=C2=A0=C2=A0=C2=A0 -kernel binaries/xen \
> -=C2=A0=C2=A0=C2=A0 |& tee smoke.serial
> +=C2=A0=C2=A0=C2=A0 &
> +qemu_pid=3D$!
> =C2=A0
> -set -e
> -(grep -q "All set up" smoke.serial) || exit 1
> -exit 0
> +# Monitor test progression until QEMU exit
> +tail --pid=3D$qemu_pid -f smoke.serial &
> +
> +# Check boot test result
> +timeout 60 tail --pid=3D$qemu_pid -f smoke.serial | \
> +=C2=A0=C2=A0=C2=A0 grep -a -q "All set up"

I am OK with provided changes. Thanks!

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A262F658A4A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 09:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469651.729045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAo2x-0002Mz-52; Thu, 29 Dec 2022 08:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469651.729045; Thu, 29 Dec 2022 08:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAo2x-0002Kp-1u; Thu, 29 Dec 2022 08:13:51 +0000
Received: by outflank-mailman (input) for mailman id 469651;
 Thu, 29 Dec 2022 08:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huHg=43=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pAo2v-0002Kd-Db
 for xen-devel@lists.xenproject.org; Thu, 29 Dec 2022 08:13:49 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b899f8e6-8750-11ed-91b6-6bf2151ebd3b;
 Thu, 29 Dec 2022 09:13:48 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso9589163wms.5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Dec 2022 00:13:48 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c161600b003cfa622a18asm26771900wmn.3.2022.12.29.00.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 00:13:47 -0800 (PST)
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
X-Inumbo-ID: b899f8e6-8750-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dTkvZKoxQz0bzD4v0mZCkEzByc+bKG0W26iPxWsn9Qs=;
        b=O080TurVg9A0F+Q383YdHqpgIz177lXAY7Iy6FnCCXsHFRK97rCUTfqQJ+jZqKhCKi
         orvQEqAUiu7cok0BqPkcuSFkdYgGdaPp4bVW12M30fjGyK64wpkMXr9FSC8C2Ie+xSnP
         1rotXsGztziXBO72Ba6aQ6hTKTFbJazVeyuxJsilk6h9fle4LOl5qzaMAE9rAuHovkPK
         h7Xht/2Sgr3TPpWs50Xj+cH/Gu4An60V+8E99Pp6IV+noNDcUxWapyoQUVCy/vBrz1gi
         KKvJMjGRVSL1yq+bL26rmAGxBlNcDL55FUN/2MrabqihIoyJMHE/UndGzkJYWdt8h2st
         tKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTkvZKoxQz0bzD4v0mZCkEzByc+bKG0W26iPxWsn9Qs=;
        b=49PvI49DOoP5/UNjYzIoi9VEGlnXF0zw9ykHlCp8c7Ypx9NA4Lm+SJLRFhGD9KDcrP
         amvt2LXlGssqbC+V0RC+mAI24gNmKCbw0YcwTdljozOU1lSQPCoUfbkNYprgbydXUtHE
         6r8+BZv7aKt8Oy/u3wZt1NjyPIZAT0U0KjLYCKcZjxOEESFrx3ImBPWviREhOvzvGKc3
         L6gz3nJBwL2lt6YTDLNnn9Zgy0DgKv/KbkAeNgg/0O7lcFzrKhstFqZ7Yhf3tZCCAkxI
         hEs5o7acJ1F7H/B5qnyZvLcWahmfElw7I/k4okQtycynp1bwvrrPmjgXTZctLmX8pjg4
         pMDw==
X-Gm-Message-State: AFqh2kq/jQ2OpBKtf65fI9Cu0UGRWbnmNZj2WwWoPkhMRb9X2txL82Dz
	+PE4Jh+dNQTulS62T3yVE/A=
X-Google-Smtp-Source: AMrXdXtn6DpYJ0g6EQv18GD+VWoxe3MGBAqwB9oI0HC3X//sOT2IfxM9MgRKOzmQ+tjiZYDpp7c38Q==
X-Received: by 2002:a05:600c:21d9:b0:3d0:8d48:2993 with SMTP id x25-20020a05600c21d900b003d08d482993mr19238893wmj.36.1672301627983;
        Thu, 29 Dec 2022 00:13:47 -0800 (PST)
Message-ID: <661c2a359f5bc409821b16802e596ace90b67abe.camel@gmail.com>
Subject: Re: [XEN PATCH v1 2/4] automation: add cross-compiler support for
 the build script
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Thu, 29 Dec 2022 10:13:46 +0200
In-Reply-To: <8f8c26d5-934d-0dd1-1d51-b04e134fcf6e@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
	 <3c926f637c4738bd14db10e8fe8f72a6eae2dfd4.1671789736.git.oleksii.kurochko@gmail.com>
	 <8f8c26d5-934d-0dd1-1d51-b04e134fcf6e@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Wed, 2022-12-28 at 23:24 +0000, Andrew Cooper wrote:
> On 23/12/2022 11:16 am, Oleksii Kurochko wrote:
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index a593419063..026f480e76 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -2,12 +2,12 @@
> > =20
> >  test -f /etc/os-release && cat "$_"
> > =20
> > -$CC --version
> > +${CROSS_COMPILE}${CC} --version
> > =20
> >  # Express the compiler version as an integer.  e.g. GCC 4.9.2 =3D>
> > 0x040902
> >  cc-ver()
> >  {
> > -    $CC -dumpversion | awk -F. '{ printf "0x%02x%02x%02x", $1, $2,
> > $3 }'
> > +    ${CROSS_COMPILE}${CC} -dumpversion | awk -F. '{ printf
> > "0x%02x%02x%02x", $1, $2, $3 }'
> >  }
> > =20
> >  # random config or default config
> > @@ -66,7 +66,7 @@ if ! type python3 || python3 -c "import sys; res
> > =3D sys.version_info < (3, 5); ex
> >  fi
> > =20
> >  # SeaBIOS requires GCC 4.6 or later
> > -if [[ "${CC}" =3D=3D "gcc" && `cc-ver` -lt 0x040600 ]]; then
> > +if [[ "${CROSS_COMPILE}${CC}" =3D=3D "gcc" && `cc-ver` -lt 0x040600
> > ]]; then
>=20
> This change won't work, because it's no longer a plain "gcc".
>=20

If look at tests on GitLab CI&CD these changes don't break anything.

> Also, prepreding CROSS_COMPILE isn't compatible with LLVM toolchains,
> but that's not something you've made any worse with your change (just
> more obvious).
>=20

CROSS_COMPILE isn't use with LLVM toolchain. I mean that in case of
LLVM toolchain CROSS_COMPILE would be equal to empty string plus
CC=3Dclang or something similar.

> We probably want a stanza near the top which sets
> CC=3D"${CROSS_COMPILE}${CC}" which can be adjusted to support LLVM in
> due
> course, and we'll need to detect GCC using --version | grep as its
> done
> elsewhere.
>=20
> But the other logic wants reworking too so we don't play around with
> bits of the tools build when we're doing a hypervisor-only build
> anyway...
>=20

I think that I can get rid of CROSS_COMPILE variable at all and use
CC=3Driscv64-linux-gnu-gcc direcly for RISC-V 64 targers in build.yaml.
Would this be a better solution?

> ~Andrew

~Oleksii



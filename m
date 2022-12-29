Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E639658D9F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 14:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469718.729133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAtDM-0004lO-Ez; Thu, 29 Dec 2022 13:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469718.729133; Thu, 29 Dec 2022 13:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAtDM-0004ih-Bg; Thu, 29 Dec 2022 13:44:56 +0000
Received: by outflank-mailman (input) for mailman id 469718;
 Thu, 29 Dec 2022 13:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huHg=43=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pAtDK-0004ib-RZ
 for xen-devel@lists.xenproject.org; Thu, 29 Dec 2022 13:44:54 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8808d57-877e-11ed-8fd4-01056ac49cbb;
 Thu, 29 Dec 2022 14:44:52 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id bk16so4210631wrb.11
 for <xen-devel@lists.xenproject.org>; Thu, 29 Dec 2022 05:44:52 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a5d5181000000b0024207478de3sm17958313wrv.93.2022.12.29.05.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 05:44:51 -0800 (PST)
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
X-Inumbo-ID: f8808d57-877e-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s+iTuRzGaeX4GHA2/HfjeY/Hy3VmrUCqbJUQwr3T4U0=;
        b=QZ1nEk+8W6bdulqbxy4S0dr61F3vAqWaCAKku3NX9AYygyFNtPqVjwRyAePLTScofP
         hFy9PfWSCrfEPGzDD4TyYmN5MPPouq9H3WUqvHPcsgpyJRh5k/DgGRXh3+0+1g40V0b8
         XbIKPSJ1GPY5KQlBrOpNBbwWKQrZ6T0CYVGWtLhKllsQQAfC9L1e8Ph03NH+1g6JhrNy
         H7U6EOrs8Xqy8GkvMpI7WMK+WvO1ZItJ6KdqL+lX6zSM9aCdxXLf7csqRazsjCNP2wZ+
         NG0ogmpzePBHqWax04GS81jJ2MX9zyovfY2XZm2TX/fMF+cPAL/baWBs3XX42u5PUHCn
         aNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s+iTuRzGaeX4GHA2/HfjeY/Hy3VmrUCqbJUQwr3T4U0=;
        b=OUhrP9hs2NKsiVpQXxhxDsdSy+s69clUJRBivcO0yzqX7M71XnwpbP0dBRaBlRBMZz
         NfGilfb8qxOgpLX8veEYSMbPC97DXRo+QnFhj39bzHlOXVtHrus9tEM+3FlAqCifsLiN
         Wx+78TG6wbQ0sM4GWq1J9lXG6F3NMs0sr3O4MK0zNyjcZtzJXf0WAoKaZ6kHotM9pU6C
         yP8Ydy1aXZju07cFdOf1IZQwhgpujReCkqpZCvpStndGUInLkddEgi1RcoDu/VdYlmoh
         TBY2kpObHKomCegq6nAFyQLGLOGNd1FMPPkSltKWMdc5xbiEDMgnZHp5pc9I3nvxZM0T
         NAeQ==
X-Gm-Message-State: AFqh2kqBS7yptNucaf+W/Ey97wA8Du1k41leYAy4Jg+fFa4Kk1ullUqi
	ar5StdZdEBWEEkz5trZIqB8=
X-Google-Smtp-Source: AMrXdXtBFC8oT9YKslYV4F2JUKeQfLACVQ0mRh3WJ3PqyhMsLFCEa4C8bwtJuibYbW6NnLW45uleWw==
X-Received: by 2002:a5d:634c:0:b0:242:51cb:45e9 with SMTP id b12-20020a5d634c000000b0024251cb45e9mr6636883wrw.0.1672321491892;
        Thu, 29 Dec 2022 05:44:51 -0800 (PST)
Message-ID: <e0bd480f8dcdc5bf5bb4eb68a0d2c02f476138a8.camel@gmail.com>
Subject: Re: [XEN PATCH v1 2/4] automation: add cross-compiler support for
 the build script
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Thu, 29 Dec 2022 15:44:50 +0200
In-Reply-To: <661c2a359f5bc409821b16802e596ace90b67abe.camel@gmail.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
	 <3c926f637c4738bd14db10e8fe8f72a6eae2dfd4.1671789736.git.oleksii.kurochko@gmail.com>
	 <8f8c26d5-934d-0dd1-1d51-b04e134fcf6e@citrix.com>
	 <661c2a359f5bc409821b16802e596ace90b67abe.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Thu, 2022-12-29 at 10:13 +0200, Oleksii wrote:
> On Wed, 2022-12-28 at 23:24 +0000, Andrew Cooper wrote:
> > On 23/12/2022 11:16 am, Oleksii Kurochko wrote:
> > > diff --git a/automation/scripts/build b/automation/scripts/build
> > > index a593419063..026f480e76 100755
> > > --- a/automation/scripts/build
> > > +++ b/automation/scripts/build
> > > @@ -2,12 +2,12 @@
> > > =C2=A0
> > > =C2=A0test -f /etc/os-release && cat "$_"
> > > =C2=A0
> > > -$CC --version
> > > +${CROSS_COMPILE}${CC} --version
> > > =C2=A0
> > > =C2=A0# Express the compiler version as an integer.=C2=A0 e.g. GCC 4.=
9.2 =3D>
> > > 0x040902
> > > =C2=A0cc-ver()
> > > =C2=A0{
> > > -=C2=A0=C2=A0=C2=A0 $CC -dumpversion | awk -F. '{ printf "0x%02x%02x%=
02x", $1,
> > > $2,
> > > $3 }'
> > > +=C2=A0=C2=A0=C2=A0 ${CROSS_COMPILE}${CC} -dumpversion | awk -F. '{ p=
rintf
> > > "0x%02x%02x%02x", $1, $2, $3 }'
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0# random config or default config
> > > @@ -66,7 +66,7 @@ if ! type python3 || python3 -c "import sys;
> > > res
> > > =3D sys.version_info < (3, 5); ex
> > > =C2=A0fi
> > > =C2=A0
> > > =C2=A0# SeaBIOS requires GCC 4.6 or later
> > > -if [[ "${CC}" =3D=3D "gcc" && `cc-ver` -lt 0x040600 ]]; then
> > > +if [[ "${CROSS_COMPILE}${CC}" =3D=3D "gcc" && `cc-ver` -lt 0x040600
> > > ]]; then
> >=20
> > This change won't work, because it's no longer a plain "gcc".
> >=20
>=20
> If look at tests on GitLab CI&CD these changes don't break anything.
>=20
> > Also, prepreding CROSS_COMPILE isn't compatible with LLVM
> > toolchains,
> > but that's not something you've made any worse with your change
> > (just
> > more obvious).
> >=20
>=20
> CROSS_COMPILE isn't use with LLVM toolchain. I mean that in case of
> LLVM toolchain CROSS_COMPILE would be equal to empty string plus
> CC=3Dclang or something similar.
>=20
> > We probably want a stanza near the top which sets
> > CC=3D"${CROSS_COMPILE}${CC}" which can be adjusted to support LLVM in
> > due
> > course, and we'll need to detect GCC using --version | grep as its
> > done
> > elsewhere.
> >=20
> > But the other logic wants reworking too so we don't play around
> > with
> > bits of the tools build when we're doing a hypervisor-only build
> > anyway...
> >=20
>=20
> I think that I can get rid of CROSS_COMPILE variable at all and use
> CC=3Driscv64-linux-gnu-gcc direcly for RISC-V 64 targers in build.yaml.
> Would this be a better solution?
>=20
It will not work.
At least that CROSS_COMPILE variable is set in riscv64.dockerfile.
So it will definitely mess the hypervisor build.
> > ~Andrew
>=20
> ~Oleksii
>=20



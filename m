Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C0BA8657B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 20:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947712.1345325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3J5M-0003ea-4U; Fri, 11 Apr 2025 18:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947712.1345325; Fri, 11 Apr 2025 18:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3J5M-0003bS-0y; Fri, 11 Apr 2025 18:26:40 +0000
Received: by outflank-mailman (input) for mailman id 947712;
 Fri, 11 Apr 2025 18:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vbRy=W5=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u3J5K-0003bM-0z
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 18:26:39 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 801cdc7f-1702-11f0-9eae-5ba50f476ded;
 Fri, 11 Apr 2025 20:26:36 +0200 (CEST)
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
X-Inumbo-ID: 801cdc7f-1702-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744395994; x=1744655194;
	bh=h+G4yxxZG3Ud/cdJWwKW5gZwXFbF33judLRqdRnYPb0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iykTupEApLNtnggyGxJvNaJpca6FncZOFuaIDJXbOM07cYOC4x6OVMZogqP+QkwZf
	 S6pSNsfvv9iKkeqN1UjsXtUmRDoDo0KdqV30NDx/mNkkEOlqxKp+3M67YSQ/+IYAOr
	 zfJ8SzYKvfNvjNlR6fCxkaC0oOvtQqhN7U8hsiO5QxKU8+tQKzxOBGEEAREdclnY2k
	 c9ClXlZDiOM56/mZ08+Xeh7CqoCkZswuBrIx7bzSQ3/tdvc4OwqfdbAXnlaTjFwES9
	 eE9cJPM6knHTGBvP7IORBFafE8K9pym5+BFlNdjUzZ0jL84HYtkdnwA8FnUxkJKAix
	 Az03oiPHMbHLA==
Date: Fri, 11 Apr 2025 18:26:30 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/3] Rework rootfs generation to make a cpio archive
Message-ID: <UVVrIXXGVrVG327UTNW2FwMwRW_AWS6rXAVaTTiKVrM2H3ceA6uEuNBb2igMi7DYoEhvFaJp78t1ZnTsg74s3x25Mly-eZZHXx_i0jGSGmQ=@proton.me>
In-Reply-To: <19e76d36-41d3-4d7f-b3db-f1e17c2c30b1@citrix.com>
References: <20250411105217.2141356-1-andrew.cooper3@citrix.com> <20250411105217.2141356-2-andrew.cooper3@citrix.com> <Z0-Vwr2two0iaVg5FoxYWjiImFDeS3tDPssc0X1D0iAcnbK2X4TpJlSRbwugx0mW2_nWjgKQ5nSioBtuRNkjLG3mhDzhuDmZCa3Mz2e5R-E=@proton.me> <19e76d36-41d3-4d7f-b3db-f1e17c2c30b1@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 919094e16b741a99c6995c82a3b97d5ce9836d29
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, April 11th, 2025 at 10:50 AM, Andrew Cooper <andrew.cooper3@citr=
ix.com> wrote:

>=20
>=20
> On 11/04/2025 4:53 pm, Denis Mukhin wrote:
>=20
> > On Friday, April 11th, 2025 at 3:52 AM, Andrew Cooper andrew.cooper3@ci=
trix.com wrote:
> >=20
> > > Rename the script as we're going to use it for ARM64 shortly, and hav=
e it take
> > > a tar or cpio parameter to determine the output format.
> > >=20
> > > Turn it into a proper bash script, and provide the cpio form under th=
e new
> > > artefact naming scheme.
> > >=20
> > > No functional change.
> > >=20
> > > Signed-off-by: Andrew Cooper andrew.cooper3@citrix.com
> > >=20
> > > ---
> > > CC: Anthony PERARD anthony.perard@vates.tech
> > >=20
> > > CC: Stefano Stabellini sstabellini@kernel.org
> > >=20
> > > CC: Michal Orzel michal.orzel@amd.com
> > >=20
> > > CC: Doug Goldstein cardoe@cardoe.com
> > >=20
> > > CC: Marek Marczykowski-G=C3=B3recki marmarek@invisiblethingslab.com
> > >=20
> > > ---
> > > .gitlab-ci.yml | 9 +++++++-
> > > ...6_64-rootfs-alpine.sh =3D> alpine-rootfs.sh} | 21 ++++++++++++++++=
+--
> > >=20
> > > 2 files changed, 27 insertions(+), 3 deletions(-)
> > > rename scripts/{x86_64-rootfs-alpine.sh =3D> alpine-rootfs.sh} (75%)
> > >=20
> > > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > > index 1d2c72b268a3..916c5ae9d508 100644
> > > --- a/.gitlab-ci.yml
> > > +++ b/.gitlab-ci.yml
> > > @@ -42,6 +42,13 @@ linux-6.6.86-arm64:
> > > #
> > > # x86_64 artifacts
> > > #
> > > +alpine-3.18-x86_64-rootfs:
> > > + extends: .x86_64-artifacts
> > > + script:
> > > + - ./scripts/alpine-rootfs.sh cpio
> > > + variables:
> > > + CONTAINER: alpine:3.18-x86_64-base
> > > +
> > > linux-6.6.56-x86_64:
> > > extends: .x86_64-artifacts
> > > script: ./scripts/build-linux.sh
> > > @@ -62,7 +69,7 @@ x86_64-kernel-linux-6.6.56:
> > > x86_64-rootfs-alpine-3.18:
> > > extends: .x86_64-artifacts
> > > script:
> > > - - . scripts/x86_64-rootfs-alpine.sh
> > > + - ./scripts/alpine-rootfs.sh tar
> > > variables:
> > > CONTAINER: alpine:3.18-x86_64-base
> > >=20
> > > diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/alpine-rootfs.=
sh
> > > similarity index 75%
> > > rename from scripts/x86_64-rootfs-alpine.sh
> > > rename to scripts/alpine-rootfs.sh
> > > index b70b3a54ede5..c29c92d1c682 100755
> > > --- a/scripts/x86_64-rootfs-alpine.sh
> > > +++ b/scripts/alpine-rootfs.sh
> > > @@ -1,4 +1,9 @@
> > > +#!/bin/bash
> > > +
> > > +set -eu
> > > +
> > > WORKDIR=3D"${PWD}"
> > > +COPYDIR=3D"${WORKDIR}/binaries"
> > >=20
> > > apk update
> > >=20
> > > @@ -56,5 +61,17 @@ passwd -d "root" root
> > >=20
> > > # Create rootfs
> > > cd /
> > > -tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
> > > - bin dev etc home init lib mnt opt root sbin usr var
> > > +PATHS=3D"bin dev etc home init lib mnt opt root sbin usr var"
> > > +
> > > +case $1 in
> > > + cpio)
> > > + find $PATHS | cpio -o -H newc | gzip > "${COPYDIR}/rootfs.cpio.gz"
> > >=20
> > > +
> > > + # Print the contents for the build log
> > > + zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
> > > Maybe allow $1 to be a filename? E. g. rootfs.cpio.gz or initrd.tar.g=
z.
> > > This way $1 will contain an explicit output artifact format along wit=
h
> > > the output filename.
> >=20
> > What do you think?
> >=20
> > > + ;;
> > > +
> > > + tar)
> > > + tar cvzf "${COPYDIR}/initrd.tar.gz" $PATHS
> > > + ;;
> > > I would add the default case and error out in case of possible mis-us=
e.
>=20
>=20
> This is bespoke tooling, used as part of Xen's GitlabCI infrastructure.
>=20
> The parameter is going to last for all of about a week, until we can
> retire the tests using the tarball, because they're creating routine but
> intermittent test failure.

Oh, I see, thanks for the details!

>=20
> I'm not looking to over-engineer the result.
>=20
> ~Andrew


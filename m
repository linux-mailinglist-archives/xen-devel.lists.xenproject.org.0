Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C159159BE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 00:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746959.1154193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLs1e-0000zd-NH; Mon, 24 Jun 2024 22:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746959.1154193; Mon, 24 Jun 2024 22:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLs1e-0000y7-Kf; Mon, 24 Jun 2024 22:19:02 +0000
Received: by outflank-mailman (input) for mailman id 746959;
 Mon, 24 Jun 2024 22:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q2Am=N2=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sLs1d-0000y1-H0
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 22:19:01 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c02ecb27-3277-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 00:18:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1719267533754239.15634385390558;
 Mon, 24 Jun 2024 15:18:53 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dfe41f7852cso4883491276.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 15:18:53 -0700 (PDT)
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
X-Inumbo-ID: c02ecb27-3277-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1719267535; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ddLKyPpPX9a+htI/RHy39D+CWvGEJNXmhMtAl1NmRHNgGGLCAKRDx8/0k5LDW8GXQEw46p+bXoDsfm1gpO+606Rx4QVCZ/bskvNqegx8+qp3ERb9QxNYjmYh9G0SWCcY2vdPGmpB3z0sFadKeCoBcJ9prDENpVF3DfoiNhHRqFs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719267535; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+r/yFq4ftT+CDCbVVm8NBUu6TF01Out8rHeaqMaEJcI=; 
	b=IKS+NHeHnxW4jy+unnQTMD6iSNDbyL4LupUuoeLiDWc9DZmhOQ43Nh39l8DpqnzblNOcu9UfZ7WASs1OnRFWo+lY0yQ7tS8XQelurR8Qj7CxANeJPbCCDp7J3IO/95+pAX93D2SiOuIPe3sDoJziMue1RTjEIDw0jYvQHjeZPG8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719267535;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+r/yFq4ftT+CDCbVVm8NBUu6TF01Out8rHeaqMaEJcI=;
	b=UcZSGd+QLT17LmLUlksixLo/im5bTuaT+vWKuFQLMbcZic34Tcqwh8w1CH6ltyHp
	q3ljwlChhQ8YBGPZGay9WO/8CuG6UcSFTt2VLXVr3yTp96i2852cIRjN8IHBsw7njln
	hQlfEqf1HTCml8KLkJtvOh0Yk4LFaIsmgtY6pcPk=
X-Gm-Message-State: AOJu0Ywhew6hVhBFayp/rX/KRsYsVQtw8FVNOADG9Yc+TzZd+cNTO3K7
	POAoK7UoJkxTQApC+jici3tJYbGqUF76+yshn3a92Zbt1xfF9XVAaQ6XboAwQ5oXHRLPMmvFwof
	6Iq+u9OVRY0Pzm/kDiY/0hK1gPjk=
X-Google-Smtp-Source: AGHT+IGhhuKjvHL3Q0uLIfNkuQRT3QSdw3H/lRPiSCCautBph1jWwNISMfxhQm0hEq0sCcqAu0z0Q4vrq5OJ8/vzVT4=
X-Received: by 2002:a25:d010:0:b0:dfa:ff74:f24f with SMTP id
 3f1490d57ef6-e0303f7f16fmr6569374276.28.1719267532923; Mon, 24 Jun 2024
 15:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <20240621191434.5046-2-tamas@tklengyel.com>
 <6f94d071-f90f-485d-a8aa-a0c8a726ce34@xen.org>
In-Reply-To: <6f94d071-f90f-485d-a8aa-a0c8a726ce34@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 24 Jun 2024 18:18:16 -0400
X-Gmail-Original-Message-ID: <CABfawhkCJv1oQ4+_bBHf_ys1=gtmFVT-Zn7UeYDLaSm9KQqgcA@mail.gmail.com>
Message-ID: <CABfawhkCJv1oQ4+_bBHf_ys1=gtmFVT-Zn7UeYDLaSm9KQqgcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 5:58=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 21/06/2024 20:14, Tamas K Lengyel wrote:
> > The build integration script for oss-fuzz targets.
>
> Do you have any details how this is meant and/or will be used?

https://google.github.io/oss-fuzz/getting-started/new-project-guide/#builds=
h

>
> I also couldn't find a cover letter. For series with more than one
> patch, it is recommended to have one as it help threading and could also
> give some insight on what you are aiming to do.
>
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > ---
> >   scripts/oss-fuzz/build.sh | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >   create mode 100755 scripts/oss-fuzz/build.sh
> >
> > diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> > new file mode 100755
> > index 0000000000..48528bbfc2
> > --- /dev/null
> > +++ b/scripts/oss-fuzz/build.sh
>
> Depending on the answer above, we may want to consider to create the
> directory oss-fuzz under automation or maybe tools/fuzz/.

I'm fine with moving it wherever.

>
> > @@ -0,0 +1,22 @@
> > +#!/bin/bash -eu
> > +# Copyright 2024 Google LLC
>
> I am a bit confused with this copyright. Is this script taken from
> somewhere?

Yes, I took an existing build.sh from oss-fuzz, it is recommended to
have the more complex part of build.sh as part of the upstream
repository so that additional targets/fixes can be merged there
instead of opening PRs on oss-fuzz directly. With this setup the
build.sh I merge to oss-fuzz will just just this build.sh in the Xen
repository. See
https://github.com/tklengyel/oss-fuzz/commit/552317ae9d24ef1c00d87595516cc3=
64bc33b662.

>
> > +#
> > +# Licensed under the Apache License, Version 2.0 (the "License");
> > +# you may not use this file except in compliance with the License.
> > +# You may obtain a copy of the License at
> > +#
> > +#      http://www.apache.org/licenses/LICENSE-2.0
> > +#
> > +# Unless required by applicable law or agreed to in writing, software
> > +# distributed under the License is distributed on an "AS IS" BASIS,
> > +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
> > +# See the License for the specific language governing permissions and
> > +# limitations under the License.
> > +#
> > +######################################################################=
##########
> > +
> > +cd xen
> > +./configure clang=3Dy --disable-stubdom --disable-pvshim --disable-doc=
s --disable-xen
>
> Looking at the help from ./configure, 'clang=3Dy' is not mentioned and it
> doesn't make any difference in the config.log. Can you clarify why this
> was added?

Just throwing stuff at the wall till I was able to get a clang build.
If it's indeed not needed I can remove it.

>
> > +make clang=3Dy -C tools/include
> > +make clang=3Dy -C tools/fuzz/x86_instruction_emulator libfuzzer-harnes=
s
> > +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_inst=
ruction_emulator
>
> Who will be defining $OUT?

oss-fuzz

Tamas


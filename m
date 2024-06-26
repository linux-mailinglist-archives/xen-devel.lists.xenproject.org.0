Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB500918235
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748846.1156774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSa0-0001id-VR; Wed, 26 Jun 2024 13:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748846.1156774; Wed, 26 Jun 2024 13:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMSa0-0001gh-SP; Wed, 26 Jun 2024 13:20:56 +0000
Received: by outflank-mailman (input) for mailman id 748846;
 Wed, 26 Jun 2024 13:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xmf9=N4=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sMSZz-0001gb-Hf
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:20:55 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e95a2063-33be-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:20:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1719408048996609.3835241882795;
 Wed, 26 Jun 2024 06:20:48 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e033d34987cso276794276.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:20:48 -0700 (PDT)
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
X-Inumbo-ID: e95a2063-33be-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1719408050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lKB7cx+6vzEndxXoVe/Zh0gbJrfzOAYvNQq9KLzK5A0QGa958S7kozHFmHHDwzJIMiaXQ8sr27Rsx9RCxQpSFUi27x/Qsy9nQf62IMC6+V5tWOZS6ZD2HDtcXHqzPlnv3bo1HhyGmZn2RylnXMoOVEZPks8051ZsfsA2Y84X2Eo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719408050; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kSgYtVbwzpmL/F9eU5ULVuSzWNb/EJ1xLiGkbR0wEqw=; 
	b=ILDcv3uMa419rf2hMjfUnxctla2uQaHPEyHJPOc5bCvNjag7A6chThC+An3B3X7FcHVwICADKzCRUpKMS88hI3jDkESO2sVhNO+Klf55GXIT8MFOSlXd4jGerU5+i8POOKspR1fE64n2Bw8hzHHIIZPv3EvAjzKruUGyiryATCc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719408050;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kSgYtVbwzpmL/F9eU5ULVuSzWNb/EJ1xLiGkbR0wEqw=;
	b=koCfRHKnD1kr4YNAN1vYsFBf8sMNCoS23UIKdsUmzVq9hKM4jEwhLFOovjsENC5g
	qNked3eHDmlkwRu5+KIFoxnPBvFrvlm5plRjORBTZWD63ypxTpae9ufj9Gkkl7WTS+z
	BfLe+nBALhUKdKJpOTX+8buabIdq7Gwv6ZjTpZEw=
X-Gm-Message-State: AOJu0YwVVmM0jmNqGvc+G1CGm8jZU+qAcL0QGaIkgL4kPQAB0Mg1CaFZ
	APk9btfip9f1NWnFj/gC4BJO7pZ8sUCxGVlj7qmihCAjRIDCs6L08FtWG7cg+zrwi63H8gYzY0g
	JZ3dnL/04E+WlWBAdJDDAMVwKZno=
X-Google-Smtp-Source: AGHT+IFC50d0T+fArAsVqMhtFR/7YElCTb/9gMbZwX91WQSC68WszDfhq1yWayru2go5wsyWnx6lLdXCsBz/KJ9b3pc=
X-Received: by 2002:a25:8548:0:b0:e03:22e5:cd49 with SMTP id
 3f1490d57ef6-e0322e5d178mr5189169276.39.1719408048069; Wed, 26 Jun 2024
 06:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <20240621191434.5046-2-tamas@tklengyel.com>
 <6f94d071-f90f-485d-a8aa-a0c8a726ce34@xen.org> <CABfawhkCJv1oQ4+_bBHf_ys1=gtmFVT-Zn7UeYDLaSm9KQqgcA@mail.gmail.com>
 <9b6819fd-fd76-4249-b1f9-5afb372dd1e1@xen.org>
In-Reply-To: <9b6819fd-fd76-4249-b1f9-5afb372dd1e1@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 26 Jun 2024 09:20:12 -0400
X-Gmail-Original-Message-ID: <CABfawhmeOn0g2y40_AxRcXQe9EMNJyXhqVtg9OoAYVSHwM37fQ@mail.gmail.com>
Message-ID: <CABfawhmeOn0g2y40_AxRcXQe9EMNJyXhqVtg9OoAYVSHwM37fQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 8:41=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Tamas,
>
> On 24/06/2024 23:18, Tamas K Lengyel wrote:
> > On Mon, Jun 24, 2024 at 5:58=E2=80=AFPM Julien Grall <julien@xen.org> w=
rote:
> >>
> >> Hi,
> >>
> >> On 21/06/2024 20:14, Tamas K Lengyel wrote:
> >>> The build integration script for oss-fuzz targets.
> >>
> >> Do you have any details how this is meant and/or will be used?
> >
> > https://google.github.io/oss-fuzz/getting-started/new-project-guide/#bu=
ildsh
> >
> >>
> >> I also couldn't find a cover letter. For series with more than one
> >> patch, it is recommended to have one as it help threading and could al=
so
> >> give some insight on what you are aiming to do.
> >>
> >>>
> >>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>> ---
> >>>    scripts/oss-fuzz/build.sh | 22 ++++++++++++++++++++++
> >>>    1 file changed, 22 insertions(+)
> >>>    create mode 100755 scripts/oss-fuzz/build.sh
> >>>
> >>> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> >>> new file mode 100755
> >>> index 0000000000..48528bbfc2
> >>> --- /dev/null
> >>> +++ b/scripts/oss-fuzz/build.sh
> >>
> >> Depending on the answer above, we may want to consider to create the
> >> directory oss-fuzz under automation or maybe tools/fuzz/.
> >
> > I'm fine with moving it wherever.
>
> What about tools/fuzz then? This is where are all the tooling for the
> fuzzing.
>
> >
> >>
> >>> @@ -0,0 +1,22 @@
> >>> +#!/bin/bash -eu
> >>> +# Copyright 2024 Google LLC
> >>
> >> I am a bit confused with this copyright. Is this script taken from
> >> somewhere?
> >
> > Yes, I took an existing build.sh from oss-fuzz,
>
> It is unclear to me what is left from that "existing" build.sh. At least
> everything below seems to be Xen specific.
>
> Anyway, if you want to give the copyright to Google then fair enough,
> but I think you want to use an Origin tag (or similar) to indicate the
> original copy.
>
> >  it is recommended to
> > have the more complex part of build.sh as part of the upstream
> > repository so that additional targets/fixes can be merged there
> > instead of opening PRs on oss-fuzz directly. With this setup the
> > build.sh I merge to oss-fuzz will just just this build.sh in the Xen
> > repository. See
> > https://github.com/tklengyel/oss-fuzz/commit/552317ae9d24ef1c00d8759551=
6cc364bc33b662.
> >
> >>
> >>> +#
> >>> +# Licensed under the Apache License, Version 2.0 (the "License");
> >>> +# you may not use this file except in compliance with the License.
> >>> +# You may obtain a copy of the License at
> >>> +#
> >>> +#      http://www.apache.org/licenses/LICENSE-2.0
> >>> +#
> >>> +# Unless required by applicable law or agreed to in writing, softwar=
e
> >>> +# distributed under the License is distributed on an "AS IS" BASIS,
> >>> +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or im=
plied.
> >>> +# See the License for the specific language governing permissions an=
d
> >>> +# limitations under the License.
> >>> +#
> >>> +####################################################################=
############
> >>> +
> >>> +cd xen
> >>> +./configure clang=3Dy --disable-stubdom --disable-pvshim --disable-d=
ocs --disable-xen
> >>
> >> Looking at the help from ./configure, 'clang=3Dy' is not mentioned and=
 it
> >> doesn't make any difference in the config.log. Can you clarify why thi=
s
> >> was added?
> >
> > Just throwing stuff at the wall till I was able to get a clang build.
> > If it's indeed not needed I can remove it.
> >
> >>
> >>> +make clang=3Dy -C tools/include
> >>> +make clang=3Dy -C tools/fuzz/x86_instruction_emulator libfuzzer-harn=
ess
> >>> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_in=
struction_emulator
> >>
> >> Who will be defining $OUT?
> >
> > oss-fuzz
>
> Ok. Can you add a link to the documentation in build.sh? This would be
> helpful for the future reader to understand what's $OUT really mean.

Sure, it turns out there is already a README.oss-fuzz in tools/fuzz
that points to the oss-fuzz so I don't think there is anything else
needed here, we can just move the build script there.

Tamas


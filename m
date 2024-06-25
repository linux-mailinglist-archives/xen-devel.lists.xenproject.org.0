Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6062791682E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 14:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747664.1155123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM5Sj-0007ri-Aa; Tue, 25 Jun 2024 12:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747664.1155123; Tue, 25 Jun 2024 12:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM5Sj-0007pU-6n; Tue, 25 Jun 2024 12:39:53 +0000
Received: by outflank-mailman (input) for mailman id 747664;
 Tue, 25 Jun 2024 12:39:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2rz=N3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sM5Si-0007pO-JH
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 12:39:52 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 029c10d9-32f0-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 14:39:50 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1719319184952149.86804190776775;
 Tue, 25 Jun 2024 05:39:44 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6439f6cf79dso22080787b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 05:39:44 -0700 (PDT)
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
X-Inumbo-ID: 029c10d9-32f0-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1719319186; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pg8SSFbJfx6Bdr2e5+icRvOVzAkkhF6h5LxTB/F0TeGt8aPXbvfHoVQPERBP+fstWjLv1QyHocrHTqKfumIu8AAJEnTW+CI8cWuj4fElXIk5ugMiYiPNmU/j1EYl+BoO75q1a+U+E3GAS2/xtdrIb1Nq4MLrtx9voC9W4KlShUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719319186; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yeXTEZwZUnpjXTQTWeqpSaG9Wl3HecQDKEKY2ZuA7Yk=; 
	b=j9VvG8SPtJJXU9VzgUplsh6WuqobRnCGw5ZHLef2a4FxN3uUgDYv6tfU7Evmg/pfJoTez4L0RSgcVbYvCW7/BPV+ICEApFrI/ghRerHeqEND/2wKqD+iL7K2b+KyM+mh2B5F8bTtfgeoiphmxB8HUsRXZu5x+AkQM2nikWPCm3s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719319186;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yeXTEZwZUnpjXTQTWeqpSaG9Wl3HecQDKEKY2ZuA7Yk=;
	b=HSLrRu9+TwaapdM6/CzCUtb+QGWbCOosC5J/0tDNsZyS6aaJvNLJnC/D0BnXIATH
	6Jdffjf0+q0iRiPaV5uyZnPL3j19EWzZ5ULMHXHk3rgOlVrfVvF0JtMSQrsWasKGNi1
	qfiIQZ+sxgOCNfbjBCHNIHkzocmvCFjZfBgrJHNY=
X-Forwarded-Encrypted: i=1; AJvYcCXeSfA/z98MMbvQysQ5bQ/MKPDxoT3SiXslQNRT8nIEWe8v4CsF9H2GVIEpJPpW3DaK+CEOa1hdpBfpZ2NW1ndcK/Sx/J5jx2biC+r+a60=
X-Gm-Message-State: AOJu0Yy9KxXlSen9Pe82Yn9LJNS9Z+LPJXCdwBLbgHdHCqWAK2mPU/tP
	yCoH2S+px4aAP/+fn6vIk6HK6ApFSNPTICwiT8YV9AqW5SxKyjhKAsNoXjP11v5udHU8ysmBrrf
	SPA0GjPyGoQiWXanY2YeOeKmzY4Q=
X-Google-Smtp-Source: AGHT+IFcV3BnSPBOfxq/OR32QZkQSX8qCLUldTzSBF4CMwbgB3MTbKLil63LAeOsUlhkcueTi1ii2Rm3aDMzE09RhR8=
X-Received: by 2002:a25:80c8:0:b0:e02:fa22:5031 with SMTP id
 3f1490d57ef6-e0303ed4c44mr7152426276.10.1719319184049; Tue, 25 Jun 2024
 05:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <20240621191434.5046-2-tamas@tklengyel.com>
 <0a7854e0-e01e-435e-95fe-b262cc4afc1e@suse.com> <CABfawhmkhCD-MFgZBrhJ1CwiiseotJ=+MANbgwsjRL_VYsnuTQ@mail.gmail.com>
 <b9b84f10-6d41-48d9-996d-069408753e28@suse.com>
In-Reply-To: <b9b84f10-6d41-48d9-996d-069408753e28@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Jun 2024 08:39:07 -0400
X-Gmail-Original-Message-ID: <CABfawhkJ0t8FenCWbupGcHD-ZhorbWN7ZjMQVm-jeg_zA1g5iQ@mail.gmail.com>
Message-ID: <CABfawhkJ0t8FenCWbupGcHD-ZhorbWN7ZjMQVm-jeg_zA1g5iQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 7:40=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.06.2024 13:15, Tamas K Lengyel wrote:
> > On Tue, Jun 25, 2024 at 5:17=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 21.06.2024 21:14, Tamas K Lengyel wrote:
> >>> --- /dev/null
> >>> +++ b/scripts/oss-fuzz/build.sh
> >>> @@ -0,0 +1,22 @@
> >>> +#!/bin/bash -eu
> >>> +# Copyright 2024 Google LLC
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
> >>
> >> I'm a little concerned here, but maybe I shouldn't be. According to wh=
at
> >> I'm reading, the Apache 2.0 license is at least not entirely compatibl=
e
> >> with GPLv2. While apparently the issue is solely with linking in Apach=
e-
> >> licensed code, I wonder whether us not having a respective file under
> >> ./LICENSES/ (and no pre-cooked SPDX identifier to use) actually has a
> >> reason possibly excluding the use of such code in the project.
> >>
> >>> +cd xen
> >>> +./configure clang=3Dy --disable-stubdom --disable-pvshim --disable-d=
ocs --disable-xen
> >>> +make clang=3Dy -C tools/include
> >>> +make clang=3Dy -C tools/fuzz/x86_instruction_emulator libfuzzer-harn=
ess
> >>> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_in=
struction_emulator
> >>
> >> In addition to what Julien said, I further think that filename / direc=
tory
> >> name are too generic for a file with this pretty specific contents.
> >
> > I don't really get your concern here?
>
> The thing that is built is specifically a x86 emulator piece of fuzzing
> binary. Neither the directory name nor the file name contain either x86
> or (at least) emul.

Because this build script is not necessarily restricted to build only
this one harness in the future. Right now that's the only one that has
a suitable libfuzzer harness, but the reason this build script is here
is to be easily able to add additional fuzzing binaries without the
need to open PRs on the oss-fuzz repo, which as I understand no one
was willing to do in the xen community due to the CLA. Now that the
integration is going to be in oss-fuzz, the only thing you have to do
in the future is add more stuff to this script to get fuzzed. Anything
that's compiled with libfuzzer and copied to $OUT will be picked up by
oss-fuzz automatically. Makes sense?

Tamas


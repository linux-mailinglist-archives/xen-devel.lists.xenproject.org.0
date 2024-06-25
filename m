Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2C916936
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747719.1155188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6S8-0004GQ-0v; Tue, 25 Jun 2024 13:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747719.1155188; Tue, 25 Jun 2024 13:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6S7-0004EJ-Ua; Tue, 25 Jun 2024 13:43:19 +0000
Received: by outflank-mailman (input) for mailman id 747719;
 Tue, 25 Jun 2024 13:43:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2rz=N3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sM6S6-0004EB-Cy
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:43:18 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfba6550-32f8-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 15:43:17 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1719322991509960.1477680832319;
 Tue, 25 Jun 2024 06:43:11 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e02b571b0f6so5432398276.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:43:11 -0700 (PDT)
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
X-Inumbo-ID: dfba6550-32f8-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1719322994; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kskmQ/HkDsXBCo7+k0gw3KG2TQKmF8MfbCEHM/ZbEADlS0ykReAmiLolfZlIr74I16IDVuPV2xM741GWXOvdCcW1Y4WD4QQmMcKItUNxVbh5JQpymPVfLz/nZoNa6nhM7+8wC8rkoAldgzmvyZNhl6So/+gaBghElUcRx6KfG7s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719322994; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pr1odYqS0ZrtCrgBJK30bcPuDVS3ze7cey35TPBpOlY=; 
	b=Ebvxkclg9ZqNovPIWFi1od8tPyZNaPPJbRVWESOwHJ4lKQGTibbrzsnNLgxpdkHAv88NrheKA6kPs4qV1BjP2oaibqyd3r3eh485gIOtmL1o8nd2jWE0CFhNmdR3fwCBwkfLzwp+67CBn6TxTkU5it5MPbtIWb4qQigxT8hER/4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719322994;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pr1odYqS0ZrtCrgBJK30bcPuDVS3ze7cey35TPBpOlY=;
	b=WnixsLCZhpY2BwZEesCNFML/5kjDHGc7xZwu07RFswP5EDbPUEHHOOpgI0qCYnSJ
	IAWA3tus3y5pkORWUUArE5Q3KGqc9hpbTzy8YRma4CjX7rLcYN6Ce1/1vTYAICYgIEt
	Pr2uyznvL7M8IL0oHIu6oJxEVg3yKk3eptqus3bY=
X-Forwarded-Encrypted: i=1; AJvYcCUspalkeHc80f9yhLr4mFs0m8GnVoRWttip/A8zg/a87psGA01DSruG3FSXZcXKFTIKbZ+K0+4Pcwplv8PPBiO9RqcvlcxzeSujcrO1BKU=
X-Gm-Message-State: AOJu0YwTK9BMqw8stIr5TL5idEgmWHb1jqu7YXRq5gLOSbjsiSBev/LH
	ccmnEI+WFTnhmnFHLQ69+2n2zi1eUY0+kGARVOvnjKTSaGCdN8Y1xeAK0cPwmyyL/1mvsyJyVWL
	/CV1HC6H4znBnSLJIRyUjDcD+9dQ=
X-Google-Smtp-Source: AGHT+IEdGW5iyChpb1JVMDxR3jJ63LbEVe4bAhxc5XoXBCuP+6lSXhBULGr2KGgRCihfdmSCCQjPADmG1B0fQysE0mc=
X-Received: by 2002:a5b:8c9:0:b0:e02:c434:8b2a with SMTP id
 3f1490d57ef6-e030402f3cdmr7300676276.54.1719322990668; Tue, 25 Jun 2024
 06:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <20240621191434.5046-2-tamas@tklengyel.com>
 <0a7854e0-e01e-435e-95fe-b262cc4afc1e@suse.com> <CABfawhmkhCD-MFgZBrhJ1CwiiseotJ=+MANbgwsjRL_VYsnuTQ@mail.gmail.com>
 <b9b84f10-6d41-48d9-996d-069408753e28@suse.com> <CABfawhkJ0t8FenCWbupGcHD-ZhorbWN7ZjMQVm-jeg_zA1g5iQ@mail.gmail.com>
 <66a7243d-a1a1-4236-832f-f3e1daf11b85@suse.com>
In-Reply-To: <66a7243d-a1a1-4236-832f-f3e1daf11b85@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Jun 2024 09:42:34 -0400
X-Gmail-Original-Message-ID: <CABfawhmAV5+Nr9A_Speh2ai3v9wfJtxmps=R6iTxNU1RFP4xRA@mail.gmail.com>
Message-ID: <CABfawhmAV5+Nr9A_Speh2ai3v9wfJtxmps=R6iTxNU1RFP4xRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 9:18=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.06.2024 14:39, Tamas K Lengyel wrote:
> > On Tue, Jun 25, 2024 at 7:40=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 25.06.2024 13:15, Tamas K Lengyel wrote:
> >>> On Tue, Jun 25, 2024 at 5:17=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>>
> >>>> On 21.06.2024 21:14, Tamas K Lengyel wrote:
> >>>>> --- /dev/null
> >>>>> +++ b/scripts/oss-fuzz/build.sh
> >>>>> @@ -0,0 +1,22 @@
> >>>>> +#!/bin/bash -eu
> >>>>> +# Copyright 2024 Google LLC
> >>>>> +#
> >>>>> +# Licensed under the Apache License, Version 2.0 (the "License");
> >>>>> +# you may not use this file except in compliance with the License.
> >>>>> +# You may obtain a copy of the License at
> >>>>> +#
> >>>>> +#      http://www.apache.org/licenses/LICENSE-2.0
> >>>>> +#
> >>>>> +# Unless required by applicable law or agreed to in writing, softw=
are
> >>>>> +# distributed under the License is distributed on an "AS IS" BASIS=
,
> >>>>> +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or =
implied.
> >>>>> +# See the License for the specific language governing permissions =
and
> >>>>> +# limitations under the License.
> >>>>> +#
> >>>>> +##################################################################=
##############
> >>>>
> >>>> I'm a little concerned here, but maybe I shouldn't be. According to =
what
> >>>> I'm reading, the Apache 2.0 license is at least not entirely compati=
ble
> >>>> with GPLv2. While apparently the issue is solely with linking in Apa=
che-
> >>>> licensed code, I wonder whether us not having a respective file unde=
r
> >>>> ./LICENSES/ (and no pre-cooked SPDX identifier to use) actually has =
a
> >>>> reason possibly excluding the use of such code in the project.
> >>>>
> >>>>> +cd xen
> >>>>> +./configure clang=3Dy --disable-stubdom --disable-pvshim --disable=
-docs --disable-xen
> >>>>> +make clang=3Dy -C tools/include
> >>>>> +make clang=3Dy -C tools/fuzz/x86_instruction_emulator libfuzzer-ha=
rness
> >>>>> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_=
instruction_emulator
> >>>>
> >>>> In addition to what Julien said, I further think that filename / dir=
ectory
> >>>> name are too generic for a file with this pretty specific contents.
> >>>
> >>> I don't really get your concern here?
> >>
> >> The thing that is built is specifically a x86 emulator piece of fuzzin=
g
> >> binary. Neither the directory name nor the file name contain either x8=
6
> >> or (at least) emul.
> >
> > Because this build script is not necessarily restricted to build only
> > this one harness in the future. Right now that's the only one that has
> > a suitable libfuzzer harness, but the reason this build script is here
> > is to be easily able to add additional fuzzing binaries without the
> > need to open PRs on the oss-fuzz repo, which as I understand no one
> > was willing to do in the xen community due to the CLA. Now that the
> > integration is going to be in oss-fuzz, the only thing you have to do
> > in the future is add more stuff to this script to get fuzzed. Anything
> > that's compiled with libfuzzer and copied to $OUT will be picked up by
> > oss-fuzz automatically. Makes sense?
>
> It does, yes. Yet nothing like that was said in the description. How
> should anyone have known there are future possibilities with this script?

Apologies, to me "The build integration script for oss-fuzz targets."
was sufficiently descriptive but it may require some familiarity with
oss-fuzz to get. I can certainly add the above text to the commit
message if that helps.

Tamas


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD18916602
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 13:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747624.1155079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM4CP-00032r-TS; Tue, 25 Jun 2024 11:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747624.1155079; Tue, 25 Jun 2024 11:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM4CP-00031Q-Qq; Tue, 25 Jun 2024 11:18:57 +0000
Received: by outflank-mailman (input) for mailman id 747624;
 Tue, 25 Jun 2024 11:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2rz=N3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sM4CP-00031I-2f
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 11:18:57 +0000
Received: from sender3-op-o17.zoho.com (sender3-op-o17.zoho.com
 [136.143.184.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ed9e6b-32e4-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 13:18:55 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1719314330415888.1733492474157;
 Tue, 25 Jun 2024 04:18:50 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dfab5f7e749so4659368276.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 04:18:50 -0700 (PDT)
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
X-Inumbo-ID: b4ed9e6b-32e4-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1719314331; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cdFqpRjP71cJyk/h30ljSOlhaa98hdj7IIpRI9JbQMbw/56F1UKll3NN/V2ULIqpRYuRtLx8XgO/9OV5AfeHhq6OL/MAuLWoI5YHbkG3xvoCQk1PdzxLlU5kk8cYsn+XItGsP7ZN74rzElJCOws9w0p1gSckgN+L2mGfty9dFz0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719314331; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cTQ9vGL9Zqkl9i/BATJ7M5Dby2blfmOFQOoK+7+j6iI=; 
	b=gJaKURi0bHmq1MnLuFX1beIs0doRZz2SVIjYJVD4OqJOmM0YGpqclsZiz33SEJJ9manWN9EVrQ1UqvCntaLVLHa5oQLiJ8LpdHjUc36e39RM9/TiNuN6pYYoIqFvP0A54PDq3zLdbC/7pdtAozqicZwMSGb5wKE0E1p7KlalCEk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719314331;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cTQ9vGL9Zqkl9i/BATJ7M5Dby2blfmOFQOoK+7+j6iI=;
	b=eu+oepVSLrmXAaxuc8CeJt4TSxC2NfpwTA0txut0BiSiL3UfKzirrzjXXxsDuURo
	HyHrMdXWsuYPgdXOZvPCDs7TU98a6gWM9onk7dci6f80S8h1TybbgxzHLVlm7/Cx887
	WS0cM3tBGSG+zxUN/qkw/cHKHs1YnuovGNtXTNGI=
X-Forwarded-Encrypted: i=1; AJvYcCUIk5pL/4y/BzJ11TZG8mZdE4kxFgAoL/hqxZAw3/mBGsCm5leYR4+Wfi76wg+h4DNk9phwfZwGzsxWInB3tc2Keir4rbFIjFkW8F1oQkY=
X-Gm-Message-State: AOJu0Yyr9vYIYCU7mcNPMHJ3CYktVN4FsGJbHn136UYEZ0wuGe6i+jqU
	ZG55wBel0xhfhX0kakNEaabO1QOgFT69gWztUUyMUg4dyqhG3y3W8t8x3jXgM9SlrhISmKAyt0z
	Y1c5qtrcN62FYPdO6iwnl44wOZX4=
X-Google-Smtp-Source: AGHT+IEgCytVU2bi1Xl3KUQPbBSRRDDYOZqldMoSFSBPbfDSZiVrB8KH6sThblT/KKTWP/UB9VPFVMQEhb5J0ULLyEU=
X-Received: by 2002:a25:ac52:0:b0:e02:bc76:3407 with SMTP id
 3f1490d57ef6-e0300f86aa6mr7523191276.34.1719314329514; Tue, 25 Jun 2024
 04:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <20240621191434.5046-2-tamas@tklengyel.com>
 <0a7854e0-e01e-435e-95fe-b262cc4afc1e@suse.com>
In-Reply-To: <0a7854e0-e01e-435e-95fe-b262cc4afc1e@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Jun 2024 07:18:13 -0400
X-Gmail-Original-Message-ID: <CABfawhm2GuBpQ1sm9nwz1R73SGSxBNZ4Tprd-mYLBkFA5vDLeA@mail.gmail.com>
Message-ID: <CABfawhm2GuBpQ1sm9nwz1R73SGSxBNZ4Tprd-mYLBkFA5vDLeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add scripts/oss-fuzz/build.sh
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 5:17=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.06.2024 21:14, Tamas K Lengyel wrote:
> > --- /dev/null
> > +++ b/scripts/oss-fuzz/build.sh
> > @@ -0,0 +1,22 @@
> > +#!/bin/bash -eu
> > +# Copyright 2024 Google LLC
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
>
> I'm a little concerned here, but maybe I shouldn't be. According to what
> I'm reading, the Apache 2.0 license is at least not entirely compatible
> with GPLv2. While apparently the issue is solely with linking in Apache-
> licensed code, I wonder whether us not having a respective file under
> ./LICENSES/ (and no pre-cooked SPDX identifier to use) actually has a
> reason possibly excluding the use of such code in the project.

The script is standalone in a clearly separate folder, not linking
with anything else in the project so there is no license mixing.
Adding an SPDX tag to the file would be fine.

Tamas


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107959165F2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 13:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747618.1155070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM49j-0002H8-JF; Tue, 25 Jun 2024 11:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747618.1155070; Tue, 25 Jun 2024 11:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM49j-0002EZ-Fn; Tue, 25 Jun 2024 11:16:11 +0000
Received: by outflank-mailman (input) for mailman id 747618;
 Tue, 25 Jun 2024 11:16:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2rz=N3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sM49h-0002EQ-TN
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 11:16:09 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5144cb93-32e4-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 13:16:08 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1719314162606320.24722921450075;
 Tue, 25 Jun 2024 04:16:02 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e02bf947545so5026994276.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 04:16:02 -0700 (PDT)
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
X-Inumbo-ID: 5144cb93-32e4-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1719314164; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P9JUAX9ndWMdwnZviLa7pvhGzGxJMF0hp/0Kq2+Fz75AHlHoDFczNWOeFY5uDmqClc80ZFwHdEltfJH1IwC2zoQ9EvwQ+8j8dTYuK2WS6bzNpf8PoEnP6tDqvnzhmdVoKA1oaalIcymmjC/nKaY9sKvQ/EDgBqYngX+d0j4fSb0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719314164; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EMeQ/Tt64Xrl1FmiiengZ/Txtmyk2xd+z37sEUGwvIc=; 
	b=NEFYW0n/tugYbqwWGfP0CTDJ2alwHD87JvNydz9MguJ2BbmBh0CuOo3MOfBuip9MpoGdUFVHwymd6Wvhs9/eeZwSKoBZ2i74+E9biBSkd+jbRVQGodiotHaGNNfF49Dwfi7GftQeT248nRgTED9kMRR9qltzIWCFgaN12+JMgso=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719314164;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EMeQ/Tt64Xrl1FmiiengZ/Txtmyk2xd+z37sEUGwvIc=;
	b=LRPqCBiK995RiT4gBBIgkJABl0VEUxLRRIeZCoQS031XKoEaZTe9jAistk6vcG+Q
	fi8S9yoiW/RI1KK0lLTOkmWb1lw9Eb0aNMu4wU5xXGNcVwR0H0JIz141trkyUHtbxLp
	7vqpy9W61ICgQPDQc5ig/RnGcEXpfRz/3L5tRWi0=
X-Forwarded-Encrypted: i=1; AJvYcCXWv//k3zDkgchpUwBzBCq66MgSXa1bucjtqA8Udp/2zqFQBLlUb9sAOFyyRhcQVXsHTj1QkxPYcJE86mDYUq/OmgFBjbGrjAG3A6pzOB8=
X-Gm-Message-State: AOJu0YzoK8x00a0MbZ8/MLEbtgjZOz6qyW1UvaNrsEKyRJyUM2o+ZFU8
	9Qc54RtASc9+8LOS5DAnMlZ1HnHgReehFPNInmIu1ZfGg5yxk6usnIe0mtzUTg7/SoheWqsAa7e
	vFiXzimLE3SXRF/PrxNEojHfhITg=
X-Google-Smtp-Source: AGHT+IFipnVvxnmDEUt1UvNBPS+HjXr9zBlQIJlz8c2oWixR3fSmH8+DQGg7wH3X+YDnR7/c+lgG/ji+jScKasXXvhw=
X-Received: by 2002:a25:cec1:0:b0:dff:3505:a35e with SMTP id
 3f1490d57ef6-e03040084d4mr7626284276.46.1719314161567; Tue, 25 Jun 2024
 04:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <20240621191434.5046-2-tamas@tklengyel.com>
 <0a7854e0-e01e-435e-95fe-b262cc4afc1e@suse.com>
In-Reply-To: <0a7854e0-e01e-435e-95fe-b262cc4afc1e@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 25 Jun 2024 07:15:25 -0400
X-Gmail-Original-Message-ID: <CABfawhmkhCD-MFgZBrhJ1CwiiseotJ=+MANbgwsjRL_VYsnuTQ@mail.gmail.com>
Message-ID: <CABfawhmkhCD-MFgZBrhJ1CwiiseotJ=+MANbgwsjRL_VYsnuTQ@mail.gmail.com>
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
>
> > +cd xen
> > +./configure clang=3Dy --disable-stubdom --disable-pvshim --disable-doc=
s --disable-xen
> > +make clang=3Dy -C tools/include
> > +make clang=3Dy -C tools/fuzz/x86_instruction_emulator libfuzzer-harnes=
s
> > +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_inst=
ruction_emulator
>
> In addition to what Julien said, I further think that filename / director=
y
> name are too generic for a file with this pretty specific contents.

I don't really get your concern here?

Tamas


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A3934D86
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 14:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760479.1170334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQfG-0006YS-9y; Thu, 18 Jul 2024 12:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760479.1170334; Thu, 18 Jul 2024 12:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQfG-0006Vp-6I; Thu, 18 Jul 2024 12:55:18 +0000
Received: by outflank-mailman (input) for mailman id 760479;
 Thu, 18 Jul 2024 12:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lg7+=OS=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sUQfE-0006Vj-OD
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 12:55:16 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f95f2e69-4504-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 14:55:15 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721307310681837.9982031627935;
 Thu, 18 Jul 2024 05:55:10 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e05f2adab8bso763157276.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 05:55:10 -0700 (PDT)
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
X-Inumbo-ID: f95f2e69-4504-11ef-bbfd-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1721307312; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CuO++IG2VsboEd2MMA9+QjzzuLOsDHgQtrO/Cs95ZNgrkVb9EizxaF5SQio4hFty4BZlgFUxw66yw3h7k15aohteLL6tlqLgeNHoN03UFL4zsor1xmqwtxmfzCluh45eWfSWSa4xNAjPVH+QjoCsprjzC/v1JCpRRL2sfbTBKpI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721307312; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/g1XCDSkX+zAx8JMyTemfy7xvWBSiTXpZZV8FhTzvJ8=; 
	b=OExPKR2QBaI8wPvPBhVZeLlzaV2GhvQ+vZ0ZxGVHgUOGQ0V9bSQrQaBWq7UnHVesOtYtF/y+h9Cg4thGHusYQSiHw+EgRFOpz+tKx/Vx6iyKtyMyGKjKBydysRl42KyFfa7bU0MuB1NdrzZZ0bVCCiKZ9R3Y6vJTkJcWKzLpfFY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721307312;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/g1XCDSkX+zAx8JMyTemfy7xvWBSiTXpZZV8FhTzvJ8=;
	b=jq7IqhC+VebI1k7NzQzrGg/weZpCBjK/txlB1319rnQaVSymKz/EqFOq9gXdl8ly
	U5zqbw0X74DgQIGFaVxmc3iBURAZB+wGa6p5Mkv4aUvO3UDqe9BitxNk3Uq9KWcHfY3
	h2rfh8WNc3VOhBWUCUluDqyc0obPhgObQyA4VkEU=
X-Forwarded-Encrypted: i=1; AJvYcCXMGMFhg/KUya9OKFiE41vThlhNPOVIHAffwxGyNdk+Sr3SN+aB9RhOjuM0kYu+bskLLKWKyfqrWwSYWuGLDL88JMGqtzU0DPKPvimdUPg=
X-Gm-Message-State: AOJu0Yygfr9enb0O6qS7QbGBeq6+tm9FJKWOCV08rbLcHGEwBllqNlwH
	nb0lZUU5BffKVplIEzBXuKr8bHuKkqsxZlkck/WAjg36wqaTa5mnoemrJP0hiBLQAyOD5I69bh1
	FP29tb2nQzpg+eqcVMQJKtPrOz8A=
X-Google-Smtp-Source: AGHT+IFf3C6rY9T31dpqdNBHNeStk9UWG7vpSBoi0Q0yQ1rIjDXqYJbDRnLP94oW4QkGAa669m5qJBHRCnQIOodvY2c=
X-Received: by 2002:a05:6902:1383:b0:e05:b655:329e with SMTP id
 3f1490d57ef6-e05ed7cc8e4mr5499345276.55.1721307309795; Thu, 18 Jul 2024
 05:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <d0974cc40ca68fe197ba7941edd934970d3a92cf.1719355322.git.tamas@tklengyel.com> <53e3356e-4cc1-475a-91a1-8fc17fda07ab@suse.com>
In-Reply-To: <53e3356e-4cc1-475a-91a1-8fc17fda07ab@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2024 08:54:33 -0400
X-Gmail-Original-Message-ID: <CABfawhkLCziShB6x5J1OXL=M6AqquL-9SpTCQRVDNCeu_dqPNw@mail.gmail.com>
Message-ID: <CABfawhkLCziShB6x5J1OXL=M6AqquL-9SpTCQRVDNCeu_dqPNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Add scripts/oss-fuzz/build.sh
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 7:17=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 26.06.2024 00:47, Tamas K Lengyel wrote:
> > --- /dev/null
> > +++ b/scripts/oss-fuzz/build.sh
> > @@ -0,0 +1,23 @@
> > +#!/bin/bash -eu
> > +# SPDX-License-Identifier: Apache-2.0
>
> Hmm. Aiui this line is supposed to make unnecessary ...
>
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
>
> ... all of this text, provided an entry is first put in ./LICENSES/.
>
> > +######################################################################=
##########
> > +
> > +cd xen
>
> This looks to suggest that the expectation is for the script to be invoke=
d
> from the root of a xen.git clone. Imo something like
>
> cd $(dirname $0)/../../xen
>
> would be more flexible.

No, it will be invoked after a git clone is made, so you have to enter
the xen folder that was just cloned.

>
> > +./configure --disable-stubdom --disable-pvshim --disable-docs --disabl=
e-xen
>
> Going forward we mean to no longer bundle e.g. qemu in release tarballs,
> yet I wonder whether passing a couple of --with-system-...=3D here wouldn=
't
> be better nevertheless.

It largely doesn't matter as long as the configure script completes
successfully since we aren't going to compile QEMU. But sure, I can
add it.

>
> > +make clang=3Dy -C tools/include
> > +make clang=3Dy -C tools/fuzz/x86_instruction_emulator libfuzzer-harnes=
s
>
> In how far is it a requirement to have "clang=3Dy" here? Wasn't this ques=
tion
> even asked before? I'm not even sure whether mid- or long-term we mean to
> retain that functionality. Overrides of tool chain (components) may bette=
r
> be done using CC=3D and friends. Plus perhaps by whoever is invoking this
> script?

It is an absolute requirement to use clang=3Dy here as oss-fuzz uses a
specific clang as compiler for C/C++ projects. The CC environment
variables are already set by the oss-fuzz docker environment but it's
insufficient for a successful clang build. Without clang=3Dy the
following error is encountered:

gcc: error: unrecognized debug output level 'line-tables-only'
gcc: error: unrecognized argument to '-fsanitize=3D' option: 'fuzzer-no-lin=
k'

Tamas


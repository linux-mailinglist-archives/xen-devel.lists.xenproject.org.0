Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B632CD833
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 14:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43502.78179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkp1A-0005fD-Es; Thu, 03 Dec 2020 13:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43502.78179; Thu, 03 Dec 2020 13:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkp1A-0005eq-BN; Thu, 03 Dec 2020 13:51:32 +0000
Received: by outflank-mailman (input) for mailman id 43502;
 Thu, 03 Dec 2020 13:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oiWT=FH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kkp18-0005ek-Qc
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 13:51:30 +0000
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12d3098d-0b58-407c-ae6b-06e7429356c1;
 Thu, 03 Dec 2020 13:51:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 3so3951346wmg.4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Dec 2020 05:51:29 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id e4sm1881349wrr.32.2020.12.03.05.51.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 05:51:28 -0800 (PST)
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
X-Inumbo-ID: 12d3098d-0b58-407c-ae6b-06e7429356c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=KG0ZODBhqlJjf3yMVFp97XKyIxJKUtY7MgL/JtPCVxk=;
        b=p0R85et3SoulqgQcgIr4QEB6ii0+JdF7kqz4YTa9i+QepyoZ2+uyi9mRfCUgnTn4Kq
         usNz3Mj5pz5xFfgHdcn1qcokLz7GXvaWR3d+ubq99hiGfoSpzKfiBEiJF88nvRcibpNt
         rP66gtTKtaW1i5YddKUVT7E9SQTtSAmKfQXvhhVsmi4P+PyFz+rcd6hr+sNwtbHTxfuP
         b8d8ETy5HVfHRqITCgIezWQbsWu4LXYJx/Gd4x8RAWXs1d76HxYfg8PnaqxVTx/fxJHy
         3U0N5QmTPXa5wSA2Tz42Qg7niqeyL56/WXqbXs9eCFakQVNY1mEk2KjwoHioznyvCMpj
         VAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=KG0ZODBhqlJjf3yMVFp97XKyIxJKUtY7MgL/JtPCVxk=;
        b=dP8yTWbK49NfcnfHTG8y67xcT6oS9fRB/bA+umO5tjrmWqwOrhJoYDGhed5XpzZurs
         RacEMgUL28zBkeKi+jGZyfcUJJXySZshLvW0J+xe6OuDgBgKo1kCPCME+Iun6Vp76CEn
         waf7Wr0mlLquO5pZAG0CQW4S1xnwF/LJWCNAeLBtEuGmPCK5gLQM61cKseZzloFaumzM
         XZwA1Aoq2XU8rOg5NX6k73qUjAauhyhxdAao4isG8pUaYdMqd2Qnp54hSHqmzLVDp75C
         P/6v/NQP/zY+8KP0YrZxrBKp3mtWqneoS9vFb7IjCin+lq1Ior5PQ9NSgoCQs4NY6yPL
         2APw==
X-Gm-Message-State: AOAM531r5u24WXdbZOyG3E2OQzAxK5fU9DRsg37gOU4/M2gcivDF8dJ1
	8l6/+jttdCqQkFvqD3HDKgw=
X-Google-Smtp-Source: ABdhPJxLAbcX/ZEH0BEBPfmqu5og4nYc8qefFJ9zXmASR5brA65YMYuDeQkVoIfsYsMLk6MEWEmIdg==
X-Received: by 2002:a1c:6a10:: with SMTP id f16mr3502596wmc.106.1607003489054;
        Thu, 03 Dec 2020 05:51:29 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>,
	"'Christian Lindig'" <christian.lindig@citrix.com>,
	"'David Scott'" <dave@recoil.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	"'Wei Liu'" <wl@xen.org>
References: <20201203124159.3688-1-paul@xen.org> <7417f158-2cad-3909-2676-f9d5a90f4202@suse.com>
In-Reply-To: <7417f158-2cad-3909-2676-f9d5a90f4202@suse.com>
Subject: RE: [PATCH v5 0/4] Xen ABI feature control
Date: Thu, 3 Dec 2020 13:51:27 -0000
Message-ID: <00b101d6c97b$660c4990$3224dcb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJzrCHAX/gquRkO4g65wfjgQBytUAJD4qPyqJl9rgA=

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 03 December 2020 13:15
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; Anthony PERARD
> <anthony.perard@citrix.com>; Christian Lindig =
<christian.lindig@citrix.com>; David Scott
> <dave@recoil.org>; George Dunlap <george.dunlap@citrix.com>; Ian =
Jackson <iwj@xenproject.org>; Jan
> Beulich <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>;
> Stefano Stabellini <sstabellini@kernel.org>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Wei Liu
> <wl@xen.org>
> Subject: Re: [PATCH v5 0/4] Xen ABI feature control
>=20
> On 03.12.20 13:41, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > This series was previously called "evtchn: Introduce a per-guest =
knob to
> > control FIFO ABI". It is been extensively re-worked and extended to =
cover
> > another ABI feature.
> >
> > Paul Durrant (4):
> >    domctl: introduce a new domain create flag,
> >      XEN_DOMCTL_CDF_evtchn_fifo, ...
> >    domctl: introduce a new domain create flag,
> >      XEN_DOMCTL_CDF_evtchn_upcall, ...
> >    libxl: introduce a 'libxl_xen_abi_features' enumeration...
> >    xl: introduce a 'xen-abi-features' option...
> >
> >   docs/man/xl.cfg.5.pod.in         | 50 =
++++++++++++++++++++++++++++++++
> >   tools/include/libxl.h            | 10 +++++++
> >   tools/libs/light/libxl_arm.c     | 22 +++++++++-----
> >   tools/libs/light/libxl_create.c  | 31 ++++++++++++++++++++
> >   tools/libs/light/libxl_types.idl |  7 +++++
> >   tools/libs/light/libxl_x86.c     | 17 ++++++++++-
> >   tools/ocaml/libs/xc/xenctrl.ml   |  2 ++
> >   tools/ocaml/libs/xc/xenctrl.mli  |  2 ++
> >   tools/xl/xl_parse.c              | 50 =
++++++++++++++++++++++++++++++--
> >   xen/arch/arm/domain.c            |  3 +-
> >   xen/arch/arm/domain_build.c      |  3 +-
> >   xen/arch/arm/setup.c             |  3 +-
> >   xen/arch/x86/domain.c            |  8 +++++
> >   xen/arch/x86/hvm/hvm.c           |  3 ++
> >   xen/arch/x86/setup.c             |  4 ++-
> >   xen/common/domain.c              |  3 +-
> >   xen/common/event_channel.c       | 24 +++++++++++++--
> >   xen/include/public/domctl.h      |  6 +++-
> >   18 files changed, 229 insertions(+), 19 deletions(-)
> > ---
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > Cc: Christian Lindig <christian.lindig@citrix.com>
> > Cc: David Scott <dave@recoil.org>
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Ian Jackson <iwj@xenproject.org>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Julien Grall <julien@xen.org>
> > Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > Cc: Wei Liu <wl@xen.org>
> >
>=20
> Do we want to add a create flag for each such feature, or would it be
> better to set options like those via hypfs?
>=20
> It would be fairly easy to ad dynamic hypfs paths, e.g.:
>=20
> /domain/<domid>/abi-features/evtchn-fifo
> /domain/<domid>/abi-features/evtchn-upcall
>=20
> which would have boolean type and could be set as long as the domain
> hasn't been started.
>=20
> xl support could even be rather generic, without the need to add =
coding
> to xl for each new feature.
>=20
> This is no objection to this series, but just an idea how to avoid
> extending the use of unstable interfaces.
>=20
> Thoughts?
>=20

I was not aware we could have something that was dynamic only before I =
domain is started.

We'd still want libxl to write the features rather than xl doing it =
directly I think as we still want it to be the owner of the default =
settings. Personally it still feels like this kind of setting does want =
to be an explicit part of domain creation, though using hypfs does sound =
like a neat idea.

  Paul

>=20
> Juergen



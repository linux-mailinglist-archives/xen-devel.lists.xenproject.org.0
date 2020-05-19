Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629581D91AA
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:06:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaxGJ-00028e-9p; Tue, 19 May 2020 08:06:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FgAx=7B=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jaxGI-00028Z-2a
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:06:06 +0000
X-Inumbo-ID: 95f9d806-99a7-11ea-9887-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95f9d806-99a7-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 08:06:04 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id d7so10449094eja.7
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 01:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=RVJqIxPZoERjogup+I552owU+rzaIvrLTsANtoO6Mds=;
 b=siZm1C2KJf3kpy7DPeUxJVcKxFVKcxenePrSg2QkzsFfTiWvKknUV6yeouvvLhxBX+
 Fv/+o295EdnmvWYmpBjAtsxlqSXN2lP1md3UujXLLyB8/GBG/GBxm4Yqjc1u/lwjGG8I
 U9fMfgBaYGQI99uAVJhnRHNJFoV3ArTg6sep5G+gVwe2OlDdPGLmxPwnun1M4YxcFmwL
 4UmXjOa+gC+pcIw5aZbT0ItVUwpCqEPysKQVOo4wWKqg2H+4CvCO2sLVlMn/wUb3KAD4
 +AcTwa43kuexI/Jms2zEs+oxNIsl/0dAIlLQ9WNC1Lsw+ibn2j60CjbOW41xI7h0bkDH
 gedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=RVJqIxPZoERjogup+I552owU+rzaIvrLTsANtoO6Mds=;
 b=HePFo4COEk7atwU61qs9sNif5+27hLtrMCITUjdAKGLRY9I7kWShDqNH2jtVH6l77D
 3IN8blS/YwsBrPCNLBdKejTuJHg9rAXIXiHmjTadT4HwhEAx71VhhQXTUqpsYvnr3wjY
 U0WQ3TfFLuLxCbGByvd7Zf/EJbn9dxgWWxGD9Q67XyZicSKQLmDVx0CyiFRBCI/4VgmP
 CPBtdnaJ/cAT/Q3iFQ/lQvCrR5ZmNbSSm1V+fy0Q/S0uSuNZ5Ihj53VJ4wCiXp5VgVTT
 UEdD+BcIn5F04RAhzX6knDSb8p6sK2M0593J9+RhUn8accWKuYqrE+ZJwE2bPuFYlBvh
 rcqw==
X-Gm-Message-State: AOAM530Nzq4gulI5Dfmufjnpd8oW/gYOKmds7rPQNfAyZa4IO+gGxkJo
 Tf3+6X0OHMf/ZqD5c+L5SoU=
X-Google-Smtp-Source: ABdhPJy5f3skt8sw4Nq05t4Kk1RXbU0cgID1IwPkxc5t88cL7AIQ1vtSSQHHla0YVDIfnclfCG3f8w==
X-Received: by 2002:a17:906:560b:: with SMTP id
 f11mr16879898ejq.264.1589875563816; 
 Tue, 19 May 2020 01:06:03 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id jp17sm1689947ejb.23.2020.05.19.01.06.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 01:06:03 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 =?UTF-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>, "'Julien Grall'" <julien@xen.org>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>, "'Wei Liu'" <wl@xen.org>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Daniel De Graaf'" <dgdegra@tycho.nsa.gov>
References: <20200519072106.26894-1-jgross@suse.com>
 <24935c43-2f2d-83cf-9039-ec0f97498103@suse.com>
 <305d829f-24a9-1a6d-2131-fed92c22c305@suse.com>
In-Reply-To: <305d829f-24a9-1a6d-2131-fed92c22c305@suse.com>
Subject: RE: [PATCH v10 00/12] Add hypervisor sysfs-like support
Date: Tue, 19 May 2020 09:06:01 +0100
Message-ID: <000f01d62db4$57181e90$05485bb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF0GzHQelLbY29QZvJSPKpxy6orIQGqCQh0Aj1ZGvypU/G18A==
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Anthony PERARD' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 19 May 2020 08:45
> To: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>; Kevin Tian =
<kevin.tian@intel.com>; Julien Grall <julien@xen.org>;
> Jun Nakajima <jun.nakajima@intel.com>; Wei Liu <wl@xen.org>; Ian =
Jackson <ian.jackson@eu.citrix.com>;
> Daniel De Graaf <dgdegra@tycho.nsa.gov>; Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Stefano Stabellini =
<sstabellini@kernel.org>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; =
Anthony PERARD
> <anthony.perard@citrix.com>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>
> Subject: Re: [PATCH v10 00/12] Add hypervisor sysfs-like support
>=20
> On 19.05.2020 09:30, J=C3=BCrgen Gro=C3=9F wrote:
> > On 19.05.20 09:20, Juergen Gross wrote:
> >>
> >> Juergen Gross (12):
> >>    xen/vmx: let opt_ept_ad always reflect the current setting
> >>    xen: add a generic way to include binary files as variables
> >>    docs: add feature document for Xen hypervisor sysfs-like support
> >>    xen: add basic hypervisor filesystem support
> >>    libs: add libxenhypfs
> >>    tools: add xenfs tool
> >>    xen: provide version information in hypfs
> >>    xen: add /buildinfo/config entry to hypervisor filesystem
> >>    xen: add runtime parameter access support to hypfs
> >>    tools/libxl: use libxenhypfs for setting xen runtime parameters
> >>    tools/libxc: remove xc_set_parameters()
> >>    xen: remove XEN_SYSCTL_set_parameter support
> >>
> >>   .gitignore                          |   6 +
> >>   docs/features/hypervisorfs.pandoc   |  92 +++++
> >>   docs/man/xenhypfs.1.pod             |  61 ++++
> >>   docs/misc/hypfs-paths.pandoc        | 165 +++++++++
> >>   tools/Rules.mk                      |   8 +-
> >>   tools/flask/policy/modules/dom0.te  |   4 +-
> >>   tools/libs/Makefile                 |   1 +
> >>   tools/libs/hypfs/Makefile           |  16 +
> >>   tools/libs/hypfs/core.c             | 536 =
++++++++++++++++++++++++++++
> >>   tools/libs/hypfs/include/xenhypfs.h |  90 +++++
> >>   tools/libs/hypfs/libxenhypfs.map    |  10 +
> >>   tools/libs/hypfs/xenhypfs.pc.in     |  10 +
> >>   tools/libxc/include/xenctrl.h       |   1 -
> >>   tools/libxc/xc_misc.c               |  21 --
> >>   tools/libxl/Makefile                |   3 +-
> >>   tools/libxl/libxl.c                 |  53 ++-
> >>   tools/libxl/libxl_internal.h        |   1 +
> >>   tools/libxl/xenlight.pc.in          |   2 +-
> >>   tools/misc/Makefile                 |   6 +
> >>   tools/misc/xenhypfs.c               | 192 ++++++++++
> >>   tools/xl/xl_misc.c                  |   1 -
> >>   xen/arch/arm/traps.c                |   3 +
> >>   xen/arch/arm/xen.lds.S              |  13 +-
> >>   xen/arch/x86/hvm/hypercall.c        |   3 +
> >>   xen/arch/x86/hvm/vmx/vmcs.c         |  47 ++-
> >>   xen/arch/x86/hvm/vmx/vmx.c          |   4 +-
> >>   xen/arch/x86/hypercall.c            |   3 +
> >>   xen/arch/x86/pv/domain.c            |  21 +-
> >>   xen/arch/x86/pv/hypercall.c         |   3 +
> >>   xen/arch/x86/xen.lds.S              |  12 +-
> >>   xen/common/Kconfig                  |  23 ++
> >>   xen/common/Makefile                 |  13 +
> >>   xen/common/grant_table.c            |  62 +++-
> >>   xen/common/hypfs.c                  | 452 +++++++++++++++++++++++
> >>   xen/common/kernel.c                 |  84 ++++-
> >>   xen/common/sysctl.c                 |  36 --
> >>   xen/drivers/char/console.c          |  72 +++-
> >>   xen/include/Makefile                |   1 +
> >>   xen/include/asm-x86/hvm/vmx/vmcs.h  |   3 +-
> >>   xen/include/public/hypfs.h          | 129 +++++++
> >>   xen/include/public/sysctl.h         |  19 +-
> >>   xen/include/public/xen.h            |   1 +
> >>   xen/include/xen/hypercall.h         |  10 +
> >>   xen/include/xen/hypfs.h             | 123 +++++++
> >>   xen/include/xen/kernel.h            |   3 +
> >>   xen/include/xen/lib.h               |   1 -
> >>   xen/include/xen/param.h             | 126 +++++--
> >>   xen/include/xlat.lst                |   2 +
> >>   xen/include/xsm/dummy.h             |   6 +
> >>   xen/include/xsm/xsm.h               |   6 +
> >>   xen/tools/binfile                   |  43 +++
> >>   xen/xsm/dummy.c                     |   1 +
> >>   xen/xsm/flask/Makefile              |   5 +-
> >>   xen/xsm/flask/flask-policy.S        |  16 -
> >>   xen/xsm/flask/hooks.c               |   9 +-
> >>   xen/xsm/flask/policy/access_vectors |   4 +-
> >>   56 files changed, 2445 insertions(+), 193 deletions(-)
> >>   create mode 100644 docs/features/hypervisorfs.pandoc
> >>   create mode 100644 docs/man/xenhypfs.1.pod
> >>   create mode 100644 docs/misc/hypfs-paths.pandoc
> >>   create mode 100644 tools/libs/hypfs/Makefile
> >>   create mode 100644 tools/libs/hypfs/core.c
> >>   create mode 100644 tools/libs/hypfs/include/xenhypfs.h
> >>   create mode 100644 tools/libs/hypfs/libxenhypfs.map
> >>   create mode 100644 tools/libs/hypfs/xenhypfs.pc.in
> >>   create mode 100644 tools/misc/xenhypfs.c
> >>   create mode 100644 xen/common/hypfs.c
> >>   create mode 100644 xen/include/public/hypfs.h
> >>   create mode 100644 xen/include/xen/hypfs.h
> >>   create mode 100755 xen/tools/binfile
> >>   delete mode 100644 xen/xsm/flask/flask-policy.S
> >>
> >
> > There are some Acks missing on this series, so please have a look at =
the
> > patches!
> >
> > There are missing especially:
> >
> > - Patch 1: VMX maintainers
> > - Patch 2 + 4: XSM maintainer
> > - Patch 4 + 9: Arm maintainer
> > - Patch 10 + 11: tools maintainers
> >
> > I'd really like the series to go into 4.14 (deadline this Friday).
>=20

I would also like to see this in 4.14.

> FTR I'm intending to waive the need for the first three of the named
> sets if they don't arrive by Friday (and there I don't mean last
> minute on Friday) - they're not overly intrusive (maybe with the
> exception of the XSM parts in #4) and the series has been pending
> for long enough. I don't feel comfortable to do so for patch 10,
> though; patch 11 looks to be simple enough again.
>=20
> Paul, as the release manager, please let me know if you disagree.
>=20

Looking at patch #4, I'm not confident that the XSM parts are complete =
(e.g. does xen.if need updating?). Also I'd put the new access vector in =
xen2, since that's where set_parameter currently is (and will be removed =
from in a later patch), but the xen class does appear to have space so =
that's really just my taste.

I agree that patch #10 really needs a tools maintainer ack but that =
patch #11 looks straightforward too so I'd be happy without one for =
that.

  Paul

> Jan



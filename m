Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE031E1CCB
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 10:01:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdUVM-0003sM-MT; Tue, 26 May 2020 08:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3u5=7I=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jdUVL-0003oj-DH
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 08:00:07 +0000
X-Inumbo-ID: e91a61d4-9f26-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e91a61d4-9f26-11ea-b07b-bc764e2007e4;
 Tue, 26 May 2020 08:00:06 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r9so2222664wmh.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2020 01:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=TDWa6IPHHqnB9ZQF5qL5hjByhVXCrB0DlhZQgkoOHis=;
 b=G5pf4Lhlyk+9taGtPaOH4JCJOD4FNZrW81g+1r86uerybaf0qWM3RPv5IyFdVUhjaD
 efiQY+sXnzuaqPwzQG2+DKfcw1+dvzI5onEkxmTuGRJWgRXZHBIpwwhOY5CDRiuLgxm3
 ms5Ek4/Og8kZgxuwHk27gN5Otmq01Rj16A9p90RufaJ8l0YMTHd//atYLZhSbR6JCNFN
 JxLYpC0e/D+dVlO5gY4JkQXsCQB4m2TSADiq3kaeUst5rw94Rxj+CVoBZsgIXIJIjeFI
 CBXW5+IQJrcj+4YZIUcHzh3eaQv9X0Cur9TaGjQLK5YrFP6kNfU9oiGbQBw6EH99rYSn
 3AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=TDWa6IPHHqnB9ZQF5qL5hjByhVXCrB0DlhZQgkoOHis=;
 b=megSxEtBkmUrSZBW1AG4hdUPVF9Mbw6/YKKjxFoQWPoHtglqyeMz66NwbCBWERRHFp
 DLr81f66FYcOl/LveyKlWIVOREFX4uMqXWzwbamIHRX5EEvNqMmY7yvwkr45QBD++dta
 u1BwyBVwQpMbp/RpYr2xzXzsFzgjL92I6wqWrTk7iNgjntUvegk5UQhNRAs1M6hcI3jV
 /0Aa4hpAU+3I7ucOyfx768tdmQj3FgD/hpYqmFDIJZ9J9MPOxZ5ZW7qv3Ewzf9O3QEIq
 jOfhkcb1tNm0YP/cUzg1DcFNTth4gs+u3oOc2RXf05h7VedlRhBDwUIt+BBgvhoNgvai
 JVcw==
X-Gm-Message-State: AOAM531JWotTlrjRlbTbdjiG1LJ7f2+4bxuPHHeKKBvuqTbC8Nrvz4fO
 VcDhY730syq6e30aWNR3eV8=
X-Google-Smtp-Source: ABdhPJzsDZXsRo/kd8VsDXHDUrHrCjoVuergmA7ZHKA5tamSZnVsbmqBQ7elSHnv+QW+wALrk9Py7w==
X-Received: by 2002:a1c:4405:: with SMTP id r5mr219103wma.72.1590480005225;
 Tue, 26 May 2020 01:00:05 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id d15sm11994980wrq.30.2020.05.26.01.00.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 01:00:04 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Jan Beulich'" <jbeulich@suse.com>, "'Kevin Tian'" <kevin.tian@intel.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>, "'Wei Liu'" <wl@xen.org>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Daniel De Graaf'" <dgdegra@tycho.nsa.gov>
References: <20200519072106.26894-1-jgross@suse.com>
 <24935c43-2f2d-83cf-9039-ec0f97498103@suse.com>
 <305d829f-24a9-1a6d-2131-fed92c22c305@suse.com>
 <000f01d62db4$57181e90$05485bb0$@xen.org>
 <fc55f4dc-c802-2153-cd6a-736a29e8a396@suse.com>
In-Reply-To: <fc55f4dc-c802-2153-cd6a-736a29e8a396@suse.com>
Subject: RE: [PATCH v10 00/12] Add hypervisor sysfs-like support
Date: Tue, 26 May 2020 09:00:02 +0100
Message-ID: <003f01d63333$aa399f20$feacdd60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF0GzHQelLbY29QZvJSPKpxy6orIQGqCQh0Aj1ZGvwCHmdLiQIdeZWcqT0U8tA=
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
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 25 May 2020 08:02
> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>; 'Kevin Tian' =
<kevin.tian@intel.com>; 'Julien
> Grall' <julien@xen.org>; 'Jun Nakajima' <jun.nakajima@intel.com>; 'Wei =
Liu' <wl@xen.org>; 'Ian
> Jackson' <ian.jackson@eu.citrix.com>; 'Daniel De Graaf' =
<dgdegra@tycho.nsa.gov>
> Cc: 'Stefano Stabellini' <sstabellini@kernel.org>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>;
> 'George Dunlap' <george.dunlap@citrix.com>; 'Anthony PERARD' =
<anthony.perard@citrix.com>; xen-
> devel@lists.xenproject.org; 'Volodymyr Babchuk' =
<Volodymyr_Babchuk@epam.com>; 'Roger Pau Monn=C3=A9'
> <roger.pau@citrix.com>
> Subject: Re: [PATCH v10 00/12] Add hypervisor sysfs-like support
>=20
> On 19.05.20 10:06, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 19 May 2020 08:45
> >> To: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>; Kevin Tian =
<kevin.tian@intel.com>; Julien Grall
> <julien@xen.org>;
> >> Jun Nakajima <jun.nakajima@intel.com>; Wei Liu <wl@xen.org>; Ian =
Jackson
> <ian.jackson@eu.citrix.com>;
> >> Daniel De Graaf <dgdegra@tycho.nsa.gov>; Paul Durrant =
<paul@xen.org>
> >> Cc: xen-devel@lists.xenproject.org; Stefano Stabellini =
<sstabellini@kernel.org>; Andrew Cooper
> >> <andrew.cooper3@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Anthony PERARD
> >> <anthony.perard@citrix.com>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Roger Pau Monn=C3=A9
> >> <roger.pau@citrix.com>
> >> Subject: Re: [PATCH v10 00/12] Add hypervisor sysfs-like support
> >>
> >> On 19.05.2020 09:30, J=C3=BCrgen Gro=C3=9F wrote:
> >>> On 19.05.20 09:20, Juergen Gross wrote:
> >>>>
> >>>> Juergen Gross (12):
> >>>>     xen/vmx: let opt_ept_ad always reflect the current setting
> >>>>     xen: add a generic way to include binary files as variables
> >>>>     docs: add feature document for Xen hypervisor sysfs-like =
support
> >>>>     xen: add basic hypervisor filesystem support
> >>>>     libs: add libxenhypfs
> >>>>     tools: add xenfs tool
> >>>>     xen: provide version information in hypfs
> >>>>     xen: add /buildinfo/config entry to hypervisor filesystem
> >>>>     xen: add runtime parameter access support to hypfs
> >>>>     tools/libxl: use libxenhypfs for setting xen runtime =
parameters
> >>>>     tools/libxc: remove xc_set_parameters()
> >>>>     xen: remove XEN_SYSCTL_set_parameter support
> >>>>
> >>>>    .gitignore                          |   6 +
> >>>>    docs/features/hypervisorfs.pandoc   |  92 +++++
> >>>>    docs/man/xenhypfs.1.pod             |  61 ++++
> >>>>    docs/misc/hypfs-paths.pandoc        | 165 +++++++++
> >>>>    tools/Rules.mk                      |   8 +-
> >>>>    tools/flask/policy/modules/dom0.te  |   4 +-
> >>>>    tools/libs/Makefile                 |   1 +
> >>>>    tools/libs/hypfs/Makefile           |  16 +
> >>>>    tools/libs/hypfs/core.c             | 536 =
++++++++++++++++++++++++++++
> >>>>    tools/libs/hypfs/include/xenhypfs.h |  90 +++++
> >>>>    tools/libs/hypfs/libxenhypfs.map    |  10 +
> >>>>    tools/libs/hypfs/xenhypfs.pc.in     |  10 +
> >>>>    tools/libxc/include/xenctrl.h       |   1 -
> >>>>    tools/libxc/xc_misc.c               |  21 --
> >>>>    tools/libxl/Makefile                |   3 +-
> >>>>    tools/libxl/libxl.c                 |  53 ++-
> >>>>    tools/libxl/libxl_internal.h        |   1 +
> >>>>    tools/libxl/xenlight.pc.in          |   2 +-
> >>>>    tools/misc/Makefile                 |   6 +
> >>>>    tools/misc/xenhypfs.c               | 192 ++++++++++
> >>>>    tools/xl/xl_misc.c                  |   1 -
> >>>>    xen/arch/arm/traps.c                |   3 +
> >>>>    xen/arch/arm/xen.lds.S              |  13 +-
> >>>>    xen/arch/x86/hvm/hypercall.c        |   3 +
> >>>>    xen/arch/x86/hvm/vmx/vmcs.c         |  47 ++-
> >>>>    xen/arch/x86/hvm/vmx/vmx.c          |   4 +-
> >>>>    xen/arch/x86/hypercall.c            |   3 +
> >>>>    xen/arch/x86/pv/domain.c            |  21 +-
> >>>>    xen/arch/x86/pv/hypercall.c         |   3 +
> >>>>    xen/arch/x86/xen.lds.S              |  12 +-
> >>>>    xen/common/Kconfig                  |  23 ++
> >>>>    xen/common/Makefile                 |  13 +
> >>>>    xen/common/grant_table.c            |  62 +++-
> >>>>    xen/common/hypfs.c                  | 452 =
+++++++++++++++++++++++
> >>>>    xen/common/kernel.c                 |  84 ++++-
> >>>>    xen/common/sysctl.c                 |  36 --
> >>>>    xen/drivers/char/console.c          |  72 +++-
> >>>>    xen/include/Makefile                |   1 +
> >>>>    xen/include/asm-x86/hvm/vmx/vmcs.h  |   3 +-
> >>>>    xen/include/public/hypfs.h          | 129 +++++++
> >>>>    xen/include/public/sysctl.h         |  19 +-
> >>>>    xen/include/public/xen.h            |   1 +
> >>>>    xen/include/xen/hypercall.h         |  10 +
> >>>>    xen/include/xen/hypfs.h             | 123 +++++++
> >>>>    xen/include/xen/kernel.h            |   3 +
> >>>>    xen/include/xen/lib.h               |   1 -
> >>>>    xen/include/xen/param.h             | 126 +++++--
> >>>>    xen/include/xlat.lst                |   2 +
> >>>>    xen/include/xsm/dummy.h             |   6 +
> >>>>    xen/include/xsm/xsm.h               |   6 +
> >>>>    xen/tools/binfile                   |  43 +++
> >>>>    xen/xsm/dummy.c                     |   1 +
> >>>>    xen/xsm/flask/Makefile              |   5 +-
> >>>>    xen/xsm/flask/flask-policy.S        |  16 -
> >>>>    xen/xsm/flask/hooks.c               |   9 +-
> >>>>    xen/xsm/flask/policy/access_vectors |   4 +-
> >>>>    56 files changed, 2445 insertions(+), 193 deletions(-)
> >>>>    create mode 100644 docs/features/hypervisorfs.pandoc
> >>>>    create mode 100644 docs/man/xenhypfs.1.pod
> >>>>    create mode 100644 docs/misc/hypfs-paths.pandoc
> >>>>    create mode 100644 tools/libs/hypfs/Makefile
> >>>>    create mode 100644 tools/libs/hypfs/core.c
> >>>>    create mode 100644 tools/libs/hypfs/include/xenhypfs.h
> >>>>    create mode 100644 tools/libs/hypfs/libxenhypfs.map
> >>>>    create mode 100644 tools/libs/hypfs/xenhypfs.pc.in
> >>>>    create mode 100644 tools/misc/xenhypfs.c
> >>>>    create mode 100644 xen/common/hypfs.c
> >>>>    create mode 100644 xen/include/public/hypfs.h
> >>>>    create mode 100644 xen/include/xen/hypfs.h
> >>>>    create mode 100755 xen/tools/binfile
> >>>>    delete mode 100644 xen/xsm/flask/flask-policy.S
> >>>>
> >>>
> >>> There are some Acks missing on this series, so please have a look =
at the
> >>> patches!
> >>>
> >>> There are missing especially:
> >>>
> >>> - Patch 1: VMX maintainers
> >>> - Patch 2 + 4: XSM maintainer
> >>> - Patch 4 + 9: Arm maintainer
> >>> - Patch 10 + 11: tools maintainers
> >>>
> >>> I'd really like the series to go into 4.14 (deadline this Friday).
> >>
> >
> > I would also like to see this in 4.14.
> >
> >> FTR I'm intending to waive the need for the first three of the =
named
> >> sets if they don't arrive by Friday (and there I don't mean last
> >> minute on Friday) - they're not overly intrusive (maybe with the
> >> exception of the XSM parts in #4) and the series has been pending
> >> for long enough. I don't feel comfortable to do so for patch 10,
> >> though; patch 11 looks to be simple enough again.
> >>
> >> Paul, as the release manager, please let me know if you disagree.
> >>
> >
> > Looking at patch #4, I'm not confident that the XSM parts are =
complete (e.g. does xen.if need
> updating?). Also I'd put the new access vector in xen2, since that's =
where set_parameter currently is
> (and will be removed from in a later patch), but the xen class does =
appear to have space so that's
> really just my taste.
>=20
> I don't think xen.if needs updating, as it contains only macros for
> groups of operations.
>=20

Ok.

> As the new hypercall isn't only replacing set_parameter, but has much
> wider semantics, I don't think it should go to xen2. There will be
> probably more interfaces being replaced and/or added after all.
>=20

If you're happy with it then, in the absence of a response from Daniel, =
then I think patch #4 can go in. Patch #10 and #11 have acks now, so it =
looks like the series is good to go. Could you send a patch for =
CHANGELOG.md as I think we'd consider this a significant feature :-)

  Paul


>=20
> Juergen



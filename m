Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B09927D2BD
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.277.725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHZV-0000hy-PX; Tue, 29 Sep 2020 15:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277.725; Tue, 29 Sep 2020 15:29:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHZV-0000hX-Lg; Tue, 29 Sep 2020 15:29:41 +0000
Received: by outflank-mailman (input) for mailman id 277;
 Tue, 29 Sep 2020 15:29:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SVYV=DG=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kNHZU-0000hK-Cl
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:29:40 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bb5f238-9bae-448d-ab5a-950852819158;
 Tue, 29 Sep 2020 15:29:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z4so5915970wrr.4
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 08:29:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d18sm6246650wrm.10.2020.09.29.08.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 08:29:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3DBE1FF7E;
 Tue, 29 Sep 2020 16:29:36 +0100 (BST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SVYV=DG=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kNHZU-0000hK-Cl
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:29:40 +0000
X-Inumbo-ID: 7bb5f238-9bae-448d-ab5a-950852819158
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7bb5f238-9bae-448d-ab5a-950852819158;
	Tue, 29 Sep 2020 15:29:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z4so5915970wrr.4
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=pTsNpgihnRMCovbJSnTper6xoQznsGjH9xoiBM8Tcqo=;
        b=CVkf1jAOILAX6/IlPxm+boOjhY4iQQjAlyOr3bV2vkHeaoIrxHj7dawu9MX9MMxZ36
         hXx4aiTwiXaZnpD3vCPONeBSyZf69P9gQcpfGe4udy/dryUtIVRXR/+Vrw8AqkTLHk6o
         zzJ0v6hNRiGqWyzBuIWswj1z5ho4D11EGYtmat1qTi1yvWxEAnJ6eS5VBcR9Czs+lpLe
         4joKekTHb+iyyHUCKix1Gf0naKOFZ4qOMptG7oYel+5aBGaI7ASjnel3ZaMVCWXrmnY8
         8v5JlROQ2IhNV+4B6TLogd6p7d9lv+pfJLQBXlVhOyLApY630Kwc8M9XTSWH3QTXsquR
         XZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=pTsNpgihnRMCovbJSnTper6xoQznsGjH9xoiBM8Tcqo=;
        b=tmIgPCv4z3odco7fICSaSWUHYaU0ysCfOodvyj4VQTWaZJb2x8f6gMgHfrFqHOIJEE
         7fk+Fmkhg8zVapu9YnD6vRvyYJj1y9C8KMyudN1ESwpizbW7kAUtH6D8igvaDwDZD3Bu
         WoFaqKwMIJs4+YumgwW9mtyuKhVI2kiAP4ob0BQrB2mXcuMH+Q1Pl4wzKD/YZ0hiz7GG
         BR2Y4Q5b1SxYnPPiBIgNGEzVKE8l/l627cS2Y8HW3sUqihQFXvnBCeAKsonv7QJUoXWY
         UjDXwA7NyTfqIGAxBWYTVvChSgwdtuCVt990R3GUPsnqhuXbLfbCX+olMD4ahaH9tBOE
         Ucqg==
X-Gm-Message-State: AOAM5332LcVWELxfLNm8DXM2z7WnPqO0Igmx9mDN+jLlqud/+nbkBRS4
	tULGPhgj/oYlFFQQUkx/7H1f3Q==
X-Google-Smtp-Source: ABdhPJyLC4f+tm8V0GdodPHt6l2L14o18XSVN4GfaaeRMZTPOpEVVEn1lRd6QbCu1O0CBUcMcLe5cg==
X-Received: by 2002:adf:de11:: with SMTP id b17mr4962703wrm.82.1601393378697;
        Tue, 29 Sep 2020 08:29:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d18sm6246650wrm.10.2020.09.29.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 08:29:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E3DBE1FF7E;
	Tue, 29 Sep 2020 16:29:36 +0100 (BST)
References: <20200926205542.9261-1-julien@xen.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, masami.hiramatsu@linaro.org,
 ehem+xen@m5p.com, bertrand.marquis@arm.com, andre.przywara@arm.com, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>, Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
In-reply-to: <20200926205542.9261-1-julien@xen.org>
Date: Tue, 29 Sep 2020 16:29:36 +0100
Message-ID: <87k0wcppnj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Julien Grall <julien@xen.org> writes:

> From: Julien Grall <jgrall@amazon.com>
>
> Hi all,
>
> Xen on ARM has been broken for quite a while on ACPI systems. This
> series aims to fix it.
>
> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
> to only support 5.1). So I did only some light testing.

I was hoping to get more diagnostics out to get it working under QEMU
TCG so I think must of missed a step:

  Loading Xen 4.15-unstable ...
  Loading Linux 4.19.0-11-arm64 ...
  Loading initial ramdisk ...
  Using modules provided by bootloader in FDT
  Xen 4.15-unstable (c/s Sat Sep 26 21:55:42 2020 +0100 git:72f3d495d0) EFI=
 loader
  ...silence...

I have a grub installed from testing on a buster base:

  dpkg --status grub-arm64-efi
  Version: 2.04-8

With:

  GRUB_CMDLINE_LINUX_DEFAULT=3D""
  GRUB_CMDLINE_LINUX=3D"console=3DttyAMA0"
  GRUB_CMDLINE_LINUX_XEN_REPLACE=3D"console=3Dhvc0 earlyprintk=3Dxen"
  GRUB_CMDLINE_XEN=3D"loglvl=3Dall guest_loglvl=3Dall com1=3D115200,8n1,0x3=
e8,5console=3Dcom1,vg"

And I built Xen with --enable-systemd and tweaked the hypervisor .config:

  CONFIG_EXPERT=3Dy
  CONFIG_ACPI=3Dy

So any pointers to make it more verbose would be helpful.

>
> I have only build tested the x86 side so far.
>
> Cheers,
>
> *** BLURB HERE ***
>
> Julien Grall (4):
>   xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()
>   xen/arm: acpi: The fixmap area should always be cleared during
>     failure/unmap
>   xen/arm: Check if the platform is not using ACPI before initializing
>     Dom0less
>   xen/arm: Introduce fw_unreserved_regions() and use it
>
>  xen/arch/arm/acpi/lib.c     | 79 ++++++++++++++++++++++++++++++-------
>  xen/arch/arm/kernel.c       |  2 +-
>  xen/arch/arm/setup.c        | 25 +++++++++---
>  xen/arch/x86/acpi/lib.c     | 18 +++++++++
>  xen/drivers/acpi/osl.c      | 34 ++++++++--------
>  xen/include/asm-arm/setup.h |  2 +-
>  xen/include/xen/acpi.h      |  1 +
>  7 files changed, 123 insertions(+), 38 deletions(-)


--=20
Alex Benn=C3=A9e


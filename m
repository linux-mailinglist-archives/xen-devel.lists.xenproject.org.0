Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7640948CE3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 12:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772761.1183217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHYF-0000Zz-F8; Tue, 06 Aug 2024 10:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772761.1183217; Tue, 06 Aug 2024 10:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHYF-0000XX-Bx; Tue, 06 Aug 2024 10:36:23 +0000
Received: by outflank-mailman (input) for mailman id 772761;
 Tue, 06 Aug 2024 10:36:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbHYE-0000EE-Eb
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 10:36:22 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8e6961e-53df-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 12:36:21 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7a8553db90so56561466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 03:36:21 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec7311sm533015466b.195.2024.08.06.03.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 03:36:20 -0700 (PDT)
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
X-Inumbo-ID: b8e6961e-53df-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722940581; x=1723545381; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b65N4SwtDbsKX9JuFYOfFusoXPOaVsNL5Pih+isLvVk=;
        b=Q/SMrv6lnNtK8DRS9t/oXsFt22T0nTSOXQnA01l5cKKy7XGNPyQ8OZJpT16FoWtTwl
         a+YPjIbxtAmgacNdT2ojoMKAhxUSZYNxi6iGKfrTvRpboXxV1EGBy4sagZR/MnE78H8+
         BArHXWaWZMZ0Jy8i1ZWRf8TCwx1+su41Fo+6ZCkkZQC3tGPITB1c5fQMb59DeXqr3RDF
         QpFMr7vsXf5iigeZhTzloDOso4vewvpY3c6yBT3HAiAJkPOF5cfuN5YiONCkBh6Ssu9q
         40xMBUvL9CwBBvQpTpZqkE/lZcYDUzZdbQKs+SREnS1/W5Ga9wccuKry1XJQarAGAJe6
         jvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722940581; x=1723545381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b65N4SwtDbsKX9JuFYOfFusoXPOaVsNL5Pih+isLvVk=;
        b=PktYYexLL/kiabTP2lU1M40+6IlzYCqQWCKrNuA1viudQSJ8yEvgSzPgY9zvEPjzHd
         ReXwYgxMIQ52sOM4wEXWtn6+7udSbWoovzCY1jlr+cPVBXSXWFxXlL3OROgkoZEw3s00
         qrkDYZier6RjTSzUtXC5BKuEQE4gbZu+SsvdxWGZEIydHEWOau9lUjos3dSW8ftMjNbA
         WGtnhaGrKGe90nqxNsDlqTtWl/ULx+eH50RoPemRztCrEfkOZlaR9HFp4q4dn8234vdi
         i46rXOzNJOwsDr6rEHFd5HKiSTk5LGMSnJc/5sj6hq5QhVY5Hz7IPUXVKyqqRLkI7nAy
         ByiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpCcoEjUC6PqQMP7fZFZ1eE2Fxc0FBbsx9FAvZfQl435VoH+KxWQu2snyFcRIXNoY2zKfp6nM1seNg778tkLm/dDucXUqfcU/Rf62ldho=
X-Gm-Message-State: AOJu0YzQZGhEA7U+/diz5ibPo+3f+QPGB8jCkebGVywl3flSLJE2ukEZ
	ZIOf9uBF+UESbpIua2O7D1hR1qE/3E/B4PyVDv6a6PZBPk2PkrV5
X-Google-Smtp-Source: AGHT+IHhVUvRdvh6GIdZKWOUaEkS54ePKbyCOfxydERmzjE/cplIqu9dg+l3U3uE5+t+DPRbkl+t/g==
X-Received: by 2002:a17:907:c00f:b0:a7d:e956:ad51 with SMTP id a640c23a62f3a-a7de956af6dmr588806466b.21.1722940580875;
        Tue, 06 Aug 2024 03:36:20 -0700 (PDT)
Message-ID: <0bf58f6598a7a60b700a7526b3abb3f1e5ea6ecd.camel@gmail.com>
Subject: Re: [PATCH v8 1/2] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, Julien Grall <jgrall@amazon.com>, 
 xen-devel@lists.xenproject.org
Date: Tue, 06 Aug 2024 12:36:19 +0200
In-Reply-To: <0fdfb454-62a4-4d68-9eaa-a5ce7b82f0a2@suse.com>
References: <cover.1722856894.git.oleksii.kurochko@gmail.com>
	 <712aebb98a689b248f29e783eb8e72a5e7568e5b.1722856894.git.oleksii.kurochko@gmail.com>
	 <0fdfb454-62a4-4d68-9eaa-a5ce7b82f0a2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-08-05 at 13:58 +0200, Jan Beulich wrote:
> On 05.08.2024 13:33, Oleksii Kurochko wrote:
> > From: Shawn Anastasio <sanastasio@raptorengineering.com>
> >=20
> > Arm's setup.c contains a collection of functions for parsing memory
> > map
> > and other boot information from a device tree. Since these routines
> > are
> > generally useful on any architecture that supports device tree
> > booting,
> > move them into xen/common/device-tree.
> >=20
> > Also, common/device_tree.c has been moved to the device-tree folder
> > with
> > the corresponding updates to common/Makefile and common/device-
> > tree/Makefile.
> >=20
> > Mentioning of arm32 is changed to CONFIG_SEPARATE_XENHEAP in
> > comparison with
> > original ARM's code as now it is moved in common code.
> >=20
> > Suggested-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Julien Grall <jgrall@amazon.com>
> > ---
> > Changes in V8:
> > =C2=A0- add the version of Xen from which bootinfo.c was derived from.
> > =C2=A0- update the commit message.
> > =C2=A0- add Acked-by: Julien Grall <jgrall@amazon.com>.
> > ---
> > Changes in V7:
> > =C2=A0- move obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device-tree/ to proper
> > place in common/Makefile.
> > =C2=A0- rename macros __XEN_BOOTFDT_H__ to XEN_BOOTFDT_H to not violate
> > MISRA rule 21.1.
> > =C2=A0- drop definition of "#define MAX_FDT_SIZE SZ_2M" in xen/bootfdt.=
h
> > as it is expected to
> > =C2=A0=C2=A0 be arch-specific. Back "#define MAX_FDT_SIZE SZ_2M" to
> > arm/setup.h where it was before
> > =C2=A0=C2=A0 these changes.
> > =C2=A0- git mv xen/common/device_tree.c xen/common/device-tree/ and
> > update correspondingly
> > =C2=A0=C2=A0 Makefiles of common/ and common/device-tree
> > =C2=A0- update the commit message
> > ---
> > Changes in V6:
> > =C2=A0- update the version of the patch to v6.=C2=A0=C2=A0=20
> > ---
> > Changes in V5:
> > =C2=A0- After rebase the Shawn's patch v4 on top of current staging the
> > following
> > =C2=A0=C2=A0 was done:
> > =C2=A0=C2=A0 - add xen/include/xen/bootfdt.h to MAINTAINERS file.
> > =C2=A0=C2=A0 - drop message "Early device tree parsing and".
> > =C2=A0=C2=A0 - After rebase on top of the current staging the following
> > changes were done:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - init bootinfo variable in <common/device-tre=
e/bootinfo.c>
> > with BOOTINFO_INIT;
> > =C2=A0=C2=A0=C2=A0=C2=A0 - update the code of dt_unreserved_regions():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM rela=
ted changes and getting of
> > reserved_mem
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem()
> > =C2=A0=C2=A0=C2=A0=C2=A0 - update the code of meminfo_overlap_check():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add check ( INVALID_PA=
DDR =3D=3D bank_start ) to if case.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - update the code of check_reserved_regions_ov=
erlap():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM rela=
ted changes.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - struct bootinfo was updated ( CONFIG_STATIC_=
SHM changes )
> > =C2=A0=C2=A0=C2=A0=C2=A0 - add shared_meminfo ( because of CONFIG_STATI=
C_SHM )
> > =C2=A0=C2=A0=C2=A0=C2=A0 - struct struct membanks was update with __str=
uct group so
> > <xen/kernel> is
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 neeeded to be included in bootfdt.=
h
> > =C2=A0=C2=A0=C2=A0=C2=A0 - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT=
, BOOTINFO_INIT
> > to generic bootfdt.h
> > =C2=A0=C2=A0=C2=A0=C2=A0 - bootinfo_get_reserved_mem(), bootinfo_get_me=
m(),
> > bootinfo_get_acpi(),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem() and bootinfo_=
get_shmem_extra() were
> > moved to xen/bootfdt.h
> > =C2=A0=C2=A0 - s/arm32/CONFIG_SEPARATE_XENHEAP/
> > =C2=A0=C2=A0 - add inclusion of <xen/macros.h> because there are functi=
on in
> > <xen/bootfdt.h> which
> > =C2=A0=C2=A0=C2=A0=C2=A0 are using container_of().
> > =C2=A0---
> > Changes in v4:
> > =C2=A0 - create new xen/include/bootinfo.h rather than relying on arch'=
s
> > =C2=A0=C2=A0=C2=A0 asm/setup.h to provide required definitions for boot=
info.c
> > =C2=A0 - build bootinfo.c as .init.o
> > =C2=A0 - clean up and sort bootinfo.c's #includes
> > =C2=A0 - use CONFIG_SEPARATE_XENHEAP rather than CONFIG_ARM_32 to guard
> > =C2=A0=C2=A0=C2=A0 xenheap-specific behavior of populate_boot_allocator
> > =C2=A0 - (MAINTAINERS) include all of common/device-tree rather than
> > just
> > =C2=A0=C2=A0=C2=A0 bootinfo.c
> > ---
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
> > =C2=A0xen/arch/arm/include/asm/setup.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
185 +--
> > =C2=A0xen/arch/arm/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 432 -----
> > =C2=A0xen/common/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 2 +-
> > =C2=A0xen/common/device-tree/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 2 +
> > =C2=A0xen/common/device-tree/bootinfo.c=C2=A0=C2=A0=C2=A0 |=C2=A0 459 +=
+++++
> > =C2=A0xen/common/device-tree/device_tree.c | 2253
> > ++++++++++++++++++++++++++
> > =C2=A0xen/common/device_tree.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2253 ----------------------
> > ----
> > =C2=A0xen/include/xen/bootfdt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 195 +++
> > =C2=A09 files changed, 2913 insertions(+), 2870 deletions(-)
> > =C2=A0create mode 100644 xen/common/device-tree/Makefile
> > =C2=A0create mode 100644 xen/common/device-tree/bootinfo.c
> > =C2=A0create mode 100644 xen/common/device-tree/device_tree.c
>=20
> Can the moved file please be in sync with its directory, naming (i.e.
> dash
> vs underscore) wise? I also expect the diff would be quite a bit
> smaller
> with git's rename detection properly enabled.
Sure, I will sent new patch series version soon. Thanks.

~ Oleksii


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF5ACC996
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004557.1384280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxe-00063D-8A; Tue, 03 Jun 2025 14:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004557.1384280; Tue, 03 Jun 2025 14:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxe-00060v-57; Tue, 03 Jun 2025 14:49:54 +0000
Received: by outflank-mailman (input) for mailman id 1004557;
 Tue, 03 Jun 2025 14:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WdC=YS=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uMSxc-00060n-S0
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:49:52 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01383e0b-408a-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 16:49:51 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso7319113e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:49:51 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379377e9sm1929345e87.237.2025.06.03.07.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:49:50 -0700 (PDT)
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
X-Inumbo-ID: 01383e0b-408a-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748962191; x=1749566991; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpzZLJFihudQ2+Wn0CdDPOwa86hjlKd/fcpwnlnFWEM=;
        b=TXIh1uMLtmcwMuIwFpxu0i1wZI+5qFbKFZLcOxrhAbJ1vZsm0EMEjz1uKGnKIMt9gH
         lwpYVTG0hdBDmnjVviVF5annYpVsDZOC7jx1eXvT9SDp+ezQE5sJHqK93XZrpmSbtLYI
         j0yoPTYpUXjLSihxJhlUEW0gnm5gY5qjGTDTBjlrE/qV/l1tPFRcdcmKGlJVSbnZOaI2
         1trKZnrFRDFgKT+kovJ2vsRrD7sM7NBpRKCkIYX6UDhj2LbA6NGioeIk6DUbunmMeZJ1
         gY2lcPGq7n9gPYgaaBKioxUQAgf0CjGCUllKRkcDd9P9CUKJRvouPX2EObGr9IKxcurL
         A5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962191; x=1749566991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpzZLJFihudQ2+Wn0CdDPOwa86hjlKd/fcpwnlnFWEM=;
        b=bc3guTaHSRMvcF4BNk+ThcPErn05Dgp27jabp1a4lget3CSUBXoOq9y8qXlxhGn6tr
         iCDbRVvb+p5sgfs3ibizoUEWenYtRwgtqEZwDZHv9GV+XZdL1AKumT97Ht4PHjd15NU1
         YrgUQa/oLxbGnNEsyJdYf5HtkhK74B9gR/LneTsr/A6qQsww4nwxW5G4ieJJm6mRVBwy
         mrJAaDgpmDpjOJc0e5Y+b8hIH4pcAaRKphrZ9oiAev2P7aec3PouDYOPirQbRfAnM0RL
         vEb3Ne5+s6Aky/uNrbOL7kxqMXTjK22LoMGKK71MisvLVX1wDpC4SPzOuT8pQM38beUl
         edMw==
X-Gm-Message-State: AOJu0YxIsgNNdBRIoFFdCPHnElSPCY/N7NUG499QvigGuJfmI3Knbja0
	HYHYRexCG99fhb2B5uNR7Ow8i8eLEIYRitpHOVo2dTrc21BZyouhj52o3gDg2RWosT8=
X-Gm-Gg: ASbGncv+ZRzESerW3Q3SNE5zLY9U/Sh+WVHfi4YXay/OuEQrjAuR5ryLg0Th2af2zWu
	uTPSx5KMOKLKb+mryrjo90epTuAtmB7DGHfTPOghA1rmYwU/lkUZT12+JUGm81SHFWMzmI9fiNF
	atqgvj8ApzPL2A3c1Jcd1SssxQfN8CQ0IyjSOL1S3pfScn3sQvmwoVrs4f5axsy+yD5Oh9Z+VC8
	gmpYFPz78cTD4lgbzhw+u9dgtrCPc4AL8PvuCGLe6I2VfbVu2d0MmHfjqEsD0t5nRHcGw6cwCz6
	o4xDe/HH9M2b/eppAvLW4TjuGA7x6GUnUZ4sXQ1saeQyYhRh5aXoeChWV87gBImKPncZGmxbDAU
	GXwjLIv0yWw1+FCoq7qsvCcA=
X-Google-Smtp-Source: AGHT+IEXJGpaihCNW2i6cfKQ6awfzdXIAoGFzBTNVZs5piGQCGWS92dGKRESDo9Ku3cRWYNDlf3A2g==
X-Received: by 2002:a05:6512:104a:b0:553:26a7:70e0 with SMTP id 2adb3069b0e04-5533b92e3e4mr6071646e87.43.1748962190753;
        Tue, 03 Jun 2025 07:49:50 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v4 0/5] xen/arm: Add option to optionally disable trapping on unmapped acceses
Date: Tue,  3 Jun 2025 16:49:43 +0200
Message-ID: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This follows up on the virtio-pci discussion and adds a per-domain
option to select the behaviour of accesses to unmapped address ranges.
The new option is trap_unmapped_accesses, it's general but for now
only implemented for ARM.

I'm happy with any name, so if you have better ideas please suggest them!

I've included regenerated golang bindings as a separate patch.

Thanks,
Edgar

ChangeLog:

v3 -> v4:
* Reject in x86 arch_sanitise_domain_config
* Add LIBXL_HAVE_TRAP_UNMAPPED_ACCESSES
* Remove "..is only implemented for ARM" from Arm specific documentation
* ARM -> Arm

v2 -> v3:
* Reword descriptions to clarify reads of all bits as ones
* Use GENMASK as GENMASK_ULL not needed
* Style fix in if/else
* Regenerate golang bindings
* Update ocaml bindings

v1 -> v2:
* Rename trap_unmapped_mmio to trap_unmapped_accesses
* Generalize to allow other archs to later support this option
* Change dom0less DT binding from boolean to integer
* Remove changes to autogenerated go bindings


Edgar E. Iglesias (5):
  xen/arm: Add way to disable traps on accesses to unmapped addresses
  xen/arm: dom0less: Add trap-unmapped-accesses
  tools/arm: Add the trap_unmapped_accesses xl config option
  tools/ocaml: Update bindings for CDF_TRAP_UNMAPPED_ACCESSES
  tools/golang: Regenerate bindings for trap_unmapped_accesses

 docs/man/xl.cfg.5.pod.in              |  9 +++++++
 docs/misc/arm/device-tree/booting.txt | 10 ++++++++
 tools/golang/xenlight/helpers.gen.go  |  6 +++++
 tools/golang/xenlight/types.gen.go    |  1 +
 tools/include/libxl.h                 |  7 +++++
 tools/libs/light/libxl_arm.c          |  3 +++
 tools/libs/light/libxl_create.c       |  3 +++
 tools/libs/light/libxl_types.idl      |  1 +
 tools/libs/light/libxl_x86.c          |  6 +++++
 tools/ocaml/libs/xc/xenctrl.ml        |  1 +
 tools/ocaml/libs/xc/xenctrl.mli       |  1 +
 tools/xl/xl_parse.c                   |  3 +++
 xen/arch/arm/dom0less-build.c         | 10 ++++++++
 xen/arch/arm/domain.c                 |  3 ++-
 xen/arch/arm/domain_build.c           |  3 ++-
 xen/arch/arm/io.c                     | 37 +++++++++++++++++++++++++--
 xen/arch/x86/domain.c                 |  7 +++++
 xen/common/domain.c                   |  3 ++-
 xen/include/public/domctl.h           |  4 ++-
 19 files changed, 112 insertions(+), 6 deletions(-)

-- 
2.43.0



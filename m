Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6376AC9082
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001145.1381365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05L-00042Z-CH; Fri, 30 May 2025 13:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001145.1381365; Fri, 30 May 2025 13:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05L-0003xe-6N; Fri, 30 May 2025 13:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1001145;
 Fri, 30 May 2025 13:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LO9=YO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uL05J-0003C4-Ps
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:47:45 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7e9374f-3d5c-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:47:41 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-55324e35f49so2510636e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 06:47:41 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cd9dsm706190e87.172.2025.05.30.06.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 06:47:39 -0700 (PDT)
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
X-Inumbo-ID: a7e9374f-3d5c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748612860; x=1749217660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cQ33hGWLZLWP4KAff3z9IviW+6yw08j6ihjaF/OCFuM=;
        b=D8zrcIEkYBOLedg4ORRREf0GXdoIIp6CIA1ZGkHEmshTBdEmpycKLR1Jj2cWnuHofm
         f9MLBAiTDbVGXVQOV+6adBvvXSXS5G8+9bnrbLrF+jbeFYT1xd/xVpfnKs0a1NdO/3uH
         8TTpOLgO85ut4gcF6xVJsGSzqWUPBj47yBSF/gh7tURxW1mtgK+rxz62aaFQ2gjExIKe
         SN+QFX1xLBrYhTFp52+cIktioMf+b7/cd/uIkNR+FKKPzPRIumGfHhK3vV2rFL5h07cB
         r++6wbVIAHpDEPUX6gJz2apptZcWHOIk8LEn6wQtjbFmnG/1Tw291eh5RTm8MiZiX9+A
         tXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748612860; x=1749217660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ33hGWLZLWP4KAff3z9IviW+6yw08j6ihjaF/OCFuM=;
        b=uRfcJpieraDDbR2c3H26II98+ogaKszac6BV52cgNM26QAoVHLUoSGLj66FsCACWaV
         4XQpdErVEndkuw4eMJL3/0m511KdJr22HzVtIvxHAR/Dbdyw2DDAsyD5ELq8bKtFNCyc
         7CtH1tshJPz/K+WjiM2RESK9Egoy6tv4mhaMMl6Ig7xs7AbqVhSX61HTzq6HixPGiUeb
         4n61D0m42JPB6zcmblxwWcVuLnvbx78zSZLjVUfLLZt6h+fFVJZbMVGnN/bMciPM7Lld
         yg8kS4uA3Pr1f8x1a72bCvXmJNL4RoLFueWq88C/7nzKGr04I1rDh+CqFDLLua1iZvBw
         ydLg==
X-Gm-Message-State: AOJu0YxUuVwh52kfZ+hykzsIza0CHkpXBXHZB3aZfipdRh2SzifuY7eu
	rYBnaiUQZrkiAgUgcEUasF72MejZ+079AmLq8gyw72B7h3ALrbyWnbpOmeyhSzF7Zes=
X-Gm-Gg: ASbGncvPCFZWCIRAXKA06nI9fOj/qjy54pDA3QbjEbTiJhrz/9A2x4cZNPmmMhV57Lf
	GZF3Ju5mhOSqRGKYR1z+BOtCPtDU4+Oi/qOHp3b8rw4q/8MWHDljdMCsF73CHlhdZNXJLsUzKcX
	wFRU1mpaOO6JshwFtXERKaBZx5k5nniK36b2rQhrMeiZtx0YoMaZPSYllGHiNIOfSp1AzB0AGe7
	zweUyI7l5O1Xl2ZpD+U0yQbVx+KFquiO1hbXOjNNruqixFkMedPsiaIZmwX2u09rz9TwUDJuY08
	r356jrhkdAJ0wo1WDdsLMVrxeo2RYSirrPpgtuS/NnfFvkfF1sojFeSZGJoufU55tchz2ijPdXY
	Txf8+17ES315pTOe721w2y+HR/t9qj5A1Og==
X-Google-Smtp-Source: AGHT+IGv0UYzyrSEZY7vl1tJtk4r9JxlZ5FLdn1FwjHgg7Cc70ALCFd1xeT25r8fWb9UrhywYyTF5Q==
X-Received: by 2002:a05:6512:138d:b0:549:8b24:989d with SMTP id 2adb3069b0e04-5533b8511demr1266844e87.0.1748612860050;
        Fri, 30 May 2025 06:47:40 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v3 0/5] xen/arm: Add option to optionally disable trapping on unmapped acceses
Date: Fri, 30 May 2025 15:45:54 +0200
Message-ID: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
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
We can drop it if it's not needed.

Thanks,
Edgar

ChangeLog:

v2 -> v3:
* Reword descriptions to clarify reads of all bits as ones.
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
 xen/common/domain.c                   |  3 ++-
 xen/include/public/domctl.h           |  4 ++-
 17 files changed, 98 insertions(+), 6 deletions(-)

-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD49A98497F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803097.1213521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8Kl-0005qZ-7R; Tue, 24 Sep 2024 16:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803097.1213521; Tue, 24 Sep 2024 16:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8Kl-0005o5-4M; Tue, 24 Sep 2024 16:24:15 +0000
Received: by outflank-mailman (input) for mailman id 803097;
 Tue, 24 Sep 2024 16:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5PF=QW=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1st8Kk-0005nz-4z
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:24:14 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e7d57ee-7a91-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 18:24:12 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3e042f4636dso3396930b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:24:12 -0700 (PDT)
Received: from gmail.com ([168.243.189.171]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-84e81f8b0cesm23748241.0.2024.09.24.09.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:24:08 -0700 (PDT)
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
X-Inumbo-ID: 6e7d57ee-7a91-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727195050; x=1727799850; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3zSB7UwGEkeQUEehWL9aGzmWvZ2F15GeF5/5FE0AoYM=;
        b=Ig2YyWiewJVweZ657wTbpYaoTmd3sL9H7Pf2jIgtApD7sqwiGcW6U2o39OjodtOVS2
         qFkCfBNDEWmNgZtm++PWfewNMKbVYwZwZjAWwUJ/IO6aIv7ntyjGbt4Ons0NSlBkeot9
         LLUTwoZCWNe3qXSGQcwvPXzk9z11Z+LSf7jwFGuEiTLuogTdv6xm3r1Q9MFARmsnh7c+
         soscn3eAZuw3a+ITiVKaQgw0/BGmsWTpLppRHnMEczurMm0euaXCQ5bgihefqaAqMcs4
         ay+/P0ZCiiYdiKG1J2BIshFBZujoV8BRQIiccy5gyzokQAGYdVQ4oL9dMyPRp+v3KK5a
         P0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195050; x=1727799850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zSB7UwGEkeQUEehWL9aGzmWvZ2F15GeF5/5FE0AoYM=;
        b=tanqAqAq8NO0YvwqCBV7RU0RdbHQl9r9mXXY9j6NBM7R54j2jre5dq3pUDeVulZKF5
         50Q0Bp/ryCgfqiZnx8v4Q1XvG36G+mW4FSv9fiTQiB5qPUKbFGOoex5p6qnNYgoDOH+1
         bAJLiyHmmAfo4NB6ZxLs4OvGzOYTfdOkwGRtzMIvtsit0RAtNemuMfnbPl7RbswvJgWH
         eJ7WLJFG4S+SG2CxvulNXIUzQQIv1ge5OBJwLR5P2ZipfNgReEt4mQkrSCdkGgwcnmpR
         OmeJbA88K/24z5ZBY/L7Pa2J7cwrEhksYv3ZoaArDO3hhgjSZv0wfVAt3nkcYa4S11XO
         8DwQ==
X-Gm-Message-State: AOJu0YxUIM4E4Ke7PEuRIfJcHuQj0LJxfcycEMYb/cw3m+XakGroZOj2
	lHJ2CMoBrVGvEKxoOlKWmaBgCRV+u8kAJevemjOa9hhDRElizb5Z7l8OiFaF
X-Google-Smtp-Source: AGHT+IFspUZSvUf6BJZSy6b3LqggqHfTkXtesFc8G6jMqNuoLaYdcL8+j55/Mz+LcuupdrAShnLq9Q==
X-Received: by 2002:a05:6808:1815:b0:3e0:41fe:646b with SMTP id 5614622812f47-3e271ced890mr9632119b6e.42.1727195050254;
        Tue, 24 Sep 2024 09:24:10 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	dpsmith@apertussolutions.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 0/6] xen/arm: Add Virtio-PCI for dom0less on ARM
Date: Tue, 24 Sep 2024 18:23:53 +0200
Message-ID: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This series adds support for Virtio-PCI for dom0less on ARM.

Three parts:
1. Decrease size of second RAM bank to free up space in <40bit address range.
2. Add generation of virtio-pci FDT nodes for domU.
3. Add a background ECAM region always responding 0xFFFFFFFF (nothing attached).

Decreasing the size of the second RAM bank is probably a bit controversial
since it breaks backwards compatibility for guests with huge amounts of RAM.
There are other options we could consider but the problem we've got is that
we're running out of address-space under <40bits. There're some fragmented
holes under <32bit but nothing between 32 - 40bits and there are ARM systems
out there that only have 40-bit physical address space (Cortex-A53 on the
Xilinx ZynqMP to name one).

For virtio-pci the holes <32-bit are not large enough to fit the ECAM range
nor a 4G area to map pretechable-memory BARs.

Another option is to leave the second bank unmodified and default virtio-pci
to >40bit addresses. Users that create guests with less RAM than the maximum
can use the fdt bindings to relocate virtio-pci down to <40bit range if they
need to.

I've published some instructions on how to try this including the work in
progress QEMU side of the ARM PVH PCI support:
https://github.com/edgarigl/docs/blob/master/xen/pvh/virtio-pci-dom0less.md

Cheers,
Edgar

Edgar E. Iglesias (5):
  xen/arm: Decrease size of the 2nd ram bank
  xen/arm: Reserve resources for virtio-pci
  xen/arm: io: Add support for mmio background regions
  xen/arm: io: Add a read-const writes-ignored mmio handler
  xen/arm: dom0less: Add a background PCI ECAM mmio region

Stewart Hildebrand (1):
  xen/arm: create dom0less virtio-pci DT node

 docs/misc/arm/device-tree/booting.txt |  21 +++
 xen/arch/arm/dom0less-build.c         | 248 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/kernel.h     |  15 ++
 xen/arch/arm/include/asm/mmio.h       |  13 +-
 xen/arch/arm/io.c                     |  39 +++-
 xen/include/public/arch-arm.h         |  21 ++-
 6 files changed, 348 insertions(+), 9 deletions(-)

-- 
2.43.0



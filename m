Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2C66B7CC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478334.741447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJY6-0006vI-D3; Mon, 16 Jan 2023 07:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478334.741447; Mon, 16 Jan 2023 07:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJY6-0006sc-A5; Mon, 16 Jan 2023 07:04:54 +0000
Received: by outflank-mailman (input) for mailman id 478334;
 Mon, 16 Jan 2023 07:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHJY5-0006sD-6A
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:04:53 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11a7d09a-956c-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 08:04:50 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id kt14so6927543ejc.3
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 23:04:50 -0800 (PST)
Received: from uni.router.wind (adsl-67.109.242.224.tellas.gr.
 [109.242.224.67]) by smtp.googlemail.com with ESMTPSA id
 v15-20020a056402184f00b0046c5baa1f58sm10990824edy.97.2023.01.15.23.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:04:49 -0800 (PST)
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
X-Inumbo-ID: 11a7d09a-956c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mp1FQXXyYfq3zENnQECHsCJiRxZfGT2QDjD6yHefefY=;
        b=oAVq/hxLg1akUx2ep0FHl8grGRt3pxaXLdhk8rOqWwiMLu/d3aMHwreojG4aLnZr9L
         8cfVVB6zYgdUq5JuvNMl1KRvz6tbcaB13ZZNsHoTfvn2yKDwkTEcoW2MQ7Hlg29HWblh
         6x0rpcEdG0lOjJOwFKA2fU2T/Pb4vGjFpwV2A1uUZJu7wah407sLtkt56V9SLUzSB6gl
         qtoDDC04YlZZPD0SUrc4XaIreDIYPHpgIg9s2aGaKzvsljEa4mpAFvUy/tcqmOgmtuQF
         EyQIVFESzUsy1z9j1nzSa8Fr9SSyH4oVNaEQ/Mnph6+gtsDOUDF6OUlc71lRc+NntTUX
         qDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mp1FQXXyYfq3zENnQECHsCJiRxZfGT2QDjD6yHefefY=;
        b=vKZ2JGwNm0FuY8QTGnB8Cd/oBx/BQZaGmfvbeZKuzl4y5gKtR8ZWiZM60qnLhg5SDa
         N+yOZGHtdUyDXE2leMeYEKc1NBu4T9KkuUqgrG60hnGrpOC+J/DgX2GQYbtPVb+l4kLY
         vdNfMyie53Tj2DYLNzT3PImjxsFwYwAW9dkcR/+y7b/BJYFxmMQ1xMUxuduWipYHDLbV
         jaRL1G0uV915YKF+OY52jlzqyysOSdH3xjlIW/4J+q/NOTK1blFod2hHqRXsGZYoJP0Q
         JTaSAYLI5HM62t/UoEwkVNwV6CoUoOqk8FEWBqcsDL5ovUlXXjwhDAcvX6B2J8jJzCdq
         5J9Q==
X-Gm-Message-State: AFqh2kqhDnfSZWSZSaNCnSnhvm+fYI8b8e+7bh9wU7+ENjBxkz6MY36N
	mToztp9nD6egZlkCBwkC9r7a7Xqji5o=
X-Google-Smtp-Source: AMrXdXuZY3+bs1/S5WfooYPQKwksVHMtp5PYwH6MbPrMdyoAYnyDoq/kPWQ3bpF8MYzoU4X2mW3+eg==
X-Received: by 2002:a17:907:8e93:b0:7ae:bfec:74c7 with SMTP id tx19-20020a1709078e9300b007aebfec74c7mr82569866ejc.72.1673852689586;
        Sun, 15 Jan 2023 23:04:49 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: [PATCH v3 0/8] Make x86 IOMMU driver support configurable
Date: Mon, 16 Jan 2023 09:04:23 +0200
Message-Id: <20230116070431.905594-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to provide a means to render the iommu driver support for x86
configurable. Currently, irrespectively of the target platform, both AMD and
Intel iommu drivers are built. This is the case because the existent Kconfig
infrastructure does not provide any facilities for finer-grained configuration.

The series adds two new Kconfig options, AMD_IOMMU and INTEL_IOMMU, that can be
used to generate a tailored iommu configuration for a given platform.

This version of the series is rebased on top of the current staging and
addresses the comments made on version 2.
Patch "[v2] x86/iommu: introduce AMD-Vi and Intel VT-d Kconfig options"
is not included in this series because it has been already merged, and patch
"[v2] x86/iommu: iommu_igfx, iommu_qinval and iommu_snoop are VT-d specific"
has been splitted up into two separate patches.

Xenia Ragiadakou (8):
  x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
  x86/iommu: iommu_igfx and iommu_qinval are Intel VT-d specific
  x86/iommu: snoop control is allowed only by Intel VT-d
  x86/acpi: separate AMD-Vi and VT-d specific functions
  x86/iommu: make code addressing CVE-2011-1898 no VT-d specific
  x86/iommu: call pi_update_irte through an hvm_function callback
  x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM code
  x86/iommu: make AMD-Vi and Intel VT-d support configurable

 xen/arch/x86/hvm/vmx/vmx.c               | 41 +++++++++++++++
 xen/arch/x86/include/asm/acpi.h          |  6 ++-
 xen/arch/x86/include/asm/hvm/hvm.h       | 10 ++++
 xen/arch/x86/include/asm/iommu.h         |  3 --
 xen/drivers/passthrough/Kconfig          | 22 +++++++-
 xen/drivers/passthrough/amd/iommu_init.c |  2 +
 xen/drivers/passthrough/iommu.c          | 15 +++++-
 xen/drivers/passthrough/vtd/intremap.c   | 36 -------------
 xen/drivers/passthrough/vtd/iommu.c      |  3 --
 xen/drivers/passthrough/vtd/x86/Makefile |  1 -
 xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
 xen/drivers/passthrough/x86/hvm.c        | 50 ++++++++++++++++--
 xen/drivers/passthrough/x86/iommu.c      |  5 ++
 xen/include/xen/acpi.h                   |  7 +++
 xen/include/xen/iommu.h                  |  8 ++-
 15 files changed, 156 insertions(+), 117 deletions(-)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/hvm.c

-- 
2.37.2



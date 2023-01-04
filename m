Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E8A65CE91
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470983.730664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOZ-00005V-Iq; Wed, 04 Jan 2023 08:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470983.730664; Wed, 04 Jan 2023 08:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOZ-0008SU-E9; Wed, 04 Jan 2023 08:45:11 +0000
Received: by outflank-mailman (input) for mailman id 470983;
 Wed, 04 Jan 2023 08:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfqB=5B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pCzOY-0008Pf-2k
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:45:10 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 175bb389-8c0c-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 09:45:07 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id u9so81072765ejo.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 00:45:07 -0800 (PST)
Received: from uni.router.wind (adsl-57.109.242.233.tellas.gr.
 [109.242.233.57]) by smtp.googlemail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15016382ejb.86.2023.01.04.00.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 00:45:06 -0800 (PST)
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
X-Inumbo-ID: 175bb389-8c0c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EBCGeHaBTmxyN/DaJmKzht+c6jCnKFesS3Z897W1Kpg=;
        b=JofC2WjASo4RG8zIrbk6xa6YUAa3FT7Jj7pAXx4ze5bEmGFhHy6xVTEDJswYShuLd3
         oXCsr70nlBgeo4xO6yUa4FimRvyUT1cKnZ+ypf29bol4wnfFsqbWnKgItghkw01Ett65
         EnZhGqR3rFV4DnVWovgKN3JcE8Lgu8yYAYAjJTFRysld0F27OHFAHtzkIkuZbY44nrwb
         irfHUk8OgLkxn2vipZz3d2zGa5dJriBJaFaDOErbGNCXOZPLQtQxhqnOWjWyIoAJ5M93
         95t5mV5b3MmSQ2vog6CuziGQzmT4HqBaxuk+XaPNmbfjvkRtpUEiPvtY2oj4DAkqRyHe
         OBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBCGeHaBTmxyN/DaJmKzht+c6jCnKFesS3Z897W1Kpg=;
        b=bWqzMuTfvlZKeILfnpZ2bmnvjCwMAFyNfaWqYv5pkDd6MG58VtZdj+QNaELfL6FdOs
         2PUhKcPoTE8w1x/XAytG31YEwKbz5FubFRQ1xyrJgstZ3GWeCGrPOFmYIVkUWhtzg4Xl
         ZvEFBj7LSOOVuPZgGoX9ZKua+2tSIfv21bWGZVrDF8UKyk9zSMBpkbHvOd5lF8O5VIUd
         SkRaDgo23sbPMmU9Q4FPuV7iw1UosC0ofKA0pNQ+N28A6TggnliMFS8FUP4wFY0B3BQh
         UdKn2k0clwBETSAnMx7/T0RudKkbNpxN3pDCEutx1was93cT/lbwZ0lCgADE42kReC8r
         0I9Q==
X-Gm-Message-State: AFqh2krqMwFGDZM2aOJjC405vqCWAyb3EpxtfSmaxH8FfIaTHJ6ridqE
	8ybFRllYxdSadObHqkZBnibhls6OcfM=
X-Google-Smtp-Source: AMrXdXumjn8F5BjTIazn7G7h3S0/llhfHrGEVIch0uQ5aP66cd7oCFL/Tv5eNSx0bxDF6y5WjQIWAA==
X-Received: by 2002:a17:906:859:b0:84c:c4a4:61ca with SMTP id f25-20020a170906085900b0084cc4a461camr9478845ejd.61.1672821907069;
        Wed, 04 Jan 2023 00:45:07 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 0/8] Make x86 IOMMU driver support configurable
Date: Wed,  4 Jan 2023 10:44:54 +0200
Message-Id: <20230104084502.61734-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to provide a means to render the iommu driver support for x86
configurable. Currently, irrespectively of the target platform, both AMD and
Intel iommu drivers are built. This is the case because the existent Kconfig
infrastructure does not provide any facilities for finer-grained configuration.

The series adds two new Kconfig options, AMD_IOMMU and INTEL_IOMMU, that can be
used to generate a tailored iommu configuration for a given platform.

This version of the series addresses the initial comments made in the RFC
version to facilitate further review of the parts that need more feedback.

Xenia Ragiadakou (8):
  x86/iommu: introduce AMD-Vi and Intel VT-d Kconfig options
  x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
  x86/iommu: iommu_igfx, iommu_qinval and iommu_snoop are VT-d specific
  x86/acpi: separate AMD-Vi and VT-d specific functions
  x86/iommu: the code addressing CVE-2011-1898 is VT-d specific
  x86/iommu: call pi_update_irte through an hvm_function callback
  x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM code
  x86/iommu: make AMD-Vi and Intel VT-d support configurable

 xen/arch/x86/hvm/vmx/vmx.c               | 10 ++++
 xen/arch/x86/include/asm/acpi.h          | 14 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h       | 15 ++++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h   | 11 ++++
 xen/arch/x86/include/asm/iommu.h         |  5 +-
 xen/arch/x86/pv/hypercall.c              |  2 +
 xen/arch/x86/x86_64/entry.S              |  2 +
 xen/drivers/passthrough/Kconfig          | 24 +++++++++
 xen/drivers/passthrough/Makefile         |  4 +-
 xen/drivers/passthrough/amd/iommu_init.c |  2 +
 xen/drivers/passthrough/iommu.c          |  9 +++-
 xen/drivers/passthrough/vtd/x86/Makefile |  1 -
 xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
 xen/drivers/passthrough/x86/hvm.c        | 48 ++++++++++++++++--
 xen/include/xen/acpi.h                   |  3 --
 xen/include/xen/iommu.h                  |  7 ++-
 16 files changed, 141 insertions(+), 80 deletions(-)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/hvm.c

-- 
2.37.2



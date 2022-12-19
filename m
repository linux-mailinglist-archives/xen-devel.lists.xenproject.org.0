Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA965079C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 07:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465755.724538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kC-0003Ao-Rx; Mon, 19 Dec 2022 06:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465755.724538; Mon, 19 Dec 2022 06:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kC-00038J-Od; Mon, 19 Dec 2022 06:35:24 +0000
Received: by outflank-mailman (input) for mailman id 465755;
 Mon, 19 Dec 2022 06:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4Hg=4R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p79kB-000383-3H
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 06:35:23 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f7cca17-7f67-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 07:35:21 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id qk9so19150159ejc.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 Dec 2022 22:35:21 -0800 (PST)
Received: from uni.router.wind (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.googlemail.com with ESMTPSA id
 q14-20020a17090676ce00b008302732f569sm77062ejn.78.2022.12.18.22.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 22:35:19 -0800 (PST)
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
X-Inumbo-ID: 4f7cca17-7f67-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPDhCF7GvIIvkuWTKAmlPB2+PrFjxVMOL+nCGfPZHVk=;
        b=naSxfX3PG3zhTOQQWtWiw51vX3E/oFCE2linmO5Sz2w87KQ4G7A+NG7GrsZ+AmWO5P
         E7oMyd/homISUHUXN35soiekMTf5bCR4xbDVhn2WlWZO0+yrVmYwYoJVNKGy2uhQgZ4w
         NfZppEoZztpbiT1vE+txsgmZXWsaF0BRK0uXu6jhY0yvMnav6JQ5AkpHOeMlAOrPlTEt
         OtMlzd5/MmGrBAsCiNDf8tWZhMzYFNtHyWMgsK5Ehjhluc/oDlY+xCQVw6/hFKUfztC7
         Ea86h6y7aGYwiqVyNlLC5Yc7vapKOzBFaqoRet0GNb8c+yQ71EJOI4wffTrLnVbu87+x
         sEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPDhCF7GvIIvkuWTKAmlPB2+PrFjxVMOL+nCGfPZHVk=;
        b=g5dXqhPEdi9AoEtDD2kLzf47M/7zbhbFDNMx7HBLDkMono8YuR8xp0pUb6W8udBAof
         wid1KGjK7gyZJeSRnMEkRUX9MANPkeKWHbfODLhCm467WPSJBOa9VrjNWylQrjsv619I
         r5dwTa9YsQaHGok5B8bnEYA8z5t+pNY1C0ypxcTRW3b/K+lBH9kNgcVyvQ6+2thp+E+V
         I1imo5DW1LAgBR3fnJGNR9puDGv/aacaje+kLlTkdem0HCF0bqGYekPbPzLW+8i3f+ez
         JNH3mGxCLJel7yAGyx4SZ1ZjMhF34GCQ/YLPMkhtmnKRUi7fvVYc5zvREySmPr47sjYQ
         9J/w==
X-Gm-Message-State: AFqh2kruXAi7yC6WXaCTbQ+VF8W8XuX5dOKb92p9DEj38uXcdHL0ratk
	zSptGLXecvRobwJRmlQpIAoVXxjMKEk=
X-Google-Smtp-Source: AMrXdXuwnvZqZ/FF0HdZk2ZxPc6rhFRv3vbDeTpDYppmCG26V/yvMcaUhJS2nhEOiD5jtaOUcfUUow==
X-Received: by 2002:a17:907:1b28:b0:7f7:a985:1838 with SMTP id mp40-20020a1709071b2800b007f7a9851838mr11668669ejc.44.1671431720311;
        Sun, 18 Dec 2022 22:35:20 -0800 (PST)
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
Subject: [RFC 0/7] Proposal to make x86 IOMMU driver support configurable
Date: Mon, 19 Dec 2022 08:34:49 +0200
Message-Id: <20221219063456.2017996-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to provide a means to render the iommu driver support for x86
configurable. Currently, irrespectively of the target platform, both AMD and
Intel iommu drivers are built. This is the case because the existent Kconfig
infrastructure does not provide any facilities for finer-grained configuration.

The series adds two new Kconfig options, AMD_IOMMU and INTEL_VTD, that can be
used to generate a tailored iommu configuration for a given platform.

This series will be part of a broader effort to separate platform specific
code and it is sent as an RFC to gather feedback regarding the way the
separation should be performed.

Xenia Ragiadakou (7):
  x86/iommu: make AMD-Vi and Intel VT-d support configurable
  x86/iommu: amd_iommu_perdev_intremap is AMD-Vi specific
  x86/iommu: iommu_igfx, iommu_qinval and iommu_snoop are VT-d specific
  x86/acpi: separate AMD-Vi and VT-d specific functions
  x86/iommu: the code addressing CVE-2011-1898 is VT-d specific
  x86/iommu: call pi_update_irte through an hvm_function callback
  x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM code

 xen/arch/x86/hvm/vmx/vmx.c               | 10 ++++
 xen/arch/x86/include/asm/acpi.h          | 14 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h       | 22 ++++++++
 xen/arch/x86/include/asm/hvm/io.h        |  1 +
 xen/arch/x86/include/asm/hvm/vmx/vmx.h   | 11 ++++
 xen/arch/x86/include/asm/iommu.h         |  5 +-
 xen/arch/x86/pv/hypercall.c              |  2 +
 xen/arch/x86/x86_64/entry.S              |  2 +
 xen/drivers/passthrough/Kconfig          | 16 ++++++
 xen/drivers/passthrough/Makefile         |  4 +-
 xen/drivers/passthrough/amd/iommu_init.c |  2 +
 xen/drivers/passthrough/iommu.c          |  7 ++-
 xen/drivers/passthrough/vtd/x86/Makefile |  1 -
 xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
 xen/drivers/passthrough/x86/hvm.c        | 47 +++++++++++++++--
 xen/include/xen/acpi.h                   |  3 --
 xen/include/xen/iommu.h                  | 11 ++--
 17 files changed, 141 insertions(+), 81 deletions(-)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/hvm.c

-- 
2.37.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DDB81A00F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657802.1026904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws0-0003IJ-Jk; Wed, 20 Dec 2023 13:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657802.1026904; Wed, 20 Dec 2023 13:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws0-0003Gr-H1; Wed, 20 Dec 2023 13:44:20 +0000
Received: by outflank-mailman (input) for mailman id 657802;
 Wed, 20 Dec 2023 13:44:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFwrz-0003Gg-9C
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:44:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df29be89-9f3d-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 14:44:18 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so57303365e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 05:44:18 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b0040b30be6244sm7617770wmq.24.2023.12.20.05.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 05:44:16 -0800 (PST)
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
X-Inumbo-ID: df29be89-9f3d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703079857; x=1703684657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+CEnHbpAcV8NYSJjT10iuURnFtmtXH0mPtofeBBjZk=;
        b=krWCPOSvGQUNIkmD47MpGxYczUr45bMSmXfmCP9XbgfLc228JvhfrDY6tiMfyD42a6
         M1T0TV4y1nYp3c9qABr7BezMdHmxqc+0jpZJk6DqI50LFBA3JoeOUgRXiEzarhNldYtM
         H3PuXGz6j7o4gW0H/pD3aWYAf1p4JIbtBsJ5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703079857; x=1703684657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+CEnHbpAcV8NYSJjT10iuURnFtmtXH0mPtofeBBjZk=;
        b=CJy/meHcMg/yRzJLsAiBbFNbXzt1RLXah1S8GOkcVIDvnw/D3TdcR6jCyicV/JrzNn
         wOXBbXKrCtksoP/kfxo5tf2IktDs/6S0vDfgeV4uLwtpBT87ImKpZxUuUHhUkbQGWxI2
         9wF9mzaBg0mbTLOSLdWeV8UaSK+ralGlJHhAJMTTlxvoIwHKaMvztHvuzOPwt40S5saS
         nyGgi9G1HbnaZU+yy4oTbUq0FKNPJjV5N+7zVDW3VULG+io/tgaYtR5NPVptDrVPa3FE
         GWX6AZeF1A7oHCgVxbt2fAPm2qpUa5nyPabWoOWOJld8AMtCebj6/bSgz90gPwFsmFto
         y76A==
X-Gm-Message-State: AOJu0YzensqcyF+OT6m6mnV08dSMp5uXAOl2MT0LE9khm9qoyCmR6Iuk
	sQ/RPjtD0+YoH3DVHORhoZNxozE7cuC5sLKRvb0=
X-Google-Smtp-Source: AGHT+IGCCCPNAw7/j2KpI7cyigApeVJH3maQe07+ZNNzcsUKuOs4fQ0njHE3cueBGHHlBD5M60u7dQ==
X-Received: by 2002:a05:600c:1818:b0:40b:5e21:ec1f with SMTP id n24-20020a05600c181800b0040b5e21ec1fmr10286604wmp.81.1703079857353;
        Wed, 20 Dec 2023 05:44:17 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v4 0/6] x86/iommu: improve setup time of hwdom IOMMU
Date: Wed, 20 Dec 2023 14:43:40 +0100
Message-ID: <20231220134346.22430-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of the series is to reduce boot time setup of IOMMU page tables
for dom0.

First and second patches are a pre-req, as further patches can end up
attempting to create maps above the max RAM address, and hence without
properly setting the IOMMU page tables levels those attempts to map
would fail.

Last 4 patches rework the hardware domain IOMMU setup to use a rangeset
instead of iterating over all addresses up to the max RAM page.  See
patch 5/6 for performance figures.

Thanks, Roger.

Roger Pau Monne (6):
  x86/p2m: move and rename paging_max_paddr_bits()
  amd-vi: set IOMMU page table levels based on guest reported paddr
    width
  x86/iommu: introduce a rangeset to perform hwdom IOMMU setup
  x86/iommu: remove regions not to be mapped
  x86/iommu: switch hwdom IOMMU to use a rangeset
  x86/iommu: cleanup unused functions

 xen/arch/x86/cpu-policy.c                   |   2 +-
 xen/arch/x86/domain.c                       |  21 ++
 xen/arch/x86/hvm/io.c                       |  15 +-
 xen/arch/x86/include/asm/domain.h           |   3 +
 xen/arch/x86/include/asm/hvm/io.h           |   4 +-
 xen/arch/x86/include/asm/paging.h           |  22 --
 xen/arch/x86/include/asm/setup.h            |   2 +-
 xen/arch/x86/setup.c                        |  81 +++---
 xen/arch/x86/tboot.c                        |   2 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  20 +-
 xen/drivers/passthrough/x86/iommu.c         | 271 +++++++++++++-------
 11 files changed, 262 insertions(+), 181 deletions(-)

-- 
2.43.0



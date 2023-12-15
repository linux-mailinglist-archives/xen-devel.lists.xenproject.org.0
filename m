Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E3F814A54
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 15:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655131.1022833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92Y-0007Ls-4z; Fri, 15 Dec 2023 14:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655131.1022833; Fri, 15 Dec 2023 14:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92Y-0007K9-1w; Fri, 15 Dec 2023 14:19:46 +0000
Received: by outflank-mailman (input) for mailman id 655131;
 Fri, 15 Dec 2023 14:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE92W-0007Jp-Jf
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 14:19:44 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de174ab3-9b54-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 15:18:50 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-333536432e0so589058f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 06:18:50 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 m18-20020a5d6a12000000b003364492703csm5234834wru.23.2023.12.15.06.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 06:18:48 -0800 (PST)
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
X-Inumbo-ID: de174ab3-9b54-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702649929; x=1703254729; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hq7ROO1Dkz8xNVK9sMXMO1yZBwV35ERmOXzQeR/x8C0=;
        b=VmYIwVhniQ3J7/NeTZ+Zpf83NQGDh2vpko9JlKLmW0scS3e1HPUXXjWbPa9rtdW4t6
         xMMhL2yX2N0dhGgl1rtaPHc1MznJ0RMOd/n8fhxHbqwr9ausJhZoqspFUTcfStySPuH7
         Yv7zq8VuxX/Vcuqc0dqFmrFAjKFFq5yGeZ4jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702649929; x=1703254729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq7ROO1Dkz8xNVK9sMXMO1yZBwV35ERmOXzQeR/x8C0=;
        b=NA415GYMbFLHUlKA0ZUW4Gn0HzZaqDMe1JfJoWlWYDLtLeD9ib1ji4K0lgTn3WSssC
         ZwsJW1IvrkhZNOnOrZ1O97qNOptEg39QTTWSakCOXFm+7lrNullt2SK8SSmoj4hGQcCg
         mJ9llgFWKzE/YB2f5NE7luBlrn2DSbcOOONeYw/XHl5khRDhRcfnLf/KExcBexiu2avj
         lS2JGhtPtb5HrbV9G1DKg4PvQlOa8FD9kIs0C2ZMCp9cqJrpiD799lZwJwhWXJtO8LM2
         JKWREH3kZYVgGqtLG1kC8s58ezM5giiLK2CdtPd5qQ7PRDf34XJiocHo9Zs7I9zP+Jir
         hkCA==
X-Gm-Message-State: AOJu0YyF0THR9g0TCUI6qcgNROjzV5zP/8QkwFGWfSGFE1cj6MpWevkn
	D1sh2NF9CPQWrMWohwvH34tnRCyvrLpL3+l7pNY=
X-Google-Smtp-Source: AGHT+IF/b/7/qScFgyi6zCgNgHy5tARgUgn0qJZAQ0F0OWawCH5vq5RwbOa55Qm59OQwGBcEYWEe7g==
X-Received: by 2002:adf:fa89:0:b0:333:d38:9cf8 with SMTP id h9-20020adffa89000000b003330d389cf8mr5965361wrr.23.1702649929063;
        Fri, 15 Dec 2023 06:18:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v3 0/7] x86/iommu: improve setup time of hwdom IOMMU
Date: Fri, 15 Dec 2023 15:18:25 +0100
Message-ID: <20231215141832.9492-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of the series is to reduce boot time setup of IOMMU page tables
for dom0.

The first patch is completely unrelated leftover work from XSA-445, just
included in the series because it's IOMMU code.

Second and third patches are a pre-req, as further patches can end up
attempting to create maps above the max RAM address, and hence without
properly setting the IOMMU page tables levels those attempts to map
would fail.

Last 4 patches rework the hardware domain IOMMU setup to use a rangeset
instead of iterating over all addresses up to the max RAM page.  See
patch 6/7 for performance figures.

Thanks, Roger.

Roger Pau Monne (7):
  iommu/vt-d: do not assume page table levels for quarantine domain
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
 xen/drivers/passthrough/vtd/iommu.c         |   2 +-
 xen/drivers/passthrough/x86/iommu.c         | 277 +++++++++++++-------
 12 files changed, 269 insertions(+), 182 deletions(-)

-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAD4A1B514
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 13:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876702.1287055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINE-0007eX-Pn; Fri, 24 Jan 2025 12:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876702.1287055; Fri, 24 Jan 2025 12:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINE-0007c3-Mp; Fri, 24 Jan 2025 12:01:20 +0000
Received: by outflank-mailman (input) for mailman id 876702;
 Fri, 24 Jan 2025 12:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbIND-0007bK-Oo
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 12:01:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb1fe049-da4a-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 13:01:18 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so621851966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 04:01:18 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fbfbcsm117545266b.153.2025.01.24.04.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 04:01:16 -0800 (PST)
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
X-Inumbo-ID: eb1fe049-da4a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737720077; x=1738324877; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/7ZDQWGxPFGr8shs6Rg8vH5vtxlwu8uwF+5wx6Pt1eI=;
        b=IotB79FmXRi/GlvQtqrohcgpn4p4UDUFj+EpBBQPQ/YhZYAuOIc9tlBvO/QjTUlERI
         WjxrWlRFKV4oIxyPStDQiXsdf55cjP5yBfG4ISdLqXDs4l22cy9+/HseMNd/gtSqmhXc
         JQFxz2aXYsdXlNJM5L5q8m9WuMHhSdCRGWm3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720077; x=1738324877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7ZDQWGxPFGr8shs6Rg8vH5vtxlwu8uwF+5wx6Pt1eI=;
        b=Ig9vsyP0ONWpWRl4Smr/D5hs1goqgzgEdk6kvF6Cc4SyNgLU+WpPaLoiyhsGPg9hju
         SIIdhTkaJU3y/P+Pb6KMOKdEd9wi/RJvVYlN5ko1jWbfjPsO6ze91efC0cPiVI6NRd1y
         cI+SxCWz1a71wRbFxy7FMkV53WKX3g/BQZlrOlk8mGB4qarS+ZyEdVOvHwOmgr/DtWVm
         uNi5pNJ4TI9krp/hy4cxX9eaSSQNAiDWwDq310q4/Z5hJhHI7rJsA4GAhXv3hLgn9d+S
         EZSf9c5apHEywDn8YgndVTpqIt4LRzwbMtm8ifAtJ8POP+ooVjGJ67I8y5dXngunpsTi
         NUAQ==
X-Gm-Message-State: AOJu0Yw8338SLNO627M6Xjy4+Q9BAQ1TLkJCQgsvhCJJsvHxtIyZfarz
	7owPF9GBRy/rLJuZP8LYuFLxIpvQgu2r+lMk58M0Dsm0gqjlZ+Wro/gBUpJnTN/IrIpnIutteAT
	+
X-Gm-Gg: ASbGnct79/Vo8Pg8ojxw50AiEOyK5mEQ30KlCsA0o8HFT2KOtZ6LKw+CAAdxHSveoVM
	J99xHnExqsHW67JZTtYfGxOXO8jprSdLG2++cusLJKKkxu2SWPtDI0N5R3Dab79rxQGWv6tk4as
	X2pOQc5DlMsSMFUc8oSkH6Vq9gU8QT4kmXYgW6mN3ZCHjV9QxOknLVfyyFVPAzXm/r0wvQiAQSw
	M2REmS8vwq9gn8YMPZeK6KcqpgaKGisAIPrpe9aKZTj+D++6jnADcG0i5AWT5/8Gzx2NXX5hOIA
	sC18Q5zB/zaShu8=
X-Google-Smtp-Source: AGHT+IH9MzzNh5+IlDH4FLutc3tC/X55HB6u8bJWc/55jopMFhljDbrP8TKtVrPXbeBIwhctunMkIw==
X-Received: by 2002:a17:906:f584:b0:ab3:a2f9:d977 with SMTP id a640c23a62f3a-ab67466fca8mr227813866b.22.1737720077191;
        Fri, 24 Jan 2025 04:01:17 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/5] x86/iommu: make CX16 mandatory for IOMMU
Date: Fri, 24 Jan 2025 13:01:06 +0100
Message-ID: <20250124120112.56678-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series is the original CX16 series sent by Teddy, with the
CX16 checks split into a separate patch, plus one extra patch to switch
AMD-Vi to use CMPXCHG16B when updating Interrupt Remapping Entries.

Note that last patch to use CMPXCHG16B fixes a real bug with AMD
hardware.

Thanks, Roger.

Roger Pau Monne (1):
  iommu/amd: atomically update IRTE

Teddy Astie (4):
  x86/iommu: check for CMPXCHG16B when enabling IOMMU
  iommu/vtd: remove non-CX16 logic from interrupt remapping
  x86/iommu: remove non-CX16 logic from DMA remapping
  iommu/vtd: cleanup MAP_SINGLE_DEVICE and related code

 xen/drivers/passthrough/amd/iommu_intr.c    | 88 ++++++++++----------
 xen/drivers/passthrough/amd/iommu_map.c     | 42 ++++------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++
 xen/drivers/passthrough/vtd/intremap.c      | 88 +++++++-------------
 xen/drivers/passthrough/vtd/iommu.c         | 90 +++++++--------------
 xen/drivers/passthrough/vtd/vtd.h           |  5 +-
 6 files changed, 121 insertions(+), 198 deletions(-)

-- 
2.46.0



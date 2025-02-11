Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBDA30959
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885345.1295145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho25-0005As-Gv; Tue, 11 Feb 2025 11:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885345.1295145; Tue, 11 Feb 2025 11:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho25-00057j-DH; Tue, 11 Feb 2025 11:02:25 +0000
Received: by outflank-mailman (input) for mailman id 885345;
 Tue, 11 Feb 2025 11:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tho24-00057K-L9
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:02:24 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abe1ff37-e867-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 12:02:23 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5de4c7720bcso6383084a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 03:02:23 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de454e3f74sm8355211a12.27.2025.02.11.03.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:02:22 -0800 (PST)
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
X-Inumbo-ID: abe1ff37-e867-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739271743; x=1739876543; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pMlt1/zbp+Ug+ja2Y3cquQBGcESRkH8JMNmIfPU6Yw=;
        b=Oy5EOZm5IE1eHJ6FsridhQQuyuTBfYs99E1Z2EsoL/ToVaSA8RgfxpAlsZJFhjjuOS
         6nEkwpqTbVBV+EoY4OFA4LIvWi1OgY328GApngyS4nwJdhO6e9OZLI8GoQyY7wXtz2ND
         6E7Le4ru7a4F7m5pihEHLAQwJauqE7nrWL9dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271743; x=1739876543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pMlt1/zbp+Ug+ja2Y3cquQBGcESRkH8JMNmIfPU6Yw=;
        b=DhuoIhtXSbSP+Hs1eI8d0y6zkbGeRcI82YcoreYi/Jgfw56yaeA3/zpLpLq0crDo2q
         mN5CqcNvMyZYzotXnEQVxHTjIN6YXRoWlA3AtBkDbzkI+WNWgBK3zUDSgmn/gzK9T63R
         RhKXx01cTdlXaItCW+6pcROpjYNTy5QJB++3ZsezDnIwAYJhV3gBxPF7NBwhr6RLec57
         O1652DzdLVXAsbAeZ2o4PLMigsTMir2JMnOiFYx/vqIW/fIEiBVR6a8vfEEJW6S2Zsfv
         bRNTzq4zVBoRGLEjXHsJTzzOWZY1a5tGGSsupi/wpEz4lokZPjU3tmyMr2tTmH5Kua1o
         WESQ==
X-Gm-Message-State: AOJu0Yw2LAbcZh+TvvFP1+qKa0OqK026a/YR9NQimp9Yp9oymhczPKJj
	/qCT8T5/CSwqSuLtrlKv1JsuLUeTqpwCyMF2FQ9WcZeOWf502EIc6zJOPVvbQafj6duArSA8zqe
	1
X-Gm-Gg: ASbGncuPBRwBvwS7Um/Muoz32mAPEBNAO4NaDd61gpfF5N4LvV1ZZacRpFeVqbNu+LV
	lYT8A5ZbVCPcFW9dGALp0tIio3nz59HtncV67DPWIJbHFeg1SQ4T7GM9I/yMsY5569fsucrh/dT
	4UsHlz85ZOvqTBBq0OXCoZX/LZMEbmNzshgb4e4U0poqqt6zF32e25+9+RdMe9KKeGkAH87RfD/
	gcz5TiWyAEoQAH+zqFhAHwTeGSYAZt+k7hhoV5yAJLNX4zRhaPBUA3rt7vxPfdffFdhpJPWyUy6
	pEZChEVZAWPdOTG5J4K9
X-Google-Smtp-Source: AGHT+IERwDmoxbQajZb87FFE+E23CZXeOQPAEXFpVjU71k+hdJfh1++xfu3t6iIQQkYjaRZjnusFNA==
X-Received: by 2002:a05:6402:4308:b0:5de:5cea:869e with SMTP id 4fb4d7f45d1cf-5de5cea8b38mr10604416a12.32.1739271742742;
        Tue, 11 Feb 2025 03:02:22 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 v3 0/5] xen/x86: prevent local APIC errors at shutdown
Date: Tue, 11 Feb 2025 12:02:04 +0100
Message-ID: <20250211110209.86974-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series aims to prevent local APIC errors from stalling the
shtudown process.  On XenServer testing we have seen reports of AMD
boxes sporadically getting stuck in a spam of:

APIC error on CPU0: 00(08), Receive accept error

Messages during shutdown, as a result of device interrupts targeting
CPUs that are offline (and have the local APIC disabled).

First patch strictly solves the issue of shutdown getting stuck, further
patches aim to quiesce interrupts from all devices (known by Xen) as an
attempt to prevent a spurious "APIC error on CPU0: 00(00)" plus also
make kexec more reliable.

Thanks, Roger.

Roger Pau Monne (5):
  x86/shutdown: offline APs with interrupts disabled on all CPUs
  x86/irq: drop fixup_irqs() parameters
  x86/smp: perform disabling on interrupts ahead of AP shutdown
  x86/pci: disable MSI(-X) on all devices at shutdown
  x86/iommu: disable interrupts at shutdown

 xen/arch/x86/crash.c                        |  8 +++++
 xen/arch/x86/include/asm/irq.h              |  4 +--
 xen/arch/x86/include/asm/msi.h              |  1 +
 xen/arch/x86/irq.c                          | 30 +++++++---------
 xen/arch/x86/msi.c                          | 18 ++++++++++
 xen/arch/x86/smp.c                          | 33 ++++++++++++-----
 xen/arch/x86/smpboot.c                      |  2 +-
 xen/drivers/passthrough/amd/iommu.h         |  1 +
 xen/drivers/passthrough/amd/iommu_init.c    | 17 +++++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 +
 xen/drivers/passthrough/iommu.c             | 12 +++++++
 xen/drivers/passthrough/pci.c               | 39 +++++++++++++++++++++
 xen/drivers/passthrough/vtd/iommu.c         | 19 ++++++++++
 xen/include/xen/iommu.h                     |  3 ++
 xen/include/xen/pci.h                       |  7 ++++
 15 files changed, 166 insertions(+), 29 deletions(-)

-- 
2.46.0



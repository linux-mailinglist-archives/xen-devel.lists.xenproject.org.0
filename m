Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D163A2AC21
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882921.1293012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3ST-00036Y-Mc; Thu, 06 Feb 2025 15:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882921.1293012; Thu, 06 Feb 2025 15:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3ST-00034o-Id; Thu, 06 Feb 2025 15:06:25 +0000
Received: by outflank-mailman (input) for mailman id 882921;
 Thu, 06 Feb 2025 15:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg3SR-0002qa-VJ
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:06:23 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed04cd58-e49b-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 16:06:22 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so166980666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 07:06:22 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab773333a90sm110441566b.130.2025.02.06.07.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:06:20 -0800 (PST)
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
X-Inumbo-ID: ed04cd58-e49b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738854381; x=1739459181; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mVuaqT58tiCs2eba3NO6vkeJ5UG2L/PhFNM6N6K9Ftg=;
        b=srvBMfWPhKpK0DxGYtT5cybDCWQ0HUbNeh7WIH624KYNKdtV8jqP+kzlEYUvP8M/TX
         a741oVzH0O6bHFA5htPiLr9eY3jUv+Ag6CLpQHVfE1OKywsd9iXkKDYvqhgEwYtkQUXT
         J/Qp/BgyZi/I+V76NvzJC7/Qz1Jk0BeboMUiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854381; x=1739459181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVuaqT58tiCs2eba3NO6vkeJ5UG2L/PhFNM6N6K9Ftg=;
        b=qCXxp6I1mIWPofEbBJ1i2QLsw70nAdUKuMQtEfwCTjsXW4hLoyxQqO9vjINaPnse6N
         ze0Z4Gjj0J3+WH+QeFQSupoZrGdvxsIScjbqZ7onEV5COavm7xp1Azh9c22Ys9JV7NWd
         rjFz8L3s6sVddxQI62oLDaopObLZYcNQRmnwzi6NM8Vn241dwpKttpIQbKnwhh9qvl96
         NKjQr7iK8hugTdMimDqNTrnKBQdtFyYATHDY4nl5Qah6uc7wEyZpGthRMt2erpqeB+60
         A9q7EUWhoP78Tq6deRCDeMvha3SFSIp+959DebINGgmJgfKql+oZ2mYmWwnNoJYzZe1K
         LKVg==
X-Gm-Message-State: AOJu0YxYOkE95GXzRkj8MBqo7JiEEFDAMbo3eE8BNndJLd+iiJl3xpaG
	FpEIlDLn8vXdrrdyT9EBvjO8aYyUAE5odO7MBIEO4J8o2ubNeel1vtMfxYBWGTqvIoAe8f4tgkc
	6
X-Gm-Gg: ASbGncvWCThZisES8mxzpOi+RYhYUL3EbLa2OPjEDOd1lRr+BL3qipVwllqfRJkOC3g
	Zaj0Af/fzfC12y30gZLO91KlL25xjjQvUOZwr/mXOsJZmM5D+E0dGA8D55M2vvhhJ5Dk4uvXmeA
	4LBaHfeHAUudKxVGTVpRFRqxMW4GuGUz1pL8CJhYWO+e5KSRiYzN8l1MYnDks29exjgNbq/za8s
	blboJcToWEjUhjs0+GtxCdWHVaDoHt6ttGoX95SA4vSLhE5gKZB/nonw5b+Sp8emtFtlGsc6bMj
	qFnll8IvVkhCU+cppMVE
X-Google-Smtp-Source: AGHT+IHfs+Ljutx8+lgr+D4XU0iQeNqeyDMs3x5eYeGsgN1RecOQ0qouVYrczSFC3t+fwMt89frpnw==
X-Received: by 2002:a17:907:da0:b0:aa6:ac9b:6822 with SMTP id a640c23a62f3a-ab75e21647dmr767552566b.12.1738854380732;
        Thu, 06 Feb 2025 07:06:20 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/5] xen/x86: prevent local APIC errors at shutdown
Date: Thu,  6 Feb 2025 16:06:10 +0100
Message-ID: <20250206150615.52052-1-roger.pau@citrix.com>
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

 xen/arch/x86/crash.c                        |  2 ++
 xen/arch/x86/include/asm/irq.h              |  4 +--
 xen/arch/x86/include/asm/msi.h              |  1 +
 xen/arch/x86/irq.c                          | 30 ++++++++-----------
 xen/arch/x86/msi.c                          | 18 +++++++++++
 xen/arch/x86/smp.c                          | 33 +++++++++++++++------
 xen/arch/x86/smpboot.c                      |  2 +-
 xen/drivers/passthrough/amd/iommu.h         |  1 +
 xen/drivers/passthrough/amd/iommu_init.c    | 17 +++++++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 +
 xen/drivers/passthrough/iommu.c             |  6 ++++
 xen/drivers/passthrough/pci.c               | 33 +++++++++++++++++++++
 xen/drivers/passthrough/vtd/iommu.c         | 19 ++++++++++++
 xen/include/xen/iommu.h                     |  3 ++
 xen/include/xen/pci.h                       |  4 +++
 15 files changed, 145 insertions(+), 29 deletions(-)

-- 
2.46.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B927445A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:34:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjMj-0006jf-II; Tue, 22 Sep 2020 14:33:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGvm=C7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKjMi-0006gf-94
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:33:56 +0000
X-Inumbo-ID: 64d744fc-8a81-4b52-9288-98899a775e7c
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64d744fc-8a81-4b52-9288-98899a775e7c;
 Tue, 22 Sep 2020 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600785226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+tULtu4gkafjx6sfjgXt1g2eQ9D6DVBmaxd4eGdhVbU=;
 b=M/jqMOKeB50eq7ypzGajGKK6I6RU226wZ2X5KRAfIdrtBN4NArhnLs2B
 U3d8/cv3pSWlgVgQsiI/jNtfVjqTOnlH7ozLzqFTdEPnA/zKtArXlVmWZ
 XdHAV6iwU5wuYhw4EgLFzkUl/PncIbFVzdsTWAvmDrk5GLEk3m6ZayCUm Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: U+MBD0bU0zcEtldsgtjSDHuhl9NDGhbFj4kufByUTqaLF+3r1uQDty8zzZcecCRirHamKF+zDc
 wuNcWNhyK+TbZWRLjRS9idfsBo9QXdnXMJizUE3+3ImS8A2GTIQdLN31BOJsMUWfc5fVrpxpiR
 usSFPVMVYeiFNSrpstEx6FYjoHHC01D0HJFjyZAyjAKp65g1WlOaBh2rWg+n6s4Xo15fTTNSfc
 yRtWaaV3SS1wDSrVJ/pguiTcZ6pEQYXItCQXlXKWoXSbmTlUUMhgItlEQ+G6z+BCYrh/ayImzf
 dZc=
X-SBRS: 2.7
X-MesageID: 27552063
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27552063"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/2] XSA-337 followup cleanup
Date: Tue, 22 Sep 2020 16:32:43 +0200
Message-ID: <20200922143245.44595-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Followup patches from XSA-337 to cleanup unused code.

Thanks, Roger.

Roger Pau Monne (2):
  x86/hpet: remove hpet_msi_read
  x86/iommu: remove code to fetch MSI message from remap table

 xen/arch/x86/hpet.c                         | 10 ---
 xen/drivers/passthrough/amd/iommu.h         |  2 -
 xen/drivers/passthrough/amd/iommu_intr.c    | 41 -----------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 -
 xen/drivers/passthrough/pci.c               |  7 --
 xen/drivers/passthrough/vtd/extern.h        |  1 -
 xen/drivers/passthrough/vtd/intremap.c      | 76 ---------------------
 xen/drivers/passthrough/vtd/iommu.c         |  1 -
 xen/include/xen/iommu.h                     |  1 -
 9 files changed, 140 deletions(-)

-- 
2.28.0



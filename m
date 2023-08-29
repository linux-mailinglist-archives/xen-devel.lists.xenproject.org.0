Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4FB78C656
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592238.924900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0W-0004W9-V5; Tue, 29 Aug 2023 13:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592238.924900; Tue, 29 Aug 2023 13:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaz0W-0004TN-RW; Tue, 29 Aug 2023 13:43:48 +0000
Received: by outflank-mailman (input) for mailman id 592238;
 Tue, 29 Aug 2023 13:43:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wiqx=EO=citrix.com=prvs=598c0cf4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qaz0V-0004TH-Bd
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:43:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 119101cc-4672-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 15:43:44 +0200 (CEST)
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
X-Inumbo-ID: 119101cc-4672-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693316624;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8U0y1PFuSfukTU5ScUbS5a3N87QNmkdeKNE5zqlZveY=;
  b=Tk8p3KuOdKNTR+tQJlz55RJZCox8RB8nd6Kq4Kj86qfDZPV3mPIUEWBH
   mJ8zbxd+aVsqCsHJ3FOldYXqVm7TSTRt0qtfvFMImZPiKlgtvYeiANxQm
   ucP24Jy5zQ8liKKl2NHQqgxcvcODvfeIePy+br9tcNdw1PAlS9k2PL4DT
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120997913
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:z8nyRqC+HVRzjRVW/wHjw5YqxClBgxIJ4kV8jS/XYbTApG4mgmYBn
 WIbWGnTbPvZYWageY91aYS0oR4AsJ7cmtdrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMscpvlDs15K6p4GNC7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4tlVOCJn0
 tYiNHMWZR2Mh8Dm0YqcY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4bSFJQKzx/Dz
 o7A1zTjQQ0iOe688hnb6nGDn9D1hzjFG6tHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceRz0s0
 V/PnNrvCnpsqpWaTHuc8vGfqjbaBMQOBTZcP2leF1JDuoS95thp1XojU+qPDoatsf/MWhjX6
 QqW7zM1iroTr54a74KSqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bct/HEwDpU
 Gws3pHHsbtQVc3leDmlGr1lIV2/2xqS3NQwa3ZLFoJpyTmi8mXLkWt4sGAnfxcB3irplFbUj
 K7vVeF5vs870JiCN/Ufj2eN5yMClPOIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJj9VixGVvs+k2HqH4/xNIPHIQhkmQvuqW3TlUz7gdJymlbIIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHXooBQlSdxATXMmmw/G7g8bfemKK7kl9Ua6OqV7gEqQ595loehDgp
 SrjBhEFmQKi2xUq62yiMxheVV8mZr4nxVpTAMDmFQzAN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:NRQW76Hk12c5qOXupLqE0seALOsnbusQ8zAXPhZKOHtom6uj5q
 OTdZUgtSMc5wx7ZJhNo7q90cq7IE80l6Qb3WBLB8bHYOCOggLBEGgF1+bfKlbbdREWmNQw6U
 /OGZIObuEZoTJB/KTHCKjTKadE/OW6
X-Talos-CUID: 9a23:mZI2CWG/C9vuMzpcqmJ/y2wtWekCWEfBj2zbLkC4KzZ4cJq8HAo=
X-Talos-MUID: 9a23:keaUJgVctbCV6QHq/G/2xy1aOfVL2IfwEEMiiKo8odK6dgUlbg==
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="120997913"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 0/3] x86: Debug Regs fixes, part 1
Date: Tue, 29 Aug 2023 14:43:30 +0100
Message-ID: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is the rework of "x86: Fix calculation of %dr6/dr7 reserved bits",
accounting for things which have changed in the past 5 years, and new
discoveries.

In particular, it was buggy to take Roger's R-by.  The logic was correct when
he reviewed it, and was not correct in the forward-port presented.

Introduce enough BusLock infrastructure (avaialble in current/next gen Intel
and AMD CPUs) to get the dr6 calculations up-to-date, and reimplement the
constants logic with reserved bits in a way that's hopefully clear and
acceptable to everyone.

This is part 1 of the work to address the bug Jinoh reported.  Sorry I haven't
had time to sort the rest yet, but at least this is a small bit of progress.

Andrew Cooper (3):
  x86: Reject bad %dr6/%dr7 values when loading guest state
  x86: Introduce new debug.c for debug register infrastructure
  x86: Fix calculation of %dr6/dr7 reserved bits

 xen/arch/x86/Makefile                       |  1 +
 xen/arch/x86/debug.c                        | 46 +++++++++++++++++++++
 xen/arch/x86/domain.c                       | 24 ++++++++++-
 xen/arch/x86/hvm/hvm.c                      | 14 ++++++-
 xen/arch/x86/include/asm/debugreg.h         | 15 +++++--
 xen/arch/x86/include/asm/x86-defns.h        | 21 +++++++++-
 xen/arch/x86/pv/misc-hypercalls.c           | 16 ++-----
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 8 files changed, 117 insertions(+), 21 deletions(-)
 create mode 100644 xen/arch/x86/debug.c

-- 
2.30.2



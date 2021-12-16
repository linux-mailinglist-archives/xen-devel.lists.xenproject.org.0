Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569A8476E59
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247796.427326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTL-0005WK-3V; Thu, 16 Dec 2021 09:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247796.427326; Thu, 16 Dec 2021 09:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTK-0005TF-TK; Thu, 16 Dec 2021 09:54:46 +0000
Received: by outflank-mailman (input) for mailman id 247796;
 Thu, 16 Dec 2021 09:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCpR=RB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxnTJ-00058M-Bu
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:54:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e158ae-5e56-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 10:54:44 +0100 (CET)
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
X-Inumbo-ID: 31e158ae-5e56-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639648484;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ypf6yGKzcUnb+pq7N7OneCROKxixqXUrpk4X+7avZrc=;
  b=Mm9OxxBuVTM8KUGkdoBHOioSWVt4M/EZsgklqoBCbG0yh8Ye4jeomWeI
   wDJDIaUVAKYfbx4oXuwfS8nBchDFlCwshIUylK8JK/GATEVYlaHQlFobq
   uXEDpa+E7xUkqgNVxpPa+JfF+oprTiQ8qQPDvODz+22V84urM3w6uzRdm
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7OjQsFR0nhXs1vmGSztLReQ6LHCYzTPymL54QNEmr/p42OlMkXTiqobBV4ovAdVtbPG2qncoHA
 6CuFLQwdSQ3G1JHlff40ukV7yVCbwRrRQJKDQ95qqeHXKG8/psuyjAjh+v11DOdHWIZg03zLK+
 1qukGLQmxwPJBW0ZbLwPKwWIFroBP1Sh1NCOnxrWSQm+CMMPQ9MJo8tPQxQxVyQyP6O3t8CiTd
 jpgBIWeiVpBDodvkoqaYKFPVsLXXQKDofDUbocXHvu5K+ye4SG0ueKHiDQQOQzUqTDVJ0ts9yh
 Ori/+zvOXsh+tlSizzFh7yY+
X-SBRS: 5.1
X-MesageID: 60174027
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d/2796gcH9GdAljl8WXxQWdPX161uxcKZh0ujC45NGQN5FlHY01je
 htvUG7SMv3fYWP8KIslPty29kxVvJaEy4I2TlE+qnwxRCIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rg29Qx34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0OiKXzbl0PMJbmxuU6SiBHNjwiLYR/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiGP
 pVFMWAwBPjGSwQXAHNKA6oTpr6Tn0jHIiNAo2KM+7VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRARwENdrZ1TuM9FqtgPPCmWXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGj4I/6UiqRdnVRACjrTiPuRt0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nIwLfH8Nj
 HmHpPm3BBt2iaKwVC6N347B+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hie22r0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJc3d/MBuaL9UdF1M2xpjGGeG6bKIN8N+nwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpONPsWp91nfW6TY+NuhXogjxmOMIZmOivpn4GWKJt9zq1zBhEfV8XZ
 /93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1ORDt8VqSPmOx5IOSIXc19z4/1w
 510YWcAoHKXuJENAV/ihqlLZOy9UJBhg2g8OCBwb1+k12J6OdSk7bsFdotxdr4irbQxwflxR
 vgDWsOBHvUQFWiXp2VDNcHw/N54aRCmpQOSJC75MjIxSIFtGl7S8dj+cwqxqCRXVnirtdEzq
 qGL3x/ARcZRXBxrCcvbMar9z164sXUHtvh1Wk/EfotadEn2qdA4IC3tlP4nZcoLLEyblDed0
 g+XBzYepPXM/NBpoIWY2/jcot7wQeVkH0dcE23K1pqMNHHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGYgj5Cr5kJXXaj8BDurcUm+1csAqyH
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCInrqCaVUhyPgWXjH0PJbR4B4op3
 OM9tZNE8Ae4kBcrbo6Lgy08G75g9ZDcv3HLbq0nPbI=
IronPort-HdrOrdr: A9a23:DPEI2awLHmOJqw60l0IlKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60174027"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH 0/6] x86: Support PKS
Date: Thu, 16 Dec 2021 09:54:15 +0000
Message-ID: <20211216095421.12871-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I found a spare half hour, and this turned out to go very smoothly.

It's tentatively RFC right now, because I'm still adding PKS support to the
XTF comprehensive pagewalk test, but the series is definitely fit for review
at this point.

Andrew Cooper (6):
  x86/prot-key: Enumeration for Protection Key Supervisor
  x86/prot-key: Split PKRU infrastructure out of asm/processor.h
  x86/hvm: Context switch MSR_PKRS
  x86/hvm: Enable guest access to MSR_PKRS
  x86/pagewalk: Support PKS
  x86/hvm: Support PKS

 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  2 +-
 xen/arch/x86/cpuid.c                        |  9 +++
 xen/arch/x86/hvm/hvm.c                      |  8 ++-
 xen/arch/x86/hvm/vmx/vmx.c                  | 14 +++++
 xen/arch/x86/include/asm/guest_pt.h         |  5 ++
 xen/arch/x86/include/asm/hvm/hvm.h          |  3 +
 xen/arch/x86/include/asm/msr-index.h        |  2 +
 xen/arch/x86/include/asm/msr.h              |  8 +++
 xen/arch/x86/include/asm/processor.h        | 38 ------------
 xen/arch/x86/include/asm/prot-key.h         | 93 +++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/x86-defns.h        |  1 +
 xen/arch/x86/mm/guest_walk.c                | 16 +++--
 xen/arch/x86/msr.c                          | 17 ++++++
 xen/arch/x86/x86_emulate.c                  |  2 +
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 16 files changed, 174 insertions(+), 46 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/prot-key.h

-- 
2.11.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACB53A469A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 18:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140549.259657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9D-0008RU-ES; Fri, 11 Jun 2021 16:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140549.259657; Fri, 11 Jun 2021 16:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9D-0008Ol-Az; Fri, 11 Jun 2021 16:36:43 +0000
Received: by outflank-mailman (input) for mailman id 140549;
 Fri, 11 Jun 2021 16:36:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pdcj=LF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lrk9B-0008Of-AX
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 16:36:41 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe792084-a39e-4b89-bba2-436f0f98475f;
 Fri, 11 Jun 2021 16:36:39 +0000 (UTC)
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
X-Inumbo-ID: fe792084-a39e-4b89-bba2-436f0f98475f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623429399;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k+DAiAmuwhraKaXytC6IFs7/40wbglrQbj+JD+BONFk=;
  b=Bv2Uhvdn8lC3raRHUvxODZxj2w6ezybcGz+MM5Qfx8X5WQi4dhEy5Qlh
   soeEzu/5VZBek55BSePKqKqqDfVywhKAXTMFdx78uGRzc9Lu09Zz6QSae
   F6UT/PLleAnDg7OAp5ClEriZbiiL1TjKQ/L27j/mumDHLa+1cRKepAdtD
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zxQ5/xyaT28GDUXdUOdrAQioIp0Rn9I7Sb0Ad93qqhg4wRiWJg+ButUdEBLV8rk10x8VBE3OGV
 le8OdVGSshE/HhU9OZHaRO1IEDk1ITuqTzsNebcGyEOSG+8i8Rh1kY11opZGpV8iowLZZH9Csg
 WPJcFBlkDClS/A040ymUau0iplI2FPzH6bDXeu3rZSFiSSmC7sm1ougXMKLf6XemUZvtsjTH75
 ikrgaZSPOLQqn/PHnQ+tWDPFrQEVzr5ockZ8J6Kmphtnv3sYoAgVJWxPvtYJ/tuPJpKnEBnKcA
 pmM=
X-SBRS: 5.1
X-MesageID: 45958352
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QCa4YqHzEo7/RYhCpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.83,265,1616472000"; 
   d="scan'208";a="45958352"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/5] x86/tsx: Consistency and settings test
Date: Fri, 11 Jun 2021 17:36:22 +0100
Message-ID: <20210611163627.4878-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See patch 5 for details.

Andrew Cooper (5):
  x86/platform: Improve MSR permission handling for XENPF_resource_op
  x86/platform: Permit reading the TSX control MSRs via XENPF_resource_op
  x86/msr: Expose MSR_ARCH_CAPS in the raw and host policies
  libs/guest: Move struct xc_cpu_policy into xg_private.h
  tests: Introduce a TSX test

 tools/libs/guest/xg_cpuid_x86.c   |  11 +-
 tools/libs/guest/xg_private.h     |   9 +
 tools/tests/Makefile              |   1 +
 tools/tests/tsx/.gitignore        |   1 +
 tools/tests/tsx/Makefile          |  43 ++++
 tools/tests/tsx/test-tsx.c        | 474 ++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/msr.c                |  14 ++
 xen/arch/x86/platform_hypercall.c |  47 +++-
 xen/arch/x86/psr.c                |   2 +-
 xen/include/asm-x86/cpufeature.h  |   1 +
 10 files changed, 581 insertions(+), 22 deletions(-)
 create mode 100644 tools/tests/tsx/.gitignore
 create mode 100644 tools/tests/tsx/Makefile
 create mode 100644 tools/tests/tsx/test-tsx.c

-- 
2.11.0



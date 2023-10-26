Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8497D89E5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 22:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623984.972338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw7OS-00084w-4G; Thu, 26 Oct 2023 20:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623984.972338; Thu, 26 Oct 2023 20:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw7OS-00083J-1c; Thu, 26 Oct 2023 20:55:52 +0000
Received: by outflank-mailman (input) for mailman id 623984;
 Thu, 26 Oct 2023 20:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MgGv=GI=citrix.com=prvs=656ff9716=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qw7OR-000838-4X
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 20:55:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 089af1ab-7442-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 22:55:48 +0200 (CEST)
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
X-Inumbo-ID: 089af1ab-7442-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698353748;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5cy4xAaZ9wU6f8Lv8BGywX/DUb3HlXjtWjNK6ZZueZA=;
  b=AJYQmvR9pqkyylyw0fCnpFgeGkjWdN0G9mii7lnCYz4htVnOBe/e/G/B
   dQohQKttfBDZG4kaSdKHfClnceZsCjsxVOlXk4zeqywKlS8q6xjjrr9fm
   SsxAaj1PSZ1Aj66wAvVswwL0B6CTv+FnTwO2uPyFw8bNuK3SSZ48XnMlP
   4=;
X-CSE-ConnectionGUID: T+oetjRMTnK/J9d/XjGbxA==
X-CSE-MsgGUID: l8xNbbU5SBOIS2s/a8t6GQ==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 129566474
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ZupAqq0yIbK+ZX9D4vbD5e1xkn2cJEfYwER7XKvMYLTBsI5bpzQBm
 mBLXjjTPfyIYDemKYpybduwp0tXv8LRmN5gGlA+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRkO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPSJJ+
 OAaEhUxaDPEpbO6h4K5ZeN8r5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGc+KkuYC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH5QIwBjE+
 T6uE2LRBkEKEtaV9Ge+2FWNvbXU2iqrRNw9LejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQxy
 lKHltXuQydzubeYTXac8La8pDa+fyMSKAcqdSICTAJD+dDsoYg/hxHIU/5qFaLzhdrwcQwc2
 BjT8nJ43e9Ky5dWhuPkpTgrng5AuLD1DQk4+gfte16jzURbNYLiV46H40jyuKMowJmicrWRg
 JQVs5HAvbBUXMjRznzlrPYlRu/zu6jfWNHIqRs/R8N/qm7FF2uLJ9g43d1oGKt+3i/okxfCZ
 1XavUtq/IVSOnSxBUOcS9nqU5tzpUQM+M6Maxw1UjatSsIoHON/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlMgeR3m3pumDiLHfgXKihLNpLHOxaopUotagPSPojVEovYyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3wYsTXPjLRzhsXrfbeGJOQTh5Y9eImO9JRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg6M+61Bcsm/SpiVcHuVH7xs0UejU+UxP93X/MKkXMPrYSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:qsIWJ6hTjcd3x99OQ75xuTH6jnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:hnUHvG5LKkJlCSCdWdssyA0TF9wnSFjhylSXAR60TlZrZ7eFYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AR6eebgxJY2i2M/ur1eYcm8Pb7dWaqKD+GGYHm6h?=
 =?us-ascii?q?bgOOjFBcqIHCU3CjpbbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,254,1694750400"; 
   d="scan'208";a="129566474"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [PATCH v2 0/2] x86: ucode and CPU Kconfig
Date: Thu, 26 Oct 2023 21:55:37 +0100
Message-ID: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A fix to the recent Ucode changes which I ultimately didn't insist on owing to
the Xen 4.18 timeline, and enough of the start on the CPU Kconfig to allow
randconfig to check the boundary.

There are many more ucode fixes to come...

Andrew Cooper (2):
  x86/ucode: Move vendor specifics back out of early_microcode_init()
  x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and conditionalise ucode

 xen/arch/x86/Kconfig                 |  2 ++
 xen/arch/x86/Kconfig.cpu             | 22 ++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/Makefile  |  4 ++--
 xen/arch/x86/cpu/microcode/amd.c     | 10 +++++++++-
 xen/arch/x86/cpu/microcode/core.c    | 16 +++++-----------
 xen/arch/x86/cpu/microcode/intel.c   | 12 ++++++++++--
 xen/arch/x86/cpu/microcode/private.h | 23 ++++++++++++++++++-----
 7 files changed, 68 insertions(+), 21 deletions(-)
 create mode 100644 xen/arch/x86/Kconfig.cpu

-- 
2.30.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1841DEB9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 18:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200095.354498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVyl7-0001Oc-KM; Thu, 30 Sep 2021 16:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200095.354498; Thu, 30 Sep 2021 16:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVyl7-0001Lx-Ge; Thu, 30 Sep 2021 16:18:09 +0000
Received: by outflank-mailman (input) for mailman id 200095;
 Thu, 30 Sep 2021 16:18:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o/Z=OU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mVyl5-0001Ka-AV
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 16:18:07 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe0dcf38-2209-11ec-bd5a-12813bfff9fa;
 Thu, 30 Sep 2021 16:18:06 +0000 (UTC)
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
X-Inumbo-ID: fe0dcf38-2209-11ec-bd5a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633018686;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8LIacdvWaCNVkUc54HHZZzLmortJQrIHn5Qqs0IThkQ=;
  b=dR9+WF+LIKb/iR+MiELWbnkyJP13Dm8xwHXiJYmsVBgLEJWAhUJGguOR
   N7/QubHVmXdDF/RYbRaFMM55QHKlJ9iLBTu8KxZhyCk1DKurPKsByixJ4
   c+AoiJBxE5W1UYmp5tNFFuP7Ac/0/Ul2RiLlu+1lXHUmcmxosEMkOjroA
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WDieJmFIR/tRTU4DIaM/Qe/Xye0TWdharfQVEmJzCTBgVd+J1lc52f2UvazEVYNjD7iLbtGjfT
 QoAppD0AOwxXl12hdKWVxB/3qL/Xiussw4RJp1JpG+grqoPjyOIUsYRz7EzCxctFzJTW/qMT+4
 r3U4aOG4zTd6VOqmbATJSPVO9DCX+HC1MtWMIOY59l3dIRZY/OOaf9L5CC5fiBLjPh++LGB94S
 sI/XUWWtj4ZFY2UEDWj+N7ZIYI8AEwtpnXsYNlDAXfLutKvuC6XHxczZ2xMB6S6NutWasJitVk
 SKhWGuVU9581drLCTD/LuWDL
X-SBRS: 5.1
X-MesageID: 54455432
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8x9ryKxywEU4qcxiMFR6t+fywSrEfRIJ4+MujC+fZmUNrF6WrkVRz
 2EYDD/QafrYa2vyeop1bYSw8k8AsMDdnIM1TwI+/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrVh2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8hN0
 9lH8qGMcg4KLLH0yOIeCSVZMAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25wSQKuCP
 JBxhTxHXCrsOyBIBHcuS49us/qKv3nxLRNbgQfAzUYwyzeKl1EguFT3C/Lec8aGQsh9lU+Cq
 mXLuW/+B3kyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYCD6TnPi/6P/0BTnHYsCd
 QpEoULCsJTe6mSzcsLxVVqFnEWNnQwAY4pWELcG6SKkn/+8DxmiOkAISTtIadoDvcAwRCA32
 lLho+4FFQCDo5XPFyvCp+78QSeafHhNdDBeNUfoWCNfu7HeTJcPYgUjpzqJOICylMG9PTjtz
 z2QoCE6it3/ZuZQjP7jrDgrb9+2z6UlrzLZBC2LAwpJDSsjPeZJgrBED3CAtp6sy67DEzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qW/3qiL7LNAMvmAhTKuMDiriUWSyC
 KM0kVkMjKK/wVPwNfMnC25PI55CIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrdMuZd2l3tW7T6CGvjGI+GPjOP2iIi9EuxebjNjr4kRscu5neki2
 4wEapTWm0kBCr2Wj+u+2dd7EG3m5EMTXfjew/G7vMbfeGKKwUktVK3cx60PYYtgk/gHn+vE5
 CjlCERZ1ED+lTvMLgDTMiJvb7bmXJBeq3MnPHNzYQb0iiZ7OYv/vr0Cc5YXfKU88LAxx/BDU
 PRYKd6LBe5CS2qb9m1FP4X9toFraD+imRmKY3i+eDE6cpM5H17J99bocxHB7i4LCibr58Iyr
 6f5jlHQQIYZRhQkB8HTMar9w1S0tHkbueRzQ0qXfYUDJBSyqNBncnWjgOU2LscALQT46gGbj
 wvGUw0FoeTtopMu9IWbj66zsIr0QfB1GVBXHjeH4O/uZzXa5Geq3aRJTP2MIWLGTGrx9aivO
 bdVwvX7PKFVlVpGqdMhQbNizKZ47Nrzvb5KiA9jGSyTPVisD7phJFiA3NVO6fIRluMI51PuV
 xLd4MReNJWIJNjhQQwYKwcSZ+ie0e0Zx2vJ5vMvLUSmvCJ68dJri6mJ08VgXMCFEIZIDQ==
IronPort-HdrOrdr: A9a23:tbtmKqs80QIxfyYFnj70Ynps7skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHvJYVcqKRcdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyYygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.85,336,1624334400"; 
   d="scan'208";a="54455432"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 0/2] Fixing gitlab CI tests
Date: Thu, 30 Sep 2021 17:17:18 +0100
Message-ID: <20210930161720.825098-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-pv32-test-fix-v1

Fixing tests due to CONFIG_PV32 missing.

debian:stretch container needs updating due to certificate issue, so also
install qemu in the container.

Anthony PERARD (2):
  automation: switch GitLab x86 smoke test to use PV 64bit binary
  automation: Add qemu to debian:stretch container for smoke test

 automation/build/debian/stretch.dockerfile |  2 ++
 automation/scripts/qemu-smoke-x86-64.sh    | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
Anthony PERARD



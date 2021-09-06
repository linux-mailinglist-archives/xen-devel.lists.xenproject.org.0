Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0399401AD8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 14:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179699.326104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNDJu-0003JU-Mk; Mon, 06 Sep 2021 12:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179699.326104; Mon, 06 Sep 2021 12:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNDJu-0003Gx-JV; Mon, 06 Sep 2021 12:01:50 +0000
Received: by outflank-mailman (input) for mailman id 179699;
 Mon, 06 Sep 2021 12:01:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PlzZ=N4=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mNDJt-0003Gb-Mz
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 12:01:49 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35354346-0f0a-11ec-b0a0-12813bfff9fa;
 Mon, 06 Sep 2021 12:01:47 +0000 (UTC)
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
X-Inumbo-ID: 35354346-0f0a-11ec-b0a0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630929707;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pf01GPhpRixaBcZCDc0yr0gLSvWSydMEpj3W90Q2OU4=;
  b=QzizcM47aFmngZqVWQQk3jdKDp7o238ck78qOwlmbzxLXCAoptelpLkH
   n/AZtJHtmheaN/+/OyjPUqeVxqPqwZKRxCgwv9wRl2tG7ScXwuguKKigN
   UnoeWhyPoAFit14aPsVNWX04hT8KEp9oVtl9NPpUz9d+eThaUtWR0jN5O
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KrnqQUvoYQ1Xtnsjv+2HZft3xh1JM5c3Bmix5ZKZyETZzEyfTYCmerJ8fuCQu/RtSp3h39P4/Z
 CwBl859DY//SyLHaO5NggCnnPmPso640oN4UT5r8dYdl2mYYuriluJZPINeyfUWYth027tHzjv
 0+wzl517PfFLpLV38+vcO4SbCU61UuwLKy8K6bcHAxLsaMjZ5WucHIcll3ysKyTtCwZYFsJGAL
 QibNliFBx9d98Zlbp7kR0XaT/4Lgv/gjSVNlB7yruc96llPuTinH/PvOUicjws91DZBrHxDmvD
 k62KYAMNFG0OosI7ceSUItSH
X-SBRS: 5.1
X-MesageID: 52084907
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NVjIUKHLX7E6fgoSpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52084907"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v1 0/2] x86/cpuid: Use AMD's NullSelectorClearsBase CPUID bit
Date: Mon, 6 Sep 2021 13:00:02 +0100
Message-ID: <cover.1630929059.git.jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (2):
  x86/cpuid: Expose NullSelectorClearsBase CPUID bit to guests
  x86/cpuid: Detect null segment behaviour on Zen2 CPUs

 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  1 +
 xen/arch/x86/cpu/amd.c                      | 18 ++++++++++++++++++
 xen/arch/x86/cpu/cpu.h                      |  1 +
 xen/arch/x86/cpu/hygon.c                    |  5 +++++
 xen/include/asm-x86/cpufeature.h            |  1 +
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 7 files changed, 28 insertions(+)

-- 
2.11.0



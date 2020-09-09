Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6096F262CC2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:00:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwtB-0008SH-PE; Wed, 09 Sep 2020 09:59:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wApk=CS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFwtA-0008SC-30
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 09:59:40 +0000
X-Inumbo-ID: c2848536-0b80-4cb0-89a5-67fffe76b543
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2848536-0b80-4cb0-89a5-67fffe76b543;
 Wed, 09 Sep 2020 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599645580;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FPAx/RvlJ/EJf4tEqFfcetB4x25d8zPxMC6uwwNixVs=;
 b=TKV9x22VeHltr620H/DaXLMl690JYT7HbDzI48TUNiGZKsJf82enbLZF
 urLl2Lk9ZYJgrNkBW3aqrmloVSyIs6FAG3nDGrme/fQH4MKHZPMwyY8YY
 Jia6bV/Ot8H9Pnd8dW53NyMEaqaKEZnTsyzXgZlKGzA14JmnahgvdLKh1 Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QXHVtOM/SBhUtRUCYtJKQbM3Rpmssc9ybpmzOqtDf7TadUfXXAE77yDs/8E1Rmk4ZOFIp12Le6
 ViUYA/rsx2LjlfcI/JKc77mgUd+KKZXjwV+OpZ2SMeqS7GY6lvhFXMeEzEqmRdYPmI0sRjWwug
 B4m143yPGLjxcuGduyY6YD9504GjWzRMCY7MKnrk/RtKFogZ/xR0LDxi7DNgwMgHknsOWBlqI1
 +OLa4NAv4wBRMcOz5C7thHNXeTOFr76uqBfqIvlyltccnBmfTbTWokzinIa2aiiShUe1z+Jpha
 tvw=
X-SBRS: 2.7
X-MesageID: 26611479
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="26611479"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/5] x86/pv: Minor perf improvements in segment handling
Date: Wed, 9 Sep 2020 10:59:15 +0100
Message-ID: <20200909095920.25495-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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

This is follow-on work from the fixes for Linux 5.9 with FSGSBASE.

Andrew Cooper (5):
  x86/asm: Rename FS/GS base helpers
  x86/asm: Split __wr{fs,gs}base() out of write_{fs,gs}_base()
  x86/pv: Optimise prefetching in svm_load_segs()
  x86/pv: Optimise to the segment context switching paths
  x86/pv: Simplify emulation for the 64bit base MSRs

 xen/arch/x86/domain.c             | 72 +++++++++++++++++++++++++++------------
 xen/arch/x86/hvm/svm/svm.c        | 43 +++++++++++------------
 xen/arch/x86/hvm/vmx/vmx.c        |  8 ++---
 xen/arch/x86/pv/domain.c          |  2 +-
 xen/arch/x86/pv/emul-priv-op.c    | 42 ++++++++++++-----------
 xen/arch/x86/x86_64/mm.c          |  8 ++---
 xen/arch/x86/x86_64/traps.c       |  6 ++--
 xen/include/asm-x86/hvm/svm/svm.h |  5 +--
 xen/include/asm-x86/msr.h         | 42 ++++++++++++++---------
 9 files changed, 135 insertions(+), 93 deletions(-)

-- 
2.11.0



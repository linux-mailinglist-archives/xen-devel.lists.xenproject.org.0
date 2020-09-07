Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A531325F86C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 12:32:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFERc-0003c5-1u; Mon, 07 Sep 2020 10:32:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5qx=CQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFERa-0003c0-Qr
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 10:32:14 +0000
X-Inumbo-ID: b4d3b092-e8ea-48bc-925a-2df6b9f23ca4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4d3b092-e8ea-48bc-925a-2df6b9f23ca4;
 Mon, 07 Sep 2020 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599474734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0OPuY5Ul7ePvRK/7cV7F4+v/hzL9w3V6677teS6VUI4=;
 b=LJWUHpNB/z0kF5tUwAzDMir8kKspho4wVzFo7vkFYXGFyuNWmKWjJpVj
 yojKZ+WYwVeA/x7+CZXelZ5CXfAiH/F6urWM0/V7L7gDkmGFF+yQTkjxP
 fVT+ZNamCGHk8G5MNdKFSzwe9wtPVag8W8RANYe2kIvcWCYidNoMoxgQX A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Pzj2ILJOZVuqaNz2SDeSh2fFOwqK+YpmyLNMawMXQWUxtw4F6dbpW9Hn6jM/UE7T9CodVVCrDB
 ImnkJvKIbNIk4h9eZTVjlb5f1kE4dJwOIh5ajgJ/Ugn42uF//Fx41dXQDq2H6sNQLdxx/y6eBV
 tiIaEZm47pXrNby+w6Zs9DebRneQHl7ynkdPmHL7KNz6u5JpnGMAV/UKOQrOBsqiqC09Dg7WMR
 Mo8WD5IpoyVSDm8ZY/Cc2XMvo7AFxH0PffCB15SJejAf7SYhnfTfOGbPyFMfZjV/6dOBOFtQjA
 7gw=
X-SBRS: 2.7
X-MesageID: 26129812
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,401,1592884800"; d="scan'208";a="26129812"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v4 0/5] x86: switch default MSR behavior
Date: Mon, 7 Sep 2020 12:31:38 +0200
Message-ID: <20200907103143.58845-1-roger.pau@citrix.com>
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

The current series attempts to change the current MSR default handling
behavior, which is to silently drop writes to writable MSRs, and allow
reading any MSR not explicitly handled.

After this series access to MSRs not explicitly handled will trigger a
#GP fault. I've tested this series with osstest and it doesn't introduce
any regression, at least on the boxes selected for testing:

http://logs.test-lab.xenproject.org/osstest/logs/153697/

Thanks, Roger.

Andrew Cooper (2):
  x86/hvm: Disallow access to unknown MSRs
  x86/msr: Drop compatibility #GP handling in guest_{rd,wr}msr()

Roger Pau Monne (3):
  x86/svm: handle BU_CFG and BU_CFG2 with cases
  x86/pv: allow reading FEATURE_CONTROL MSR
  x86/pv: disallow access to unknown MSRs

 xen/arch/x86/hvm/svm/svm.c     | 53 ++++++++++++++++++++------------
 xen/arch/x86/hvm/vmx/vmx.c     | 24 +++------------
 xen/arch/x86/msr.c             | 56 +++++++---------------------------
 xen/arch/x86/pv/emul-priv-op.c | 18 ++++++-----
 4 files changed, 60 insertions(+), 91 deletions(-)

-- 
2.28.0



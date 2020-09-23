Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A983227556A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 12:19:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL1ru-0004vK-6S; Wed, 23 Sep 2020 10:19:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqyB=DA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kL1rr-0004v9-Sj
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 10:19:19 +0000
X-Inumbo-ID: b01d076f-62b6-40bc-b648-17519f70000e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b01d076f-62b6-40bc-b648-17519f70000e;
 Wed, 23 Sep 2020 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600856358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F7TG/TteC8REbAvegZm4zjVC/bzlaP7EvWDw3EZZrZE=;
 b=QKh70DjgzGZs4N/orppATrFd5z9hx87913cCdFwNAK39YE/xjhceopLY
 H0cgK+0OqNBeF1OR66eXOINDpT/PFE8gqZ10jV8fWpNya4HdI2zppbvNx
 BC8sqhHj64oXnyzbJ9mw+QlTbpkXjm4IGSSbVizn7rFgEAL1NAVhk09+8 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ICeEvJ0CGQjvxQWuQQDQ0Bs0DB7r2iAbrrgk0Tq7T9xDshOIrEvR3XJ6/cNm5lUrULb756qJpk
 9b/QhEonRbw+UI0XsNCEugAP49QrOIDBZhf5900kLlMSk0rFSrt2WR8JKY4vdF1kL/Sn0Rr8Dz
 BsOYPYz4dF51bMTghVelH+zHVlYdOqeVPFiEJXiNFArdw7QcQ9k23j8Fits31J9PaDLaXGVUxQ
 Ci0uJoJtgmY29CAWMxKXoeKy2SaBBBX3jVCjqcA9DXBtMUJ6q3k/FxAe2y6NCZQ1/8S4dneITE
 0Lw=
X-SBRS: 2.7
X-MesageID: 27361565
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,293,1596513600"; d="scan'208";a="27361565"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andy Lutomirski
 <luto@kernel.org>, Manuel Bouyer <bouyer@antioche.eu.org>
Subject: [PATCH 0/3] x86/pv: Multiple fixes to SYSCALL/SYSENTER handling
 (XSA-339 followup)
Date: Wed, 23 Sep 2020 11:18:45 +0100
Message-ID: <20200923101848.29049-1-andrew.cooper3@citrix.com>
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

Patches 1 and 2 are a consequence of trying to get the Linux x86 selftests to
pass even when running under Xen.

Patches 3 and XSA-339 were further fallout from trying to put in place testing
to cover all aspects of the PV fast system call entrypoints.

Patch 3 was almost an XSA itself, but was ultimately argued as not affecting
any known PV guest.  It turns out that this is only true because of c/s
dba899de14 in 2018, which did fix a real userspace => VM DoS on NetBSD.

All fixes need backporting.

Andrew Cooper (3):
  x86/pv: Don't deliver #GP for a SYSENTER with NT set
  x86/pv: Don't clobber NT on return-to-guest
  x86/pv: Inject #UD for missing SYSCALL callbacks

 xen/arch/x86/x86_64/compat/entry.S |  2 +-
 xen/arch/x86/x86_64/entry.S        | 31 +++++++++++++++++++++----------
 2 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.11.0



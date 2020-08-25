Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707B2517E4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXJo-00030M-Or; Tue, 25 Aug 2020 11:40:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXJn-00030H-P6
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:40:47 +0000
X-Inumbo-ID: 31c57e26-cb00-4e17-965f-1edeaa1f1269
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31c57e26-cb00-4e17-965f-1edeaa1f1269;
 Tue, 25 Aug 2020 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GEvylugId01/K5N3Q9RUZCyLGhGc+fqUxaWCkiQKhRY=;
 b=TOB6ozJbmbQ2WCJcuOBE0acDuhT1NQLsan/wZjCHrCoVOcPfFPkEBsxg
 5tDaQ81gJywnmkQXivj0X04Ugrd7w6Q6qaqDh7Ce40VfrFjMMETtB2eEr
 ES1OIzNaCqejsvuGK1i+6UCrhDlrwhacTZtJl1ui+MfS/KAOkxQKgYAxK E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4QrQ2snYueB69aXzUhTq+QnGKuIIuEWi+tJGqCjW/AA39q3csazLe15xAG2VoNM52yPk0nLBLX
 +BRy0eWLntbAI03+6xMN9CsodbaD/IxuitCZxZNw6ML3mEScUiq0+vBE19F12vcjhUeVKHLLZ9
 AVY0Wn9sPRhHkwBzEgqTAu2Jd/U7Y84cmWcHWq46QrBcJWo1w7W9dhhRwfMJDuRV6LKLxKJ0Dy
 ywBZP+ZQt78V98EBu/AnD7sDIe2PauzBbk5MVPuIdF6GKytb/nbEJbX0ILgivijtSRQvMqlzTy
 lG8=
X-SBRS: 2.7
X-MesageID: 25246371
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25246371"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 00/12] Miscellaneous cleanups
Date: Tue, 25 Aug 2020 12:40:29 +0100
Message-ID: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
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

This small pre-series contains cleanups arising from my test host
reuse work.  The final patch is a feature removal.

Ian Jackson (12):
  ms-queuedaemon: Update for newer Tcl's socket channel ids
  Executive.pm planner: fix typo
  README.planner: Document magic job hostflags
  sg-run-job: Minor whitespace (formatting) changes
  show_abs_time: Represent undef $timet as <undef>
  duration estimator: Fix a warning
  ts-hosts-allocate-Executive: Add a comment about a warning
  target setup refactoring: Move target_kernkind_check
  target setup refactoring: Move target_kernkind_console_inittab
  target setup refactoring: Merge target_kernkind_*
  target setup refactoring: Add a doc comment
  abolish "kernkind"; desupport non-pvops kernels

 Osstest.pm                  |  1 +
 Osstest/Debian.pm           |  3 +-
 Osstest/Executive.pm        |  5 ++--
 Osstest/TestSupport.pm      | 23 ++++++--------
 README                      |  2 +-
 README.planner              | 60 +++++++++++++++++++++++++++++++++++++
 make-hosts-flight           |  1 -
 mfi-common                  |  7 ++---
 ms-queuedaemon              | 10 +++----
 sg-run-job                  |  8 ++---
 ts-debian-fixup             |  5 ++--
 ts-hosts-allocate-Executive |  4 +++
 12 files changed, 92 insertions(+), 37 deletions(-)

-- 
2.20.1



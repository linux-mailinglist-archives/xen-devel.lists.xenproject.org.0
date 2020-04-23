Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7D1B58FC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYy9-0000B6-97; Thu, 23 Apr 2020 10:20:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYy7-0000AB-93
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:20:31 +0000
X-Inumbo-ID: 0f0d0f76-854c-11ea-933e-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f0d0f76-854c-11ea-933e-12813bfff9fa;
 Thu, 23 Apr 2020 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637231; x=1619173231;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=FA21mCdHll/rCD+CdQJA+A8GO9v6LBIhxlYvWv3fymI=;
 b=FqZbLvn9EsPOxxKqWXbwWZcRSziErBhTbi3nJvNSmOfVbc+VBjBWYqDS
 saUMzTWA/sNAqfrx3ktVJtq59U9uy7DsVYlunoCK/NgCzhUlg2WUaSQ+B
 mEeWA4jrTWWvPStlXh6yP0rbOaPXtpH0wyzYYhurRh5ydxYNhnuKUUZtJ Q=;
IronPort-SDR: Qtdg0ScsyKudTkS6Uwe+BZ1jNO5g82NyOrJWdgcbA4QHpsIQItEEPxbvvOFDU3kbykAOoZLgie
 OjFeAGZ3kGlg==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="39000805"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 23 Apr 2020 10:20:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id C57D0A1BEF; Thu, 23 Apr 2020 10:20:29 +0000 (UTC)
Received: from EX13D02EUC003.ant.amazon.com (10.43.164.10) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:01 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D02EUC003.ant.amazon.com (10.43.164.10) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:20:00 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:19:59 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF v2 v2 0/4] Small fixes and improvements
Date: Thu, 23 Apr 2020 10:19:51 +0000
Message-ID: <20200423101955.13761-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, wipawel@xen.org, paul@xen.org, semelpaul@gmail.com,
 andrew.cooper3@citrix.com, wipawel@amazon.de, nmanthey@amazon.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is the first series of XTF patches I intend to send.
It covers some relatively small changes displaying Xen version on test
start, as well as adding serial consol support for HVM guests..

Paul Semel (1):
  Enabled serial writing for hvm guests

Pawel Wieczorkiewicz (3):
  lib: Add XEN_MAJOR() and XEN_MINOR() macros
  lib: always append CR after LF in vsnprintf()
  setup: Detect and display Xen version on test startup

 arch/x86/setup.c        | 22 +++++++++++++++++++++-
 common/console.c        |  3 ++-
 common/libc/vsnprintf.c | 10 ++++++++++
 common/setup.c          |  6 +++++-
 include/xtf/framework.h |  2 +-
 include/xtf/lib.h       |  3 +++
 tests/xsa-213/main.c    |  4 ++--
 7 files changed, 44 insertions(+), 6 deletions(-)

-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879





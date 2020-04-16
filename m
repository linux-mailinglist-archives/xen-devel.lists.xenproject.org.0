Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C91ABD09
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 11:42:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP12A-0005WZ-Ux; Thu, 16 Apr 2020 09:42:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xq2g=6A=amazon.de=prvs=368a07d89=wipawel@srs-us1.protection.inumbo.net>)
 id 1jP129-0005WF-By
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 09:42:09 +0000
X-Inumbo-ID: 8a4fa7d8-7fc6-11ea-9e09-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a4fa7d8-7fc6-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587030130; x=1618566130;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=N1PTILdmBfZn0k0Ab+em8z55iCcBPHLG1MBSARH7dyg=;
 b=sEft3WfAQREuuD+g9jBzjrYb/4rysG/zSJOhqQfvuaXkaeJO49yRnX32
 NBnbbgMWGR6vPJCM3wlsvoQCXgp1fiYhhY5zUmhVQp34J8EF0rVEaeuv3
 7oTH1SnQ3gpGWot8wQEzhNVQBEjPHPVucU0WqFqfXDMwmsU1/D36TUgEb 4=;
IronPort-SDR: C//d8M9DnvYSECCCxrZ9Up9jtF1y54t7U8++eWZJ9svcIKT+TotKIfB1wKTibmdkvwkB35BF+R
 JOsW0slzsbSw==
X-IronPort-AV: E=Sophos;i="5.72,390,1580774400"; d="scan'208";a="26069913"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 16 Apr 2020 09:41:56 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 28D05A23D6; Thu, 16 Apr 2020 09:41:55 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 09:41:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 09:41:53 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Apr 2020 09:41:52 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 0/4] Small fixes and improvements
Date: Thu, 16 Apr 2020 09:41:37 +0000
Message-ID: <20200416094141.65120-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, paul@xen.org, semelpaul@gmail.com,
 andrew.cooper3@citrix.com, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 nmanthey@amazon.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is the first series of XTF patches I intend to send.
It covers some relatively small fixes to handling of PV console
by HVM guests, as well as adding serial consol support.

Paul Semel (2):
  Enabled serial writing for hvm guests
  setup: Setup PV console for HVM guests on xen >4.2

Pawel Wieczorkiewicz (2):
  lib: Add XEN_MAJOR() and XEN_MINOR() macros
  lib: always append CR after LF in vsnprintf()

 arch/x86/setup.c        | 34 ++++++++++++++++++++++++++++++++--
 common/libc/vsnprintf.c | 10 ++++++++++
 common/setup.c          |  6 +++++-
 include/xtf/framework.h |  2 +-
 include/xtf/lib.h       |  3 +++
 tests/xsa-213/main.c    |  4 ++--
 6 files changed, 53 insertions(+), 6 deletions(-)

-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879





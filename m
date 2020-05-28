Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D21E5D22
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 12:27:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeFkd-0000xN-0S; Thu, 28 May 2020 10:27:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNTM=7K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jeFkb-0000xG-6G
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 10:27:01 +0000
X-Inumbo-ID: c3881828-a0cd-11ea-9dbe-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3881828-a0cd-11ea-9dbe-bc764e2007e4;
 Thu, 28 May 2020 10:27:00 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cSKd4Y6+AIAY/kxhWWVdLKq2BbQ5R7Q1hnlWUyvcGTtuOFAM6q8s0pfJjUh/tV2wSk4hhZPwh9
 E1SEWsEtJF5kyYl1YdBu+QUW/3Khrvs3Qa9QsW08cxj41FbGVYZut6t+rEGqM7TClJ6phuBE9s
 0qjbg5BvcSsU7NCS7azKx7jUDlXZte5zXc91GTHAixTQ5pa2QuD15EP/JY17DLw6RpztWOaVHW
 cZtUKT18dsGi0HqiOabVZi3k6m6gXfMwYvz8bgwJV8UR48zMfxWcIXfCKoNxZlrIbtqTheBVT6
 RXU=
X-SBRS: 2.7
X-MesageID: 18992937
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,444,1583211600"; d="scan'208";a="18992937"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/2] osstest: update FreeBSD guest tests
Date: Thu, 28 May 2020 12:26:46 +0200
Message-ID: <20200528102648.8724-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

The following series adds FreeBSD 11 and 12 guests tests to osstest.
ATM this is only tested on amd64, since the i386 versions had a bug.

The result can be seen at:

http://logs.test-lab.xenproject.org/osstest/logs/150428/

Note this flight has been generated without using the freebsd-{11,12}
hostflags and with the following env variable set:

OSSTEST_JOBS_ONLY=^(.*)freebsd(.*)$,build-(amd64|i386),build-(amd64|i386)-pvops

In order to limit the number of tests run. The runvar difference can be
see in patch #2.

Roger Pau Monne (2):
  freebsd10: refactor code to generate jobs
  freebsd: add FreeBSD 11 and 12 guest jobs

 make-flight | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

-- 
2.26.2



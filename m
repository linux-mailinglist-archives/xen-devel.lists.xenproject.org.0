Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F271F56CF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 16:30:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj1jZ-0005mH-CM; Wed, 10 Jun 2020 14:29:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUV0=7X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jj1jX-0005mB-7c
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 14:29:39 +0000
X-Inumbo-ID: d051aeda-ab26-11ea-b44c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d051aeda-ab26-11ea-b44c-12813bfff9fa;
 Wed, 10 Jun 2020 14:29:38 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 28LQ6243xPtLOg9Tx0FeyTmA79gAsNnUIEDAkrnnC4DYHNuij2MohtLdD0CRCEcQBSktJNWbKf
 K/kJvMbUKD7cqhg884NMWgxThL4qb/qWh5fRCWj1BFbxsttg4lTKv4bmNMDDKgujjHP3KSQ555
 Ddcvatd/MbQGt7DD18P5PJMJcbOl8jYflwyjoAzMtvATiKyUu7BwIEBFe7H98noHtkMpI7YyCz
 FcFfpzd5yHwANiQPyA7iHXscGBRqE+mYaZ8LB6ioXYKHbYu3/grxfm+G9JouOMhLnKORr7b1fQ
 3Oo=
X-SBRS: 2.7
X-MesageID: 20039436
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="20039436"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v2 0/2] x86/passthrough: fixes for PVH dom0 edge
 triggered interrupts
Date: Wed, 10 Jun 2020 16:29:21 +0200
Message-ID: <20200610142923.9074-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Small series with two bugfixes to correctly handle edge triggered
interrupts on PVH dom0.

for-4.14 reasoning: fixes are isolated to PVH dom0 specific passthrough
code (IDENTITY_GSI kind of bindings), and hence shouldn't affect
passthrough to HVM domUs. Without these fixes the RTC timer won't work
correctly on a PVH dom0 because it's edge triggered (GSI 8).

Roger Pau Monne (2):
  x86/passthrough: do not assert edge triggered GSIs for PVH dom0
  x86/passthrough: introduce a flag for GSIs not requiring an EOI or
    unmask

 xen/arch/x86/hvm/irq.c        | 13 ++++++++-----
 xen/drivers/passthrough/io.c  | 24 +++++++++++++++---------
 xen/include/asm-x86/hvm/irq.h |  2 ++
 3 files changed, 25 insertions(+), 14 deletions(-)

-- 
2.26.2



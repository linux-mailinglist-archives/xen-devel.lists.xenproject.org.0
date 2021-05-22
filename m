Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920938D54F
	for <lists+xen-devel@lfdr.de>; Sat, 22 May 2021 12:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131469.245707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkPAa-0001p9-2K; Sat, 22 May 2021 10:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131469.245707; Sat, 22 May 2021 10:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkPAZ-0001mY-VQ; Sat, 22 May 2021 10:47:47 +0000
Received: by outflank-mailman (input) for mailman id 131469;
 Sat, 22 May 2021 10:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZFP=KR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lkPAY-0001mR-As
 for xen-devel@lists.xenproject.org; Sat, 22 May 2021 10:47:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2d3db06-9813-40d2-bb27-4b2dbe71d2c9;
 Sat, 22 May 2021 10:47:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62319ABB1;
 Sat, 22 May 2021 10:47:44 +0000 (UTC)
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
X-Inumbo-ID: a2d3db06-9813-40d2-bb27-4b2dbe71d2c9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621680464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YVW4fFsQp9kFBzeDykkxPl+Pl2140mXCCdzxA1+za9I=;
	b=AaNXEBTRFwWA9N+NX+QIk+DNpndes8olYZO18kkr8miV3r3jVORk8wYbrTesisIpL2xD3o
	4je9K3ghkEiqQ4R6WbzdLG2R9TWpv9/NC51+IQmojAOSMEqKqzU43YTlK1cW6Kl7+Ez8JV
	nfNUOrDoAqqIz4DkokjVNnB0N2aPppw=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.13-rc3
Date: Sat, 22 May 2021 12:47:43 +0200
Message-Id: <20210522104743.10801-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc3-tag

xen: branch for v5.13-rc3

It contains:
- a fix for a boot regression when running as PV guest on hardware without
  NX support
- a small series fixing a bug in the Xen pciback driver when configuring
  a PCI card with multiple virtual functions


Thanks.

Juergen

 arch/x86/xen/enlighten_pv.c      |  8 ++++----
 drivers/xen/xen-pciback/vpci.c   | 14 ++++++++------
 drivers/xen/xen-pciback/xenbus.c | 22 +++++++++++++++++-----
 3 files changed, 29 insertions(+), 15 deletions(-)

Jan Beulich (3):
      x86/Xen: swap NX determination and GDT setup on BSP
      xen-pciback: redo VF placement in the virtual topology
      xen-pciback: reconfigure also from backend watch handler


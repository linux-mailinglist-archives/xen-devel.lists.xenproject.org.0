Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7451E4C36
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 19:43:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je05X-0004OV-Ug; Wed, 27 May 2020 17:43:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NoV=7J=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1je05W-0004OP-7P
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 17:43:34 +0000
X-Inumbo-ID: 94fd9e58-a041-11ea-a76e-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94fd9e58-a041-11ea-a76e-12813bfff9fa;
 Wed, 27 May 2020 17:43:33 +0000 (UTC)
Received: from localhost (mobile-166-175-190-200.mycingular.net
 [166.175.190.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C628B20663;
 Wed, 27 May 2020 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590601412;
 bh=g3K+YeZ1yYJxyeiZYfgVMKP3rgbKk0R7FZQrOzGYFD4=;
 h=From:To:Cc:Subject:Date:From;
 b=JMWwka5vNpbNGWnUUgtimzSN0G8Pvb5P/VTBVcE7vDaIMLZWSEFxt4+jVAomle1UR
 QaZ7Ig7WnzizcmKoBp2qZ+EAKlmGgcPaKhzeJPEPoQNUCrAe7vLoAMfpJ0g8wLPkyv
 Kf2ABixKI9pZl67nVgy2SLj51DIdykhx0R+T+qPY=
From: Bjorn Helgaas <helgaas@kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] xen: Use dev_printk() when possible
Date: Wed, 27 May 2020 12:43:24 -0500
Message-Id: <20200527174326.254329-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Use dev_printk() when possible to include device and driver information in
the conventional format.

Bjorn Helgaas (2):
  xen-pciback: Use dev_printk() when possible
  xenbus: Use dev_printk() when possible

 drivers/xen/xen-pciback/conf_space.c        | 16 +++++----
 drivers/xen/xen-pciback/conf_space_header.c | 40 +++++++++------------
 drivers/xen/xen-pciback/conf_space_quirks.c |  6 ++--
 drivers/xen/xen-pciback/pci_stub.c          | 38 +++++++++-----------
 drivers/xen/xen-pciback/pciback_ops.c       | 38 ++++++++------------
 drivers/xen/xen-pciback/vpci.c              | 10 +++---
 drivers/xen/xenbus/xenbus_probe.c           | 11 +++---
 7 files changed, 70 insertions(+), 89 deletions(-)


base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
-- 
2.25.1



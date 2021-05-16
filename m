Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E4381D23
	for <lists+xen-devel@lfdr.de>; Sun, 16 May 2021 08:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127897.240263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liAIG-0006jy-JG; Sun, 16 May 2021 06:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127897.240263; Sun, 16 May 2021 06:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liAIG-0006hY-Fw; Sun, 16 May 2021 06:30:28 +0000
Received: by outflank-mailman (input) for mailman id 127897;
 Sun, 16 May 2021 06:30:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E7ce=KL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1liAIE-0006Qh-Re
 for xen-devel@lists.xenproject.org; Sun, 16 May 2021 06:30:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd3d4ce5-ec5e-4272-b28f-c559394c2c4a;
 Sun, 16 May 2021 06:30:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8183AFC8;
 Sun, 16 May 2021 06:30:20 +0000 (UTC)
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
X-Inumbo-ID: fd3d4ce5-ec5e-4272-b28f-c559394c2c4a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621146620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v8til0hEEG2JW3BLQ4jQ4a/ff0IVW6Ge5T7xlA6EHMc=;
	b=ga/I6o3hbtGVeR9bAnm8oiI+abMWn1V+1mrd0MCPjkvsQR7mVvBltKDjdXUrzkP9Hvg3nQ
	asO0As6A/ikJO4JKcLrpBSIR0yOrQ+lcCVpsAm8F6PzotWAoyLPmI2ZJ8QVprVr0uk3A0z
	MXXIt3BS4o7OrY+pEQgfLypxEi1jPYI=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.13-rc2
Date: Sun, 16 May 2021 08:30:20 +0200
Message-Id: <20210516063020.3349-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc2-tag

xen: branch for v5.13-rc2

It contains the following patches:

- 2 patches for error path fixes
- a small series for fixing a regression with swiotlb with Xen on Arm


Thanks.

Juergen

 arch/arm/xen/mm.c               | 20 +++++++-------------
 arch/arm64/mm/init.c            |  3 ++-
 drivers/xen/gntdev.c            |  4 +++-
 drivers/xen/swiotlb-xen.c       |  5 +++++
 drivers/xen/unpopulated-alloc.c |  4 +++-
 include/xen/arm/swiotlb-xen.h   | 15 ++++++++++++++-
 6 files changed, 34 insertions(+), 17 deletions(-)

Christoph Hellwig (1):
      arm64: do not set SWIOTLB_NO_FORCE when swiotlb is required

Juergen Gross (2):
      xen/gntdev: fix gntdev_mmap() error exit path
      Merge tag 'for-linus-5.13b-rc2-tag' of gitolite.kernel.org:pub/scm/linux/kernel/git/xen/tip into __for-linus-5.13b-rc2-tag

Stefano Stabellini (2):
      xen/arm: move xen_swiotlb_detect to arm/swiotlb-xen.h
      xen/swiotlb: check if the swiotlb has already been initialized

Zhen Lei (1):
      xen/unpopulated-alloc: fix error return code in fill_list()


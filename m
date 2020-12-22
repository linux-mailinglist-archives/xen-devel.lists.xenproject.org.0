Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5BB2E0CD6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 16:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57959.101629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpA-0006at-FE; Tue, 22 Dec 2020 15:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57959.101629; Tue, 22 Dec 2020 15:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpA-0006aP-Ag; Tue, 22 Dec 2020 15:43:44 +0000
Received: by outflank-mailman (input) for mailman id 57959;
 Tue, 22 Dec 2020 15:43:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krjp8-0006aF-CP
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 15:43:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjp7-0001pd-RN; Tue, 22 Dec 2020 15:43:41 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjp7-0002Vd-HS; Tue, 22 Dec 2020 15:43:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=Nll9lXZt/LBrS6V2JsGc0ecRr3c0eFUXdRQAetw31cY=; b=jN8ILFaTNV7AIRUg2huK5CT/P6
	ChxZc8Be51a+GMb57kaTzZA04VURNzXy3OALTiyNbbHadx9J18InmpAUJYidbAwfm8houbg4Ub75E
	Gj27aDpFEv1pYaj/ZisyJoQKLD7NJ1J/zbnybgBaYjMK6t2kYA5NPg/cVEiiVERJbTu4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15 0/4] xen/iommu: Collection of bug fixes for IOMMU teadorwn
Date: Tue, 22 Dec 2020 15:43:34 +0000
Message-Id: <20201222154338.9459-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series is a collection of bug fixes for the IOMMU teardown code.
All of them are candidate for 4.15 as they can either leak memory or
lead to host crash/host corruption.

This is sent directly on xen-devel because all the issues were either
introduced in 4.15 or happen in the domain creation code.

Cheers,

Julien Grall (4):
  xen/iommu: Check if the IOMMU was initialized before tearing down
  xen/iommu: x86: Free the IOMMU page-tables with the pgtables.lock held
  [RFC] xen/iommu: x86: Clear the root page-table before freeing the
    page-tables
  xen/iommu: x86: Don't leak the IOMMU page-tables

 xen/arch/x86/domain.c               |  2 +-
 xen/drivers/passthrough/iommu.c     | 10 +++++-
 xen/drivers/passthrough/x86/iommu.c | 47 +++++++++++++++++++++++++++--
 xen/include/asm-x86/iommu.h         |  2 +-
 4 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.17.1



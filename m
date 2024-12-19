Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51319F7873
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860965.1272947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCnt-0002NJ-Ea; Thu, 19 Dec 2024 09:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860965.1272947; Thu, 19 Dec 2024 09:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCnt-0002Kx-Ba; Thu, 19 Dec 2024 09:26:45 +0000
Received: by outflank-mailman (input) for mailman id 860965;
 Thu, 19 Dec 2024 09:26:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQ2H=TM=eurecom.fr=ariel.otilibili-anieli@srs-se1.protection.inumbo.net>)
 id 1tOCnr-0002Kr-7r
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:26:43 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b0ade88-bdeb-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 10:26:41 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 10:26:41 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 8C2852260;
 Thu, 19 Dec 2024 10:26:40 +0100 (CET)
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
X-Inumbo-ID: 5b0ade88-bdeb-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734600402; x=1766136402;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DxnzFmAuYsk81Rt5/vcHL2fXrilMEjK+UHr4qOKdwJg=;
  b=GgB2rqIvnbYZrDFHGegSE9OSghVdcp8ywR3cUL5GWrw1rXkh+Jnrr7Qa
   DhAe+63bDA8YwBWL1rWkIHEqJx0t1gJI+Y4OsF4vMJKa8Zlozf71hkdgp
   piNDay5kSIUGRbH9LGFVo+UWKjQOUw5jigat/C2/e/d48Qr0w6jXHTL6s
   4=;
X-CSE-ConnectionGUID: Zrg74N3NQ5KzGXDKrfriHA==
X-CSE-MsgGUID: TwDNy/uAQFqKGWAwhYEXZA==
X-IronPort-AV: E=Sophos;i="6.12,247,1728943200"; 
   d="scan'208";a="28251760"
From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
To: linux-kernel@vger.kernel.org
Cc: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/1] lib: Remove dead code
Date: Thu, 19 Dec 2024 10:21:11 +0100
Message-ID: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch removes a dead code in lib/inflate.c; it follows from a discussion
in Xen.

The dead code is tracked by Coverity-ID 1055253 in Xen, was triggered by a file
taken unmodified from Linux.

Thank you,

Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com/

Ariel Otilibili (1):
  lib: Remove dead code

 lib/inflate.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.47.1



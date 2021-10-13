Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E425042C40A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208605.364797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafcH-0005pS-UX; Wed, 13 Oct 2021 14:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208605.364797; Wed, 13 Oct 2021 14:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafcH-0005nG-RQ; Wed, 13 Oct 2021 14:52:25 +0000
Received: by outflank-mailman (input) for mailman id 208605;
 Wed, 13 Oct 2021 14:52:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kt2p=PB=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mafcG-0005n4-Rv
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:52:24 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id df58f88a-674a-4e9c-870f-c1e3967f021c;
 Wed, 13 Oct 2021 14:52:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76BC5D6E;
 Wed, 13 Oct 2021 07:52:23 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 915683F694;
 Wed, 13 Oct 2021 07:52:22 -0700 (PDT)
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
X-Inumbo-ID: df58f88a-674a-4e9c-870f-c1e3967f021c
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/docs: Clarify legacy DT bindings on UEFI
Date: Wed, 13 Oct 2021 15:52:02 +0100
Message-Id: <20211013145202.53070-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since the introduction of UEFI boot for Xen, the legacy
compatible strings were not supported and the stub code
was checking only the presence of “multiboot,module” to
require the Xen UEFI configuration file or not.
The documentation was not updated to specify that behavior.

Add a phrase to docs/misc/arm/device-tree/booting.txt
to clarify it.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v2:
- dropped redundant wording in docs/misc/arm/device-tree/booting.txt
- Add more details to the commit message
---
 docs/misc/arm/device-tree/booting.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index c6a775f4e8..71895663a4 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -51,6 +51,8 @@ Each node contains the following properties:
 	Xen 4.4 supported a different set of legacy compatible strings
 	which remain supported such that systems supporting both 4.4
 	and later can use a single DTB.
+	However when booting Xen using UEFI, the legacy compatible
+	strings are not supported.
 
 	- "xen,multiboot-module" equivalent to "multiboot,module"
 	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
-- 
2.17.1



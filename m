Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C31420A69
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 13:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201321.355783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMXd-0002Wx-1y; Mon, 04 Oct 2021 11:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201321.355783; Mon, 04 Oct 2021 11:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXMXc-0002U7-Um; Mon, 04 Oct 2021 11:53:56 +0000
Received: by outflank-mailman (input) for mailman id 201321;
 Mon, 04 Oct 2021 11:53:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJPG=OY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mXMXc-0002MH-3Y
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 11:53:56 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id befd8b32-2509-11ec-beab-12813bfff9fa;
 Mon, 04 Oct 2021 11:53:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D781A1FB;
 Mon,  4 Oct 2021 04:53:52 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C3BE3F70D;
 Mon,  4 Oct 2021 04:53:51 -0700 (PDT)
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
X-Inumbo-ID: befd8b32-2509-11ec-beab-12813bfff9fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Andre.Przywara@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 04/14] xen/pci: Include asm/pci.h after pci_sbdf_t in xen/pci.h
Date: Mon,  4 Oct 2021 12:51:59 +0100
Message-Id: <32f30d33e93a971ad748ff8857567846be5c9e31.1633340795.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633340795.git.rahul.singh@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prototypes declared in asm/pci.h that take argument of type pci_sbdf_t
are included in xen/pci.h before defining pci_sbdf_t.

Include asm/pci.h after pci_sbdf_t in xen/pci.h to fix the issue.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in v4: Added in this version
---
---
 xen/include/xen/pci.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 8e3d4d9454..70ac25345c 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -15,7 +15,6 @@
 #include <xen/pfn.h>
 #include <asm/device.h>
 #include <asm/numa.h>
-#include <asm/pci.h>
 
 /*
  * The PCI interface treats multi-function devices as independent
@@ -62,6 +61,8 @@ typedef union {
     };
 } pci_sbdf_t;
 
+#include <asm/pci.h>
+
 struct pci_dev_info {
     /*
      * VF's 'is_extfn' field is used to indicate whether its PF is an extended
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04373D43A
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 22:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554879.866353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfl-0004LV-SJ; Sun, 25 Jun 2023 20:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554879.866353; Sun, 25 Jun 2023 20:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfl-0004Fu-Md; Sun, 25 Jun 2023 20:49:25 +0000
Received: by outflank-mailman (input) for mailman id 554879;
 Sun, 25 Jun 2023 20:49:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDWfk-00049b-Sq
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 20:49:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfk-0003Nd-Hy; Sun, 25 Jun 2023 20:49:24 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfk-00021M-AE; Sun, 25 Jun 2023 20:49:24 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ze41TrTEDnEX29OT1AHfqfE9eyz1GRWB/h0Tzh6x6sw=; b=t6JvaOPPa7AuK8mxOH+M6lRRH7
	I7kQWX8z/QU8gxHbAC6LKuGGrtQToawvnjjGsoCOSw3r/IigPeVa4W9ajiG/uxS/75QnIhFRrYJ4S
	lCebwDwGR9sJlg3z/TrvVzzoEhHiZzHZAnnAk5NHW/3l5kpMZdcnX3kH7i5yMgbCIWNA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 7/9] xen/arm64: head: Rework PRINT() to work when the string is not withing +/- 1MB
Date: Sun, 25 Jun 2023 21:49:05 +0100
Message-Id: <20230625204907.57291-8-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
References: <20230625204907.57291-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The instruction ADR is able to load an address of a symbol that is
within the range +/- 1 MB of the instruction.

While today Xen is quite small (~1MB), it could grow up to 2MB in the
current setup. So there is no guarantee that the instruction can
load the string address (stored in rodata).

So replace the instruction ADR with the pseudo-instruction ADR_L
which is able to handle symbol within the range +/- 4GB.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm64/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index c9e2e36506d9..38f896bdb8e2 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -90,7 +90,7 @@
  */
 #define PRINT(_s)          \
         mov   x3, lr ;     \
-        adr   x0, 98f ;    \
+        adr_l x0, 98f ;    \
         bl    puts    ;    \
         mov   lr, x3 ;     \
         RODATA_STR(98, _s)
-- 
2.40.1



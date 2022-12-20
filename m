Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B267651C9A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466599.725566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLM-0003UK-1G; Tue, 20 Dec 2022 08:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466599.725566; Tue, 20 Dec 2022 08:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLL-0003On-NE; Tue, 20 Dec 2022 08:51:23 +0000
Received: by outflank-mailman (input) for mailman id 466599;
 Tue, 20 Dec 2022 08:51:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLK-0001kP-77
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 79cc520f-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:21 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA52B13D5;
 Tue, 20 Dec 2022 00:52:01 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C02AB3F71A;
 Tue, 20 Dec 2022 00:51:19 -0800 (PST)
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
X-Inumbo-ID: 79cc520f-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 07/18] xen: cppcheck: misra rule 20.7 deviation on compiler.h
Date: Tue, 20 Dec 2022 08:50:49 +0000
Message-Id: <20221220085100.22848-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found a violation of rule 20.7 for the macro
sizeof_field, but the parenthesis cannot be applied on the second
operand of a member access operator, hence we can suppress the
finding.

Eclair and coverity does not report this finding.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/xen/compiler.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index a5631303348b..301ba55d6ecc 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -115,6 +115,7 @@
  * @TYPE: The structure containing the field of interest
  * @MEMBER: The field to return the size of
  */
+/* SAF-0-false-positive-cppcheck R20.7 member-access operator */
 #define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
 
 #if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 201112L
-- 
2.17.1



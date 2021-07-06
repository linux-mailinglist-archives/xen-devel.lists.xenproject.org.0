Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D83BD7A4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151296.279634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kze-0006r4-52; Tue, 06 Jul 2021 13:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151296.279634; Tue, 06 Jul 2021 13:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kze-0006o7-0k; Tue, 06 Jul 2021 13:20:06 +0000
Received: by outflank-mailman (input) for mailman id 151296;
 Tue, 06 Jul 2021 13:20:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0kzc-0006fZ-P4
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:20:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0kzb-0001YF-Jb; Tue, 06 Jul 2021 13:20:03 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0kzb-0001op-AK; Tue, 06 Jul 2021 13:20:03 +0000
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
	bh=AHt4qoHq1+UuC5E67ZQf2Rgi5gaP0PaL/CVC6PtQZl0=; b=s0YSsil34iKrVHTsH6zelac4yq
	L+e2RKSA8Rt1eRnzaNZLsC7/EjMb/zjN9QQphg9yL8rUl0qRM8PgibbLyRZa2U84aYQHjdFIY5lhy
	1jMPirC9ERSrYKKAheNcPYhvrT0p0JYnlK1UynOEdZqfeGx/gB5Dp7EnlT827lGWVfV4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	michal.orzel@arm.com,
	olaf@aepfle.de
Subject: [PATCH] tools/xen-foreign: Update the size for vcpu_guest_{core_regs, context}
Date: Tue,  6 Jul 2021 14:20:00 +0100
Message-Id: <20210706132000.29892-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Commit 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to
uint64_t") updated the size of the structure vcpu_guest_core_regs and
indirectly vcpu_guest_context.

On Arm, the two structures are only accessible to the tools and the
hypervisor (and therefore stable). However, they are still checked
by the scripts in tools/include/xen-foreign are not able to understand
that.

Ideally we should rework the scripts so we don't have to update
the size for non-stable structure. But I don't have limited time
to spend on the issue. So chose the simple solution and update
the size accordingly.

Note that we need to keep vcpu_guest_core_regs around because
the structure is used by vcpu_guest_context and therefore the
scripts expects the generated header to contain it.

Fixes: 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Cc: michal.orzel@arm.com
Cc: olaf@aepfle.de
---
 tools/include/xen-foreign/reference.size | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/include/xen-foreign/reference.size b/tools/include/xen-foreign/reference.size
index a0409db5c458..11a06a7a432c 100644
--- a/tools/include/xen-foreign/reference.size
+++ b/tools/include/xen-foreign/reference.size
@@ -4,8 +4,8 @@ structs                   |   arm32   arm64  x86_32  x86_64
 start_info                |       -       -    1112    1168
 trap_info                 |       -       -       8      16
 cpu_user_regs             |       -       -      68     200
-vcpu_guest_core_regs      |     304     304       -       -
-vcpu_guest_context        |     344     344    2800    5168
+vcpu_guest_core_regs      |     312     312       -       -
+vcpu_guest_context        |     352     352    2800    5168
 arch_vcpu_info            |       0       0      24      16
 vcpu_time_info            |      32      32      32      32
 vcpu_info                 |      48      48      64      64
-- 
2.17.1



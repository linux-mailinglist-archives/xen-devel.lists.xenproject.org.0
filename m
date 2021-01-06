Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22A2EBD66
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 12:59:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62457.110654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx7T9-0006cB-O9; Wed, 06 Jan 2021 11:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62457.110654; Wed, 06 Jan 2021 11:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx7T9-0006bm-Kz; Wed, 06 Jan 2021 11:59:15 +0000
Received: by outflank-mailman (input) for mailman id 62457;
 Wed, 06 Jan 2021 11:54:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wCt=GJ=roman-x580vd=roman@srs-us1.protection.inumbo.net>)
 id 1kx7OQ-0006PW-PT
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:54:22 +0000
Received: from roman-X580VD (unknown [178.151.124.169])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dbeb541-4560-4860-9346-d070ea1399eb;
 Wed, 06 Jan 2021 11:54:21 +0000 (UTC)
Received: from roman-X580VD (localhost [127.0.0.1])
 by roman-X580VD (8.15.2/8.15.2/Debian-18) with ESMTP id 106BRwKO041026;
 Wed, 6 Jan 2021 13:27:58 +0200
Received: (from roman@localhost)
 by roman-X580VD (8.15.2/8.15.2/Submit) id 106BRwpL040994;
 Wed, 6 Jan 2021 13:27:58 +0200
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
X-Inumbo-ID: 6dbeb541-4560-4860-9346-d070ea1399eb
From: Roman Skakun <roman_skakun@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1] arm/optee: Use only least 32 bits for SMC type arg according to SMCCC
Date: Wed,  6 Jan 2021 13:26:57 +0200
Message-Id: <123c27ed53ab50ca6f605a96002dcc7e1b7d3e6e.1609931750.git.rm.skakun@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch added additional sanity and increases an understanding for
getting proper value from the first argument for SMC call on aarch64
according to SMCC Convention.

[0] ARM DEN0028B, page 12

Signed-off-by: Roman Skakun <roman_skakun@epam.com>
---
 xen/arch/arm/tee/optee.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index ee85359742..87060b52b8 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -1643,7 +1643,8 @@ static bool optee_handle_call(struct cpu_user_regs *regs)
     if ( !ctx )
         return false;
 
-    switch ( get_user_reg(regs, 0) )
+    /* Only least 32 bits are significant (see ARM DEN 0028B, page 12) */
+    switch ( (uint32_t)get_user_reg(regs, 0) )
     {
     case OPTEE_SMC_CALLS_COUNT:
         set_user_reg(regs, 0, OPTEE_MEDIATOR_SMC_COUNT);
-- 
2.25.1



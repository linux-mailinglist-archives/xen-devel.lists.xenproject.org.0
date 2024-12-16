Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066DC9F36CC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 17:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858395.1270618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNEPx-0003oV-3M; Mon, 16 Dec 2024 16:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858395.1270618; Mon, 16 Dec 2024 16:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNEPx-0003lt-0h; Mon, 16 Dec 2024 16:58:01 +0000
Received: by outflank-mailman (input) for mailman id 858395;
 Mon, 16 Dec 2024 16:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ults=TJ=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tNEPv-0003ln-LL
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 16:58:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e618e851-bbce-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 17:57:57 +0100 (CET)
Received: from delta.homenet.telecomitalia.it
 (host-82-59-161-229.retail.telecomitalia.it [82.59.161.229])
 by support.bugseng.com (Postfix) with ESMTPSA id 21AA54EE0738;
 Mon, 16 Dec 2024 17:57:54 +0100 (CET)
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
X-Inumbo-ID: e618e851-bbce-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1734368276; bh=IIRKdy9oT95fHBS88XII/+1T1/LoTgdJ1XtpdTtepJw=;
	h=From:To:Cc:Subject:Date:From;
	b=NmAU25MzrNRkTZSTpmnnNtanN2wOg6iIUelp5dMx4GQfg9OyI/GM4E01I39dKQ6Y3
	 IYx0WFY+fFxaoTiD3auR0sBB9KgSMGSjguC7J88OrN4wmMes43u9WHlr4dwbzjEnm9
	 uBzfXsp6ombbpBGyYZgzh32XqIkE6ArAgDy4HLtGHXfdTqNb0SC2gxpodYaIpwHu0F
	 NThSWoHbc2KSV3Ua5vrIYuQdKNjhLJkB9rC0RGgfiAV97h6b51WPnjp4un0HB2+3VB
	 idwyN2WsX+cn297PY7ePpB87vCdhRQ1l98ZjhTmt+LeYA+wXUeaFO0/qbdcNm3fMh+
	 V1nnLIf4OhDxA==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] misra: add deviation for MISRA C Rule R11.8.
Date: Mon, 16 Dec 2024 17:57:45 +0100
Message-ID: <202c8efa4f846018e463f6242d25eb10c015d835.1734367711.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 11.8 states as following: "A cast shall not remove any `const' or
`volatile' qualification from the type pointed to by a pointer".

Function `__hvm_copy' in `xen/arch/x86/hvm/hvm.c' is a double-use
function, where the parameter needs to not be const because it can be
set for write or not. As it was decided a new const-only function will
lead to more developer confusion than it is worth, this violation is
addressed by deviating the function.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
As this patch introduces a deviation for service MC3A2.R11.1, it
depends on the following patch and shall not be applied prior to its
application.
https://lore.kernel.org/xen-devel/cf13be4779f15620e94b99b3b91f9cb040319989.1733826952.git.alessandro.zucchelli@bugseng.com/T/#u
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 2f58f29203..5056669f16 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -393,6 +393,12 @@ Fixing this violation would require to increase code complexity and lower readab
 -config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
 -doc_end
 
+-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a double-use
+function, where the parameter needs to not be const because it can be set for
+writeor not"
+-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*$)))"}
+-doc_end
+
 -doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
 -config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
 }
-- 
2.43.0



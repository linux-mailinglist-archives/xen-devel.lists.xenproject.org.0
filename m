Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8689F6851
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860471.1272488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuzZ-0003QV-6X; Wed, 18 Dec 2024 14:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860471.1272488; Wed, 18 Dec 2024 14:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNuzZ-0003OQ-3o; Wed, 18 Dec 2024 14:25:37 +0000
Received: by outflank-mailman (input) for mailman id 860471;
 Wed, 18 Dec 2024 14:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3vl=TL=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tNuzW-0003OJ-AC
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:25:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f025c815-bd4b-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 15:25:33 +0100 (CET)
Received: from delta.homenet.telecomitalia.it
 (host-82-59-161-229.retail.telecomitalia.it [82.59.161.229])
 by support.bugseng.com (Postfix) with ESMTPSA id 182C34EE0738;
 Wed, 18 Dec 2024 15:25:29 +0100 (CET)
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
X-Inumbo-ID: f025c815-bd4b-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1734531931; bh=nz5SGNzKkrBDkmuzBCerTpwM3pMGyf0Iax1l74zOG2I=;
	h=From:To:Cc:Subject:Date:From;
	b=RSaMPaaq3GVx98PSPjTh2rPLHwwvGBagjZel0BQswfdYZkmZp6un+YF0hG23IWOOY
	 qhHyv7Ub/El9bU08ZOK8eP3dvOa36UB2PTm9sA07UtWi47NJx7n1tDkxFN4WTxJx8h
	 26+MD3ZbipVItAhrtsVdMYXNX+SseMmnNGpHySOs9l/8ebJOEgfUZCX9C1cbaKgtgv
	 zuW/I+TzZ0OMnFo3NJiGz4Fwn8J32O3dG+Ie8M6nJh51C4oO9jq45C1o6vlaY78a1n
	 sQR9ZnHeK1C7+aJmJCT8DldGZGE78OuYZU/jiM3qwLtPZYhK2/Tn3/5WX7MIjC1Z6S
	 4ltda9VLyXFJg==
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] misra: add deviation for MISRA C Rule R11.8.
Date: Wed, 18 Dec 2024 15:25:10 +0100
Message-ID: <7e4f836606d72769a80299c5451f6f7241471d8a.1734530952.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 11.8 states as following: "A cast shall not remove any `const' or
`volatile' qualification from the type pointed to by a pointer".

Function `__hvm_copy' in `xen/arch/x86/hvm/hvm.c' is a double-use
function, where the parameter needs to not be const because it can be
set for write or not. As it was decided a new const-only function will
lead to more developer confusion than it's worth, this violation is
addressed by deviating the function.
All cases of casting away const-ness are accompanied with a comment
explaining why it is safe given the other flags passed in; such comment is used
by the deviation in order to match the appropriate function call.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
As this patch introduces a deviation for service MC3A2.R11.8, it
depends on the following patch and shall not be applied prior to its
application.
https://lore.kernel.org/xen-devel/cf13be4779f15620e94b99b3b91f9cb040319989.1733826952.git.alessandro.zucchelli@bugseng.com/T/#u

Changes from V1:
The deviation has been refined to specify that every instance of casting away
const-ness is accompanied by a comment explaining why it is safe.
This comment is a requirement that has been incorporated into the text defining
the deviation.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 2f58f29203..c9d06b44f4 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -393,6 +393,12 @@ Fixing this violation would require to increase code complexity and lower readab
 -config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
 -doc_end
 
+-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a double-use
+function, where the parameter needs to not be const because it can be set for
+write or not"
+-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*HVMCOPY_to_guest doesn't modify.*$)))"}
+-doc_end
+
 -doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
 -config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
 }
-- 
2.43.0



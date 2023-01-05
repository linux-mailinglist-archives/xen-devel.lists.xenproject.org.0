Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F6A65E738
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 10:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471740.731713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDM8Q-0007ap-6a; Thu, 05 Jan 2023 09:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471740.731713; Thu, 05 Jan 2023 09:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDM8Q-0007Yy-3r; Thu, 05 Jan 2023 09:02:02 +0000
Received: by outflank-mailman (input) for mailman id 471740;
 Thu, 05 Jan 2023 09:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5bW3=5C=linux.alibaba.com=jiapeng.chong@srs-se1.protection.inumbo.net>)
 id 1pDM8O-0007Ys-MA
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 09:02:00 +0000
Received: from out30-8.freemail.mail.aliyun.com
 (out30-8.freemail.mail.aliyun.com [115.124.30.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99c8f410-8cd7-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 10:01:56 +0100 (CET)
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VYvE98r_1672909303) by smtp.aliyun-inc.com;
 Thu, 05 Jan 2023 17:01:51 +0800
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
X-Inumbo-ID: 99c8f410-8cd7-11ed-b8d0-410ff93cb8f0
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R231e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0VYvE98r_1672909303;
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH v2] x86/xen: Remove the unused function p2m_index()
Date: Thu,  5 Jan 2023 17:01:41 +0800
Message-Id: <20230105090141.36248-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function p2m_index is defined in the p2m.c file, but not called
elsewhere, so remove this unused function.

arch/x86/xen/p2m.c:137:24: warning: unused function 'p2m_index'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3557
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -Modify title and submission.

 arch/x86/xen/p2m.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 58db86f7b384..9bdc3b656b2c 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -134,11 +134,6 @@ static inline unsigned p2m_mid_index(unsigned long pfn)
 	return (pfn / P2M_PER_PAGE) % P2M_MID_PER_PAGE;
 }
 
-static inline unsigned p2m_index(unsigned long pfn)
-{
-	return pfn % P2M_PER_PAGE;
-}
-
 static void p2m_top_mfn_init(unsigned long *top)
 {
 	unsigned i;
-- 
2.20.1.7.g153144c



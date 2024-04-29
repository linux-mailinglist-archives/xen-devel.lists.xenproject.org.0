Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95D8B5D67
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714219.1115364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SpX-0003ak-QA; Mon, 29 Apr 2024 15:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714219.1115364; Mon, 29 Apr 2024 15:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SpX-0003Vs-LV; Mon, 29 Apr 2024 15:22:11 +0000
Received: by outflank-mailman (input) for mailman id 714219;
 Mon, 29 Apr 2024 15:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDZ7=MC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s1SpW-0002rB-F6
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:22:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d99815a-063c-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:22:07 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id E100F4EE0752;
 Mon, 29 Apr 2024 17:22:06 +0200 (CEST)
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
X-Inumbo-ID: 3d99815a-063c-11ef-909b-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 3/3] automation/eclair: make explicit there are no adopted files by default
Date: Mon, 29 Apr 2024 17:21:59 +0200
Message-Id: <9d09f9787becdc356c076865e095d0ea97fbba62.1714401209.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714401209.git.federico.serafini@bugseng.com>
References: <cover.1714401209.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to consider no adopted files by default.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/analysis.ecl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index a604582da3..66ed7f952c 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -21,6 +21,10 @@ map_strings("scheduled-analysis",analysis_kind)
 
 -eval_file=toolchain.ecl
 -eval_file=public_APIs.ecl
+
+-doc="Initially, there are no files tagged as adopted."
+-file_tag+={adopted,"none()"}
+
 if(not(scheduled_analysis),
     eval_file("adopted.ecl")
 )
-- 
2.34.1



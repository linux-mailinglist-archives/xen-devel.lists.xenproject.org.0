Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2025C9B4665
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 11:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827199.1241741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5j6G-0002l0-3f; Tue, 29 Oct 2024 10:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827199.1241741; Tue, 29 Oct 2024 10:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5j6G-0002iN-0U; Tue, 29 Oct 2024 10:05:20 +0000
Received: by outflank-mailman (input) for mailman id 827199;
 Tue, 29 Oct 2024 10:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ottI=RZ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1t5j6E-0002iF-HY
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 10:05:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c23a680-95dd-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 11:05:17 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [78.209.134.168])
 by support.bugseng.com (Postfix) with ESMTPSA id C5E004EE074E;
 Tue, 29 Oct 2024 11:05:15 +0100 (CET)
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
X-Inumbo-ID: 4c23a680-95dd-11ef-a0c3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1730196316; bh=wRYHOgPPtTt/Og4v5KLi4jNOtEDDhTloZVW3e84WLG8=;
	h=From:To:Cc:Subject:Date:From;
	b=O/twVt8vOlQDCPhA7pxRMGpEtuJmEgNI2IhgVrtdt3hGXXZuXbYMhK3HCrMtRRsFs
	 6aRMnU76fYsU5kYYoc5SWwvOdSmdO4HR5eX4p+B84rzRIb4vmFiynKMwiWF8+kW8Fx
	 2tdlpIM2miMLnvbgMo9MtMCqsDfzz+LIxfbp0sEt4OtpcqsvWomfNuj2/wHE7Wnz95
	 9lLEX42ozX4fl8v9DwE/2ZBR3yaBBaWYUmFpe8egCeYt/cyJegY2ELvt4xdDZQiA3n
	 Q4lwUMkKT+FkJQIxXk5GcLmNn479W4J/cJ/fQiBO8RTZCshqiLkgQN5wLZDb3VJmh6
	 fjVctTUpOWiyQ==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair: monitor Rules 11.2 and 18.1 and update configuration
Date: Tue, 29 Oct 2024 11:05:00 +0100
Message-ID: <b513d40f6195226b421012e0cf42bb14279cd0b3.1730196105.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rule 11.2 and Rule 18.1 to the monitored set.

Tag Rule 7.3 as clean.
Tag Rule 11.2 and Rule 20.7 as clean only for arm.

Rule 2.2, Rule 9.5 and Directive 4.12 are not accepted:
do not enable them and do not tag them as clean.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/monitored.ecl | 5 ++---
 automation/eclair_analysis/ECLAIR/tagging.ecl   | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
index 4d9ef1bd83..4e1deef7a7 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -6,13 +6,11 @@
 -enable=MC3R1.D4.7
 -enable=MC3R1.D4.10
 -enable=MC3R1.D4.11
--enable=MC3R1.D4.12
 -enable=MC3R1.D4.14
 -enable=MC3R1.R1.1
 -enable=MC3R1.R1.3
 -enable=MC3R1.R1.4
 -enable=MC3R1.R2.1
--enable=MC3R1.R2.2
 -enable=MC3R1.R2.6
 -enable=MC3R1.R3.1
 -enable=MC3R1.R3.2
@@ -43,10 +41,10 @@
 -enable=MC3R1.R9.2
 -enable=MC3R1.R9.3
 -enable=MC3R1.R9.4
--enable=MC3R1.R9.5
 -enable=MC3R1.R10.1
 -enable=MC3R1.R10.2
 -enable=MC3R1.R11.1
+-enable=MC3R1.R11.2
 -enable=MC3R1.R11.7
 -enable=MC3R1.R11.8
 -enable=MC3R1.R11.9
@@ -66,6 +64,7 @@
 -enable=MC3R1.R17.4
 -enable=MC3R1.R17.5
 -enable=MC3R1.R17.6
+-enable=MC3R1.R18.1
 -enable=MC3R1.R18.2
 -enable=MC3R1.R18.6
 -enable=MC3R1.R18.8
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 76032b1fe1..e1d4ed012a 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -28,7 +28,6 @@ MC3R1.D4.14||
 MC3R1.R1.1||
 MC3R1.R1.3||
 MC3R1.R1.4||
-MC3R1.R2.2||
 MC3R1.R2.6||
 MC3R1.R3.1||
 MC3R1.R3.2||
@@ -42,6 +41,7 @@ MC3R1.R6.1||
 MC3R1.R6.2||
 MC3R1.R7.1||
 MC3R1.R7.2||
+MC3R1.R7.3||
 MC3R1.R7.4||
 MC3R1.R8.1||
 MC3R1.R8.2||
@@ -54,7 +54,6 @@ MC3R1.R8.14||
 MC3R1.R9.2||
 MC3R1.R9.3||
 MC3R1.R9.4||
-MC3R1.R9.5||
 MC3R1.R10.2||
 MC3R1.R11.6||
 MC3R1.R11.7||
@@ -109,11 +108,11 @@ MC3R1.R22.10"
 -setq=target,getenv("XEN_TARGET_ARCH")
 
 if(string_equal(target,"x86_64"),
-    service_selector({"additional_clean_guidelines","MC3R1.D4.3"})
+    service_selector({"additional_clean_guidelines","none()"})
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.3||MC3R1.R16.3||MC3R1.R16.6"})
+    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.3||MC3R1.R16.6||MC3R1.R20.7"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
-- 
2.43.0



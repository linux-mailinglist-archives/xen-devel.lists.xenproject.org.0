Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076B891771
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 12:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699357.1092187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8u-0007bH-Pl; Fri, 29 Mar 2024 11:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699357.1092187; Fri, 29 Mar 2024 11:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8u-0007WX-J9; Fri, 29 Mar 2024 11:11:28 +0000
Received: by outflank-mailman (input) for mailman id 699357;
 Fri, 29 Mar 2024 11:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVj/=LD=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rqA8s-0006qu-KZ
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 11:11:26 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13de8de8-edbd-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 12:11:23 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id F080A800AB;
 Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id BB6D8202A9; Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
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
X-Inumbo-ID: 13de8de8-edbd-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711710682;
	bh=gQdWCDqh5zFcK/ZMx9JSLjpUrWRQkvbUNQcXRiak9pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f4eP/5IlAfpJBFxFvkLT/sK9fXPQCirqm/Qd0hf0AdY30Pejr5275U/JC0zCluNY6
	 KhNSPODwnILmcRaPLLpCYe3wcUImIaffWXJupx2tLynnhohTvBMnnWBuW2qrVlNX1t
	 0JfgTNK2mBdsroKfAlPVyQ8jcGth7L44GP5xpkCk=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v2 3/6] tools/misc: xenwatchdogd: add static qualifier
Date: Fri, 29 Mar 2024 11:10:53 +0000
Message-Id: <20240329111056.6118-4-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240329111056.6118-1-leigh@solinno.co.uk>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Make all functions except main() static in xenwatchdogd.c. Also make
the remaining global variable static.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/misc/xenwatchdogd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index 35a0df655a..2e7f9f51c5 100644
--- a/tools/misc/xenwatchdogd.c
+++ b/tools/misc/xenwatchdogd.c
@@ -11,11 +11,11 @@
 #include <stdio.h>
 #include <stdbool.h>
 
-xc_interface *h;
+static xc_interface *h;
 static bool safeexit = false;
 static bool done = false;
 
-void daemonize(void)
+static void daemonize(void)
 {
     switch (fork()) {
     case -1:
@@ -38,12 +38,12 @@ void daemonize(void)
         err(EXIT_FAILURE, "reopen stderr");
 }
 
-void catch_exit(int sig)
+static void catch_exit(int sig)
 {
     done = true;
 }
 
-void catch_usr1(int sig)
+static void catch_usr1(int sig)
 {
     safeexit = true;
     done = true;
-- 
2.39.2



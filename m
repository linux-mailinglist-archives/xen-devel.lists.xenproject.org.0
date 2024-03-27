Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1FA88EDF8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 19:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698686.1090699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnR-000513-QP; Wed, 27 Mar 2024 18:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698686.1090699; Wed, 27 Mar 2024 18:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnR-0004vn-I2; Wed, 27 Mar 2024 18:14:45 +0000
Received: by outflank-mailman (input) for mailman id 698686;
 Wed, 27 Mar 2024 18:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSYu=LB=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rpXmv-0004pv-Ek
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 18:14:13 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfe395f7-ec65-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 19:14:12 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id B0F4B8009F;
 Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 86739202A8; Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
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
X-Inumbo-ID: cfe395f7-ec65-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711563251;
	bh=JDIuy3KhnVNygJWUuL86c9BvLnjCSC0gyIjiqhIaOR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cwUuo4NJyABfEk6Zpckz7ZK35hiSzNFLUrnCwKZmyF6SYyGvbeQDYuJKy9/1jKrNg
	 UbljzUuah9nj65NmAqNlxA3UBGPBPx4ZMFNFGWdBQBEbDxYXcLMjV+uTp34AH1+Pfp
	 JDiHNMSniZw3roF9pEZJtJz2WZLZZ5FVq48wKz4M=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH 3/6] tools/misc: xenwatchdogd: make functions static
Date: Wed, 27 Mar 2024 18:13:50 +0000
Message-Id: <20240327181353.10951-4-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240327181353.10951-1-leigh@solinno.co.uk>
References: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
 <20240327181353.10951-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Make all functions except main() static in xenwatchdogd.c.
---
 tools/misc/xenwatchdogd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index d4da0ad0b6..224753e824 100644
--- a/tools/misc/xenwatchdogd.c
+++ b/tools/misc/xenwatchdogd.c
@@ -15,7 +15,7 @@ xc_interface *h;
 bool safeexit = false;
 bool done = false;
 
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



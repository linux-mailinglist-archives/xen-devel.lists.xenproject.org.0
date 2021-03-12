Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62423398D5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 22:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97342.184928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKoyS-0001Zh-5G; Fri, 12 Mar 2021 21:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97342.184928; Fri, 12 Mar 2021 21:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKoyS-0001ZI-21; Fri, 12 Mar 2021 21:05:32 +0000
Received: by outflank-mailman (input) for mailman id 97342;
 Fri, 12 Mar 2021 21:05:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oc3E=IK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lKoyQ-0001ZD-PZ
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 21:05:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b83948e-7b7d-49d8-9c41-682aa6d7868d;
 Fri, 12 Mar 2021 21:05:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C45264F2A;
 Fri, 12 Mar 2021 21:05:29 +0000 (UTC)
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
X-Inumbo-ID: 9b83948e-7b7d-49d8-9c41-682aa6d7868d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615583129;
	bh=0QNIPZgMEwF/WodAJ21fXlLPnZdWQNpPxT2BnDMPf0I=;
	h=From:To:Cc:Subject:Date:From;
	b=UWCAlPFlDPPZfZj65LbohqwThK7rpds/NUuaf0KN6x6DtYxENo+JU+cjgaOwU5yDo
	 FxsZ/ayHW3lthZQoPWfBYIcDJFPRtur+qTcXf8cm+oDltI+bDuUtVrKTgtk4GR/IXP
	 dalhyXd37qjghB579pON9WlKY3z7GchOGgGEcPEt5igBZ8XILfvIWmnC+Ax9RQiMo6
	 CgB2QRpZcG3QEajrdVfTGo/JVhwv+5rgaKC3EXP68On4af4xYJsXI8+5h1RlDXSnUg
	 oisEU1SF0ogdQZhE98So1vWMYerc4fpu5niLrbH3GNtBrW/QOncO3hpVeBWgGNS+aY
	 FhQZBlPBtUO5g==
From: Stefano Stabellini <sstabellini@kernel.org>
To: cardoe@cardoe.com
Cc: sstabellini@kernel.org,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] automation: remove allow_failure from Alpine Linux jobs
Date: Fri, 12 Mar 2021 13:05:26 -0800
Message-Id: <20210312210526.14862-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Now that the Alpine Linux build jobs complete successfully on staging we
can remove the "allow_failure: true" tag.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/build.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 23ab81d892..cca2c310e2 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -434,25 +434,21 @@ alpine-3.12-gcc:
   extends: .gcc-x86-64-build
   variables:
     CONTAINER: alpine:3.12
-  allow_failure: true
 
 alpine-3.12-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
     CONTAINER: alpine:3.12
-  allow_failure: true
 
 alpine-3.12-clang:
   extends: .clang-x86-64-build
   variables:
     CONTAINER: alpine:3.12
-  allow_failure: true
 
 alpine-3.12-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
     CONTAINER: alpine:3.12
-  allow_failure: true
 
 
 # Arm builds
-- 
2.17.1



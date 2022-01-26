Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB4449C0D8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 02:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260644.450488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCXNQ-0001Z2-F3; Wed, 26 Jan 2022 01:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260644.450488; Wed, 26 Jan 2022 01:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCXNQ-0001XC-90; Wed, 26 Jan 2022 01:45:36 +0000
Received: by outflank-mailman (input) for mailman id 260644;
 Wed, 26 Jan 2022 01:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pz6t=SK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCXNP-0001X6-8z
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 01:45:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a589e0f4-7e49-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 02:45:33 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D54461583;
 Wed, 26 Jan 2022 01:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF35C340E0;
 Wed, 26 Jan 2022 01:45:30 +0000 (UTC)
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
X-Inumbo-ID: a589e0f4-7e49-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643161530;
	bh=D9QCx8tErIgPSpghBzu3gO4U7oJe6Bs/keFgXoZPebE=;
	h=From:To:Cc:Subject:Date:From;
	b=onq/hE8t1Q7fdPmSh4wyxS/ZtjoeFiax+vduAkHFatIlGvqiCa6/y3/WElR9Pxc5n
	 T3Ki8OG1P/mdX1RxXijWG8jqwn+hbITMVePo81jcsj0QEOLhVUcR7aaykN3wm8EBgm
	 a1ql+IKh0WwMy+YSc5Y5V5RZascuwD3TKc1VB8j5azmuJEhXFxLoAY4ji4ExWsT3M6
	 GeAInG4p27GxNYH0N/BenBkaf0Do16O6uBWacSxm6IbbIxWxupIlWGhlUXhX1lMxaO
	 Iv6lPSPIyFB48L5chG7shb8+BSzeX+TdyQwzVsqxHfMeZ/Vr5wIeVKt4+yzJCMB3Gz
	 OL8+tjE9IOgGQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	anthony.perard@citrix.com,
	andrew.cooper3@citrix.com,
	wl@xen.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] automation: remove python-dev from debian unstable build containers
Date: Tue, 25 Jan 2022 17:45:28 -0800
Message-Id: <20220126014528.1826070-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Debian unstable doesn't have the legacy python-dev package anymore.
Note: only the arm64v8 container has been rebuilt.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v2:
- remove python-dev from all debian unstable containers
---
 automation/build/debian/unstable-arm64v8.dockerfile | 1 -
 automation/build/debian/unstable-i386.dockerfile    | 1 -
 automation/build/debian/unstable.dockerfile         | 1 -
 3 files changed, 3 deletions(-)

diff --git a/automation/build/debian/unstable-arm64v8.dockerfile b/automation/build/debian/unstable-arm64v8.dockerfile
index 4409f596e1..5c73458d9d 100644
--- a/automation/build/debian/unstable-arm64v8.dockerfile
+++ b/automation/build/debian/unstable-arm64v8.dockerfile
@@ -15,7 +15,6 @@ RUN apt-get update && \
         zlib1g-dev \
         libncurses5-dev \
         libssl-dev \
-        python-dev \
         python3-dev \
         xorg-dev \
         uuid-dev \
diff --git a/automation/build/debian/unstable-i386.dockerfile b/automation/build/debian/unstable-i386.dockerfile
index 06ffb97384..6ce54a481b 100644
--- a/automation/build/debian/unstable-i386.dockerfile
+++ b/automation/build/debian/unstable-i386.dockerfile
@@ -17,7 +17,6 @@ RUN apt-get update && \
         zlib1g-dev \
         libncurses5-dev \
         libssl-dev \
-        python-dev \
         python3-dev \
         xorg-dev \
         uuid-dev \
diff --git a/automation/build/debian/unstable.dockerfile b/automation/build/debian/unstable.dockerfile
index bd61cd12c2..9de766d596 100644
--- a/automation/build/debian/unstable.dockerfile
+++ b/automation/build/debian/unstable.dockerfile
@@ -15,7 +15,6 @@ RUN apt-get update && \
         zlib1g-dev \
         libncurses5-dev \
         libssl-dev \
-        python-dev \
         python3-dev \
         xorg-dev \
         uuid-dev \
-- 
2.25.1



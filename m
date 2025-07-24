Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BBB103BA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 10:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055463.1423865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uerSZ-0006ZM-5V; Thu, 24 Jul 2025 08:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055463.1423865; Thu, 24 Jul 2025 08:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uerSZ-0006XF-2r; Thu, 24 Jul 2025 08:37:51 +0000
Received: by outflank-mailman (input) for mailman id 1055463;
 Thu, 24 Jul 2025 08:37:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uerSX-0006X9-2Y
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 08:37:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uerSW-00GUMs-1m;
 Thu, 24 Jul 2025 08:37:48 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uerSW-00APpr-0a;
 Thu, 24 Jul 2025 08:37:48 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=SicBP9AGEmB8+UmuZIm06yzBG5AuaCLTkKlhn3wBLV8=; b=VIP4v7OvByIbgDZ9YioRyKwq3g
	Y0k4e0Son02CSNM9KyuK4AH6x5XPMoQc8LLNrkkzIVO0uJCN0C7cBwvcq1/v/N/y1aeHz/z3h7+sG
	9XYZjYFPhlO22z017FHSk16LEUe65Zud8j9g7La3aMMmNrN6I1oM2u7mzhUdAHxBoy4E=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] CI: Add and use ccache in build-each-commit job
Date: Thu, 24 Jul 2025 10:37:20 +0200
Message-Id: <20250724083720.45229-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    The job build-each-commit is a bit faster, and can do about twice as
    much builds.
    
        https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/10785719529
    
    I haven't updated the container yet.

 automation/build/debian/12-x86_64.dockerfile | 3 +++
 automation/gitlab-ci/build-each-commit.sh    | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
index 6e0a403f64..e26a19079e 100644
--- a/automation/build/debian/12-x86_64.dockerfile
+++ b/automation/build/debian/12-x86_64.dockerfile
@@ -54,6 +54,9 @@ RUN <<EOF
         expect
         qemu-system-x86
 
+        # for build-each-commit-gcc
+        ccache
+
         # for qemu-alpine-x86_64-gcc
         busybox-static
         cpio
diff --git a/automation/gitlab-ci/build-each-commit.sh b/automation/gitlab-ci/build-each-commit.sh
index 08fddecbbe..166392fffd 100755
--- a/automation/gitlab-ci/build-each-commit.sh
+++ b/automation/gitlab-ci/build-each-commit.sh
@@ -12,6 +12,11 @@ if [[ $? -ne 0 ]]; then
     exit 0
 fi
 
+if [ -d /usr/lib/ccache ]; then
+    echo "Building with ccache"
+    PATH="/usr/lib/ccache:$PATH"
+fi
+
 echo "Building ${BASE}..${TIP}"
 
 NON_SYMBOLIC_REF=1 ./automation/scripts/build-test.sh ${BASE} ${TIP} \
-- 
Anthony PERARD



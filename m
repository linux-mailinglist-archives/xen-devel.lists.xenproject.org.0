Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3016A207A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 18:29:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501344.773059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbsz-0000wB-4O; Fri, 24 Feb 2023 17:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501344.773059; Fri, 24 Feb 2023 17:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbsz-0000ss-0K; Fri, 24 Feb 2023 17:29:33 +0000
Received: by outflank-mailman (input) for mailman id 501344;
 Fri, 24 Feb 2023 17:29:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+11/=6U=citrix.com=prvs=4121c3e27=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pVbsx-0000bj-Bx
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 17:29:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c88de6ac-b468-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 18:29:28 +0100 (CET)
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
X-Inumbo-ID: c88de6ac-b468-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677259768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dKjZmvLIgfgTCPTPD7KJgT13Ikz4Lhyv/yjVesUtAEg=;
  b=afhjV7klf2BlKyDKMxKNl0jYh1We3+k1Ss5y1DdWJ5KpKHjf6gxr1LEp
   1MGt2v7r2UvXRlG+w3MW5EC+JiijO4gylvNrUsKLK3a28xX3I87TEBZKe
   wBlrVr5NEOLslqxS45YNTQm7HS+1X2TmQ78Q8Se1eEVoC3PmPtRJd8zs/
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97830161
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7XdTr6MY1mOmKNnvrR29l8FynXyQoLVcMsEvi/4bfWQNrUp0gTZVy
 WAaDWDSO/7cMGvxf4onPtu180JX6p7SmoRlSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5ABmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v4wGltV+
 K0fERAAZS6dmLmv3bmpbsA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3VFZ4NxxjBz
 o7A1zm6XColMJuv8yeE3lKqt8HLjH7cYI1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaPtwQQXNd4GOQg5AaAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRSXKa9ECzHsO3O9HXrZHZTdDVZDcMZcecby8Gku7sog0PId/ZuG5CrkYbsBDri5
 xnf+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm8zb67omhezO
 ic/XD+9A7cCVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOgD+0zxd2zvxua
 cbznSOQ4ZEyU/kP8dZLb71Fje9DKt4WmAs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6OOneh8I9Q4xsy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQioLhG/HNXqnkU8GAA==
IronPort-HdrOrdr: A9a23:L5dqDq17o66h+ZbCd2jvXwqjBWByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OUtQ/+xoXZPtfZqyz+8Q3WB8B8bBYOCEghrKEGgB1/qa/9SIIUSXmYA86U
 4JSdkHNDSaNykcsS+V2njcLz8V+qj9zEnkv5as815dCSVRL41w5QZwDQiWVmVwWQl9HJI8UL
 6R/NBOqTaMcWkeKp3TPAhxY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortU
 LFjwv6zKO+tOzT8G6v60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIL9sXrWT1QpF3t1GvDwR8e
 XkklMFBYBe+nnRdma6rV/GwA/7ygsj7Hfk1BuxnWbjidaRfkNxN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnzUQ1wnEbcmwtorQcqtQ0TbWIiUs4ZkWVfxjIiLH44JlOM1GnzKp
 gnMCnejMwmDm9yIUqp8lWH++bcIkjbLi32P3TqhfblqQS+vEoJvnfwl/Zv7kvosqhNP6V52w
 ==
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="97830161"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v3 1/4] automation: Use EOL tag for Jessie container
Date: Fri, 24 Feb 2023 17:29:12 +0000
Message-ID: <20230224172915.39675-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224172915.39675-1-anthony.perard@citrix.com>
References: <20230224172915.39675-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As Jessie is EOL, the official tag isn't supported anymore. Also, the
GPG key for the packages on the repository on the official image are
expired and it isn't possible to update or install packages.

But we can use the image from "debian/eol" tag which use repositories
from archive.debian.org and have workaround to ignore the validity
date of the keys.

There isn't a dedicated i386 tag for jessie, but we can ask docker to
pull the i386 image of the "debial/eol:jessie" tag.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - new patch, this replace "automation: Ignore package authentification issue in Jessie container"
    
    workaround I've seen in the debian/eol:jessie:
        'Acquire::Check-Valid-Until "false";' in /etc/apt/apt.conf.d/
    And a script to replace the "gpgv" binary used by apt, which check that
    the only issue with a signature is that the key has expired.

 automation/build/debian/jessie-i386.dockerfile | 2 +-
 automation/build/debian/jessie.dockerfile      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index b152d658d3..c9ac15a3ff 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -1,4 +1,4 @@
-FROM i386/debian:jessie
+FROM --platform=linux/i386 debian/eol:jessie
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 1e33e635d2..63b2c1e5b7 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:jessie
+FROM debian/eol:jessie
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-- 
Anthony PERARD



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C35C69E534
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 17:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499022.770044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwA-00076n-Vm; Tue, 21 Feb 2023 16:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499022.770044; Tue, 21 Feb 2023 16:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVwA-00071p-N0; Tue, 21 Feb 2023 16:56:18 +0000
Received: by outflank-mailman (input) for mailman id 499022;
 Tue, 21 Feb 2023 16:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJL1=6R=citrix.com=prvs=409c08766=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pUVw7-0006LK-V8
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 16:56:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1a83510-b208-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 17:56:08 +0100 (CET)
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
X-Inumbo-ID: a1a83510-b208-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676998568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vyg/T9XMUEE68jg+6QZXY7ebqN0NWemozUvwP8WqujU=;
  b=K6exygKpgoRC1snPAf10ED/JT3Ay6YAxv3zniv29YdDMTGqRsUgqwMDG
   TklOBXFauFwOaWlYdgYCgndRj7YD0qzg19T2hzky0k5HSf3VU23DeiLMi
   /QWGZpzFzO0tiUnwD9mGnvRjYVI3zkMYWcaewY9Nf37gx4sR8Hii2G+DF
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97316291
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:TbFGLq+s2lGsd2BdGqwMDrUDmn6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 DFMWGGBM/+LYzP2KI9yatvjpBtQupDTyIVnQQRqq3g8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmP6oS5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkTz
 dIXERERPiuJuPqt6ZihcsRt3/4aeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0EwR3B+
 DiXpgwVBDkeGt3OzxWuokv0rffrmznSAo4LDLyBo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0UNNKH+o3wAqE0KbT7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9dJ6G3u7K93XoY3FTdDJcI3ZeFmPp/uUPvqlutjzAd/d/QJW/scXuMBvq+
 x2L9RIH0uB7YdEw6423+lXOgjSJr5fPTxIo6gi/Yl9J/j+Vd6b+OdX2tAGzAeJoad/AEwLf5
 CRsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iQsI2KBj
 Kz741k5CHpv0JyCNPYfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZzz/Bma
 c/LLp/3VR727JiLKxLsGo8gPUIDnHhilQs/u7imp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bqO3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJIdI7wf4Ozb+Rp
 hlQmCZwkTLCuJEOEi3SAlgLVV8ldcwXQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:QW8CjqocuN6YBWyuhW0PBCYaV5rdeYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VAssRQb8+xoV5PufZqxz/BICMwqTNWftWrdyQyVxeNZnOjfKlTbckWTygce79
 YET0EXMrbN5DNB/KLHCWeDcurJwLO8gd+VbeW19QYScem9AZsQnjuQCWygYz1LrBEtP+tBKH
 IFjPA32gZJfx4sH7yGL0hAZcfvjfvRmqnrZBYXbiRXlDVn3VuTmcXH+wHz5GZlbw9y
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97316291"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v2 4/7] automation: Use EOL tag for Jessie container
Date: Tue, 21 Feb 2023 16:55:39 +0000
Message-ID: <20230221165542.7642-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221165542.7642-1-anthony.perard@citrix.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
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
index 3f86d91f63..276b640ec9 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -1,4 +1,4 @@
-FROM i386/debian:jessie
+FROM --platform=linux/i386 debian/eol:jessie
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 2f19adcad3..06128d1a40 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:jessie
+FROM debian/eol:jessie
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-- 
Anthony PERARD



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5D6617BED
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:52:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436387.690478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYlq-0001GP-H5; Thu, 03 Nov 2022 11:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436387.690478; Thu, 03 Nov 2022 11:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYlq-00019N-D8; Thu, 03 Nov 2022 11:52:30 +0000
Received: by outflank-mailman (input) for mailman id 436387;
 Thu, 03 Nov 2022 11:52:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glJU=3D=citrix.com=prvs=299622fb7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oqYlo-00016T-Vz
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:52:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd29f0bb-5b6d-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 12:52:27 +0100 (CET)
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
X-Inumbo-ID: fd29f0bb-5b6d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667476347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sdBaG8nza+w2eZvi73Kk9Zj+hZVkMYunpXxpVdr9hzQ=;
  b=UOmyRt+kcbj3C3UpixAozeGcy/5XSIT3+/A715IkSTCP/qx77gWa3DZd
   OepW6vW2PURtHFpCBD9QxXKQYhTpBS82Q5WgT84k94hG3NCQJwngkYI2n
   JV4oXeL6oLJ9wO0mPIoK4ARVTGD1pJjnKDL6hzOuO0cqGPzPyinJzPqrL
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83173629
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p5esJqiX0wp5SSvWRBL6gcgmX161rRAKZh0ujC45NGQN5FlHY01je
 htvDTqAOvqCZTfwfd5wOo639khU7MPUmIQySlRqpHg1EXwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWv0N8klgZmP6oS5QeFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQxN2sKPx6EjN6a76+XDctLgeMENo7kadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthbD/
 z2doT6oav0cHOC6ih/bqXOzuuXevDv0Rr81V5nn1tc/1TV/wURMUUZLBDNXu8KRqkO4QcMZF
 EUS9QInt610/0uuJvH/VRClpH+PvjYHRsFdVeY97WmlyLfQ4gufLngJSHhGctNOnNAybSwn0
 BmOhdyBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyNxxwiY9+rYIeUxXfGwbFiC4G+aUPGs
 y1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9zqw+KTPuftlU
 Xt+TSpLJS9DYZmLNBLsG48gPUYDn0jSP1/7S5Hh1AiA2rGDfnOTQrptGALQML9ltf/d+1iPr
 Yk32y62J/J3CbOWX8Uq2dRLcQBiwYYTWPgaVPC7hsbce1E7SQnN+tfawK87epwNokimvr6gw
 51JYWcBkQKXuJEyAV/VApyVQO+wAM0XQLNSFXBEAGtELFB5Md7zsv9EKcdoFVTlncQ6pcNJo
 zA+U53oKpxypv7volzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:m4M2+aELXJa0bB86pLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 eTdZUgpGbJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQts5
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="83173629"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [XEN PATCH for-4.17 v2 1/6] xen: Add licence information to public/errno.h
Date: Thu, 3 Nov 2022 11:51:59 +0000
Message-ID: <20221103115204.49610-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221103115204.49610-1-anthony.perard@citrix.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes: 81f559e97974 ("make error codes a formal part of the ABI")
Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/public/errno.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index 5c53af6af9..6bdc8c5079 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: MIT */
+
 /*
  * There are two expected ways of including this header.
  *
-- 
Anthony PERARD



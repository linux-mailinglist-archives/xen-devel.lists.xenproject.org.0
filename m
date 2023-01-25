Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E68267BD86
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 21:58:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484555.751178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKmpz-0004xi-Gb; Wed, 25 Jan 2023 20:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484555.751178; Wed, 25 Jan 2023 20:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKmpz-0004v3-Dz; Wed, 25 Jan 2023 20:57:43 +0000
Received: by outflank-mailman (input) for mailman id 484555;
 Wed, 25 Jan 2023 20:57:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a83O=5W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKmpy-0004ux-Dp
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 20:57:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7fa0eef-9cf2-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 21:57:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E7EFB81BAA;
 Wed, 25 Jan 2023 20:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8872C433D2;
 Wed, 25 Jan 2023 20:57:37 +0000 (UTC)
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
X-Inumbo-ID: e7fa0eef-9cf2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674680258;
	bh=NjOPVgeL6TzTpB1raybc4GpDzLzYle8JRXOrLMSBex8=;
	h=From:To:Cc:Subject:Date:From;
	b=bfeTCjxBCoUud7hi+9tT+TDGcx1QFAdoxLOtHXWet0Mb/L72k3B7fMgJq+CQs+mAq
	 lZgq8+yDRhzNzH4DiIpGuvwR56kPb3I/+mOqKGQvMO8TQd0pxi2671LfqsdQjmheho
	 4Ul8fvBnm8FlxfZAHzpJ2lBMRWrEgA7jLkC1lD/Y+ziPCVl4B19jYZ1lQIOzsk7L2c
	 uZgDBR8o7bAK+WX0jSrmnRuGUfnVFb1TcPLRwSVw7YnouNP8k7aFDrHl/71qnqWikb
	 zzTUsG4ygPfj39RQYXpc/MLSsIssrUFUKVMmT7JZfftkS7DnXWNuZOVCgKucc6C/sK
	 al2jYZRLSJKzA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	george.dunlap@citrix.com,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] Add more rules to docs/misra/rules.rst
Date: Wed, 25 Jan 2023 12:57:35 -0800
Message-Id: <20230125205735.2662514-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

As agreed during the last MISRA C discussion, I am adding the following
MISRA C rules: 7.1, 7.3, 18.3.

I am also adding 13.1 and 18.2 that were "agreed pending an analysis on
the amount of violations".

In the case of 13.1 there are zero violations reported by cppcheck.

In the case of 18.2, there are zero violations reported by cppcheck
after deviating the linker symbols, as discussed.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index dcceab9388..1da79f33c1 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -138,6 +138,16 @@ existing codebase are work-in-progress.
      - Single-bit named bit fields shall not be of a signed type
      -
 
+   * - `Rule 7.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_01.c>`_
+     - Required
+     - Octal constants shall not be used
+     -
+
+   * - `Rule 7.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_03.c>`_
+     - Required
+     - The lowercase character l shall not be used in a literal suffix
+     -
+
    * - `Rule 8.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c>`_
      - Required
      - Types shall be explicitly specified
@@ -200,6 +210,11 @@ existing codebase are work-in-progress.
        expression which has potential side effects
      -
 
+   * - `Rule 13.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_01_1.c>`_
+     - Required
+     - Initializer lists shall not contain persistent side effects
+     -
+
    * - `Rule 14.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_01.c>`_
      - Required
      - A loop counter shall not have essentially floating type
@@ -227,6 +242,16 @@ existing codebase are work-in-progress.
        static keyword between the [ ]
      -
 
+   * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_02.c>`_
+     - Required
+     - Subtraction between pointers shall only be applied to pointers that address elements of the same array
+     -
+
+   * - `Rule 18.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_03.c>`_
+     - Required
+     - The relational operators > >= < and <= shall not be applied to objects of pointer type except where they point into the same object
+     -
+
    * - `Rule 19.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_19_01.c>`_
      - Mandatory
      - An object shall not be assigned or copied to an overlapping
-- 
2.25.1



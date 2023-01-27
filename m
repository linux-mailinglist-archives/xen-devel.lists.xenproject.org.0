Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B259C67ED9B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 19:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485863.753286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTZm-00038n-KX; Fri, 27 Jan 2023 18:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485863.753286; Fri, 27 Jan 2023 18:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTZm-00036C-Gh; Fri, 27 Jan 2023 18:35:50 +0000
Received: by outflank-mailman (input) for mailman id 485863;
 Fri, 27 Jan 2023 18:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BqQd=5Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pLTZl-000364-FL
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 18:35:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ac31c6d-9e71-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 19:35:48 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3533EB8214D;
 Fri, 27 Jan 2023 18:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1002C433EF;
 Fri, 27 Jan 2023 18:35:44 +0000 (UTC)
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
X-Inumbo-ID: 6ac31c6d-9e71-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674844545;
	bh=hpHAcdSFOtCLhFqbX/JA+8llrM6/bNsw7JHhCmB7eMM=;
	h=From:To:Cc:Subject:Date:From;
	b=lhofPJvfW1aIU6810KInaKJVTLgTtzeQlPMzsthBXJy5CUj3Q6q6hdF5DGay1ypyO
	 exKMsMu9gZuxwzBXEgHtEQY2qAIAASln9TB+ufGL40dTlX7zf60rcPb63Cm+awgNd5
	 iE4o/RbJrZPcNmoqLhZ8Q0RzxOhbYXJPGdk21ERhRfG45unRggpWwa62tk2+CaME58
	 cMUjBtSQn+EnZlLKW9VwV8mUIxpOUwxotIJ5aKxbuPmDJo9B4jBxCFxuLk/eufItnd
	 ZaB62Hrh++ou18Y8oA37W141VTQaJkS7gOZNevkMTPsTQYbif59lZgWpLAmcZdzoM2
	 1WDVHoZ4W5EfQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	george.dunlap@citrix.com,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	stefano.stabellini@amd.com
Subject: [PATCH v2] Add more rules to docs/misra/rules.rst
Date: Fri, 27 Jan 2023 10:35:41 -0800
Message-Id: <20230127183541.3013908-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

As agreed during the last MISRA C discussion, I am adding the following
MISRA C rules: 7.1, 7.3, 18.3.

I am also adding 13.1 that was "agreed pending an analysis on the amount
of violations". There are zero violations reported by cppcheck.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- remove 18.2
---
 docs/misra/rules.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index dcceab9388..83f01462f7 100644
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
@@ -227,6 +242,11 @@ existing codebase are work-in-progress.
        static keyword between the [ ]
      -
 
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



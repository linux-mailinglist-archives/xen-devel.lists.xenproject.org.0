Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B276E75D741
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 00:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567716.887129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMyQY-0006Qr-0j; Fri, 21 Jul 2023 22:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567716.887129; Fri, 21 Jul 2023 22:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMyQX-0006Oz-U4; Fri, 21 Jul 2023 22:16:45 +0000
Received: by outflank-mailman (input) for mailman id 567716;
 Fri, 21 Jul 2023 22:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMyQW-0006Ot-4W
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 22:16:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44fdcbc5-2814-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 00:16:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5871561D2F;
 Fri, 21 Jul 2023 22:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F52C433C8;
 Fri, 21 Jul 2023 22:16:39 +0000 (UTC)
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
X-Inumbo-ID: 44fdcbc5-2814-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689977800;
	bh=UU/KNHtJWPOE4DwMSvwfMbjpQ3D4sVoEwSzL4QdF4O0=;
	h=From:To:Cc:Subject:Date:From;
	b=QJ8Z5plGK9/iRi+qC+XLcZzsNYggCRA3XAY3RKZYgKk4xzMntN3VTDVl4wv7j5CYq
	 vA2OO2R1tPaUeRr99IQiKJv1hH5CwnryWqOkmyOPlsk0JUzTrACDLlvsm3u19RJ+HN
	 UaobQwj6jZMEnbCV0QdKacWCdJ1GBdiwEp2u8MQrTJTr8x1v6SvmN7YyrZKrwDuAk+
	 Q7ynOXOzFUwleQHct52lPPY4CT888bbdcsY6wxo2JcD9rsnBbX4I2ZFl7nYDzm6sVx
	 YKsp4uyr8+2Ee2EQvnBAYUFAn0tnyHYbhtmThDzh+Gm/R7e0328uo9l6wWcb1XafAC
	 vm59BRcYmbfug==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] docs/misra: add Rule 1.1 and 5.6
Date: Fri, 21 Jul 2023 15:16:36 -0700
Message-Id: <20230721221636.3693746-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Rule 1.1 is uncontroversial and we are already following it.

Rule 5.6 has been deemed a good rule to have by the MISRA C group.
However, we do have a significant amount of violations that will take
time to resolve and might require partial deviations in the form of
in-code comments or MISRA C scanners special configurations (ECLAIR).
For new code, we want this rule to generally apply hence the addition to
docs/misra/rules.rst.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

---
Changes in v2:
- add a note about compiler extensions to Rule 1.1
- add "generally" in the commit message
---
 docs/misra/rules.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 29a777938a..8f0e4d3f25 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -82,6 +82,14 @@ maintainers if you want to suggest a change.
      - Summary
      - Notes
 
+   * - `Rule 1.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_01.c>`_
+     - Required
+     - The program shall contain no violations of the standard C syntax
+       and constraints, and shall not exceed the implementation's
+       translation limits
+     - We make use of several compiler extensions as documented by
+       `C-language-toolchain.rst <docs/misra/C-language-toolchain.rst>`_
+
    * - `Rule 1.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_03.c>`_
      - Required
      - There shall be no occurrence of undefined or critical unspecified
@@ -156,6 +164,11 @@ maintainers if you want to suggest a change.
        headers (xen/include/public/) are allowed to retain longer
        identifiers for backward compatibility.
 
+   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
+     - Required
+     - A typedef name shall be a unique identifier
+     -
+
    * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
      - Required
      - Bit-fields shall only be declared with an appropriate type
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD8796E82
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 03:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597043.931206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3im-0007sx-Fa; Thu, 07 Sep 2023 01:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597043.931206; Thu, 07 Sep 2023 01:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3im-0007qq-C9; Thu, 07 Sep 2023 01:22:12 +0000
Received: by outflank-mailman (input) for mailman id 597043;
 Thu, 07 Sep 2023 01:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qe3ik-0006y7-U5
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 01:22:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f77a4df0-4d1c-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 03:22:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C74D0B81D3A;
 Thu,  7 Sep 2023 01:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12494C433C8;
 Thu,  7 Sep 2023 01:22:06 +0000 (UTC)
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
X-Inumbo-ID: f77a4df0-4d1c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694049728;
	bh=bs/dcggUZ/Oiz4QqfXxtmXxh/V+hsKtSAq2RX6E0gkc=;
	h=From:To:Cc:Subject:Date:From;
	b=g8dlzYmsLraTat9mW1WUXCh6bzTCFByresDRLJ1rrHDMOs5gP1jKqGMeEFGXlZ+Wy
	 9/HK3mgbUWMqgwLooEDO/sKwxRSFVnP4Bd5h0eokhUE+BpIcSjRyVY0i4IxU6Q3CZD
	 N90Vt+UQVjlGaci+KMhp9fMv2vxJ+CBc12ynajrKnDrVFJMrZFlg3gFu6mS3MasD/F
	 wSQHNFpJv53VfFyqpZ6KTjGe43tNpXtXPBy8CAF6dYOdhkMQ6ockbxV2YAKJ08wY/m
	 wTrXkWz17UPnSF6RnT378YnqHx4UXajbspqKA8HfOuXoWyBIewV9kDNiJEkQG1As3R
	 zY0wTblZhx4+Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	roberto.bagnara@bugseng.com,
	nicola.vetrini@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] docs/misra: add 14.3
Date: Wed,  6 Sep 2023 18:22:03 -0700
Message-Id: <20230907012203.1238090-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Add 14.3, with project-wide deviations.

Also take the opportunity to clarify that parameters of function pointer
types are expected to have names (Rule 8.2).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- add switch to the Rule 14.3 exceptions
- add "and alike" for while(0) and while(1)
---
 docs/misra/rules.rst | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 34916e266a..3d8d1633a4 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -234,7 +234,8 @@ maintainers if you want to suggest a change.
    * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
      - Required
      - Function types shall be in prototype form with named parameters
-     -
+     - Clarification: both function and function pointers types shall
+       have named parameters.
 
    * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
      - Required
@@ -385,6 +386,17 @@ maintainers if you want to suggest a change.
      - A loop counter shall not have essentially floating type
      -
 
+   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
+     - Required
+     - Controlling expressions shall not be invariant
+     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
+       checks, and other constructs that are detected as errors by MISRA
+       C scanners, managing the configuration of a MISRA C scanner for
+       this rule would be unmanageable. Thus, this rule is adopted with
+       a project-wide deviation on if ?: and switch statements.
+
+       while(0) and while(1) and alike are allowed.
+
    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
      - Required
      - A switch-expression shall not have essentially Boolean type
-- 
2.25.1



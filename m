Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAEB78E49D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 03:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593328.926318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWsE-0001CE-5F; Thu, 31 Aug 2023 01:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593328.926318; Thu, 31 Aug 2023 01:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWsE-0001A3-1s; Thu, 31 Aug 2023 01:53:30 +0000
Received: by outflank-mailman (input) for mailman id 593328;
 Thu, 31 Aug 2023 01:53:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFXE=EQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qbWsC-00019v-NC
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 01:53:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ceaa9c9-47a1-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 03:53:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A16DD60DFE;
 Thu, 31 Aug 2023 01:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08FDC433C8;
 Thu, 31 Aug 2023 01:53:23 +0000 (UTC)
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
X-Inumbo-ID: 2ceaa9c9-47a1-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693446805;
	bh=r89SBP4ZBFiA5pzozqSflB/e7p8Bb4jB8v6Sxpw1v94=;
	h=From:To:Cc:Subject:Date:From;
	b=DEEnU5GyPbG9lO8bAZ1i2r1dFXZMJK2pZw9G0QZdGRpTlB6cLtqw+KDJFg6M0wJw9
	 KLaF75YQev+zt7gfb/ZKp8FKIM1qfKbM9JXYZ+Ry6Jb+ehlEEc815EJDagK0JzBuD3
	 U+ZtdeDJ/Upxm3cwXkFc46eoAW09YSrmP2ZdX98dwKvYI6zd/WM6tBfoEcdoxKYfs1
	 6kd8cLxCKtgf4k6Ni2sYX6bhedT+hrmAmo1AmznLsWb3lOZMaYgPvNOdP3dh93OSuY
	 nuDrQsPKsoVnq9NFX1SfBRwVN//L6nVo25fC2mOdCleh/54zrR1wUI91NMMZ/fo71q
	 wRdGsl+rFHKDQ==
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
Date: Wed, 30 Aug 2023 18:53:16 -0700
Message-Id: <20230831015316.531167-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Add 14.3, with project-wide deviations.

Also take the opportunity to clarify that parameters of function pointer
types are expected to have names (Rule 8.2).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
v2:
- remove 14.4
- better wording for the 8.2 clarification
- add while(0) and while(1) to 14.3
- add ?: to the deviation
- remove list of statements the rule applies to
---
 docs/misra/rules.rst | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index db30632b93..9389976290 100644
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
@@ -332,6 +333,17 @@ maintainers if you want to suggest a change.
      - A loop counter shall not have essentially floating type
      -
 
+   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
+     - Required
+     - Controlling expressions shall not be invariant
+     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
+       checks, and other constructs that are detected as errors by MISRA
+       C scanners, managing the configuration of a MISRA C scanner for
+       this rule would be unmanageable. Thus, this rule is adopted with
+       a project-wide deviation on if and ?: statements.
+
+       while(0) and while(1) are allowed.
+
    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
      - Required
      - A switch-expression shall not have essentially Boolean type
-- 
2.25.1



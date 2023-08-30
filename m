Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F4A78D178
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 03:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592653.925437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb9Ys-0002KC-MQ; Wed, 30 Aug 2023 00:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592653.925437; Wed, 30 Aug 2023 00:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb9Ys-0002I3-Jn; Wed, 30 Aug 2023 00:59:58 +0000
Received: by outflank-mailman (input) for mailman id 592653;
 Wed, 30 Aug 2023 00:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gRJs=EP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qb9Ys-0002Hx-39
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 00:59:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88aaa359-46d0-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 02:59:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5A1062AB5;
 Wed, 30 Aug 2023 00:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25A3C433C9;
 Wed, 30 Aug 2023 00:59:52 +0000 (UTC)
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
X-Inumbo-ID: 88aaa359-46d0-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693357194;
	bh=0C+rFqD5HpHjRZq31l0hOmN7L4Q5TeDSQyVi9ZvzwW8=;
	h=From:To:Cc:Subject:Date:From;
	b=GTDUAHejpso3bzwvQdS3tfmz0vAJhneXD3ZdiQCVcfEjXaxQ70YdQJz2DKueL6zJ/
	 c9OTCGbyPjQTsgekjKc8M4kq/HOkcKKeNfJ1FsGvlgvVLCtFJbgHzbl3cCtbefQXd/
	 dMI2H5j8XnhUe408ufjxr2xjmgSYnQINt9HtAqDldzzYWSX+17FmSuFcNhWg/Nj7NI
	 ZziTn4Jg499TL0WQ7mqGS7pL7wYSY7MvMmXxaiQgazsAuDyOjG3rwa+UK2dgJf65c0
	 PfC9CdQpi0bYE/RgsJDKarHl8GzMZyTnwpyzeu6++HqqapefHhmuucSTFI30S3+vtC
	 gOFqtTAZ2UQ9w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	julien@xen.org,
	sstabellini@kernel.org,
	george.dunlap@citrix.com,
	bertrand.marquis@arm.com,
	nicola.vetrini@bugseng.com,
	roberto.bagnara@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: add 14.3 and 14.4
Date: Tue, 29 Aug 2023 17:59:50 -0700
Message-Id: <20230830005950.305085-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Add 14.3, with a project-wide deviations on if statements.
Add 14.4, clarifying that implicit conversions of integers, chars and
pointers to bool are allowed.

Also take the opportunity to clarify that parameters of function pointer
types are expected to have names (Rule 8.2).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index db30632b93..6cde4feeae 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -234,7 +234,7 @@ maintainers if you want to suggest a change.
    * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
      - Required
      - Function types shall be in prototype form with named parameters
-     -
+     - Function pointer types shall have named parameters too.
 
    * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
      - Required
@@ -332,6 +332,24 @@ maintainers if you want to suggest a change.
      - A loop counter shall not have essentially floating type
      -
 
+   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
+     - Required
+     - Controlling expressions shall not be invariant
+     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
+       checks, and other constructs that are detected as errors by MISRA
+       C scanners, managing the configuration of a MISRA C scanner for
+       this rule would be unmanageable. Thus, this rule is adopted with
+       a project-wide deviation on 'if' statements. The rule only
+       applies to while, for, do ... while, ?:, and switch statements.
+
+   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
+     - Required
+     - The controlling expression of an if statement and the controlling
+       expression of an iteration-statement shall have essentially
+       Boolean type
+     - Implicit conversions of integers, pointers, and chars to boolean
+       are allowed
+
    * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
      - Required
      - A switch-expression shall not have essentially Boolean type
-- 
2.25.1



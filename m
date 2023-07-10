Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E974DF39
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 22:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561393.877822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIxV2-000446-9u; Mon, 10 Jul 2023 20:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561393.877822; Mon, 10 Jul 2023 20:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIxV2-00040j-6W; Mon, 10 Jul 2023 20:28:48 +0000
Received: by outflank-mailman (input) for mailman id 561393;
 Mon, 10 Jul 2023 20:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atS4=C4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qIxV0-0003xp-1v
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 20:28:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b45be5a-1f60-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 22:28:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F057D611C0;
 Mon, 10 Jul 2023 20:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD6BC433C7;
 Mon, 10 Jul 2023 20:28:38 +0000 (UTC)
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
X-Inumbo-ID: 5b45be5a-1f60-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689020919;
	bh=axyZZQcYXEYTlxOxAA7ForY8wuep7GAcbh9SoRg9mZo=;
	h=From:To:Cc:Subject:Date:From;
	b=Ss3QI9eEJVaJSQjEO2UqkrEhgCZvMkqFE57MOrujvpfBFfz/sRLeWLEcwLn9vHfk9
	 YTcjMUKjE5jInBZwX98TlYi7RuGhFmCwEWt34efW+8UwJUenQrBy4h+Xolr6uQLLnm
	 AjGfFfxAJaNp/jIRB6UrjV/rYS0teUShmLD7OAP7SBiDwkL33jfklIcDsAHaTAH9f1
	 pNgzcnfWgYlPeZXibS5K2R9Wu75BB1VfbF4XPJIub5xc8xYhHW/CwZ2GwiiQ8vvWRB
	 BixjtQe2ctiDN+xF4igFEQ+U2ES8r2b1YX4DME3xy+4ITbRK5E/I0pp3H1KDpux8X4
	 Kdy0SJw3HquuQ==
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
Subject: [PATCH v2] docs/misra: add Rule 7.4 and 9.4
Date: Mon, 10 Jul 2023 13:28:35 -0700
Message-Id: <20230710202835.2052428-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Rule 9.4 is non-controversial and we have no violations.

Rule 7.4 is considered a good idea with the caveat that assigning a
string literal to const void is allowed. I added a note to specify it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- improve rule 7.4 note
---
 docs/misra/rules.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 622f35410c..67ee8c029e 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -203,6 +203,15 @@ maintainers if you want to suggest a change.
      - The lowercase character l shall not be used in a literal suffix
      -
 
+   * - `Rule 7.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_04.c>`_
+     - Required
+     - A string literal shall not be assigned to an object unless the
+       objects type is pointer to const-qualified char
+     - All "character types" are permitted, as long as the string
+       element type and the character type match. (There should be no
+       casts.) Assigning a string literal to any object with type
+       "pointer to const-qualified void" is allowed.
+
    * - `Rule 8.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c>`_
      - Required
      - Types shall be explicitly specified
@@ -275,6 +284,11 @@ maintainers if you want to suggest a change.
        braces
      -
 
+   * - `Rule 9.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_04.c>`_
+     - Required
+     - An element of an object shall not be initialized more than once
+     -
+
    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_05.c>`_
      - Mandatory
      - The sizeof operator shall not have an operand which is a function
-- 
2.25.1



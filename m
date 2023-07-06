Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C574A72B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 00:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560104.875747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHXk5-0008UG-4C; Thu, 06 Jul 2023 22:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560104.875747; Thu, 06 Jul 2023 22:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHXk5-0008SO-0J; Thu, 06 Jul 2023 22:46:29 +0000
Received: by outflank-mailman (input) for mailman id 560104;
 Thu, 06 Jul 2023 22:46:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JNo=CY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHXk4-0008SG-6b
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 22:46:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efa67aa6-1c4e-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 00:46:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A86260D2E;
 Thu,  6 Jul 2023 22:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D52C433C7;
 Thu,  6 Jul 2023 22:46:22 +0000 (UTC)
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
X-Inumbo-ID: efa67aa6-1c4e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688683583;
	bh=Vd2StGY3QLHbG5ajXmHSkNw/fN1H9V5IpfNUtQM6kgU=;
	h=From:To:Cc:Subject:Date:From;
	b=AydGXQcT2Z4I3TisHEC4uplAYU8S8tAiZ5UP2msFzmFTpSreLhZVy4d7c2rE0ZiO6
	 YODxqEG+bqMUtTV+47y02m60avcbl1n2eLD0KH2/b0TUSw3a6Idl221Aq/nH4iKkaY
	 TJCCYYHj1zptHdu2z7gLZ3FM7U45n0f7JJIQDlzuPcDgJekerih0ETmW8fRSDNUeUQ
	 hAgMzVZDTXGw+OZB2ZX6Xx08UCn/Oq0LLpyJceA7GcGWgRC/fcFWDXNNk+GavMGHLf
	 L7RcgxtzjY0dgYFG6EI+jcLwXBrWM68SA0H/U5UGaIwHAAZ6s5F5Gacw0FwPKJ5Gqd
	 Cgj9zu6yXQbNg==
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
Subject: [PATCH] docs/misra: add Rule 7.4 and 9.4
Date: Thu,  6 Jul 2023 15:46:19 -0700
Message-Id: <20230706224619.1092613-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Rule 9.4 is non-controversial and we have no violations.

Rule 7.4 is considered a good idea with the caveat that assigning a
string literal to const void is allowed. I added a note to specify it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 622f35410c..986d031786 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -203,6 +203,13 @@ maintainers if you want to suggest a change.
      - The lowercase character l shall not be used in a literal suffix
      -
 
+   * - `Rule 7.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_04.c>`_
+     - Required
+     - A string literal shall not be assigned to an object unless the
+       objects type is pointer to const-qualified char
+     - Assigning a string literal to any object with type
+       "pointer to const-qualified void" is allowed
+
    * - `Rule 8.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c>`_
      - Required
      - Types shall be explicitly specified
@@ -275,6 +282,11 @@ maintainers if you want to suggest a change.
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



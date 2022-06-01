Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F52539AE1
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 03:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340156.565128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwDP7-0000QB-Cm; Wed, 01 Jun 2022 01:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340156.565128; Wed, 01 Jun 2022 01:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwDP7-0000MY-53; Wed, 01 Jun 2022 01:44:09 +0000
Received: by outflank-mailman (input) for mailman id 340156;
 Wed, 01 Jun 2022 01:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwDP5-0008Ua-N7
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 01:44:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5319790f-e14c-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 03:44:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BBAE8B8175B;
 Wed,  1 Jun 2022 01:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BBFC3411C;
 Wed,  1 Jun 2022 01:44:05 +0000 (UTC)
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
X-Inumbo-ID: 5319790f-e14c-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654047845;
	bh=WcTGrMPln2r4PN7xO0mKkWVF8X4wWkx3gFpXJmHXKEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRGVkIGNwipP5Hv6OA8LFhVgl711eabBTutfxMp3T56F/51EHJHXBupb6vQqC0Xph
	 Ndy95yMWel2pcgn9/g/aS7hyrXIQrPUVoF7Sd8p7prUUbpEAfE9AkXcbfpm2fXARm1
	 fgInc9I+f5DVW9fBxsYdyC8aOA2GcQtXQMbInYf8fBO4N9SfgQJlF4q1gCjSYfWNFm
	 E7VTkieOtkk1E7QnF0EiWddNxxdAL4qvZZKL1qcLRHnyf46cPtV/zNSlCqshnOZKRv
	 M4O8ylTJnobKO6XeLTDM5g/kOxOv40oY7667zNxJ/AvIOtXKuJU2cO3Zb1csnwPHGL
	 29SrcaD2YAH6w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	George.Dunlap@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 2/2] docs/misra: add Rule 5.1
Date: Tue, 31 May 2022 18:44:02 -0700
Message-Id: <20220601014402.2293524-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205311816170.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205311816170.1905099@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Add Rule 5.1, with the additional note that the character limit for Xen
is 40 characters.

The max length identifiers found by ECLAIR are:

__mitigate_spectre_bhb_clear_insn_start
domain_pause_by_systemcontroller_nosync

Both of them are 40 characters long.

Explicitly mention that public headers might have longer identifiers.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---

Changes in v2:
- lower the limit to 40
- mention public headers
- improve commit message
---
 docs/misra/rules.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 7d6a9fe063..6ccff07765 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -82,6 +82,13 @@ existing codebase are work-in-progress.
      - Line-splicing shall not be used in // comments
      -
 
+   * - `Rule 5.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_01_2.c>`_
+     - Required
+     - External identifiers shall be distinct
+     - The Xen characters limit for identifiers is 40. Public headers
+       (xen/include/public/) are allowed to retain longer identifiers
+       for backward compatibility.
+
    * - `Rule 6.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c>`_
      - Required
      - Single-bit named bit fields shall not be of a signed type
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41F53345A
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 02:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336795.561233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nteza-0001yR-3e; Wed, 25 May 2022 00:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336795.561233; Wed, 25 May 2022 00:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nteza-0001vR-0G; Wed, 25 May 2022 00:35:14 +0000
Received: by outflank-mailman (input) for mailman id 336795;
 Wed, 25 May 2022 00:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIJu=WB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ntezY-0001N9-Gp
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 00:35:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88d94eac-dbc2-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 02:35:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6C75FB81BFC;
 Wed, 25 May 2022 00:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A360FC34118;
 Wed, 25 May 2022 00:35:08 +0000 (UTC)
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
X-Inumbo-ID: 88d94eac-dbc2-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653438909;
	bh=sjKpMtPk4Pg6387GmnH2YJdsLfcRs7y+YGW+mPOUkgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vJdcQN7MwlXt9tsknTo8xOee3y5rmdsilSBNvEh/0YyNXk8MxoG7nV56eEeSSXox/
	 9MUswDFQC5tFX+p+/vQrwxjdMTny7VeNBmtY/gl6eLpJDNyndUAGgWq9U+2tIMIfd/
	 eEY24rinh9YJKSwWYQgo0EXVQrgfzKKmPa25gBlLNR1NkZILAgKa6xGgbrek1LfqF4
	 XJexjMv+QiAM9rPx3e19xqi72uMH+4pxC1AQkvATQ2cQ2yw+HomsalX8RInPLP+jm/
	 guj3CjZxOqCIOO809mpE30nJ8/if5mL6o/Wy1gmzfuPoElKenu0Aq0kMUMFJTPIp8r
	 ZqEnwlYUzGz6g==
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
Subject: [PATCH 2/2] docs/misra: add Rule 5.1
Date: Tue, 24 May 2022 17:35:05 -0700
Message-Id: <20220525003505.304617-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Add Rule 5.1, with the additional note that the character limit for Xen
is 63 characters.

The max length identifiers found by ECLAIR are:

__mitigate_spectre_bhb_clear_insn_start
domain_pause_by_systemcontroller_nosync

Both of them are 40 characters long. A limit of 63 characters work for
the existing code.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 docs/misra/rules.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index c0ee58ab25..6052fc6309 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -35,6 +35,11 @@ hypervisor.
   - Severity:  Required
   - Summary:  Line-splicing shall not be used in // comments
   - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c
+- Rule: Rule 5.1
+  - Severity:  Required
+  - Summary:  External identifiers shall be distinct
+  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_01_2.c
+  - Note: the Xen characters limit for identifiers is 63
 - Rule: Rule 6.2
   - Severity:  Required
   - Summary:  Single-bit named bit fields shall not be of a signed type
-- 
2.25.1



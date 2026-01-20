Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5769D3C02B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 08:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208398.1520561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi5zl-0005jx-0s; Tue, 20 Jan 2026 07:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208398.1520561; Tue, 20 Jan 2026 07:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi5zk-0005iT-UM; Tue, 20 Jan 2026 07:17:44 +0000
Received: by outflank-mailman (input) for mailman id 1208398;
 Tue, 20 Jan 2026 07:17:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vi5zj-0005iN-OW
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 07:17:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vi5zj-00Cd7n-1N;
 Tue, 20 Jan 2026 07:17:43 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vi5zi-00B9Gz-2f;
 Tue, 20 Jan 2026 07:17:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=pKv7ArlF2h8gshpBz8SQSzsZjNvWC9ePOUcC6f6+vYs=; b=fqCAX5
	x5ojsDobFg+W5C3nbGSSGsmyDUjaOm0WBukIaUZRnOLFsA8V5lSby+/aamd5HMswdrlFlZfwrYvTH
	CMbjLAZPLr5uOKDIvnbj5V6onXxWjbI9zMiiE0zYquW6LsaQ1UeYE69xVrNW6soBZKk9K/Crh0g1V
	Dpzx9EEBArk=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v3] INSTALL: remove unsupported XEN_CONFIG_EXPERT from documentation
Date: Mon, 19 Jan 2026 23:16:56 -0800
Message-ID: <20260120071654.640873-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Remove XEN_CONFIG_EXPERT explanation and also correct information in
the entire "Xen Hypervisor" section.

Amends: 37339ba9ef46 ("automation: Remove XEN_CONFIG_EXPERT leftovers")
Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- Applied suggested edits to the entire section suggested by Stefano
- Link to v2: https://lore.kernel.org/xen-devel/20260116030842.415583-2-dmukhin@ford.com/
---
 INSTALL | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/INSTALL b/INSTALL
index c2e756bf4b2b..670cbc2fa3b8 100644
--- a/INSTALL
+++ b/INSTALL
@@ -25,19 +25,12 @@ Xen Hypervisor
 Xen itself is configured via a `kconfig' system borrowed from Linux.
 See https://www.kernel.org/doc/html/v5.4/kbuild/.
 
-Note that unlike with Linux, and contrary to that document, you cannot
-look at Kconfig files, or the default or generated config files etc.,
-to find available configuration options.  This is because it is only
-supported (and security supported) by the Xen Project, to change a
-small subset of the options.  Attempts to change other options will be
-silently overridden.  The only way to find which configuration options
-are available is to run `make menuconfig' or the like.
-
-You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
-in your environment.  However, doing this is not supported and the
-resulting configurations do not receive security support.  If you set
-this variable there is nothing stopping you setting dangerously
-experimental combinations of features - not even any warnings.
+Only a subset of options is supported or security-supported by Xen
+Project. You can explore all available options, including unsupported
+ones and those recommended only for expert users, by using `make
+menuconfig` and enabling `CONFIG_UNSUPPORTED` and/or `CONFIG_EXPERT`.
+However, enabling these options is not supported, and configurations
+resulting from them do not receive security support.
 
 Options recognized by configure
 ===============================
-- 
2.52.0



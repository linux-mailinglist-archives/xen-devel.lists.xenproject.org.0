Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4434744F307
	for <lists+xen-devel@lfdr.de>; Sat, 13 Nov 2021 13:11:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225531.389482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlrrF-0002Yj-RY; Sat, 13 Nov 2021 12:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225531.389482; Sat, 13 Nov 2021 12:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlrrF-0002VQ-NX; Sat, 13 Nov 2021 12:10:09 +0000
Received: by outflank-mailman (input) for mailman id 225531;
 Sat, 13 Nov 2021 08:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVXp=QA=weissschuh.net=linux@srs-se1.protection.inumbo.net>)
 id 1mlohp-0001X8-UF
 for xen-devel@lists.xenproject.org; Sat, 13 Nov 2021 08:48:14 +0000
Received: from todd.t-8ch.de (todd.t-8ch.de [2a01:4f8:c010:41de::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c8120ba-445e-11ec-a9d2-d9f7a1cc8784;
 Sat, 13 Nov 2021 09:48:11 +0100 (CET)
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
X-Inumbo-ID: 6c8120ba-445e-11ec-a9d2-d9f7a1cc8784
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1636792709;
	bh=oUFtQ64Cm+17GAUy1q4rYvKGNoMzMADVbvq6kqHCI3I=;
	h=From:To:Cc:Subject:Date:From;
	b=IVv6RVqZLUq1cdNfpOznglmn97XUhItFa/Mu1oo42XBzbALjHyi23d89q10snve0g
	 WeAxMLbAclVWrMHA072X4griCtu+sxUFoiIkJRLbzGjy+/w4sNtIim4XqbM8ldDr1u
	 pKdM0DyNsfxEbsoNzkKC6r9Poz3/JIk70OCmv7Qo=
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/privcmd: make option visible in Kconfig
Date: Sat, 13 Nov 2021 09:38:21 +0100
Message-Id: <20211113083821.71060-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This configuration option provides a misc device as an API to userspace.
Make this API usable without having to select the module as a transitive
dependency.

This also fixes an issue where localyesconfig would select
CONFIG_XEN_PRIVCMD=m because it was not visible and defaulted to
building as module.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---

Note: If CONFIG_XEN_PRIVCMD really is only meant to be selected by
XENFS, then the issue can be fixed by removing its "default m"
definition.
---
 drivers/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index a1b11c62da9e..c14d8631b8f6 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -259,7 +259,7 @@ config XEN_SCSI_BACKEND
 	  if guests need generic access to SCSI devices.
 
 config XEN_PRIVCMD
-	tristate
+	tristate "Xen privileged domain-0 commands"
 	depends on XEN
 	default m
 

base-commit: 66f4beaa6c1d28161f534471484b2daa2de1dce0
-- 
2.33.1



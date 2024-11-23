Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9B9D6AC0
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842135.1257575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEulY-0007T4-Hn; Sat, 23 Nov 2024 18:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842135.1257575; Sat, 23 Nov 2024 18:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEulY-0007QO-Ek; Sat, 23 Nov 2024 18:21:56 +0000
Received: by outflank-mailman (input) for mailman id 842135;
 Sat, 23 Nov 2024 18:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEulW-0006MT-CX
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:21:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceeccf12-a9c7-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:21:52 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386058592745.5673185331648;
 Sat, 23 Nov 2024 10:20:58 -0800 (PST)
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
X-Inumbo-ID: ceeccf12-a9c7-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNlZWNjZjEyLWE5YzctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MTEyLjU2Mjg1LCJzZW5kZXIiOiJkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; t=1732386062; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SnFo088t2rfUVSWrOoGKtu1gmKKaiQm9jnSngpa10SC2uFNfMP6eh2Ijhg4M1QzZ4eZA0RRvWK9Ha996hzzUq4Wz7xnIyQ7voOwqJGdqapAb7y1TOn1juJwX92F3+W2jBfFjyQWSfhR19OBSYZafPkwMuwj1hA+Jl3CoWsL6wJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386062; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7kQp6O2mc6cHBoZxlvkzYOcwjpPdg5e+ctsTL3O8uUc=; 
	b=aIKQMKIxIOGZ7cnv7741xU4l+9Ty3TFGW0RPn3m2kC01WEJK8DOwEL/ANY9tX7clAEc5pd/qcNWTuKHKm3zvqDuTF19mqktmmZiVOKBEN9j9g8VxPImkUhJuMtGzMEf40bp2HNlSXivt9r/YJESA/vYu24l3/kBq21pzKrpWEPA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386062;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=7kQp6O2mc6cHBoZxlvkzYOcwjpPdg5e+ctsTL3O8uUc=;
	b=tGgFlmFjTwLuS/GwUqS49R+PuhQxKEw82ykmASFJLgWAiZMfZg09YQKHEJf53o7y
	Frnd97WcgeQCwWtqF7+qgb3qQQmSTNNfkxjanjRRFON+2puENB5WrMInHGTqEDCwjku
	hNlqyZqdBa+ecHdkhsY1E7l8J4bmzjs9cpn0sOvo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 04/15] kconfig: introduce option to independently enable libfdt
Date: Sat, 23 Nov 2024 13:20:33 -0500
Message-Id: <20241123182044.30687-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Currently the inclusion of libfdt is controlled by the CONFIG_HAS_DEVICE_TREE
kconfig flag. This flag also changes behvaior in a few places, such as boot
module processing for XSM. To support the ability to include libfdt without
changing these behaviors, introduce CONFIG_LIB_DEVICE_TREE. The inclusion of
libfdt is then moved under CONFIG_LIB_DEVICE_TREE.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/Kconfig  | 4 ++++
 xen/common/Makefile | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d92499a..5c592dbdc703 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -53,8 +53,12 @@ config HAS_ALTERNATIVE
 config HAS_COMPAT
 	bool
 
+config LIB_DEVICE_TREE
+    bool
+
 config HAS_DEVICE_TREE
 	bool
+    select LIB_DEVICE_TREE
 
 config HAS_DIT # Data Independent Timing
 	bool
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b279b09bfb2b..ff1795de5dda 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -78,7 +78,7 @@ obj-y += sched/
 obj-$(CONFIG_UBSAN) += ubsan/
 
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
-obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
+obj-$(CONFIG_LIB_DEVICE_TREE) += libfdt/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
 $(obj)/config.gz: $(CONF_FILE)
-- 
2.30.2



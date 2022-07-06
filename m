Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F65C5693E2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362545.592632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CG1-0007Ih-0M; Wed, 06 Jul 2022 21:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362545.592632; Wed, 06 Jul 2022 21:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CG0-0007GQ-Ts; Wed, 06 Jul 2022 21:08:24 +0000
Received: by outflank-mailman (input) for mailman id 362545;
 Wed, 06 Jul 2022 21:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CF4-0003HV-Ba
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:07:26 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1ce176b-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:07:25 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141515007710.3122852676397;
 Wed, 6 Jul 2022 14:05:15 -0700 (PDT)
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
X-Inumbo-ID: a1ce176b-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kn/VLgVHdrNiMJYv6C8ca0f3cdXI0qCRcFQLsnDcyMGQ1mki8dYJaC3NtgtMnjfgYBfWCjCcWod+iM56MB7VjEdyNP8q1wWzOTBPgidoReSQ46jpnhM77OeMjLtS9WasAHtekYzXvH7tBW3IoEpMn7uttyv5zClFn5gUZTO6KFI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141516; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=HKjJTQMRAU0h0mGoRHhFPzIn/dQiHWAlt9SCRVrEJ6w=; 
	b=Tpb6tPRG3vu03zYlMxnzKUhhBtf1S5wuRqC8BBy2YpSyaWrcZEQRzU+/Jw+8zg14X2ifEFgBihC0cWFnLBYSX1XlJ3Tjg2XjkCDf3hYgaN5QH4ymcLFJHwHxSAILg0xL/yxB6gkEPIGLaxgxyx/CU0Q6YB3gIHZMlSb1h4MrGyE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141516;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=HKjJTQMRAU0h0mGoRHhFPzIn/dQiHWAlt9SCRVrEJ6w=;
	b=mARI0734kr2pktMr8wWc2nsNy5B6xK65nm0w1Rh8HNsFD0TZD1DC4JRFO1tG5/nh
	53OJP4pGyVDIdK8mbuWT30tkLnig2RETxO93J7Kq9ijq2BdngSh0PYZBX72uFlEMPVr
	iquDN14+baAoOa9kZEiPo89oz1Fc4x7gHiuF2w8M=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 08/18] kconfig: introduce domain builder config option
Date: Wed,  6 Jul 2022 17:04:43 -0400
Message-Id: <20220706210454.30096-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hyperlaunch domain builder is the consolidated boot time domain building logic
framework.  This commit introduces the first config option for the domain
builder to control support for loading the domain configurations via the
flattened device tree.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/common/Kconfig                |  1 +
 xen/common/domain-builder/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 xen/common/domain-builder/Kconfig

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 9fc6683932..5a1c40e392 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -355,6 +355,7 @@ config ARGO
 
 	  If unsure, say N.
 
+source "common/domain-builder/Kconfig"
 source "common/sched/Kconfig"
 
 config CRYPTO
diff --git a/xen/common/domain-builder/Kconfig b/xen/common/domain-builder/Kconfig
new file mode 100644
index 0000000000..893038cab3
--- /dev/null
+++ b/xen/common/domain-builder/Kconfig
@@ -0,0 +1,15 @@
+
+menu "Domain Builder Features"
+
+config BUILDER_FDT
+	bool "Domain builder device tree (UNSUPPORTED)" if UNSUPPORTED
+	select CORE_DEVICE_TREE
+	---help---
+	  Enables the ability to configure the domain builder using a
+	  flattened device tree.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
+endmenu
-- 
2.20.1



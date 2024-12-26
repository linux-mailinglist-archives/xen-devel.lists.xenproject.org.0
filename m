Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927399FCC14
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 18:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863307.1274779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrE5-0000V4-Fy; Thu, 26 Dec 2024 17:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863307.1274779; Thu, 26 Dec 2024 17:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrE5-0000OY-8x; Thu, 26 Dec 2024 17:00:45 +0000
Received: by outflank-mailman (input) for mailman id 863307;
 Thu, 26 Dec 2024 17:00:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrC9-00026T-2O
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:58:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9a917e4-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:58:44 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232276554498.6175530673062;
 Thu, 26 Dec 2024 08:57:56 -0800 (PST)
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
X-Inumbo-ID: a9a917e4-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232279; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M7NNEHXQn2ArpWBIQxAC0ps93lMWSHGq5oSivwW0+R8gPtzYljK8+60SNKgxIKx8oWgAWsfNozgdVR/REUWoUcYBehp1Jl2TESlPzKnNJqDUl0mUgjrAD0NWL4XZvjv+tvbSFBJ19YFMyeq6fZxI8vIDtaFGZ1tkCDOGUqgdBxw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232279; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8yEFyhV1XLn4s2lQSWFXirGDySzcrcFW20gpc2BTrdE=; 
	b=Sjo7UcOJjZCiCDH7mVrwEr+aYJHgxVvMmktXLANiKegNebDK20xolGaiAvPan6+BOQk/KxLQaPPfWEIaAsXAdenkrD0ZBU3+t9jz7wzc9YEHZm88YKXsvGwAGkufLNcaYCshUHIIs2RS7gTuZfR3M4rOPhEK1gOqpbScs2f4j9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232279;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=8yEFyhV1XLn4s2lQSWFXirGDySzcrcFW20gpc2BTrdE=;
	b=EuxeSErU3fDeUZdkR7CTZ02vOLwuQf8rDS1fVGLmwmfiqgwUGIyGWEENBxSz2PUQ
	QSacve/gwL+VOnH/lbV8gaSkVG2+JrADznjiDHodOejSoJ1RQHx03BTsONA5zVOcXPt
	AkhX9UDFEf0eY/liexwx7UDxTknbqoEii17s1mLQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 05/15] kconfig: introduce domain builder config option
Date: Thu, 26 Dec 2024 11:57:30 -0500
Message-Id: <20241226165740.29812-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hyperlaunch domain builder will be the consolidated boot time domain building
logic framework. Introduces the config option to enable this domain builder to
and turn on the ability to load the domain configuration via a flattened device
tree.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v1:
- fixed Kconfig indentation
- change directory name to use - instead of _
---
 xen/arch/x86/Kconfig                |  2 ++
 xen/arch/x86/domain-builder/Kconfig | 15 +++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 xen/arch/x86/domain-builder/Kconfig

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9cdd04721afa..25b9b75423c5 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -383,6 +383,8 @@ config ALTP2M
 
 	  If unsure, stay with defaults.
 
+source "arch/x86/domain_builder/Kconfig"
+
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/domain-builder/Kconfig b/xen/arch/x86/domain-builder/Kconfig
new file mode 100644
index 000000000000..8ed493c3b545
--- /dev/null
+++ b/xen/arch/x86/domain-builder/Kconfig
@@ -0,0 +1,15 @@
+
+menu "Domain Builder Features"
+
+config DOMAIN_BUILDER
+	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
+	select LIB_DEVICE_TREE
+	help
+	  Enables the domain builder capability to configure boot domain
+	  construction using a flattened device tree.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
+endmenu
-- 
2.30.2



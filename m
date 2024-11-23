Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557AF9D6AD2
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 19:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842170.1257626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuu3-0002li-D0; Sat, 23 Nov 2024 18:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842170.1257626; Sat, 23 Nov 2024 18:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEuu3-0002ic-9y; Sat, 23 Nov 2024 18:30:43 +0000
Received: by outflank-mailman (input) for mailman id 842170;
 Sat, 23 Nov 2024 18:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waGT=SS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tEuln-0006MT-9s
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 18:22:11 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8eb2951-a9c7-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 19:22:08 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1732386060588445.6400500771855;
 Sat, 23 Nov 2024 10:21:00 -0800 (PST)
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
X-Inumbo-ID: d8eb2951-a9c7-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ4ZWIyOTUxLWE5YzctMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzg2MTI5LjMzMTY5NCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1732386064; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LuKtf6yGrosFtvb+ZQDDnHtqkFccL6yvnBuL7iLv4HM+7KvvSt/33sBY0MF+skZy/ryyb+b0S+GX3Ka+8TenUsNLvVMZWwP7LvuQoYW7QfGYWpX4TCZS4uxtz53N6O772TeQei+PR8IiXfCGI2NdFzXv+3s7LEY8oJR49PL/NpU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732386064; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lbJ1kYoT11hAmwZ4EpUrvdMfSFs0q+QjdARR8BxX4a0=; 
	b=HRP2q0nhKt7/tNLQfZkFss67cRQhCbW8x5Z5PQpvaMUZ7r6gKmkQq9QezLKxIyPsp5yfvhyCj5e7jF+HMlb6Z9To/0yeRY5i6BGzk8RVEp5wT/hDe9j35fHskqylWqIwEshmbwIrHILxY23+7Mlr45JdaRGlwPwv2qVwhpH4wIg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732386064;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=lbJ1kYoT11hAmwZ4EpUrvdMfSFs0q+QjdARR8BxX4a0=;
	b=k7Wy/bENWPhRGKEvUdRPIm3xlLwULPPWHkSVOrfQ4QVzm++6BtfUHQw+V8UDJTcV
	XQl/jMz1DtIqVeS9mxL4Db0RNl52G7/CKN2Oq4hQN6fAyRtkkGxuM82xP+AJIdL52Qu
	ri/GcnolgcqI1hFaVbETq2B3k7jAcNQm+HJiPh30=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 05/15] kconfig: introduce domain builder config option
Date: Sat, 23 Nov 2024 13:20:34 -0500
Message-Id: <20241123182044.30687-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241123182044.30687-1-dpsmith@apertussolutions.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hyperlaunch domain builder will be the consolidated boot time domain building
logic framework. Introduces the config option to enable this domain builder to
and turn on the ability to load the domain configuration via a flattened device
tree.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/Kconfig                |  2 ++
 xen/arch/x86/domain_builder/Kconfig | 15 +++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 xen/arch/x86/domain_builder/Kconfig

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
diff --git a/xen/arch/x86/domain_builder/Kconfig b/xen/arch/x86/domain_builder/Kconfig
new file mode 100644
index 000000000000..7be2ec3ed00f
--- /dev/null
+++ b/xen/arch/x86/domain_builder/Kconfig
@@ -0,0 +1,15 @@
+
+menu "Domain Builder Features"
+
+config DOMAIN_BUILDER
+	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
+	select LIB_DEVICE_TREE
+	help
+      Enables the domain builder capability to configure boot domain
+	  construction using a flattened device tree.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
+endmenu
-- 
2.30.2



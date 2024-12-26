Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87DA9FCC09
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 17:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863254.1274690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBx-0003qw-Ka; Thu, 26 Dec 2024 16:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863254.1274690; Thu, 26 Dec 2024 16:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQrBx-0003nO-HD; Thu, 26 Dec 2024 16:58:33 +0000
Received: by outflank-mailman (input) for mailman id 863254;
 Thu, 26 Dec 2024 16:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkhu=TT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tQrBv-00026T-QV
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 16:58:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a166dfd6-c3aa-11ef-a0da-8be0dac302b0;
 Thu, 26 Dec 2024 17:58:30 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1735232275282537.8488659077085;
 Thu, 26 Dec 2024 08:57:55 -0800 (PST)
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
X-Inumbo-ID: a166dfd6-c3aa-11ef-a0da-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1735232278; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W3DodgsazXFjX0SgC7QZPmQngljNi6P3X1Ga6aPmmqLyubSdmVWjkTTBkYcht06FJZ7FOZJLSRfuPKmV6bwsUdUbjpKrXhjymNJh0Q9VyRUJeHsekrFn0Fssm2r15UkUfUpYh/tyBAWZ/TDeeBJDlzNopnHqlZK6dSMd0XihsrA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735232278; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x++da7MTBOqDP2KwlGntWaTQGzUq2g/NoStpY3TKCOk=; 
	b=KnsTPMZO8WNaI3N0W9CgbY8vgQvswWQZ+fquFXtRPYzeJHzaoKpp7dlWovIPdcWELAhl64umXCL/rOgtY8dlfeKBIXovKc8PIwRkaBunWy3eRgM69KtE9Abug4QURByXyY83a5Rt8xbZvhLMirFaMCiDcj9PQwGeuTaWR0fzQRE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735232278;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=x++da7MTBOqDP2KwlGntWaTQGzUq2g/NoStpY3TKCOk=;
	b=huWXxgNUFU9hytyQsge//J9qvUI1mnw7xIsSSmnZAX5i/Ntpz0LMUP/lngDLVUlh
	RSZsWYCje8sCmfil6MQemy1JsFNnRkZNCHDTiFWM3CKvdZswMx73En0skcxYdVlvXvv
	3fg62La3zTl2+UwwGuYUnHGmj5ZE5NBh3KrRySvM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 04/15] kconfig: introduce option to independently enable libfdt
Date: Thu, 26 Dec 2024 11:57:29 -0500
Message-Id: <20241226165740.29812-5-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241226165740.29812-1-dpsmith@apertussolutions.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Currently, the inclusion of libfdt is controlled by the CONFIG_HAS_DEVICE_TREE
kconfig flag. This flag also changes behavior in a few places, such as boot
module processing for XSM. To support the ability to include libfdt without
changing these behaviors, introduce CONFIG_LIB_DEVICE_TREE. The inclusion of
libfdt is then moved under CONFIG_LIB_DEVICE_TREE.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
Changes since v1:
- grammar and spelling fixes to commit message
- corrected indentation to Kconfig format
- relocated LIB_DEVICE_TREE to alphabet ordered location
---
 xen/common/Kconfig  | 4 ++++
 xen/common/Makefile | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6166327f4d14..028ed9c3631e 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -55,6 +55,7 @@ config HAS_COMPAT
 
 config HAS_DEVICE_TREE
 	bool
+	select LIB_DEVICE_TREE
 
 config HAS_DIT # Data Independent Timing
 	bool
@@ -89,6 +90,9 @@ config HAS_UBSAN
 config HAS_VMAP
 	bool
 
+config LIB_DEVICE_TREE
+	bool
+
 config MEM_ACCESS_ALWAYS_ON
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index cba3b32733ba..3d29aef01155 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -79,7 +79,7 @@ obj-y += sched/
 obj-$(CONFIG_UBSAN) += ubsan/
 
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
-obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
+obj-$(CONFIG_LIB_DEVICE_TREE) += libfdt/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
 $(obj)/config.gz: $(CONF_FILE)
-- 
2.30.2



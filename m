Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0378A1894
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703999.1100085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwJF-0002Jc-NF; Thu, 11 Apr 2024 15:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703999.1100085; Thu, 11 Apr 2024 15:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwJF-0002H5-KJ; Thu, 11 Apr 2024 15:25:53 +0000
Received: by outflank-mailman (input) for mailman id 703999;
 Thu, 11 Apr 2024 15:25:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyOp=LQ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ruwJE-0001Lt-QU
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:25:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6b147b3-f817-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 17:25:51 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1712849129263617.850379804771;
 Thu, 11 Apr 2024 08:25:29 -0700 (PDT)
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
X-Inumbo-ID: c6b147b3-f817-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1712849131; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HIx5FW/9J/YpXJij7ziRXd0hJp9LM4o0J4Zsep2HgEIF79eACWqzQSCN0NdAUGiH3yKv1qCzrjKfi70lbC+2TlAb1ShAZBPI6ki4mhTdfc13g19v17SeW8mKCh3daKSKEBi+uaSiAAzeMaAnyltQNJxaGp3uthFGaEVDfAjAXD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712849131; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PUB6KtciZH+3eK2ig4StmU9ob+dKCPfxbaMjLlfbeTo=; 
	b=crNwOm4J84maaWqDwfzmaiwZoffjq7bM5Lto2XWWZsouecA/4qr6vStpzsI0JqtcoXY+vhLXuQaZx6ewVaxRah5PgpRdEAehv+qkD598EjyEfRr4BNGAAaWlfJZPNgBVZtQG9qGNmmptYfjnUbDoditFZiiT7r++emasFsojWf0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712849131;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=PUB6KtciZH+3eK2ig4StmU9ob+dKCPfxbaMjLlfbeTo=;
	b=S01Ct4aY3yD9hCl+rm5uNia74MOxMvb0TqZ8/MBmvfuSuq7gSHxXzEXWxiSSxz4A
	pXKtoiqatUYSzVKneF+cX5EZIwhL0yIeMJXfhPATY6aL5oRwpRJcHLxXU1H39AUYmZM
	hE3SpgS/Qwa54fpYGQoT26o/GEEWHItbsP9++KVM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/5] gzip: colocate gunzip code files
Date: Thu, 11 Apr 2024 11:25:14 -0400
Message-Id: <20240411152518.2995-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411152518.2995-1-dpsmith@apertussolutions.com>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This patch moves the gunzip code files to common/gzip. Makefiles are adjusted
accordingly.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/Makefile             | 2 +-
 xen/common/gzip/Makefile        | 1 +
 xen/common/{ => gzip}/gunzip.c  | 0
 xen/common/{ => gzip}/inflate.c | 0
 4 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/gzip/Makefile
 rename xen/common/{ => gzip}/gunzip.c (100%)
 rename xen/common/{ => gzip}/inflate.c (100%)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index e5eee19a8537..d512cad5243f 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -14,7 +14,7 @@ obj-y += event_channel.o
 obj-y += event_fifo.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += guestcopy.o
-obj-bin-y += gunzip.init.o
+obj-y += gzip/
 obj-$(CONFIG_HYPFS) += hypfs.o
 obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
diff --git a/xen/common/gzip/Makefile b/xen/common/gzip/Makefile
new file mode 100644
index 000000000000..bda73c0184ad
--- /dev/null
+++ b/xen/common/gzip/Makefile
@@ -0,0 +1 @@
+obj-bin-y += gunzip.init.o
diff --git a/xen/common/gunzip.c b/xen/common/gzip/gunzip.c
similarity index 100%
rename from xen/common/gunzip.c
rename to xen/common/gzip/gunzip.c
diff --git a/xen/common/inflate.c b/xen/common/gzip/inflate.c
similarity index 100%
rename from xen/common/inflate.c
rename to xen/common/gzip/inflate.c
-- 
2.30.2



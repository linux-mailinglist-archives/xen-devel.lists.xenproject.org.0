Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6799FEAC5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 22:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863551.1274946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt2-0007Oo-PL; Mon, 30 Dec 2024 21:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863551.1274946; Mon, 30 Dec 2024 21:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt2-0007L1-JO; Mon, 30 Dec 2024 21:01:16 +0000
Received: by outflank-mailman (input) for mailman id 863551;
 Mon, 30 Dec 2024 21:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjPe=TX=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tSMt1-00073D-57
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 21:01:15 +0000
Received: from mx1.somlen.de (typhoon.somlen.de [89.238.64.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 343edaa2-c6f1-11ef-a0db-8be0dac302b0;
 Mon, 30 Dec 2024 22:01:13 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 6841F506D31;
 Mon, 30 Dec 2024 22:01:13 +0100 (CET)
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
X-Inumbo-ID: 343edaa2-c6f1-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1735592473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNoycYF/AunNCbr33bPlfVZJJaaGcAgrVSlzFQ4oMMU=;
	b=Jd/ryk/mRGv4VnXHj3pLw18iO39jMHpJOXtH+LSHqrLZSQy1Kp6PNpTLMyv/UCxUqC0oM+
	Wc0AVSF/DR1vXdcfjAF7iXWLChWteN1+Hewq/vNohDVERwOX4SLUe49E3VmhF9PkpARXmP
	bIt5guaI5iSxwBg4xL16NO/gvhOyxFX9AnrfOrbi+rT1e2pgs+X5usSZ9I2m8h1Sc/m50U
	W39PRRlh3Wxyxt9gJlfPKvz8NZJOGRBShrXs42TEu+fzMcuvAFkYUw+1NN/romZ/Iy1U4L
	HTLUKXwjwMHcbwO9LSHnes6YmElHgwT+d0NuwhiwQbtqRsx0dYEvKiSelry0YA==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 3/5] xen/arch/x86: make objdump output user locale agnostic
Date: Mon, 30 Dec 2024 22:00:31 +0100
Message-Id: <c86ce036f829a9e626c8d1dfc595c6caf6c48212.1735585600.git.maxi@daemonizer.de>
In-Reply-To: <cover.1735585600.git.maxi@daemonizer.de>
References: <cover.1735585600.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The objdump output is fed to grep, so make sure it doesn't change with
different user locales and break the grep parsing.
This problem was identified while updating xen in Debian and the fix is
needed for generating reproducible builds in varying environments.

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 xen/arch/x86/arch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 9dde8a5756..cb47d72991 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -109,7 +109,7 @@ endif
 ifeq ($(XEN_BUILD_PE),y)
 
 # Check if the linker produces fixups in PE by default
-efi-nr-fixups := $(shell $(OBJDUMP) -p $(efi-check).efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
+efi-nr-fixups := $(shell LC_ALL=C $(OBJDUMP) -p $(efi-check).efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
 
 ifeq ($(efi-nr-fixups),2)
 MKRELOC := :
-- 
2.39.5



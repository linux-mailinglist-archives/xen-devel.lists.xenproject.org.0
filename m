Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253A987C508
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693513.1081705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMx-0000ts-Ea; Thu, 14 Mar 2024 22:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693513.1081705; Thu, 14 Mar 2024 22:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMx-0000pV-AO; Thu, 14 Mar 2024 22:16:11 +0000
Received: by outflank-mailman (input) for mailman id 693513;
 Thu, 14 Mar 2024 22:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y43E=KU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rktMv-0000X2-2B
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:16:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fbee253-e250-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 23:16:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1B23E8285446;
 Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5HM8izUN8lnN; Thu, 14 Mar 2024 17:15:58 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5C43A828673E;
 Thu, 14 Mar 2024 17:15:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OKrLz0-b-UO0; Thu, 14 Mar 2024 17:15:58 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D68AF828543D;
 Thu, 14 Mar 2024 17:15:57 -0500 (CDT)
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
X-Inumbo-ID: 6fbee253-e250-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5C43A828673E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710454558; bh=sYFuyPzI+hrrFJYLQ4ibI3REmlE1nCAfT4TkBNcqNYs=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=RzrlIuYuVGBybpl9EcDNGgjX4G+3zxrBCmEfVoQ+tXsIRSp6xvp1tTfgjU2Mphebl
	 wOz25CGw3W98rVsls2QkzQofvLspPhBrHFzm7vYT6J1R6U04H25UnsfmeEqcwkPdFt
	 R35HGpFCKaHBDAmduVRBT1P3SqR8dkBwcA4CP+tg=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/9] EFI: Introduce inline stub for efi_enabled on !X86 && !ARM
Date: Thu, 14 Mar 2024 17:15:39 -0500
Message-Id: <39069a589f9c4dc0db9b01b7412c1a99bea55f37.1710443965.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1710443965.git.sanastasio@raptorengineering.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On architectures with no EFI support, define an inline stub
implementation of efi_enabled in efi.h that always returns false.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/include/xen/efi.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 942d2e9491..160804e294 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -31,7 +31,15 @@ union compat_pf_efi_info;
 struct xenpf_efi_runtime_call;
 struct compat_pf_efi_runtime_call;
 
+#if defined(CONFIG_X86) || defined(CONFIG_ARM)
 bool efi_enabled(unsigned int feature);
+#else
+static inline bool efi_enabled(unsigned int feature)
+{
+    return false;
+}
+#endif
+
 void efi_init_memory(void);
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
 bool efi_rs_using_pgtables(void);
-- 
2.30.2



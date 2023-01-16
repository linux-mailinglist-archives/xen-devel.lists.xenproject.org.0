Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5382C66B7C6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 08:05:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478344.741528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYQ-00019p-1h; Mon, 16 Jan 2023 07:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478344.741528; Mon, 16 Jan 2023 07:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHJYP-000155-RY; Mon, 16 Jan 2023 07:05:13 +0000
Received: by outflank-mailman (input) for mailman id 478344;
 Mon, 16 Jan 2023 07:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHJYN-00077f-Nx
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 07:05:11 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dcc2f81-956c-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 08:05:10 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id w14so22136567edi.5
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 23:05:10 -0800 (PST)
Received: from uni.router.wind (adsl-67.109.242.224.tellas.gr.
 [109.242.224.67]) by smtp.googlemail.com with ESMTPSA id
 v15-20020a056402184f00b0046c5baa1f58sm10990824edy.97.2023.01.15.23.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 23:05:09 -0800 (PST)
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
X-Inumbo-ID: 1dcc2f81-956c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFtAIFWagelWwYtF1JcxxpIotxhdCnsB0YtD2VA9RRo=;
        b=RT//jZDLvmix66SORRWgKClrn5/Rfa9SfWfdd01NqS2+KeNxcbUjgD3ynhoeDOC9FN
         8cH7b0b0SImNbTWC/H4xsCDsBPMVp8kXunVuILoXAhGyRBUlYaGXpvsSOUeWOWGJWgLh
         v5VkLHYur8nQMtheKKXu5/v9FkBWpwDUshk6X12qLiGKgU+JICuO+8dSoYH/GySQQ5RL
         HsbRWRphVQcSKP7y3m6RbWVXV5sRa0/v54n6BVf/+i0UrZRHT5jYnfmO0sfZxnR1teaY
         w+BL6m1tHsR2Wnl6Jh+nRkR5OI2OpVJ6DRGi456WAbapgq/Vo+gcREbkB+bv3mCZIX6T
         JMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFtAIFWagelWwYtF1JcxxpIotxhdCnsB0YtD2VA9RRo=;
        b=E6ngn+JYNwQLOVfKCgPLIjqieR8j3XFFtQam0Zc4mwe6RP2zjUmHku6XEiiZq4oTFi
         XGX7V9xhONDYSaKn1Y5tivg13ZHj09V5DQRPCVFoJzzWX+epp/N/Ek1+XQKqRFM9LTMS
         9EICp8nDSWqTbhVgiljXfZJMplmg9cMPmRWZQ9h8jkg046v9CFJV6X5mkFlkKq12d3sj
         ECJmNBICsEcYQsJV0NmUSyA8cUw6Tv4cu2yDW69fiFgyK9vfR90rKavtlU+gUh+rrMXl
         Iwm7JD8hy8F6hoByhFIYtQK4EGWelDsAkR7AHejQCFDnZSKbzn5Ov2Te1z/eu3gR9IR0
         8dPQ==
X-Gm-Message-State: AFqh2kogGiOtgvq8pym3I49bUEwfvUbBzSr+HDP61VE36wVEZ9d1IG9f
	EEzA20RYSb6Ab+P7toO1AtukoEGktW4=
X-Google-Smtp-Source: AMrXdXt1cCRLvVR7hwmgT7ueBnmamvx7LubZMuPwhQ4tixWhuyn7PeJawKU0VJYORkt4+PIMEiOKkA==
X-Received: by 2002:aa7:c946:0:b0:496:4d2f:1b4b with SMTP id h6-20020aa7c946000000b004964d2f1b4bmr9099920edt.7.1673852710095;
        Sun, 15 Jan 2023 23:05:10 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 8/8] x86/iommu: make AMD-Vi and Intel VT-d support configurable
Date: Mon, 16 Jan 2023 09:04:31 +0200
Message-Id: <20230116070431.905594-9-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230116070431.905594-1-burzalodowa@gmail.com>
References: <20230116070431.905594-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide the user with configuration control over the IOMMU support by making
AMD_IOMMU and INTEL_IOMMU options user selectable and able to be turned off.

However, there are cases where the IOMMU support is required, for instance for
a system with more than 254 CPUs. In order to prevent users from unknowingly
disabling it and ending up with a broken hypervisor, make the support user
selectable only if EXPERT is enabled.

To preserve the current default configuration of an x86 system, both options
depend on X86 and default to Y.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Changes in v3:
  - add Jan's Acked-by tag

 xen/drivers/passthrough/Kconfig | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 5c65567744..864fcf3b0c 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -38,10 +38,28 @@ config IPMMU_VMSA
 endif
 
 config AMD_IOMMU
-	def_bool y if X86
+	bool "AMD IOMMU" if EXPERT
+	depends on X86
+	default y
+	help
+	  Enables I/O virtualization on platforms that implement the
+	  AMD I/O Virtualization Technology (IOMMU).
+
+	  If your system includes an IOMMU implementing AMD-Vi, say Y.
+	  This is required if your system has more than 254 CPUs.
+	  If in doubt, say Y.
 
 config INTEL_IOMMU
-	def_bool y if X86
+	bool "Intel VT-d" if EXPERT
+	depends on X86
+	default y
+	help
+	  Enables I/O virtualization on platforms that implement the
+	  Intel Virtualization Technology for Directed I/O (Intel VT-d).
+
+	  If your system includes an IOMMU implementing Intel VT-d, say Y.
+	  This is required if your system has more than 254 CPUs.
+	  If in doubt, say Y.
 
 config IOMMU_FORCE_PT_SHARE
 	bool
-- 
2.37.2



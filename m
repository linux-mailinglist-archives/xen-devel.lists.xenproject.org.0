Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930169495D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494621.764832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHb-0004TC-9s; Mon, 13 Feb 2023 14:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494621.764832; Mon, 13 Feb 2023 14:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHb-0004MP-1C; Mon, 13 Feb 2023 14:58:19 +0000
Received: by outflank-mailman (input) for mailman id 494621;
 Mon, 13 Feb 2023 14:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHY-0001Ha-Vn
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:17 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7fe0c09-abae-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 15:58:15 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id eq11so13272291edb.6
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:58:15 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:58:14 -0800 (PST)
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
X-Inumbo-ID: d7fe0c09-abae-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4XxNzz7rqsriFu3pt/xtkLxxWkI8GAzMmbRJ9k+P3k=;
        b=LIVU7Nn9rKw1Sx2lMV6AQsc501lDTNYf4YUZT8T+RQe3HEnEcWlUAkLkCDBPHdyeSn
         XSYCHC2ioaJPSJBc9pmsL4o4K9FZBIOKyLkM+ScNiB2zZEifYfYubSp1CnZJGEdhwE6x
         PHhKCUpimVfjTaqgC101oXU7Im8XBkpB4N8GxkE9RsIvnkNhzgp+nD1yLT2wWwD7jvqj
         o6LRjEXXX8Qw1wVsBF/nMyLFE6X4ngRMNvQJ9U4AEaUZ3NA4QZjiCId7fNHfCavXhEWm
         aqdlxa7HOc8BCSlnKFYsicDqhdiUQAVxRU7nnmyfSja0TYVaUVx6q/crAORjbImsbOWF
         dYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4XxNzz7rqsriFu3pt/xtkLxxWkI8GAzMmbRJ9k+P3k=;
        b=RTHCgql5+CuBdg8LBKmmeiPQeOiuEGakkJluYntETneh5YBkzxlPoWB97cBKrWizf6
         PKqyA0oE/9coMAUCKcTWHvE/VYr2KXk4lOiUTriei+ltK8K67w2Bo/Jmp26FA3IRqcR2
         o35djpte9YEY4jVmoDkhovnU2t+a4mH+BCMThysTP0TYfLQTFN5ZZNmPxuDqrRv+V6Ft
         YAaAGTDb/looVP3W5gXmtLP1BT+sXyG1tAg1DuC6mDSvkTsg2yUDWk6mcM9+YLHMdCaP
         dh91JrHB2YH6lFI8G5jk/hRSCPB7AfN5v27dz2eOVbgmw1Oh1J4DWWnqEPujdySmFq7z
         STqw==
X-Gm-Message-State: AO0yUKX4PSsLK1nMcYDMEQvxOx1LYHiOSACou3GNhHFDMJQ9GugjRAtK
	GdWdiowsdimlqMmDUAgewqXdnM/xTIY=
X-Google-Smtp-Source: AK7set+qOVFZEYPqf6090xY3A1jG/4TWdiNMUokFCls7wZJZ0YWyYbbwmfdRqnyNYh17MWf/omyhwg==
X-Received: by 2002:a50:8705:0:b0:4ab:4569:4b9f with SMTP id i5-20020a508705000000b004ab45694b9fmr10836818edb.0.1676300294999;
        Mon, 13 Feb 2023 06:58:14 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 10/10] x86/hvm: make AMD-V and Intel VT-x support configurable
Date: Mon, 13 Feb 2023 16:57:51 +0200
Message-Id: <20230213145751.1047236-11-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide the user with configuration control over the cpu virtualization support
in Xen by making AMD_SVM and INTEL_VMX options user selectable.

To preserve the current default behavior, both options depend on HVM and
default to Y.

To prevent users from unknowingly disabling virtualization support, make the
controls user selectable only if EXPERT is enabled.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/Kconfig | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 2a72111c23..fce40f08b1 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -118,10 +118,24 @@ config HVM
 	  If unsure, say Y.
 
 config AMD_SVM
-	def_bool y if HVM
+	bool "AMD-V" if EXPERT
+	depends on HVM
+	default y
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  AMD Virtualization Technology (AMD-V).
+	  If your system includes a processor with AMD-V support, say Y.
+	  If in doubt, say Y.
 
 config INTEL_VMX
-	def_bool y if HVM
+	bool "Intel VT-x" if EXPERT
+	depends on HVM
+	default y
+	help
+	  Enables virtual machine extensions on platforms that implement the
+	  Intel Virtualization Technology (Intel VT-x).
+	  If your system includes a processor with Intel VT-x support, say Y.
+	  If in doubt, say Y.
 
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
-- 
2.37.2



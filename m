Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B617B6F12FF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 10:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527189.819523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJ9l-0003w5-31; Fri, 28 Apr 2023 08:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527189.819523; Fri, 28 Apr 2023 08:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJ9k-0003nA-SE; Fri, 28 Apr 2023 08:08:40 +0000
Received: by outflank-mailman (input) for mailman id 527189;
 Fri, 28 Apr 2023 08:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmhV=AT=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1psJ9j-0003M3-D7
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 08:08:39 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0a4c247-e59b-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 10:08:37 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso44959705e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 01:08:37 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c230d00b003f31da39b62sm2569464wmo.18.2023.04.28.01.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 01:08:35 -0700 (PDT)
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
X-Inumbo-ID: e0a4c247-e59b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682669316; x=1685261316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ull2YxWBFQl0HliuvqOLTfd5qwQa1W30wkLZFscPDpw=;
        b=c+VOSAyMBxEBJRiQ8XbRHkxqCgy0oM1qlBzbUlrqhy5sOrgE/OmyiX6kEah4qp9Mv1
         0PH0dOE65KsGrnQ4cqQe7QqsgNJuJrDbY5ZtDA3X7mWDTuBb3ADkldtl8Pr82RMs1+QK
         xDvNRBvKGqm1IWFmyCTvrlH4OwlKt15nv/Woc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682669316; x=1685261316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ull2YxWBFQl0HliuvqOLTfd5qwQa1W30wkLZFscPDpw=;
        b=GX67mYm0XihBfzix7fo1d/rZ2zdad+QYsmvs8dhqqV+N0MAJlQg6pRnvE0yCDH4Z78
         Rzc+Kk1wgyFN4ayEv1YXowbOQnxAUzulI3f1osMNfLTZhnfV7ZvlPuE4kdJT1F6SqmkE
         s5Hzh5JeLWN/vXg3B6R2ZDdWhsGYJbqfyj6fRuh9CIdMFohkQ8URsxtmZJANjuqu++tA
         P0g+UHZbXlMM1LmMUj4WuxBJzw6v+Q4kOsdQfzi11KgtTmlvtvjOE9+WvI3US9Kk5LzG
         sSVIzDK7jcR+vrPkfkRQZZU9a3SH2UxvyF0MFVeJntsegJxZk7icVnYWKoX/cVCiUgJ2
         loTA==
X-Gm-Message-State: AC+VfDxHf7YNzgJW7RfiSiQKQarJiwRGOc6xRNZ2lGqtC3qkftfEqg/f
	1WfmXCFPRp0mRun8B5rwAbVFttFtllTc4MzfNq8=
X-Google-Smtp-Source: ACHHUZ4sKhcZrmWQOmeyk+jAWUc6aoWKQoq2pZkkD16DksbVl/Kln3xeeBjNzDXSKv8Zi17uTg+tkw==
X-Received: by 2002:a05:600c:220d:b0:3f1:9526:22be with SMTP id z13-20020a05600c220d00b003f1952622bemr3282326wml.23.1682669316259;
        Fri, 28 Apr 2023 01:08:36 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 5/5] SUPPORT.md: Make all security support explicit
Date: Fri, 28 Apr 2023 09:08:32 +0100
Message-Id: <20230428080832.2461044-5-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428080832.2461044-1-george.dunlap@cloud.com>
References: <20230428080832.2461044-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial goal of SUPPORT.md was to help both users, and the Xen
Project Security Team, determine what functionality was security
supported; i.e., what kinds of security bugs would trigger an XSA.

Our proposal is that as of 4.18, all functionality not explicitly
listed as security supported will be considered not security
supported.  Add some text to that effect.

The patch as written cannot be applied, since specifying "xl.cfg core
functionality" is a TODO; but it should do to start a discussion.

Signed-off-by: Georg Dunlap <george.dunlap@cloud.com>
---
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper@cloud.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@cloud.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 SUPPORT.md | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index aa1940e55f..fcbcb44c44 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -17,6 +17,36 @@ for the definitions of the support status levels etc.
 Release Notes
 : <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
 
+# General security support
+
+An XSA will always be issued for security-related bugs which are
+present in a "plain vanilla" configuration.  A "plain vanilla"
+configuration is defined as follows:
+
+* The Xen hypervisor is built from a tagged release of Xen, or a
+  commit which was on the tip of one of the supported stable branches.
+
+* The Xen hypervisor was built with the default config for the platform
+
+* No Xen command-line parameters were specified
+
+* No parameters for Xen-related drivers in the Linux kernel were specified
+
+* No modifications were made to the default xl.conf
+
+* xl.cfg files use only core functionality
+
+* Alternate toolstacks only activate functionality activated by the
+  core functionality of xl.cfg files.
+
+Any system outside this configuration will only be considered security
+supported if the functionality is explicitly listed as supported in
+this document.
+
+If a security-related bug exits only in a configuration listed as not
+security supported, the security team will generally not issue an XSA;
+the bug will simply be handled in public.
+
 # Feature Support
 
 ## Kconfig
-- 
2.25.1



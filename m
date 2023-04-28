Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D75D6F130E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 10:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527207.819548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJDX-0007OU-Rj; Fri, 28 Apr 2023 08:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527207.819548; Fri, 28 Apr 2023 08:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJDX-0007MH-OX; Fri, 28 Apr 2023 08:12:35 +0000
Received: by outflank-mailman (input) for mailman id 527207;
 Fri, 28 Apr 2023 08:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmhV=AT=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1psJDV-0007Lx-WB
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 08:12:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3d61d0-e59c-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 10:12:33 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so59630545e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 01:12:33 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm20655456wrf.73.2023.04.28.01.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 01:12:32 -0700 (PDT)
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
X-Inumbo-ID: 6d3d61d0-e59c-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682669552; x=1685261552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ull2YxWBFQl0HliuvqOLTfd5qwQa1W30wkLZFscPDpw=;
        b=LVsGuSvxSXIKRXj6ZPk4Zx48oWm72M1THdn6GJgbyPbEg3QSyNDe2Iik3tPNCu3YEt
         9Ai0K8fJ9dQAi9dthxVlHBDvRl1/Qj53KZ1PESnDr0I1qRMlblGYCTAHiHDrdl9zBnoT
         Bldgj8thXfWN2LecuFI9jyXSOHI+QtJK37mYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682669552; x=1685261552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ull2YxWBFQl0HliuvqOLTfd5qwQa1W30wkLZFscPDpw=;
        b=hKlUBVx8u2eVojiA/xS3iemEDBfD1P7v45f7KJLEroStJMj/z2zKr647Cz056YQGXQ
         CU3dE1UhABZscn7ZrWNrsi6MIO0zl0gDLhpDaC3/bR+KSt6QYXembi4BF/O0H923unGv
         gbLAvEFs58bNYfanpO8+y38JKPEGGBRrepQ+G7Pz0HR/715R1wA189v0Qh1zneShakUN
         YNn1WAb37WcGdCR+GfYC1r2v+cAAgqPVjBBB70M5yNmmeyfa5lK8KTl8a403KNXWXNT4
         hdDGpAmE1Un/ZHWvYV8RbCt0dKLny+RXTbfSZOCH7ceTRZ0kcyUYvRatDQjfaP1xV++6
         qANQ==
X-Gm-Message-State: AC+VfDzK1TdEq0N21almdehdwDl/nLjw2w4N20femdF1OFnvPYATh7aU
	iSmj68iv0GoEC806vnuxUh2hcS1/k9knJ2HagOU=
X-Google-Smtp-Source: ACHHUZ7VNVaY+I109n2GVJBGOURrb5g+fuYJ/Plbvuhsj8QMP5lDMr1XLZ/RGo8yfQadGyFSGf1pYg==
X-Received: by 2002:a05:600c:299:b0:3f1:8c37:fa79 with SMTP id 25-20020a05600c029900b003f18c37fa79mr3288376wmk.31.1682669552336;
        Fri, 28 Apr 2023 01:12:32 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH RFC] SUPPORT.md: Make all security support explicit
Date: Fri, 28 Apr 2023 09:12:31 +0100
Message-Id: <20230428081231.2464275-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
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



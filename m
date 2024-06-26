Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFB918608
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 17:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749244.1157278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUjP-0006dQ-Ko; Wed, 26 Jun 2024 15:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749244.1157278; Wed, 26 Jun 2024 15:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUjP-0006bU-Hw; Wed, 26 Jun 2024 15:38:47 +0000
Received: by outflank-mailman (input) for mailman id 749244;
 Wed, 26 Jun 2024 15:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMUjO-0006Z3-9w
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 15:38:46 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b7e1f3f-33d2-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 17:38:44 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-79c084476bdso188386285a.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 08:38:44 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef30c1esm55692166d6.79.2024.06.26.08.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 08:38:42 -0700 (PDT)
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
X-Inumbo-ID: 2b7e1f3f-33d2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719416323; x=1720021123; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KG63BasigL6EjyAVVQsMRh0WTj185+GcKDw46ekPGTI=;
        b=UtmHvmJ563bizgLXpiYe76cEAt0Q/JcKZr2eo9eqrzeuEPz3nza7Mv93KCbD6UrYGe
         TkmSHCcPir+rFgMwy7U/DOq7L6w4O9vDn0j9k1fFlIbsY4SS5OpGEzTMnn3igNAdHQ9/
         R9hw6B7X/cn1DxeRXkrOLuUd3Wef0+sIgsbLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416323; x=1720021123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KG63BasigL6EjyAVVQsMRh0WTj185+GcKDw46ekPGTI=;
        b=DsFywpnMHQxb48tT6/vSdwExzJI8JbbXYb/M5gowdTiveSv3LU3M5WYbXdQQTYNLfB
         onIWLA5y9g3hxgH3jHQoSXN4XtJ1LsvAeWDQ+D4ZjTYQX51DFHhOLK3DYMTJn3ANKaSU
         0+fihe93qolsYgUZyVBlPueul/+W0ZEdDQxSJFoYqV1v/J8IkE7x/1q/yFjeaJg3FUmP
         YCPwjNjKy/lwbLVTZL0FeqCz6N1Z5bjV55s8BNpVckgepAy+/6BK9gZZxAhEI1ixB2iz
         uI7Cf4edudyED0PhCOEVWA6zhlVQ48f57e22wwfWOCijfTmvucgvT6F0ccnYONSPgGcm
         IFAA==
X-Gm-Message-State: AOJu0YwAJAm9DmahJ1pFCvtjy9RUTXHbz6rH5qSQfT0MLY69z8NmHdHy
	Xx/j4YhqcBxnk/Ng3d+nSPbTdkVXl3fOLJBX1yY+cuXRqiok9yFwvWRdar7Xn/3/Nr9VPtzwMgj
	nm2c=
X-Google-Smtp-Source: AGHT+IEvEO2vzEzCn0fizkYLMdQH8kX6ddBLYClg1yQzeHBXTdml0NZkSOUyGLpMRPNAKTuZzPLB3A==
X-Received: by 2002:a0c:f051:0:b0:6b4:ffca:ca96 with SMTP id 6a1803df08f44-6b5409e0b5dmr112332276d6.30.1719416323083;
        Wed, 26 Jun 2024 08:38:43 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Nick Rosbrook <rosbrookn@gmail.com>
Subject: [PATCH] MAINTAINERS: Step down as maintainer and committer
Date: Wed, 26 Jun 2024 16:19:35 +0100
Message-Id: <20240626151935.26704-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remain a Reviewer on the golang bindings and scheduler for now (using
a xenproject.org alias), since there may be architectural decisions I
can shed light on.

Remove the XENTRACE section entirely, as there's no obvious candidate
to take it over; having the respective parts fall back to the tools
and The Rest seems the most reasonable option.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Juergen Gross <jgross@suse.com>
CC: Nick Rosbrook <rosbrookn@gmail.com>
---
 MAINTAINERS | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d66b898ec..2b0c894527 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -325,8 +325,8 @@ F:	xen/arch/x86/debug.c
 F:	tools/debugger/gdbsx/
 
 GOLANG BINDINGS
-M:	George Dunlap <george.dunlap@citrix.com>
 M:	Nick Rosbrook <rosbrookn@gmail.com>
+R:	George Dunlap <gwd@xenproject.org>
 S:	Maintained
 F:	tools/golang
 
@@ -490,9 +490,9 @@ S:	Supported
 F:	xen/common/sched/rt.c
 
 SCHEDULING
-M:	George Dunlap <george.dunlap@citrix.com>
 M:	Dario Faggioli <dfaggioli@suse.com>
 M:	Juergen Gross <jgross@suse.com>
+R:	George Dunlap <gwd@xenproject.org>
 S:	Supported
 F:	xen/common/sched/
 
@@ -597,7 +597,6 @@ F:	tools/tests/x86_emulator/
 X86 MEMORY MANAGEMENT
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-R:	George Dunlap <george.dunlap@citrix.com>
 S:	Supported
 F:	xen/arch/x86/mm/
 
@@ -641,13 +640,6 @@ F:	tools/libs/store/
 F:	tools/xenstored/
 F:	tools/xs-clients/
 
-XENTRACE
-M:	George Dunlap <george.dunlap@citrix.com>
-S:	Supported
-F:	tools/xentrace/
-F:	xen/common/trace.c
-F:	xen/include/xen/trace.h
-
 XEN MISRA ANALYSIS TOOLS
 M:	Luca Fancellu <luca.fancellu@arm.com>
 S:	Supported
@@ -670,7 +662,6 @@ K:	\b(xsm|XSM)\b
 
 THE REST
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-M:	George Dunlap <george.dunlap@citrix.com>
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Julien Grall <julien@xen.org>
 M:	Stefano Stabellini <sstabellini@kernel.org>
-- 
2.25.1



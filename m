Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7B76DB39
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 01:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575859.901331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsE-0002Zd-BV; Wed, 02 Aug 2023 23:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575859.901331; Wed, 02 Aug 2023 23:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsE-0002Xr-8l; Wed, 02 Aug 2023 23:03:22 +0000
Received: by outflank-mailman (input) for mailman id 575859;
 Wed, 02 Aug 2023 23:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qRKsC-0002Xg-Vq
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 23:03:21 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c461511c-3188-11ee-b265-6b7b168915f2;
 Thu, 03 Aug 2023 01:03:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 20C018285570;
 Wed,  2 Aug 2023 18:03:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id L50En6x9HQe5; Wed,  2 Aug 2023 18:03:15 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D5AB982853DD;
 Wed,  2 Aug 2023 18:03:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2FNVpzo_oeqE; Wed,  2 Aug 2023 18:03:15 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 694448285570;
 Wed,  2 Aug 2023 18:03:15 -0500 (CDT)
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
X-Inumbo-ID: c461511c-3188-11ee-b265-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D5AB982853DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691017395; bh=E+ZWgBHexIIC5drESkxQIt9+akyKQK9mOXv/LPhfb4Q=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pjB+X0hSerN2rUHKxTcnAfmizRMpvZMhGE7AQBDKKqHFNnbg/6czAiGEOl41rxIxT
	 FrrVzUYoUnLeYvKKS8KubPQxSIBYqxhnrISMfeT9cCCyCKH/QaQ6tKQCnVcQeA2zPB
	 TC/YoWujZn/nJ6ATFkINIV7dx0rvwFYYeoRmG810=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/9] xen/common: Add missing #includes treewide
Date: Wed,  2 Aug 2023 18:02:57 -0500
Message-Id: <2c9eb4fc175a1bdd21293f2e2611d8e21991636d.1691016993.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1691016993.git.sanastasio@raptorengineering.com>
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

A few files treewide depend on defininitions in headers that they
don't include. This works when arch headers end up including the
required headers by chance, but broke on ppc64 with only minimal/stub
arch headers.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/common/memory.c       | 1 +
 xen/common/symbols.c      | 1 +
 xen/common/xmalloc_tlsf.c | 1 +
 xen/include/xen/domain.h  | 1 +
 xen/include/xen/iommu.h   | 1 +
 xen/include/xen/sched.h   | 1 +
 6 files changed, 6 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index c206fa4808..1b185b00e4 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -28,6 +28,7 @@
 #include <asm/current.h>
 #include <asm/hardirq.h>
 #include <asm/p2m.h>
+#include <asm/page.h>
 #include <public/memory.h>
 #include <xsm/xsm.h>
=20
diff --git a/xen/common/symbols.c b/xen/common/symbols.c
index 9377f41424..691e617925 100644
--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -19,6 +19,7 @@
 #include <xen/virtual_region.h>
 #include <public/platform.h>
 #include <xen/guest_access.h>
+#include <xen/errno.h>
=20
 #ifdef SYMBOLS_ORIGIN
 extern const unsigned int symbols_offsets[];
diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index c603c39bb9..349b31cb4c 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -27,6 +27,7 @@
 #include <xen/mm.h>
 #include <xen/pfn.h>
 #include <asm/time.h>
+#include <asm/page.h>
=20
 #define MAX_POOL_NAME_LEN       16
=20
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index d35af34841..767127b440 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -4,6 +4,7 @@
=20
 #include <xen/types.h>
=20
+#include <public/domctl.h>
 #include <public/xen.h>
 #include <asm/domain.h>
 #include <asm/numa.h>
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971..ef817efec9 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -24,6 +24,7 @@
 #include <xen/page-defs.h>
 #include <xen/pci.h>
 #include <xen/spinlock.h>
+#include <xen/errno.h>
 #include <public/domctl.h>
 #include <public/hvm/ioreq.h>
 #include <asm/device.h>
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 854f3e32c0..6a96534a45 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -21,6 +21,7 @@
 #include <xen/smp.h>
 #include <xen/perfc.h>
 #include <asm/atomic.h>
+#include <asm/current.h>
 #include <xen/vpci.h>
 #include <xen/wait.h>
 #include <public/xen.h>
--=20
2.30.2



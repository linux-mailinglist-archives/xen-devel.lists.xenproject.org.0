Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D66786135
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 22:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589513.921467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8g-00053n-B7; Wed, 23 Aug 2023 20:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589513.921467; Wed, 23 Aug 2023 20:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8g-000512-89; Wed, 23 Aug 2023 20:07:38 +0000
Received: by outflank-mailman (input) for mailman id 589513;
 Wed, 23 Aug 2023 20:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Dg=EI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYu8e-0004Vt-RP
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 20:07:36 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1a7cf85-41f0-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 22:07:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1852182855DC;
 Wed, 23 Aug 2023 15:07:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id uZoO9KfOnNA8; Wed, 23 Aug 2023 15:07:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3457682854AE;
 Wed, 23 Aug 2023 15:07:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LcVz9PzYzhOf; Wed, 23 Aug 2023 15:07:31 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 733AE828556D;
 Wed, 23 Aug 2023 15:07:30 -0500 (CDT)
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
X-Inumbo-ID: b1a7cf85-41f0-11ee-9b0c-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3457682854AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692821251; bh=uqKv0cI8bm6fBXMRvyKP1NoJ1ooRWBO2+LzKlpR82/4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ovKK6ImsM4R5NCJFZ1t6DSwnX9zJEsrlW1yPlwnYq8v80cnLGc0SAIbqfcrQqPiVH
	 yLWvAzIih5Lg6HnMqPAoW30U18qtJOzhPcoHKk6hNvj78VZXGHLt7B93TO9A+Vy2RQ
	 p9ZcEjmQMBgwOK8PBBbLg25Gix94zQoKHLTeEz04=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/8] xen/common: Add missing #includes treewide
Date: Wed, 23 Aug 2023 15:07:12 -0500
Message-Id: <e786dd5bbd6c235c69f5b2e49d485397f155d393.1692816595.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1692816595.git.sanastasio@raptorengineering.com>
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

A few files treewide depend on defininitions in headers that they
don't include. This works when arch headers end up including the
required headers by chance, but broke on ppc64 with only minimal/stub
arch headers.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v2:
  - (xen/domain.h) Drop <public/domctl.h> include in favor of a forward
    declaration of struct xen_domctl_createdomain.

 xen/common/memory.c       | 1 +
 xen/common/symbols.c      | 1 +
 xen/common/xmalloc_tlsf.c | 1 +
 xen/include/xen/domain.h  | 1 +
 xen/include/xen/iommu.h   | 1 +
 xen/include/xen/sched.h   | 1 +
 6 files changed, 6 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index b1dcbaf551..fa165ebc14 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -28,6 +28,7 @@
 #include <asm/current.h>
 #include <asm/hardirq.h>
 #include <asm/p2m.h>
+#include <asm/page.h>
 #include <public/memory.h>
 #include <xsm/xsm.h>

diff --git a/xen/common/symbols.c b/xen/common/symbols.c
index 9377f41424..691e617925 100644
--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -19,6 +19,7 @@
 #include <xen/virtual_region.h>
 #include <public/platform.h>
 #include <xen/guest_access.h>
+#include <xen/errno.h>

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

 #define MAX_POOL_NAME_LEN       16

diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index d35af34841..81fb05a642 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -77,6 +77,7 @@ void arch_vcpu_destroy(struct vcpu *v);
 int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset=
);
 void unmap_vcpu_info(struct vcpu *v);

+struct xen_domctl_createdomain;
 int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config,
                        unsigned int flags);
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 110693c59f..7368df9138 100644
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
index b4f43cd410..d8c8dd85a6 100644
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
--
2.30.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B9DA09D1D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 22:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870012.1281458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWMPj-0008Ff-F9; Fri, 10 Jan 2025 21:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870012.1281458; Fri, 10 Jan 2025 21:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWMPj-0008ER-Bq; Fri, 10 Jan 2025 21:19:31 +0000
Received: by outflank-mailman (input) for mailman id 870012;
 Fri, 10 Jan 2025 21:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qCll=UC=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tWMPi-0008EG-6Y
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 21:19:30 +0000
Received: from mx1.somlen.de (breeze.somlen.de [2a00:1828:a019::100:0])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 929ebaa9-cf98-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 22:19:27 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 99E295030F4;
 Fri, 10 Jan 2025 22:19:26 +0100 (CET)
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
X-Inumbo-ID: 929ebaa9-cf98-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1736543966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pgKmm6AVDFKKCXdhODIqgz4Hc2RbX2q3s9xrk82N8Ik=;
	b=jE2nfZ4phlHsxEAnHSQVK4/zsEbsG/KLmtSDtzhAYmdFSxTWs4Ed1h5T84zH4lL+R93JtW
	LDPV3w/4YN2KeMNd1tn04Wyenixnib9Bq14qSXFJqGreqBkOvJacMxK0NB4X0UGGNWethM
	xCi0cnh0wFqqicCxUrcv6+TYQpBNQ6gOFvYYaAe1UhQMxNmkKbrdR27aLyQHBb8CR0r0zQ
	OSD/m8yloizOMk/GnUqTEaADpoM7be8QzTcYvZQKTz2xoX5I8Js4uKKSWwKLrTt+ZokwxB
	Pe0dPKdoekp/zhh/eMAFRCDHJZxjQHcd6zyYlEtDkAvF9p5aTwzchlQ4jotLMQ==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH 1/1] docs/Makefile: Add ppc and riscv to DOC_ARCHES
Date: Fri, 10 Jan 2025 22:19:03 +0100
Message-Id: <b1d5c6fca18b93e402d229d22763621719964ea7.1736542505.git.maxi@daemonizer.de>
In-Reply-To: <cover.1736542505.git.maxi@daemonizer.de>
References: <cover.1736542505.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not having ppc and riscv included in DOC_ARCHES causes "multiple
definitions of ..." message on documentation build, similar to the
example shown below:

include/public/arch-ppc.h:91: multiple definitions of Typedef
vcpu_guest_core_regs_t: include/public/arch-arm.h:300
include/public/arch-ppc.h:91: multiple definitions of Typedef
vcpu_guest_core_regs_t: include/public/arch-ppc.h:85

It can also make the generated html documentation link to the header
files of another architecture. This is additionally a problem as it can
randomly make the documentation build non-reproducible.

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 docs/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/Makefile b/docs/Makefile
index b30cc619f8..9f8ba8acd9 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -5,7 +5,7 @@ include $(XEN_ROOT)/Config.mk
 VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory xenversion)
 DATE		:= $(shell date +%Y-%m-%d)
 
-DOC_ARCHES      := arm x86_32 x86_64
+DOC_ARCHES      := arm ppc riscv x86_32 x86_64
 MAN_SECTIONS    := 1 5 7 8
 
 # Documentation sources to build
-- 
2.39.5



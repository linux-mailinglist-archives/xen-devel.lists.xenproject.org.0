Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C673D65C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554961.866464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0e-0000Nu-Qo; Mon, 26 Jun 2023 03:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554961.866464; Mon, 26 Jun 2023 03:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0e-0000Lp-MO; Mon, 26 Jun 2023 03:35:24 +0000
Received: by outflank-mailman (input) for mailman id 554961;
 Mon, 26 Jun 2023 03:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0d-0000HH-Fg
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7963a96d-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:35:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 388F41FB;
 Sun, 25 Jun 2023 20:36:03 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C65593F64C;
 Sun, 25 Jun 2023 20:35:16 -0700 (PDT)
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
X-Inumbo-ID: 7963a96d-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 04/52] xen/arm: add .text.idmap in ld script for Xen identity map sections
Date: Mon, 26 Jun 2023 11:33:55 +0800
Message-Id: <20230626033443.2943270-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Only the first 4KB of Xen image will be mapped as identity
(PA == VA). At the moment, Xen guarantees this by having
everything that needs to be used in the identity mapping
in .text.header section of head.S, and the size will be
checked by _idmap_start and _idmap_end at link time if this
fits in 4KB.

In a later patch, we will move the MMU specific code out
of head.S. Although we can add .text.header to the new file
to guarantee all identity map code still in the first 4KB.
However, the order of these two files on this 4KB depends
on the build tools. Currently, we use the build tools to
process the order of objs in the Makefile to ensure that
head.S must be at the top. But if you change to another
build tools, it might not be the same result.

In this patch we introduce a new section named .text.idmap
in the region between _idmap_start and _idmap_end. And in
Xen link script, we force the .text.idmap contents to linked
after .text.header. This will ensure code of head.S always be
at the top of Xen binary.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2:
1. New patch.
---
v3:
1. adapt to changes to "_end_boot"
---
 xen/arch/arm/xen.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index be58c2c395..4f7daa7dca 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -34,6 +34,7 @@ SECTIONS
        _stext = .;             /* Text section */
        _idmap_start = .;
        *(.text.header)
+       *(.text.idmap)
        _idmap_end = .;
 
        *(.text.cold)
-- 
2.25.1



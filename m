Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49620AB87B2
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985310.1371220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYTT-0001dz-DZ; Thu, 15 May 2025 13:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985310.1371220; Thu, 15 May 2025 13:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYTT-0001bF-9q; Thu, 15 May 2025 13:18:11 +0000
Received: by outflank-mailman (input) for mailman id 985310;
 Thu, 15 May 2025 13:18:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYTR-0001J6-Ib
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:18:09 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a53f416-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:18:08 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315072278892.8921462394743;
 Thu, 15 May 2025 06:17:52 -0700 (PDT)
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
X-Inumbo-ID: 0a53f416-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315073; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hgZ7ZOrNk4bGYFFTOrgv5Rn+VkpogqoYv56NnOp6KxXKhwxIBQw2HNHhOUdz1X1g9vKDTDfxNzg+oOCehVU2GklEln66YNtonMX9B2Kd46CxbgXNSIOc7+Yx0foVCDmzZypFQ0CBigtr6PL6UZRmM5IcOHnQYIXTrozT7H+S9/k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315073; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6MJtagRP8j/7OOUbmkIpnGDxrpbtsZXN/la+TvFmy3A=; 
	b=hhwyvUiYERcheefM1uZxGSM+TXZHbgZzD/nH/rhM/DKMyT/tgge+AsAL3r98eEK8KdxWu1r3DTxL15XCtDfA//bynzTAqTC5c1iy+Hj3o8wMEyOEXCyG0rBIsWfTGISerjq4bbfmKZp1vU1a0srAb+pl3Mc7wr66JnZ/kgLXNig=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315073;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=6MJtagRP8j/7OOUbmkIpnGDxrpbtsZXN/la+TvFmy3A=;
	b=B4QHmkofDqWuc3u2dHhiEnRGmdvxOpNgHfoz1kiFVY4tYnSZWkiBzyK4SuBWfvRv
	CoqVM7VZNJcSkozWp+OAvbfWEwW9ABeZ7M+XesFoD7HOgDvghu56thPPB+33ZVHcAwH
	Mb283HZPisIHG+CEOyz6SG7Bj45dJlYmGW9zKogc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFCv2 01/38] maintainers: add new section for hyperlaunch
Date: Thu, 15 May 2025 09:17:07 -0400
Message-Id: <20250515131744.3843-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add new section to MAINTAINERS for hyperlaunch, including the files
specifically added to this point under the hyperlaunch work.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca98f..d9a85a0b818c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -343,6 +343,17 @@ F:	tools/misc/xenhypfs.c
 F:	xen/common/hypfs.c
 F:	xen/include/xen/hypfs.h
 
+HYPERLAUNCH
+M:	Daniel P. Smith <dpsmith@apertussolutions.com>
+M:	Christopher Clark <christopher.w.clark@gmail.com>
+S:	Supported
+F:	xen/common/domain-builder
+F:	xen/include/xen/domain-builder.h
+F:	xen/x86/domain-builder/
+F:	xen/x86/include/asm/bootinfo.h
+F:	xen/x86/include/asm/boot-domain.h
+F:	xen/x86/include/asm/domain-builder.h
+
 IMX8QM/QXP SUPPORT
 R:	John Ernberg <john.ernberg@actia.se>
 F:	xen/arch/arm/platforms/imx8qm.c
-- 
2.30.2



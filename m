Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067AA945A8
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960019.1352065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GMk-0004kJ-Ba; Sat, 19 Apr 2025 22:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960019.1352065; Sat, 19 Apr 2025 22:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GMk-0004iq-5K; Sat, 19 Apr 2025 22:08:50 +0000
Received: by outflank-mailman (input) for mailman id 960019;
 Sat, 19 Apr 2025 22:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GMi-0004ik-MI
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:08:48 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dab1ca76-1d6a-11f0-9ffb-bf95429c2676;
 Sun, 20 Apr 2025 00:08:43 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174510051064835.59787454297157;
 Sat, 19 Apr 2025 15:08:30 -0700 (PDT)
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
X-Inumbo-ID: dab1ca76-1d6a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745100512; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gpwctGYRt8O3btV9jHXd2KCVn+t1kjs5/Id1HPt2cbGqT026m8dmA2YTwe2AIeEij1nr31qKsZNf3o3orDK7+hLxggdUUhaQzTCEVvAzi3iNMT6n9Ro9doHh7fNjrJXsAd+VvNqWqMAsXQ6zIHFc99ZvB0vNiWLICW1mVbqdN6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100512; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JN77pQspCeOkPfnup+NGDjVXEkmaX55POW75Epj0P+M=; 
	b=Fpnoi1TDSE+n20ORDixmcAODoLeN0Olcvc9qCIs6yLkvpfowxWpLHob6conq5xfsmMXz0v/8hbMrdp3GsQzJi/yPJ9fMlJvanEDzhcpTcAXFMW+AJfAli+bDVoDDF2hmc14LDeoMyaLlxdOnFw80kvRsXLkpevvCzrAKfdC3RZM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100512;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=JN77pQspCeOkPfnup+NGDjVXEkmaX55POW75Epj0P+M=;
	b=R4S63Kf+ksPn8NQdjAgaIRPp4NbvD0HNL+//O/+YBZMB0lu8eK6T3aE2dK79pllg
	BcAtQAJEeFaA16i6qgi4YLfFtorYeoNCuhJX23vD9p24NsM+eCaoBbPIulWDVozxgJq
	2RQUGeWTgcJAQ/chPyXDlOKvWh3eQiaRYzyNlzbo=
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
Subject: [RFC 01/38] maintainers: add new section for hyperlaunch
Date: Sat, 19 Apr 2025 18:07:43 -0400
Message-Id: <20250419220820.4234-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add new section to MAINTAINERS for hyperlaunch, including the files
specifically added to this point under the hyperlaunch work.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca98f..7de671efe512 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -343,6 +343,15 @@ F:	tools/misc/xenhypfs.c
 F:	xen/common/hypfs.c
 F:	xen/include/xen/hypfs.h
 
+HYPERLAUNCH
+M:	Daniel P. Smith <dpsmith@apertussolutions.com>
+M:	Christopher Clark <christopher.w.clark@gmail.com>
+S:	Supported
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



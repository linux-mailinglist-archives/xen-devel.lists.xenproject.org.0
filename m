Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F324381222
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127567.239785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhepR-0005Ob-KE; Fri, 14 May 2021 20:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127567.239785; Fri, 14 May 2021 20:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhepR-0005Lx-FK; Fri, 14 May 2021 20:54:37 +0000
Received: by outflank-mailman (input) for mailman id 127567;
 Fri, 14 May 2021 20:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lhepP-0005Lh-Ot
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:54:35 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3e8d256-e19f-460e-ba88-322a74a98629;
 Fri, 14 May 2021 20:54:35 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025182737819.1959056472596;
 Fri, 14 May 2021 13:46:22 -0700 (PDT)
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
X-Inumbo-ID: a3e8d256-e19f-460e-ba88-322a74a98629
ARC-Seal: i=1; a=rsa-sha256; t=1621025184; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=am66yHbMEbvVXda4yV02AM7B3UfoQs94eod4/+Nbhecxu6jNtYb7wp3iFrALk6oLmjok8zUUdwmVqjy10Or7Ylca18JhynRYiUM+/mixQOEV4N3zBx0+eFMd3X3svlowZ7XuHY6KunsthH88cYM74UR4ngHpnd0a2o8YMDDgnCA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025184; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=wGvCSSkU+bbasgBbtH8pFrI6xBZiDUPG25gTuiiEgZg=; 
	b=fzl33zqwkpAb35n+OFVABlbb2MnwJNaXTVp/HFeQw3T1k3Lf8Od9844KtkyVf4PCurUW0g+BuOuYBlyj5cGaC/LAYr4VAoF0U7HzwK315Yhdx2dIjaQNOCJY7qGGy7kbicnZ13b33jMQm2g7gTIGxlBF2riRHTWOnDm4p9o4ZJs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025184;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wGvCSSkU+bbasgBbtH8pFrI6xBZiDUPG25gTuiiEgZg=;
	b=B/FKSizqkYATTS3vrvUFnslLv3AB7UwEBf9dn/VFIO7eq3IKX4otTAAUYoj28D3y
	yOfTUs2ikHw5Wvq5YKC+YNUxPZ4VfFoIpx9/SDTy9+Ssr+yT/cJZjqbXKJ3gYSVgF98
	bK8MDMxF8mM2BjeMT/fbClzZ3obnHj4MtLRFH43A=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	wl@xen.org,
	roger.pau@citrix.com,
	tamas@tklengyel.com,
	tim@xen.org,
	jgross@suse.com,
	aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	dfaggioli@suse.com,
	paul@xen.org,
	kevin.tian@intel.com,
	dgdegra@tycho.nsa.gov,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [RFC PATCH 10/10] common/Kconfig: updating Kconfig for domain roles
Date: Fri, 14 May 2021 16:54:37 -0400
Message-Id: <20210514205437.13661-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This adjusts the Kconfig system for the reorganizing of XSM by the introduction
of domain roles.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/Kconfig | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 3064bf6b89..560ad274c4 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -199,11 +199,12 @@ config XENOPROF
 
 	  If unsure, say Y.
 
-config XSM
-	bool "Xen Security Modules support"
-	default ARM
+menu "Xen Security Modules"
+
+config XSM_POLICY
+	bool "XSM policy support"
 	---help---
-	  Enables the security framework known as Xen Security Modules which
+	  Enables loadable policy support for Xen Security Modules which
 	  allows administrators fine-grained control over a Xen domain and
 	  its capabilities by defining permissible interactions between domains,
 	  the hypervisor itself, and related resources such as memory and
@@ -214,7 +215,7 @@ config XSM
 config XSM_FLASK
 	def_bool y
 	prompt "FLux Advanced Security Kernel support"
-	depends on XSM
+	depends on XSM_POLICY
 	---help---
 	  Enables FLASK (FLux Advanced Security Kernel) as the access control
 	  mechanism used by the XSM framework.  This provides a mandatory access
@@ -254,7 +255,6 @@ config XSM_FLASK_POLICY
 config XSM_SILO
 	def_bool y
 	prompt "SILO support"
-	depends on XSM
 	---help---
 	  Enables SILO as the access control mechanism used by the XSM framework.
 	  This is not the default module, add boot parameter xsm=silo to choose
@@ -278,6 +278,8 @@ choice
 		bool "SILO" if XSM_SILO
 endchoice
 
+endmenu
+
 config LATE_HWDOM
 	bool "Dedicated hardware domain"
 	default n
-- 
2.20.1



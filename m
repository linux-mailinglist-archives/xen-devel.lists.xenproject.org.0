Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56148B396
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 18:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255979.439010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Kme-00032W-SB; Tue, 11 Jan 2022 17:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255979.439010; Tue, 11 Jan 2022 17:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Kme-00030F-Og; Tue, 11 Jan 2022 17:18:08 +0000
Received: by outflank-mailman (input) for mailman id 255979;
 Tue, 11 Jan 2022 17:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KamR=R3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1n7Kmd-000309-AL
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 17:18:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f44c7b2-7302-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 18:18:05 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1641921481347592.0753134066362;
 Tue, 11 Jan 2022 09:18:01 -0800 (PST)
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
X-Inumbo-ID: 6f44c7b2-7302-11ec-9ce5-af14b9085ebd
ARC-Seal: i=1; a=rsa-sha256; t=1641921481; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JdDKhRhAwZQIrkkRJ9wcQODbo/DI+MLFUAzR83Vr89JPkLi8/KO9cuHGcCh39t6bvQsh15lZS9F8XRxdDxXMW37DpDL0bbscfkgyGkXhIOPuWoiWm9yRkEdffXxvxzW+iCRB9tf09tzbsd7BE+OPT/pKa3amfQppKZ4YE6h/ijg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1641921481; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=qsTQc3SfLcU/uIGx1/188+JBMWG8NHVrBgLTSOosXpE=; 
	b=lt0GZd5XBdhBG0Pk0T9yaFHmdLIrrUPzDPPrY0Fj0aovhJeDAGPmuT+GuMus7dXt5wy3rCBpyRj+Nf8c9bsZd3kR5ny/Hq7K/Axf3JA/ss4NK3G6GVB23CxbQZvcpVBtRYVQt67daWTzZzeHcVoQtaq8Vy/iOJcLYbAqG0VScYY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1641921481;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=qsTQc3SfLcU/uIGx1/188+JBMWG8NHVrBgLTSOosXpE=;
	b=rxCAJPbmLVpZ93ePkIbhXd4n+SJZUARNUruTKacv2rrfkQwJgU5yao8j3KInivxb
	r3opYYloj/QUIDEdKOunbhax4+SPKHFLuu4IZ8ajbBJLQJpqS5MnsD3UO60mA+saxgV
	ZatkLoelT1KdWh5q9SiVkcNw0Br0jN84rbRT4NTA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: requesting to be txt reviewer
Date: Tue, 11 Jan 2022 16:21:14 -0500
Message-Id: <20220111212114.16273-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

I would like to submit myself, Daniel P. Smith, as a reviewer of TXT support in
Xen.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e84a05760..4a2884dfa7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -317,6 +317,7 @@ F:	xen/include/xen/hypfs.h
 
 INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
 R:	Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
+R:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Odd Fixes
 F:	xen/arch/x86/include/asm/tboot.h
 F:	xen/arch/x86/tboot.c
-- 
2.20.1



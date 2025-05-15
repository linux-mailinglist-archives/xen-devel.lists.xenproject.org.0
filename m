Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4477AB87B4
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985327.1371250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYU4-0002ug-6v; Thu, 15 May 2025 13:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985327.1371250; Thu, 15 May 2025 13:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYU4-0002sB-3f; Thu, 15 May 2025 13:18:48 +0000
Received: by outflank-mailman (input) for mailman id 985327;
 Thu, 15 May 2025 13:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYU3-0001J6-6x
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:18:47 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20d9c2ed-318f-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 15:18:46 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315076250162.1941233290696;
 Thu, 15 May 2025 06:17:56 -0700 (PDT)
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
X-Inumbo-ID: 20d9c2ed-318f-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1747315077; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VN/R52rVkWfwpPWfVt6XrX9JArsO+VWgXu6R734zNdSNBU0QSw6eBnDnEAzQNTh9wfq3xeVnJq4Bv+zll41AAMvlicUcajSUtOWHgRSOnR1eStBT6IJX9A6EChO3IPK6SjK2uVhWOMpJjLSL1i6/GErchJ9D0jtrdZmOPJKHNgE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315077; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iHVvaVi4MhX0h9Mwr6nanEd/O/4lHAF3yTF25jOYNb8=; 
	b=H6r7318QdVqAqxRxFqjkpFAIdUWuax8OzHSzrS57PHJzBKNMlmd3gPX+4fg2k6SW/+bYVWU3ZcHUDCnn3v1ozsLwe/Tjl03orptP1KU+y15cjKBZMF3F5x4tlZVFBNXhjoQUS/Fj39u/LW6vFM2yIeWjSMRQPOF4pbWi/let9r4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315077;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=iHVvaVi4MhX0h9Mwr6nanEd/O/4lHAF3yTF25jOYNb8=;
	b=P9TiwOaJdN59afatcwL+eam3nKCfTbKgdKP0Q86vefHCLzl07BHD+uFbLcrAkT7D
	xWt/rLqhJ0v/O9jAkgd9kzwg2dana28T/9SvtCdeNA+fJ/5f+Da/0qnQC34umTF8PKZ
	Jll+QAdPK0qRfe9GYXWFe9i90LY2phMIAsrRuRGc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 05/38] x86/hyperlaunch: move dom0 cpuid policy behind capability check
Date: Thu, 15 May 2025 09:17:11 -0400
Message-Id: <20250515131744.3843-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131744.3843-1-dpsmith@apertussolutions.com>
References: <20250515131744.3843-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

To incrementally convert create_dom0() into being a generalized domain
construction function, move the dom0 specific cpuid policy behind the control
domain capability.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 409630089d29..298e27848dda 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1059,7 +1059,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     bd->d = d;
 
-    init_dom0_cpuid_policy(d);
+    if ( has_dom0_caps(bd) )
+        init_dom0_cpuid_policy(bd->d);
 
     if ( domain_vcpu0_create(bd) == NULL )
         panic("Error creating %pdv0\n", d);
-- 
2.30.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F369B3811FA
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127530.239708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lheim-00005Y-Ty; Fri, 14 May 2021 20:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127530.239708; Fri, 14 May 2021 20:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lheim-0008UH-PC; Fri, 14 May 2021 20:47:44 +0000
Received: by outflank-mailman (input) for mailman id 127530;
 Fri, 14 May 2021 20:47:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lheik-0008T4-H0
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:47:42 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d74994f-f036-4af5-8adc-4ad68a9277b9;
 Fri, 14 May 2021 20:47:41 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025163659110.00355228974297;
 Fri, 14 May 2021 13:46:03 -0700 (PDT)
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
X-Inumbo-ID: 8d74994f-f036-4af5-8adc-4ad68a9277b9
ARC-Seal: i=1; a=rsa-sha256; t=1621025166; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NuKcIjf2Mse2sjH2moVr61XODOZU9hZ7ybaTOSiqn2u76cuw3cj+6NdbQfhZnHK8/B5OnWdyI8Q0Meb8MCAh9M+Onsy0tueL9kPELhO34aQchcTbhshihAlc2dzLPJr+xCIR54ztO8mimxA7LIYF/GPwhGTSwdX0oul7/QVtVg4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025166; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=u4HQkexSnVzuR1YPZlazV5uqbJ/6zfhWNSE1eH1HBJ8=; 
	b=BRVhxSFJ1+V6DgKq770g0BJXXkUdv9m3JhIaFrmfOJlY5tRJ15LJ2weFAsRlRcm2yPNR1l1/SksWU0JqGguYe2PmVo8+DTKq7TWfibFnZH87ISyqWgOHer+z5lavaSl0/3il9QQ1tw6g/HOvg8PvoBVctbBgduST7uV5dmNBMeM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025166;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u4HQkexSnVzuR1YPZlazV5uqbJ/6zfhWNSE1eH1HBJ8=;
	b=QshMINoCesaBByUUc7RYJF2XUhdDIPtOsNwd4aL3NI1Lpp0BjLYDfpiA/22STJ8Z
	5jL06EIbeVtCvbqZubV/lskZ2rgYpwCYJ8j3nxOruREH2qhe+rHYvPChnBQSYkCg1nd
	qavHwxoZCaXrjBoqwPF2znlwyQGrYu5/C1W2Uz3g=
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
Subject: [RFC PATCH 03/10] xenstore: migrate to default privilege model
Date: Fri, 14 May 2021 16:54:30 -0400
Message-Id: <20210514205437.13661-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Move to using a check for the Xenstore Domain role for the is_xenstore_domain
check.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/domain.c     | 3 +++
 xen/include/xen/sched.h | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 26bba8666d..1f2c569e5d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -551,6 +551,9 @@ struct domain *domain_create(domid_t domid,
     {
         d->options = config->flags;
         d->vmtrace_size = config->vmtrace_size;
+
+        if (config->flags & XEN_DOMCTL_CDF_xs_domain)
+            d->xsm_roles = XSM_XENSTORE;
     }
 
     /* Sort out our idea of is_control_domain(). */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 66b79d9c9f..9a88e5b00f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1129,7 +1129,7 @@ static inline bool is_vcpu_online(const struct vcpu *v)
 
 static inline bool is_xenstore_domain(const struct domain *d)
 {
-    return d->options & XEN_DOMCTL_CDF_xs_domain;
+    return d->xsm_roles & XSM_XENSTORE;
 }
 
 static always_inline bool is_iommu_enabled(const struct domain *d)
-- 
2.20.1



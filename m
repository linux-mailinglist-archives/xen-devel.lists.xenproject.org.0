Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A724ECCE7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 21:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296500.504744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZdcy-0001pd-8u; Wed, 30 Mar 2022 19:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296500.504744; Wed, 30 Mar 2022 19:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZdcy-0001mz-5H; Wed, 30 Mar 2022 19:05:08 +0000
Received: by outflank-mailman (input) for mailman id 296500;
 Wed, 30 Mar 2022 19:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L21/=UJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZdcw-0001VT-E5
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 19:05:06 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e670fb0-b05c-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 21:05:05 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648667096871750.1941533014053;
 Wed, 30 Mar 2022 12:04:56 -0700 (PDT)
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
X-Inumbo-ID: 4e670fb0-b05c-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1648667098; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I8IHlShgYkhKa5I3J2yTRYG+M0XKPmdaxJWzBhuOES71D3stl8jxjCkIlFhPgoIo8U4hLtUpJNeI2eA1huxJQ4a6d0bNGIj23RucANz0xEGPxR7TEqlCxe3/jjOxw5HyHt2SIuNrloV1l5mI5Vr3B2qss/fMD59Kqtr1LVddLzU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648667098; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=xQOPCqDVTdCL2p8rO8+lt5h9rYY5L4DAdcWEvMlILpc=; 
	b=luLcV2MpRfAx3Q9MergmERIqb8fWR6K95maJnAo9qkKdj8Xb0jCFDligMpTjiYYxSk0GXywpLbbRYAGyRwlu1jFjSqDngHYch6xxjyGQjBtZKiW610XfxXi+W0/Vx7fEYYbg8gIi9QgEAvSItnQNENmj8hoxHA9vneoO2tTEz+0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648667098;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=xQOPCqDVTdCL2p8rO8+lt5h9rYY5L4DAdcWEvMlILpc=;
	b=lcUXJCMjU1RN/AekWEXGxAZz1CD5oOJAPf87B9IBcG7XENztAfFnl/NVJ6njPzbn
	Ym8fUsAB4EPNR/2ikx33xTQyB0tlEQv1hY66ufoxiWvdSN4ZHstqEtkwDqoLjGJRp+L
	s+5qO6vQovFOayEgp2vJSKYowBodypnzKuXAvl7Q=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Date: Wed, 30 Mar 2022 19:05:48 -0400
Message-Id: <20220330230549.26074-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220330230549.26074-1-dpsmith@apertussolutions.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

There are now instances where internal hypervisor logic needs to make resource
allocation calls that are protected by XSM checks. The internal hypervisor logic
is represented a number of system domains which by designed are represented by
non-privileged struct domain instances. To enable these logic blocks to
function correctly but in a controlled manner, this commit introduces a pair
of privilege escalation and demotion functions that will make a system domain
privileged and then remove that privilege.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index e22d6160b5..157e57151e 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -189,6 +189,28 @@ struct xsm_operations {
 #endif
 };
 
+static always_inline int xsm_elevate_priv(struct domain *d)
+{
+    if ( is_system_domain(d) )
+    {
+        d->is_privileged = true;
+        return 0;
+    }
+
+    return -EPERM;
+}
+
+static always_inline int xsm_demote_priv(struct domain *d)
+{
+    if ( is_system_domain(d) )
+    {
+        d->is_privileged = false;
+        return 0;
+    }
+
+    return -EPERM;
+}
+
 #ifdef CONFIG_XSM
 
 extern struct xsm_operations *xsm_ops;
-- 
2.20.1



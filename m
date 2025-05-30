Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DA5AC8A29
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 10:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000578.1380808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKvPc-0004d0-2D; Fri, 30 May 2025 08:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000578.1380808; Fri, 30 May 2025 08:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKvPb-0004aL-VE; Fri, 30 May 2025 08:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1000578;
 Fri, 30 May 2025 08:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npWi=YO=bounce.vates.tech=bounce-md_30504962.683970d3.v1-2d2857a00af54ff682a29e4086620663@srs-se1.protection.inumbo.net>)
 id 1uKvPa-0004aF-4o
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 08:48:22 +0000
Received: from mail145-2.atl61.mandrillapp.com
 (mail145-2.atl61.mandrillapp.com [198.2.145.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d622315a-3d32-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 10:48:20 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-2.atl61.mandrillapp.com (Mailchimp) with ESMTP id 4b7xhz12sHzQXk4xN
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 08:48:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2d2857a00af54ff682a29e4086620663; Fri, 30 May 2025 08:48:19 +0000
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
X-Inumbo-ID: d622315a-3d32-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1748594899; x=1748864899;
	bh=CINTqxmjCzUBSSvhqj+l0XHTYM1/Zj7I0ZRwoJo+6LY=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=TDXQJ2YhTyJEFWE0HIvs44Zts+3qw96zYysE7rf+Bmw0WdgyBaV/d8DX97qJUB5j2
	 YyIQ+igkTjYRo7o5hiFAT1r4zh2NvZYyXr9FJNZ7OOlLugzm0tqBB8tM6MMU/qZ+s4
	 BOfX8L6bv7lsn99QcnLPhqGa7zQ/91SAGCWJFMgz0cSXK9V22rgx18CmwoE+xsGM+Y
	 k8GBQVJ9ZwlepFvsZVcd02t9n1ZwFUkcYoN46dcPeiqQGhgIGQjJ+pmB6+MGTyschD
	 tRZJeNaxaOkQZJPQ12l3rkb3dTVIUU0WqciRYdZAHNPaMEYkSFk6d8cGjG9Mp5jmxo
	 3jnpptnN+R3sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1748594899; x=1748855399; i=teddy.astie@vates.tech;
	bh=CINTqxmjCzUBSSvhqj+l0XHTYM1/Zj7I0ZRwoJo+6LY=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=d752I994NA1n97Q5ztHwhVlFnBm4PCqoS9bVzT7jYrdClGhZJA3st/SGcg498VySW
	 rg8zOUdNR1q+ME8b26lZ85lugdhRmvIqmRto12cfOrqXhl+voY/8B0H5nmQ+GVUbTz
	 5AbnNoJPFk34HcoZ+1dqgYdHnqXe1X4gJKCVAMCtKEDtWWTMBvmWc+TIBSCYJWtCEr
	 ukwBvAAso2Eg1I5l9N1CtceUoivvahTnRlqv/T3CjsZAAk+g8tx4e5Dmlr17NE3Zuh
	 /DLwYo1qEthe8QTN0Zvtfde+VcUjlTyKqkP+xa1I/pZ8dJr+fKpO+R4bKWEo+Wzif9
	 ghtFKoRPfwh1g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20vmx:=20Introduce=20vcpu=20single=20context=20VPID=20invalidation?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1748594898078
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <83d0e7dfc076e9453fb6537e5948c03d90e947da.1748594036.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2d2857a00af54ff682a29e4086620663?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250530:md
Date: Fri, 30 May 2025 08:48:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce vpid_sync_vcpu_context to do a single-context invalidation
on the vpid attached to the vcpu as a alternative to per-gva and all-contexts
invlidations.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Extracted from SEV series.
This will be used for instance in fixed-ASID patches (in SEV series).
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index d85b52b9d5..1269c318dc 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -451,6 +451,23 @@ static inline void ept_sync_all(void)
 
 void ept_sync_domain(struct p2m_domain *p2m);
 
+static inline void vpid_sync_vcpu_context(struct vcpu *v)
+{
+    int type = INVVPID_SINGLE_CONTEXT;
+
+    /*
+     * If single context invalidation is not supported, we escalate to
+     * use all context invalidation.
+     */
+    if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
+        goto execute_invvpid;
+
+    type = INVVPID_ALL_CONTEXT;
+
+execute_invvpid:
+    __invvpid(type, v->arch.hvm.n1asid.asid, 0);
+}
+
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
 {
     int type = INVVPID_INDIVIDUAL_ADDR;
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



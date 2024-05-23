Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D768CCEF2
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 11:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728262.1133127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA4cA-0006xU-5s; Thu, 23 May 2024 09:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728262.1133127; Thu, 23 May 2024 09:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA4cA-0006uL-2O; Thu, 23 May 2024 09:19:58 +0000
Received: by outflank-mailman (input) for mailman id 728262;
 Thu, 23 May 2024 09:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6NZt=M2=bounce.vates.tech=bounce-md_30504962.664f0a39.v1-2fb4daa5dcaf486a8f71b549e7ac6e39@srs-se1.protection.inumbo.net>)
 id 1sA4c8-0006uF-N1
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 09:19:56 +0000
Received: from mail187-24.suw11.mandrillapp.com
 (mail187-24.suw11.mandrillapp.com [198.2.187.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dc144ee-18e5-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 11:19:55 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-24.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4VlN1555QWzJKF3q8
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 09:19:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2fb4daa5dcaf486a8f71b549e7ac6e39; Thu, 23 May 2024 09:19:53 +0000
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
X-Inumbo-ID: 9dc144ee-18e5-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1716455993; x=1716716493;
	bh=rb2g7/BafJk9f48N+Ig/DxIGBOHotYs1+I4pEEvyMaA=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=t3b3P7X85yze9/uayCXuewejxeoJ1jLwI2WHHbPHeik0tzKvgO4NrqGPLIYX/6fU8
	 kpz4lkN1F9zWxTYbayycAswMrSO12tqg9ynFxGXdQBxhpDhhJVw56w3qTdeOlhyYzN
	 Vp5k4mfmNIt5hJPNPs3AXKcw+Xl+UKqt2M49f5UYDe+ckHWUFBKOC+Q5n0MOCa9qV6
	 vWwdHvwG9X1bArNKuRJt9LWqlt7ulmmQkB5DNIWOreAKUfXVdMi9KDRPThSRj0CegG
	 CdX8WqGxPumzUZ61yzG6lzvYxrr7RRTI5BLnp6agNfTr1LZ2Wf0CupvauPczkmrNoj
	 F8lrPr9XV/cgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1716455993; x=1716716493; i=teddy.astie@vates.tech;
	bh=rb2g7/BafJk9f48N+Ig/DxIGBOHotYs1+I4pEEvyMaA=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=aRCcRUksJ6hk/3evHqjybmx9cuR1lQTNwoN2qExfb9elL0WMgSWDdtsYRZNy7WfIu
	 4TTaExTdOFSchWKa3fZW25riCFRMb7sV1X3moYWNbx6JgKOJXFkOfr0JTKfRFaN0f8
	 xOyHtiXyashi+nK4UEW0h7ITEfQ+Zkm9zJUQA0IGqCxcViAI5koyPTbzVg304fxRIw
	 8puxTH0Zu9OaeNfbF3GOu1XsfPJnFuZvy5bUWh0zqsUUafCWhAwjSRJKeewxkJVlFu
	 UuzN6WvKh8ycB/kYsM3o9JDx7ui3XFOkyJ1Fjl1GQfCb0ESyGVpwHVxCdglnr3YER6
	 yjLxUVTdSwU/A==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20x86/iommu:=20Conditionally=20compile=20platform-specific=20union=20entries?=
X-Mailer: git-send-email 2.45.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1716455992462
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <2744240f42dadcb1edc69d0f921d5909fe0f63a2.1716455673.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2fb4daa5dcaf486a8f71b549e7ac6e39?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240523:md
Date: Thu, 23 May 2024 09:19:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

If some platform driver isn't compiled in, remove its related union
entries as they are not used.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/iommu.h | 4 ++++
 xen/arch/x86/include/asm/pci.h   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 8dc464fbd3..99180940c4 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -42,17 +42,21 @@ struct arch_iommu
     struct list_head identity_maps;
 
     union {
+        #ifdef CONFIG_INTEL_IOMMU
         /* Intel VT-d */
         struct {
             uint64_t pgd_maddr; /* io page directory machine address */
             unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
             unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
         } vtd;
+        #endif
+        #ifdef CONFIG_AMD_IOMMU
         /* AMD IOMMU */
         struct {
             unsigned int paging_mode;
             struct page_info *root_table;
         } amd;
+        #endif
     };
 };
 
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index fd5480d67d..842710f0dc 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -22,12 +22,16 @@ struct arch_pci_dev {
      */
     union {
         /* Subset of struct arch_iommu's fields, to be used in dom_io. */
+        #ifdef CONFIG_INTEL_IOMMU
         struct {
             uint64_t pgd_maddr;
         } vtd;
+        #endif
+        #ifdef CONFIG_AMD_IOMMU
         struct {
             struct page_info *root_table;
         } amd;
+        #endif
     };
     domid_t pseudo_domid;
     mfn_t leaf_mfn;
-- 
2.45.1



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


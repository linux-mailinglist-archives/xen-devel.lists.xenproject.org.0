Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCE9A37FBC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890007.1299079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCq-0001Bh-7O; Mon, 17 Feb 2025 10:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890007.1299079; Mon, 17 Feb 2025 10:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCp-00014y-Vr; Mon, 17 Feb 2025 10:18:27 +0000
Received: by outflank-mailman (input) for mailman id 890007;
 Mon, 17 Feb 2025 10:18:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sn43=VI=bounce.vates.tech=bounce-md_30504962.67b30cee.v1-83694620b59941faaa58546f2c7bf24c@srs-se1.protection.inumbo.net>)
 id 1tjyCo-0008Nl-8u
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:18:26 +0000
Received: from mail178-27.suw51.mandrillapp.com
 (mail178-27.suw51.mandrillapp.com [198.2.178.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 853ebf0b-ed18-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:18:25 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-27.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YxJWy43Xhz6CPyQG
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 10:18:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 83694620b59941faaa58546f2c7bf24c; Mon, 17 Feb 2025 10:18:22 +0000
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
X-Inumbo-ID: 853ebf0b-ed18-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739787502; x=1740057502;
	bh=4U0gQ1LwmfSJjBNx+a/TBnpKULERm/cQUAt5K2wmoPM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WHOegyZehYdUxq9ncTPTLcDG+LemZbXY3ePpQlwwB8qNFOcQfLtFZkhtuZ+qEKZa3
	 D1RzS1xoSgW44cHabMP6M93o2+zWPMWGKNpi4PyRsMJEsatJBhWTN0KnDPB4OpzH+K
	 eafxDJvLsNmt5wyMtj/rtakJkVl57TgBEpo3Bj4xyg5vXOHKnaQZDglh+pBOPojjGt
	 Wiru4nLcKO51RLYDn6O5Y1GzY4EsDOOPp0waVKHiuZiDjduf+xX9+qvOu1tx5WXrm2
	 Q9GagtHhRNHGHtz8ZmbSwrfXcUCFrV1YxF4wVnU8lcDBA3mJO3RIV3h/VfiGgPJd8g
	 0RKUOKF69ApbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739787502; x=1740048002; i=teddy.astie@vates.tech;
	bh=4U0gQ1LwmfSJjBNx+a/TBnpKULERm/cQUAt5K2wmoPM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qw3ThI/gyKATkVg6M3+CmClz8rrBmKerozE8KvgquMtkdN+gnf8NksoaRsSJttzLn
	 HnnKYzCpMyFy4UerZ33DJRoYI/FQSZypbfREWpYbA2ZDd3S5PBOd3QEpBehBQtWjtt
	 Q/6C6Cbs5x5LMZ23+6FaBjLWJDn3OF1ha5re2EJhGz2rRGCoQwbjvG1uxPMujKGQD0
	 KbdK/c6Lbhji3jVRy7BU9tAdSb7uT0Nq0YE7Gfa0X8aQFZrIpEoO1tzPU3D2bLD7RM
	 2C/XKHdYn+DY9CYsV1lE9R0vP5p5NpevBXgwLe6254U9i8qZs60QdSzNITn6njD67J
	 TdmliTRamIFkQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v6=2003/11]=20x86/domain:=20Defer=20domain=20iommu=20initialization.?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739787500080
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <03ef72e582221299e12c44176dbbe31ce5da9261.1739785339.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1739785339.git.teddy.astie@vates.tech>
References: <cover.1739785339.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.83694620b59941faaa58546f2c7bf24c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250217:md
Date: Mon, 17 Feb 2025 10:18:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

For the IOMMU redesign, the iommu context pagetable is defined once during
initialization. When reusing P2M pagetable, we want to ensure that this
pagetable is properly initialized.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/domain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812..48bf9625e2 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -858,9 +858,6 @@ int arch_domain_create(struct domain *d,
     if ( (rc = init_domain_irq_mapping(d)) != 0 )
         goto fail;
 
-    if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
-        goto fail;
-
     psr_domain_init(d);
 
     if ( is_hvm_domain(d) )
@@ -879,6 +876,9 @@ int arch_domain_create(struct domain *d,
     else
         ASSERT_UNREACHABLE(); /* Not HVM and not PV? */
 
+    if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
+        goto fail;
+
     if ( (rc = tsc_set_info(d, XEN_CPUID_TSC_MODE_DEFAULT, 0, 0, 0)) != 0 )
     {
         ASSERT_UNREACHABLE();
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


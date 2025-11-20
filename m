Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F607C73A2C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166859.1493307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Y0-00029T-PN; Thu, 20 Nov 2025 11:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166859.1493307; Thu, 20 Nov 2025 11:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Y0-00027k-Ka; Thu, 20 Nov 2025 11:09:56 +0000
Received: by outflank-mailman (input) for mailman id 1166859;
 Thu, 20 Nov 2025 11:09:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=58Zc=54=bounce.vates.tech=bounce-md_30504962.691ef6ff.v1-fe5580723b8f4641a8a2c0f50e1932a1@srs-se1.protection.inumbo.net>)
 id 1vM2Xy-0001P8-IV
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:09:54 +0000
Received: from mail180-15.suw31.mandrillapp.com
 (mail180-15.suw31.mandrillapp.com [198.2.180.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fc724a0-c601-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 12:09:52 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-15.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwbz373YzPm0r8t
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:09:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fe5580723b8f4641a8a2c0f50e1932a1; Thu, 20 Nov 2025 11:09:51 +0000
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
X-Inumbo-ID: 6fc724a0-c601-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763636991; x=1763906991;
	bh=0H4/bqjY8W+k0exa1sAH31qgAUJ6pXe42xKLfYS+xWo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=msYCO4HDWTM4iOOo+eFWbNxDT82rYCtfdYEvQfVgVOCJV9n7znv9NJ1+IgHVhCX7E
	 tCUbVz57CmWUWs1bpXljd3Ja0ca0TLjBfGr8fMvDssV8LfKy7+Zb2ex9SFyLlTLf6X
	 5fhePPQtGpX3DN/IkOQUZMX+s3c3GOLs+HSDmHAUFzAudDsUuxQ0Smruu5mc7HO5c2
	 TTAiqOjk8PSYf/RRLNHFvWuiapGPuD2YTGLEVh2tKhTS7c2ectr1YQvrFtmJt4S/yr
	 2p2Zdo4LnnqfnUXW4CdXzTBHEAcxIXql+St5R3THqUTJB7ZK73qIaeKVRMyqKAczkG
	 stogBT6ui+FwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763636991; x=1763897491; i=teddy.astie@vates.tech;
	bh=0H4/bqjY8W+k0exa1sAH31qgAUJ6pXe42xKLfYS+xWo=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0opB1cZySE3tmA0dy/XBB/lebquNL1ppesV6JdpjFMgRKk3XHIEmANUqCkxgRjCpq
	 FhWgUtTh4LT9h/d53avQoATekE4Xegjpf3qDXS1R3UX9BwCo4fu3wu/UFM3hhRWMSw
	 RZXyDn3TarmIHQeyW+7shTNyOvjF+7EtIQqEBmY4D3I/YXuBI1J0REN+z1yRa9NzS1
	 p7UAszszIReUtoAQ2bMGy96TWegb9MOZhZswd1Pf1TN1neExSKxAtbrsP6cnqmOw1L
	 ShygmRhsVnCYDXNjAomEghJYoAOpxdTeXxU7NOxp6QyQ0pkFBr9/rpEfzGoPzy5ckb
	 wgGzajGgBMjYQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2003/14]=20x86/domain:=20Defer=20domain=20iommu=20initialization.?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763636990528
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <c4a81e284ec202a34b8e983679dead4dc2ae248a.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fe5580723b8f4641a8a2c0f50e1932a1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:09:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

For the IOMMU redesign, the iommu context pagetable is defined once during
initialization. When reusing P2M pagetable, we want to ensure that this
pagetable is properly initialized.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/domain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 66b7412b87..393b0fe27c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -927,9 +927,6 @@ int arch_domain_create(struct domain *d,
     if ( (rc = init_domain_irq_mapping(d)) != 0 )
         goto fail;
 
-    if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
-        goto fail;
-
     psr_domain_init(d);
 
     if ( is_hvm_domain(d) )
@@ -948,6 +945,9 @@ int arch_domain_create(struct domain *d,
     else
         ASSERT_UNREACHABLE(); /* Not HVM and not PV? */
 
+    if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
+        goto fail;
+
     if ( (rc = tsc_set_info(d, XEN_CPUID_TSC_MODE_DEFAULT, 0, 0, 0)) != 0 )
     {
         ASSERT_UNREACHABLE();
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



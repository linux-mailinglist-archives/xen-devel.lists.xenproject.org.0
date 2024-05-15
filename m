Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54A8C63A4
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722092.1125949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AuR-0002TY-8a; Wed, 15 May 2024 09:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722092.1125949; Wed, 15 May 2024 09:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AuR-0002Qi-5R; Wed, 15 May 2024 09:26:51 +0000
Received: by outflank-mailman (input) for mailman id 722092;
 Wed, 15 May 2024 09:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AuQ-0002Qc-7I
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:26:50 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 412e715d-129d-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:26:49 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 2A79C354FB;
 Wed, 15 May 2024 05:26:48 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 218BA354F8;
 Wed, 15 May 2024 05:26:48 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 57FC3354F7;
 Wed, 15 May 2024 05:26:47 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 412e715d-129d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=QWpi+mcgV19u04TlYTDH6KKf8
	W1LgMYc9I836I7tdAs=; b=WL9hLhGSSOj29npYKRo+om4seXCql3jkvXEmLUT2+
	h/XCrDC8Ny2rtUE3fGsAZlUvpUtUA7SjW0GLPOJcAjeLwHFjShk/g71Rg45xqmWo
	aL/pEdZlpiaaoBmhRYkGGfT5ztyxf4M880EGVT/9cZVDZFwT0DB3VqrdfTKRwxP5
	EQ=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v2 14/15] iommu/vt-d: guard vmx_pi_hooks_* calls with cpu_has_vmx
Date: Wed, 15 May 2024 12:26:45 +0300
Message-Id: <73072e5b2ec40ad28d4bcfb9bb0870f3838bb726.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 408AB73C-129D-11EF-88AA-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

VMX posted interrupts support can now be excluded from x86 build along wi=
th
VMX code itself, but still we may want to keep the possibility to use
VT-d IOMMU driver in non-HVM setups.
So we guard vmx_pi_hooks_{assign/deassign} with some checks for such a ca=
se.

No functional change intended here.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/drivers/passthrough/vtd/iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthroug=
h/vtd/iommu.c
index e13be244c1..ad78282250 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2772,7 +2772,7 @@ static int cf_check reassign_device_ownership(
=20
     if ( !QUARANTINE_SKIP(target, pdev->arch.vtd.pgd_maddr) )
     {
-        if ( !has_arch_pdevs(target) )
+        if ( cpu_has_vmx && !has_arch_pdevs(target) )
             vmx_pi_hooks_assign(target);
=20
 #ifdef CONFIG_PV
@@ -2806,7 +2806,7 @@ static int cf_check reassign_device_ownership(
     }
     if ( ret )
     {
-        if ( !has_arch_pdevs(target) )
+        if ( cpu_has_vmx && !has_arch_pdevs(target) )
             vmx_pi_hooks_deassign(target);
         return ret;
     }
@@ -2824,7 +2824,7 @@ static int cf_check reassign_device_ownership(
         write_unlock(&target->pci_lock);
     }
=20
-    if ( !has_arch_pdevs(source) )
+    if ( cpu_has_vmx && !has_arch_pdevs(source) )
         vmx_pi_hooks_deassign(source);
=20
     /*
--=20
2.25.1



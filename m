Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0AA940F9B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767541.1178215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkGU-0002R7-6V; Tue, 30 Jul 2024 10:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767541.1178215; Tue, 30 Jul 2024 10:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkGU-0002PB-3Z; Tue, 30 Jul 2024 10:39:34 +0000
Received: by outflank-mailman (input) for mailman id 767541;
 Tue, 30 Jul 2024 10:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2k0=O6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sYkGS-0002P5-3m
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:39:32 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00569ff9-4e60-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 12:39:31 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id ABCA03EFD5;
 Tue, 30 Jul 2024 06:39:29 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 956A23EFD4;
 Tue, 30 Jul 2024 06:39:29 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 2D6C63EFD2;
 Tue, 30 Jul 2024 06:39:24 -0400 (EDT)
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
X-Inumbo-ID: 00569ff9-4e60-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=20gz3fWtI75N+KDktRlgBWgUQ
	6Rep9w3jgom4UXRHu4=; b=pmIJ1TprgfIJprwHbYQgyIvJ6ug/BVHXtV3XPXygW
	9e/ndA58yuCuWywOItW/xAqaVz9fpNBq+PvEQwxStPPhIjMrtdndazTZKHwguppR
	73MOu/b5a6cyw6gBogVDGiBgkvdF3hw79DCTPHe3ToonCHasbnkzcc+FbOikHDIU
	u0=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v5 12/13] x86/vmx: replace CONFIG_HVM with CONFIG_INTEL_VMX in vmx.h
Date: Tue, 30 Jul 2024 13:39:22 +0300
Message-Id: <11e0804a979f7ee7279bbf4741be0b2019967f37.1722333634.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 FD66FCD2-4E5F-11EF-BFA6-9625FCCAB05B-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

As now we got a separate config option for VMX which itself depends on
CONFIG_HVM, we need to use it to provide vmx_pi_hooks_{assign,deassign}
stubs for case when VMX is disabled while HVM is enabled.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v5:
- change kconfig option name VMX -> INTEL_VMX
changes in v4:
 - added tag
changes in v3:
 - use CONFIG_VMX instead of CONFIG_HVM to provide stubs, instead of guar=
ding
   calls to vmx_pi_hooks_{assign,deassign} in iommu/vt-d code
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/includ=
e/asm/hvm/vmx/vmx.h
index 1489dd05c2..f0ec459622 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -599,7 +599,7 @@ void vmx_pi_desc_fixup(unsigned int cpu);
=20
 void vmx_sync_exit_bitmap(struct vcpu *v);
=20
-#ifdef CONFIG_HVM
+#ifdef CONFIG_INTEL_VMX
 void vmx_pi_hooks_assign(struct domain *d);
 void vmx_pi_hooks_deassign(struct domain *d);
 #else
--=20
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED8B8B974F
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 11:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715683.1117493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SUp-00083x-VY; Thu, 02 May 2024 09:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715683.1117493; Thu, 02 May 2024 09:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SUp-000815-Rs; Thu, 02 May 2024 09:12:55 +0000
Received: by outflank-mailman (input) for mailman id 715683;
 Thu, 02 May 2024 09:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUhA=MF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s2SUo-00080h-69
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 09:12:54 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2708c599-0864-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 11:12:53 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 0E9731AFEE;
 Thu,  2 May 2024 05:12:51 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 066281AFED;
 Thu,  2 May 2024 05:12:51 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 528781AFEC;
 Thu,  2 May 2024 05:12:50 -0400 (EDT)
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
X-Inumbo-ID: 2708c599-0864-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=n8lh5sI7kgYWqWm0ZWfIf98vp
	I8aDBlCayXCBhx7N2Q=; b=EnSbZrzqTTb8JKUMDhjijLQ0pnaq3vOJhuoLXgBTv
	/TIE3764Q+jQo2weoCZp0wLZIGnN80l7PsnNIL790o77y+IZL05JOoVd6g6H2AZW
	3c0ohGF70/UqqdGTsYYle96nyf8b5AC1Q0LpwE4ZyVuwi5UpbVA4wKVbkFXMFj+w
	ik=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v2 1/5] x86/vpmu: separate amd/intel vPMU code
Date: Thu,  2 May 2024 12:12:43 +0300
Message-Id: <ddbf4e24c41f48832bba4b11368cd5e6e9f79a20.1714640459.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 26447D24-0864-11EF-B2B6-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Build AMD vPMU when CONFIG_AMD is on, and Intel vPMU when CONFIG_INTEL
is on respectively, allowing for a plaftorm-specific build.

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>

---
changes in v2:
 - drop static inline stubs, use #idef/#endif in vpmu_init)()
changes in v1:
 - switch to CONFIG_{AMD,INTEL} instead of CONFIG_{SVM,VMX}
---
 xen/arch/x86/cpu/Makefile | 4 +++-
 xen/arch/x86/cpu/vpmu.c   | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index 35561fe51d..eafce5f204 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -10,4 +10,6 @@ obj-y +=3D intel.o
 obj-y +=3D intel_cacheinfo.o
 obj-y +=3D mwait-idle.o
 obj-y +=3D shanghai.o
-obj-y +=3D vpmu.o vpmu_amd.o vpmu_intel.o
+obj-y +=3D vpmu.o
+obj-$(CONFIG_AMD) +=3D vpmu_amd.o
+obj-$(CONFIG_INTEL) +=3D vpmu_intel.o
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index b2e9881e06..3db90b7839 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -827,6 +827,7 @@ static int __init cf_check vpmu_init(void)
=20
     switch ( vendor )
     {
+#ifdef CONFIG_AMD
     case X86_VENDOR_AMD:
         ops =3D amd_vpmu_init();
         break;
@@ -834,11 +835,12 @@ static int __init cf_check vpmu_init(void)
     case X86_VENDOR_HYGON:
         ops =3D hygon_vpmu_init();
         break;
-
+#endif
+#ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
         ops =3D core2_vpmu_init();
         break;
-
+#endif
     default:
         printk(XENLOG_WARNING "VPMU: Unknown CPU vendor: %d. "
                "Turning VPMU off.\n", vendor);
--=20
2.25.1



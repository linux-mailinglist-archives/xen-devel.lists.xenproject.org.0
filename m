Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9458C4DA4
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721229.1124484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nQk-000880-Fl; Tue, 14 May 2024 08:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721229.1124484; Tue, 14 May 2024 08:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nQk-00085h-D2; Tue, 14 May 2024 08:22:38 +0000
Received: by outflank-mailman (input) for mailman id 721229;
 Tue, 14 May 2024 08:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XrDB=MR=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s6nQi-00085M-Od
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:22:36 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c6266cb-11cb-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 10:22:32 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id EE5BA2C41E;
 Tue, 14 May 2024 04:22:33 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E536F2C41D;
 Tue, 14 May 2024 04:22:33 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 388772C41C;
 Tue, 14 May 2024 04:22:33 -0400 (EDT)
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
X-Inumbo-ID: 1c6266cb-11cb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=nwJV6QxpfW1VT27LacPTJtctg
	XhxVUKxAohHmFS/6/8=; b=l1PZlyraEegQH1RDFglOeRqO1bBQmuYIvdTzywUV8
	883BMOSgeaVdATiPuQmfK0qaAQmo2uUvL/MPa4/DqpDzR4rwBwN5fd8vTmpc/rdb
	E7J08pHmX5jVJodHZwZJjEgQctZnkm1uQQHa3cZT+eOCea2qrls/oXVVEB1Qeans
	KU=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v3 3/6] x86/MCE: guard access to Intel/AMD-specific MCA MSRs
Date: Tue, 14 May 2024 11:22:30 +0300
Message-Id: <15b01508ca14265f643ddfb508481012c21a8c81.1715673586.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 1CE33192-11CB-11EF-B574-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Add build-time checks for newly introduced INTEL/AMD config options when
calling vmce_{intel/amd}_{rdmsr/wrmsr}() routines.
This way a platform-specific code can be omitted in vmce code, if this
platform is disabled in config.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v3:
 - neither of the blank lines dropped
changes in v2:
 - use #ifdef/#endif in switch instead of IS_ENABLED
 - fallback to returning default 0 if vendor not recognized
---
 xen/arch/x86/cpu/mcheck/vmce.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmc=
e.c
index 94d1f021e1..5abdf4cb5f 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -138,16 +138,20 @@ static int bank_mce_rdmsr(const struct vcpu *v, uin=
t32_t msr, uint64_t *val)
     default:
         switch ( boot_cpu_data.x86_vendor )
         {
+#ifdef CONFIG_INTEL
         case X86_VENDOR_CENTAUR:
         case X86_VENDOR_SHANGHAI:
         case X86_VENDOR_INTEL:
             ret =3D vmce_intel_rdmsr(v, msr, val);
             break;
+#endif
=20
+#ifdef CONFIG_AMD
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
             ret =3D vmce_amd_rdmsr(v, msr, val);
             break;
+#endif
=20
         default:
             ret =3D 0;
@@ -271,14 +275,18 @@ static int bank_mce_wrmsr(struct vcpu *v, uint32_t =
msr, uint64_t val)
     default:
         switch ( boot_cpu_data.x86_vendor )
         {
+#ifdef CONFIG_INTEL
         case X86_VENDOR_INTEL:
             ret =3D vmce_intel_wrmsr(v, msr, val);
             break;
+#endif
=20
+#ifdef CONFIG_AMD
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
             ret =3D vmce_amd_wrmsr(v, msr, val);
             break;
+#endif
=20
         default:
             ret =3D 0;
--=20
2.25.1



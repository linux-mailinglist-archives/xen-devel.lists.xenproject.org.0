Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207F58B9765
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 11:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715693.1117512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SYm-0001kh-Kt; Thu, 02 May 2024 09:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715693.1117512; Thu, 02 May 2024 09:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2SYm-0001iY-IB; Thu, 02 May 2024 09:17:00 +0000
Received: by outflank-mailman (input) for mailman id 715693;
 Thu, 02 May 2024 09:16:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUhA=MF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s2SYl-0001ht-6r
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 09:16:59 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9ddb56c-0864-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 11:16:58 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id A2AB21B012;
 Thu,  2 May 2024 05:16:57 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 99F821B011;
 Thu,  2 May 2024 05:16:57 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 9E1F81B010;
 Thu,  2 May 2024 05:16:56 -0400 (EDT)
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
X-Inumbo-ID: b9ddb56c-0864-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=lgp28eofjwhEroQqYCklB0e/t
	P+m22xf9XqOUZKnIoA=; b=iV5Q5v2lZrzH5K4MyUiyAT/abCGCVRTRvk2x/PVvu
	OeJz58/s4lt7FOHZFK5DXc/413Bm//7t8DKEEcLQyl6fwt/Ncoi3fIhHk3upbG6g
	PCL5hDPRI4LmNuISx8YI46eGeQ7YFZFEEMIbSDv0GYtDjIYs4azWUIIvghhHEgxc
	gE=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 3/5] x86/MCE: guard access to Intel/AMD-specific MCA MSRs
Date: Thu,  2 May 2024 12:16:54 +0300
Message-Id: <725b477a688ad17e5fa2a8bac78f4905170523c8.1714640459.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 B914D3A6-0864-11EF-B9EA-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Add build-time checks for newly introduced INTEL/AMD config options when
calling vmce_{intel/amd}_{rdmsr/wrmsr}() routines.
This way a platform-specific code can be omitted in vmce code, if this
platform is disabled in config.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - use #ifdef/#endif in switch instead of IS_ENABLED
 - fallback to returning default 0 if vendor not recognized
---
 xen/arch/x86/cpu/mcheck/vmce.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmc=
e.c
index 94d1f021e1..373a8e2452 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -138,17 +138,19 @@ static int bank_mce_rdmsr(const struct vcpu *v, uin=
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
-
+#endif
+#ifdef CONFIG_AMD
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
             ret =3D vmce_amd_rdmsr(v, msr, val);
             break;
-
+#endif
         default:
             ret =3D 0;
             break;
@@ -271,15 +273,17 @@ static int bank_mce_wrmsr(struct vcpu *v, uint32_t =
msr, uint64_t val)
     default:
         switch ( boot_cpu_data.x86_vendor )
         {
+#ifdef CONFIG_INTEL
         case X86_VENDOR_INTEL:
             ret =3D vmce_intel_wrmsr(v, msr, val);
             break;
-
+#endif
+#ifdef CONFIG_AMD
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
             ret =3D vmce_amd_wrmsr(v, msr, val);
             break;
-
+#endif
         default:
             ret =3D 0;
             break;
--=20
2.25.1



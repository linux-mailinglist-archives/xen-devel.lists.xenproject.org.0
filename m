Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270508AE04F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710436.1109671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBt7-0003rF-Hd; Tue, 23 Apr 2024 08:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710436.1109671; Tue, 23 Apr 2024 08:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBt7-0003og-EX; Tue, 23 Apr 2024 08:52:29 +0000
Received: by outflank-mailman (input) for mailman id 710436;
 Tue, 23 Apr 2024 08:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKuO=L4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rzBt5-0003oV-IV
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:52:27 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdf14cdf-014e-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 10:52:25 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 089E42F571;
 Tue, 23 Apr 2024 04:52:24 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 00B522F570;
 Tue, 23 Apr 2024 04:52:24 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 752212F56F;
 Tue, 23 Apr 2024 04:52:20 -0400 (EDT)
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
X-Inumbo-ID: cdf14cdf-014e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=S1rwCtNYMTM6b7pGJJ8grguoV
	77WucEJ1NnbYDjwq30=; b=x+nWwy8vZGgQ662bifcMeCFlB6UAPDjpKka1g8OqA
	LzvCuebQ7lPmAdyZMRSTJIjV/DEGLqb551EPsp1iCsbZZ+cCPWwPEZM6/njNJ4l0
	RUdW1lpG4sT9PdwOoEscAKZdXLZ9T3EZ76VcuadNSXDEgbY0DMtSL+ylPRhej8aN
	UI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 3/7] x86/MCE: guard access to Intel/AMD-specific MCA MSRs
Date: Tue, 23 Apr 2024 11:52:17 +0300
Message-Id: <d187db984b9b5413d73849594985e10c2c2fdc03.1713860310.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 CB7F013C-014E-11EF-A908-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Add build-time checks for newly introduced INTEL/AMD config options when
calling vmce_{intel/amd}_{rdmsr/wrmsr}() routines.
This way a platform-specific code can be omitted in vmce code, if this
platform is disabled in config.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/mcheck/vmce.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmc=
e.c
index c437f62c0a..be229684a4 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -141,12 +141,14 @@ static int bank_mce_rdmsr(const struct vcpu *v, uin=
t32_t msr, uint64_t *val)
         case X86_VENDOR_CENTAUR:
         case X86_VENDOR_SHANGHAI:
         case X86_VENDOR_INTEL:
-            ret =3D vmce_intel_rdmsr(v, msr, val);
+            ret =3D IS_ENABLED(CONFIG_INTEL) ?
+                  vmce_intel_rdmsr(v, msr, val) : -ENODEV;
             break;
=20
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
-            ret =3D vmce_amd_rdmsr(v, msr, val);
+            ret =3D IS_ENABLED(CONFIG_AMD) ?
+                  vmce_amd_rdmsr(v, msr, val) : -ENODEV;
             break;
=20
         default:
@@ -272,12 +274,14 @@ static int bank_mce_wrmsr(struct vcpu *v, uint32_t =
msr, uint64_t val)
         switch ( boot_cpu_data.x86_vendor )
         {
         case X86_VENDOR_INTEL:
-            ret =3D vmce_intel_wrmsr(v, msr, val);
+            ret =3D IS_ENABLED(CONFIG_INTEL) ?
+                  vmce_intel_wrmsr(v, msr, val) : -ENODEV;
             break;
=20
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
-            ret =3D vmce_amd_wrmsr(v, msr, val);
+            ret =3D IS_ENABLED(CONFIG_AMD) ?
+                  vmce_amd_wrmsr(v, msr, val) : -ENODEV;
             break;
=20
         default:
--=20
2.25.1



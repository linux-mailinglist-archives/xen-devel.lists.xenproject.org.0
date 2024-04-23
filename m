Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BBF8AE047
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710432.1109660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBr5-0003KK-6S; Tue, 23 Apr 2024 08:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710432.1109660; Tue, 23 Apr 2024 08:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBr5-0003HM-3g; Tue, 23 Apr 2024 08:50:23 +0000
Received: by outflank-mailman (input) for mailman id 710432;
 Tue, 23 Apr 2024 08:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKuO=L4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rzBr3-0003HB-4y
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:50:21 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8289f7b8-014e-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 10:50:19 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id A07922F561;
 Tue, 23 Apr 2024 04:50:17 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 98F5C2F560;
 Tue, 23 Apr 2024 04:50:17 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id F21E62F55F;
 Tue, 23 Apr 2024 04:50:12 -0400 (EDT)
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
X-Inumbo-ID: 8289f7b8-014e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=aYD43tk+gWcyJQX2GE5PLFjHO
	p7VB7dWZgOWsQGq9gU=; b=b9bWZqrJCuMB6yFz66DOS65k9dAox6+zmq11HPZRZ
	xuTsr9VtncYPmCJBBV0uvWTaYpw2L31N+2cEkEM3l0MLSzFkiy1dQBkKDO/CEx0L
	EDFKF/YH39t5bxaQtEwMcRakeb4H1UqO7tHyjQdpI0+j6Z+YAmH42XlqiKDlRgYi
	MQ=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 2/7] x86/intel: guard vmce_has_lmce() with INTEL option
Date: Tue, 23 Apr 2024 11:50:09 +0300
Message-Id: <5e26895d84f8b7750799740ac2324b2cb92fa97e.1713860310.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 7F821B2A-014E-11EF-9A68-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Since MCG_LMCE_P bit is specific to Intel CPUs the code to check it can
possibly be excluded from build if !CONFIG_INTEL. With these guards
calls to vmce_has_lmce() are eliminated and mce_intel.c can end up
not being built.

Also replace boilerplate code that checks for MCG_LMCE_P flag with
vmce_has_lmce(), which might contribute to readability a bit.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/mcheck/vmce.c | 4 ++--
 xen/arch/x86/msr.c             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmc=
e.c
index 353d4f19b2..c437f62c0a 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -199,7 +199,7 @@ int vmce_rdmsr(uint32_t msr, uint64_t *val)
          * bits are always set in guest MSR_IA32_FEATURE_CONTROL by Xen,=
 so it
          * does not need to check them here.
          */
-        if ( cur->arch.vmce.mcg_cap & MCG_LMCE_P )
+        if ( IS_ENABLED(CONFIG_INTEL) && vmce_has_lmce(cur) )
         {
             *val =3D cur->arch.vmce.mcg_ext_ctl;
             mce_printk(MCE_VERBOSE, "MCE: %pv: rd MCG_EXT_CTL %#"PRIx64"=
\n",
@@ -324,7 +324,7 @@ int vmce_wrmsr(uint32_t msr, uint64_t val)
         break;
=20
     case MSR_IA32_MCG_EXT_CTL:
-        if ( (cur->arch.vmce.mcg_cap & MCG_LMCE_P) &&
+        if ( IS_ENABLED(CONFIG_INTEL) && vmce_has_lmce(cur) &&
              !(val & ~MCG_EXT_CTL_LMCE_EN) )
             cur->arch.vmce.mcg_ext_ctl =3D val;
         else
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 9babd441f9..4010c87d93 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -86,7 +86,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t =
*val)
             goto gp_fault;
=20
         *val =3D IA32_FEATURE_CONTROL_LOCK;
-        if ( vmce_has_lmce(v) )
+        if ( IS_ENABLED(CONFIG_INTEL) && vmce_has_lmce(v) )
             *val |=3D IA32_FEATURE_CONTROL_LMCE_ON;
         if ( cp->basic.vmx )
             *val |=3D IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
--=20
2.25.1



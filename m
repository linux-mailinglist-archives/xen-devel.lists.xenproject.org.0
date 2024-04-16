Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C058A6415
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706638.1103918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcS1-0006yE-A7; Tue, 16 Apr 2024 06:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706638.1103918; Tue, 16 Apr 2024 06:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcS1-0006vi-6J; Tue, 16 Apr 2024 06:37:53 +0000
Received: by outflank-mailman (input) for mailman id 706638;
 Tue, 16 Apr 2024 06:37:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcRz-0006va-Kf
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:37:51 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d765debc-fbbb-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:37:49 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id D5B9D36586;
 Tue, 16 Apr 2024 02:37:47 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id C0FCF36585;
 Tue, 16 Apr 2024 02:37:47 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id B4E8D36584;
 Tue, 16 Apr 2024 02:37:43 -0400 (EDT)
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
X-Inumbo-ID: d765debc-fbbb-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=9Zw6Q89ndDALDigv8IS7imOfjSDEUzFnmBNeSU/Q/xY=; b=TkFo
	iZVtU4VyBn+zFeGpwLM4tVTkkaKEk24s+noMTIIecFoQYYcN0/qF88jEOdpbfUGP
	xPeUlFnTYSUtcgPUHvHAn9UFBg6DGSTAbjbJu++eDUMhizYy2GNUATZtgG4W4AL1
	/zEpyRGvmtrLETxN+mLc09NB1LcKxIDDkTkJuBo=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1 09/15] x86/traps: guard vmx specific functions with CONFIG_VMX
Date: Tue, 16 Apr 2024 09:37:40 +0300
Message-Id: <20240416063740.3469592-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 D47E1B62-FBBB-11EE-BE54-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

The functions vmx_vmcs_enter() and vmx_vmcs_exit() are VT-x specific.
Guard their calls with CONFIG_VMX.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/traps.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d554c9d41e..218eb5b322 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -676,7 +676,6 @@ void vcpu_show_execution_state(struct vcpu *v)
=20
     vcpu_pause(v); /* acceptably dangerous */
=20
-#ifdef CONFIG_HVM
     /*
      * For VMX special care is needed: Reading some of the register stat=
e will
      * require VMCS accesses. Engaging foreign VMCSes involves acquiring=
 of a
@@ -684,12 +683,11 @@ void vcpu_show_execution_state(struct vcpu *v)
      * region. Despite this being a layering violation, engage the VMCS =
right
      * here. This then also avoids doing so several times in close succe=
ssion.
      */
-    if ( cpu_has_vmx && is_hvm_vcpu(v) )
+    if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx && is_hvm_vcpu(v) )
     {
         ASSERT(!in_irq());
         vmx_vmcs_enter(v);
     }
-#endif
=20
     /* Prevent interleaving of output. */
     flags =3D console_lock_recursive_irqsave();
@@ -714,10 +712,8 @@ void vcpu_show_execution_state(struct vcpu *v)
         console_unlock_recursive_irqrestore(flags);
     }
=20
-#ifdef CONFIG_HVM
-    if ( cpu_has_vmx && is_hvm_vcpu(v) )
+    if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx && is_hvm_vcpu(v) )
         vmx_vmcs_exit(v);
-#endif
=20
     vcpu_unpause(v);
 }
--=20
2.25.1



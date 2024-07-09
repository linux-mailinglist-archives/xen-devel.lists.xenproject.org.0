Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA9192AFA3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 07:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755769.1164231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3sR-00039F-E7; Tue, 09 Jul 2024 05:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755769.1164231; Tue, 09 Jul 2024 05:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3sR-00036S-AF; Tue, 09 Jul 2024 05:58:59 +0000
Received: by outflank-mailman (input) for mailman id 755769;
 Tue, 09 Jul 2024 05:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR3sP-000356-K6
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 05:58:57 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 525da89d-3db8-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 07:58:55 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id E440138271;
 Tue,  9 Jul 2024 01:58:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id DBCFC38270;
 Tue,  9 Jul 2024 01:58:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id A41F03826E;
 Tue,  9 Jul 2024 01:58:48 -0400 (EDT)
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
X-Inumbo-ID: 525da89d-3db8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=+Yl11oadxrSru19AkHHp51vGZ
	ym9OE6VsrHHN87lIL4=; b=QQuqpJfnKq+IF2Lu8XKoD6G+RFzkILLwFW8YgiNXz
	rEbYCNUOUvcXDsI9X1iWsaV8moErdio4QYW6ZMmGOvIuI5tVRqli5h4cm1RYgZFg
	LN1plZNT+/S172eM0+xcl2EQQMJ7epAP5GEmCJ79g+gxNOyEpEs2aIoLKqIvjNfI
	VE=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v4 07/14] x86/traps: guard vmx specific functions with usinc_vmx() check
Date: Tue,  9 Jul 2024 08:58:45 +0300
Message-Id: <5c90e9fcffca0e730c8488935028e6cd6ab917c4.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 4F6271FA-3DB8-11EF-BF52-C38742FD603B-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Replace cpu_has_vmx check with using_vmx(), so that not only VMX support =
in CPU
is being checked at runtime, but also at build time we ensure the availab=
ility
of functions vmx_vmcs_enter() & vmx_vmcs_exit().

Also since CONFIG_VMX is checked in using_vmx and it depends on CONFIG_HV=
M,
we can drop #ifdef CONFIG_HVM lines around using_vmx.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - adjusted call to using_vmx(), as it has become an inline function
 - added tag
 - description changed a bit for more clarity
changes in v3:
 -using_vmx instead of IS_ENABLED(CONFIG_VMX)
 - updated description
---
 xen/arch/x86/traps.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index ee91fc56b1..d2af6d70d2 100644
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
+    if ( using_vmx() && is_hvm_vcpu(v) )
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
+    if ( using_vmx() && is_hvm_vcpu(v) )
         vmx_vmcs_exit(v);
-#endif
=20
     vcpu_unpause(v);
 }
--=20
2.25.1



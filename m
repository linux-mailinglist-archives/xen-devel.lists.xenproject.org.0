Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A75298D811F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734851.1140960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5np-0006EK-Md; Mon, 03 Jun 2024 11:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734851.1140960; Mon, 03 Jun 2024 11:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5np-0006BC-K3; Mon, 03 Jun 2024 11:24:37 +0000
Received: by outflank-mailman (input) for mailman id 734851;
 Mon, 03 Jun 2024 11:24:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5nn-0006B5-VS
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:24:36 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da47167b-219b-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 13:24:34 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 4FC05317C7;
 Mon,  3 Jun 2024 07:24:33 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 48509317C6;
 Mon,  3 Jun 2024 07:24:33 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 60861317C5;
 Mon,  3 Jun 2024 07:24:30 -0400 (EDT)
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
X-Inumbo-ID: da47167b-219b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=sEkjfdgPA5uPcRwW5X9CnC8Lf
	bf4U4pmRrO5A9YryUE=; b=LhQL90P2fpJ9a4IStB+H/oyPE2fx62KY9i5DwDiMg
	Z+W52+FFuMDE+/mmn/HYaCFbzwuwdinLyF1On10RA/n8ShUR2ePaVl5pWjQYXVKB
	+gspc13lb/uy8RWM0LSBNNVLKDRjm/BXsUnK0DLuXxb8ikWHMYl3Ynj+0jradqkX
	Fo=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v3 09/16] x86/traps: guard vmx specific functions with usinc_vmx macro
Date: Mon,  3 Jun 2024 14:24:27 +0300
Message-Id: <63045d707485c818af5eafa45752e60405ecf887.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 D84958B4-219B-11EF-B94D-8F8B087618E4-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

Replace cpu_has_vmx check with using_vmx, so that not only VMX support in=
 CPU
gets checked, but also presence of functions vmx_vmcs_enter() & vmx_vmcs_=
exit()
in the build checked as well.

Also since CONFIG_VMX is checked in using_vmx and it depends on CONFIG_HV=
M,
we can drop #ifdef CONFIG_HVM lines around using_vmx.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
changes in v3:
 - using_vmx instead of IS_ENABLED(CONFIG_VMX)
 - updated description
---
 xen/arch/x86/traps.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 9906e874d5..a81f3cf57c 100644
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
+    if ( using_vmx && is_hvm_vcpu(v) )
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
+    if ( using_vmx && is_hvm_vcpu(v) )
         vmx_vmcs_exit(v);
-#endif
=20
     vcpu_unpause(v);
 }
--=20
2.25.1



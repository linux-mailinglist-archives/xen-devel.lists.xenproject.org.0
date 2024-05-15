Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9DB8C637C
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722067.1125898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AkS-0006I2-Fh; Wed, 15 May 2024 09:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722067.1125898; Wed, 15 May 2024 09:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AkS-0006Fn-D7; Wed, 15 May 2024 09:16:32 +0000
Received: by outflank-mailman (input) for mailman id 722067;
 Wed, 15 May 2024 09:16:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AkQ-0006Ff-VH
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:16:30 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d03c5259-129b-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:16:30 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 1956435482;
 Wed, 15 May 2024 05:16:29 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 11C5A35481;
 Wed, 15 May 2024 05:16:29 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 6DC4E35480;
 Wed, 15 May 2024 05:16:28 -0400 (EDT)
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
X-Inumbo-ID: d03c5259-129b-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=299ufJ2kZ2D6V92PsDN8HDonp
	5MtRuFSITeTwpBue9Q=; b=rb+6o5hp4FAI7YCe5i8W0vZBh6ACm1yvFfWcphJE3
	I43FEEViadokhM9ME3L2rzVfiBMtPhO3OHmhZ81bD7l2n4RYexuCyYHi/Zi8QUQ7
	Y2kIViauLGzLeW3zUm+//qflMIXP/AlhtRfLvko/qXCbHX9BeLEyU1tUAsvL46YT
	lA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v2 09/15] x86/traps: clean up superfluous #idef-s
Date: Wed, 15 May 2024 12:16:26 +0300
Message-Id: <7f0b98062ce67ad8176670efbe3c3ebdb43d2b1c.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 CFA4903E-129B-11EF-85B5-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Remove preprocessor checks for CONFIG_HVM option, because expressions cov=
ered
by these checks are already guarded by cpu_has_vmx, which itself depends
on CONFIG_HVM option (via CONFIG_VMX).

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/traps.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d554c9d41e..7b8ee45edf 100644
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
@@ -689,7 +688,6 @@ void vcpu_show_execution_state(struct vcpu *v)
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
     if ( cpu_has_vmx && is_hvm_vcpu(v) )
         vmx_vmcs_exit(v);
-#endif
=20
     vcpu_unpause(v);
 }
--=20
2.25.1



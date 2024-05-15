Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100248C639C
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722088.1125939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AsR-0001up-UE; Wed, 15 May 2024 09:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722088.1125939; Wed, 15 May 2024 09:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AsR-0001tI-Qc; Wed, 15 May 2024 09:24:47 +0000
Received: by outflank-mailman (input) for mailman id 722088;
 Wed, 15 May 2024 09:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AsR-0001tC-2W
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:24:47 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7d6d3ca-129c-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:24:46 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id F0554354E1;
 Wed, 15 May 2024 05:24:44 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E83D2354E0;
 Wed, 15 May 2024 05:24:44 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 42EF7354DE;
 Wed, 15 May 2024 05:24:44 -0400 (EDT)
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
X-Inumbo-ID: f7d6d3ca-129c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=lfpK0MUD/x59alsKeTEo/v19a
	RiX/271n/gqtVYSVVQ=; b=mgpjqU5zYcdWNnEYuplOJbgzNb2Etbw8ls45J8vYf
	dVAVR2IKZeSbAdmR5l3Hm3NcgWWdAcS7dZNdVZU6UlQs36pqRXldu0WI9ppq/p6P
	lfmUD6OoyKZYLfoB6Dg9Ft7FtRe6bsYAttvRh5jnueqWdPk/+tyRJJm924qBvuUY
	bk=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v2 13/15] x86/ioreq: guard VIO_realmode_completion with CONFIG_VMX
Date: Wed, 15 May 2024 12:24:42 +0300
Message-Id: <9e64fa33b298f789d8340cf1046a9fbf683dd2b7.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 F72CFF8C-129C-11EF-9E53-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

VIO_realmode_completion is specific to vmx realmode, so guard the complet=
ion
handling code with CONFIG_VMX. Also, guard VIO_realmode_completion itself=
 by
CONFIG_VMX, instead of generic CONFIG_X86.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
changes in v1:
 - put VIO_realmode_completion enum under #ifdef CONFIG_VMX
---
 xen/arch/x86/hvm/emulate.c | 2 ++
 xen/arch/x86/hvm/ioreq.c   | 2 ++
 xen/include/xen/sched.h    | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index ab1bc51683..d60b1f6f4d 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2667,7 +2667,9 @@ static int _hvm_emulate_one(struct hvm_emulate_ctxt=
 *hvmemul_ctxt,
         break;
=20
     case VIO_mmio_completion:
+#ifdef CONFIG_VMX
     case VIO_realmode_completion:
+#endif
         BUILD_BUG_ON(sizeof(hvio->mmio_insn) < sizeof(hvmemul_ctxt->insn=
_buf));
         hvio->mmio_insn_bytes =3D hvmemul_ctxt->insn_buf_bytes;
         memcpy(hvio->mmio_insn, hvmemul_ctxt->insn_buf, hvio->mmio_insn_=
bytes);
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 4eb7a70182..b37bbd660b 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -33,6 +33,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion com=
pletion)
 {
     switch ( completion )
     {
+#ifdef CONFIG_VMX
     case VIO_realmode_completion:
     {
         struct hvm_emulate_ctxt ctxt;
@@ -43,6 +44,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion com=
pletion)
=20
         break;
     }
+#endif
=20
     default:
         ASSERT_UNREACHABLE();
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 132b841995..50a58fe428 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -152,7 +152,7 @@ enum vio_completion {
     VIO_no_completion,
     VIO_mmio_completion,
     VIO_pio_completion,
-#ifdef CONFIG_X86
+#ifdef CONFIG_VMX
     VIO_realmode_completion,
 #endif
 };
--=20
2.25.1



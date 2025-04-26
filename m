Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB45BA9D8F8
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 09:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968978.1358370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Zx2-0007o6-HS; Sat, 26 Apr 2025 07:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968978.1358370; Sat, 26 Apr 2025 07:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Zx2-0007l8-DB; Sat, 26 Apr 2025 07:27:52 +0000
Received: by outflank-mailman (input) for mailman id 968978;
 Sat, 26 Apr 2025 07:27:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ssvg=XM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u8Zx0-00071f-Nm
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 07:27:50 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f53e5b9f-226f-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 09:27:50 +0200 (CEST)
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
X-Inumbo-ID: f53e5b9f-226f-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=u35343243rg35dyuekwrpevosy.protonmail; t=1745652469; x=1745911669;
	bh=HPfty69uBvTrq82vqiOmS6ersOWif3DTHgIUG7+hNJ8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=ZRIhWFPZBg/seUzg3BkcaRc3iPI8mdDe3+tYwuU3/qwnWtCoZ/0rB/72NTTHpgVrD
	 CP4ix9Zhq/L/s/YmiL5vjucW4eKI+4GWyF0xIL/6ZyTv98goQYQ9iKlkR4dxn87s5+
	 WFUhlThYzq/woQK+dOVcWSBxxnyxCgLrlAb723TIIfmN95nIYfjBR5E1SJObOWlQDb
	 2APZyxV+UlF5V8+0b/0o09N4tNNtXncyZiIzUC0N1bZl3nOtxLpf+giJ4oa4dKVwKl
	 bQ9iyq45OkGWYYECrSspgBuK+c/l4nNJTFIF/vsQPNNX0+wn3k8JD/MtMf3juTu907
	 0SaKD5yjB736g==
Date: Sat, 26 Apr 2025 07:27:44 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: [PATCH v4 2/3] x86/vmx: Update DR7 type
Message-ID: <20250426072739.39373-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b44d07f619a002cfab877a51c8b3ce4fabeaea88
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Convert the DR7 type to `unsigned int` and fix the accesses where necessary=
.

[1] https://lore.kernel.org/xen-devel/0d01646b-83e3-4a02-b365-d149d2664e73@=
citrix.com/

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/vmx/vmx.c        | 2 +-
 xen/arch/x86/include/asm/domain.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 4883bd823d..75c6992172 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -926,7 +926,7 @@ static void vmx_save_dr(struct vcpu *v)
     v->arch.dr[3] =3D read_debugreg(3);
     v->arch.dr6   =3D read_debugreg(6);
     /* DR7 must be saved as it is used by vmx_restore_dr(). */
-    __vmread(GUEST_DR7, &v->arch.dr7);
+    v->arch.dr7 =3D vmread(GUEST_DR7);
 }
=20
 static void __restore_debug_registers(struct vcpu *v)
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 5fc1d1e5d0..a54ef3a8c1 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -595,7 +595,7 @@ struct arch_vcpu
=20
     /* Debug registers. */
     unsigned long dr[4];
-    unsigned long dr7; /* Ideally int, but __vmread() needs long. */
+    unsigned int dr7;
     unsigned int dr6;
=20
     /* other state */
--=20
2.34.1




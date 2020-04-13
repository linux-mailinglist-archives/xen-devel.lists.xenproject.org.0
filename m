Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4401A6664
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 14:37:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNyJp-00021D-2U; Mon, 13 Apr 2020 12:36:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pMlu=55=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1jNyJn-000218-Hl
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2020 12:36:03 +0000
X-Inumbo-ID: 54e1771a-7d83-11ea-882f-12813bfff9fa
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54e1771a-7d83-11ea-882f-12813bfff9fa;
 Mon, 13 Apr 2020 12:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1586781352; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=URT4ApyJH9amVLiaLSYaw57F9uCpTWyKxsPl34oflcpUmtg2p4WEWREBPNpMbTbnK1x3emOOWzNfG4I6m556+BGi/dxKmMA4uPJtmeBnmzxqlhHbK2jI1dO//XNcSsJzn81VxfqbYA5G60VD/DLVsCkF5Eij6K/9d7WBF/Wq4bE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1586781352;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=B++eaGNam0FxBVZre8TLB+VO2JQ+stYGRCXlTtSwji0=; 
 b=PI0hG2vGh1Jacd3QytBJxwOaEe72zlJRPnLxGu+3h/5jWT8h4tTHkbcyA7M1vZhw1FPOrghFM95VspEGEMuXDfankhybKPGPevnpKs0Xtr7kRLhR7hJasqerOEFAr9CN1/h1W147K8ImoZti5ZMFflyURZdtqVThdCSJaMhRBPE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=qubes-os.org;
 spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
 dmarc=pass header.from=<frederic.pierret@qubes-os.org>
 header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586781352; 
 s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=B++eaGNam0FxBVZre8TLB+VO2JQ+stYGRCXlTtSwji0=;
 b=Vw6Awvh5xzJpfznhRXSvdmRdaTs0ecMplK9U9YbHWel0dJPtTWXZg6bMj3pnJMZU
 2pwabRVZYXIdimTTxYgmkGbT9lfiW+n34pHw5jAze9UJ28ySBvUhSq9lMfn56QGL66O
 1YavpT7oYIr47FHLWkWOooX1csDP2RVHnLw2l08Y=
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1586781351454814.489105458741;
 Mon, 13 Apr 2020 05:35:51 -0700 (PDT)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <20200413123535.10884-1-frederic.pierret@qubes-os.org>
Subject: [PATCH] xen x86: fix early boot crash with gcc-10
Date: Mon, 13 Apr 2020 14:35:35 +0200
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The change fixes boot failure on VM where kernel (at least v5.4 and v5.6)
is built with gcc-10 and STACKPROTECTOR_STRONG enabled:

```
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: =
cpu_bringup_and_idle+0x93/0xa0
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.31-1.qubes.x86_64 #1
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.12.0-1 04/01/201=
4
Call Trace:
  dump_stack+0x64/0x88
   panic+0x10b/0x2ed
   ? cpu_bringup_and_idle+0x93/0xa0
   __stack_chk_fail+0x15/0x20
   cpu_bringup_and_idle+0x93/0xa
```
The change makes successfully booting the VM. The VM is hosted by
KVM hypervisor and is running Xen into.

Based on work done by Sergei Trofimovich: https://lkml.org/lkml/2020/3/26/1=
133

Signed-off-by: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@qubes=
-os.org>
---
 arch/x86/xen/smp_pv.c          | 2 +-
 include/linux/compiler-gcc.h   | 1 +
 include/linux/compiler_types.h | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 8fb8a50a28b4..5c8ee4a5bb0c 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -88,7 +88,7 @@ static void cpu_bringup(void)
 =09local_irq_enable();
 }
=20
-asmlinkage __visible void cpu_bringup_and_idle(void)
+asmlinkage __visible void __no_stack_protector cpu_bringup_and_idle(void)
 {
 =09cpu_bringup();
 =09boot_init_stack_canary();
diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index d7ee4c6bad48..fb67c743138c 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -172,3 +172,4 @@
 #endif
=20
 #define __no_fgcse __attribute__((optimize("-fno-gcse")))
+#define __no_stack_protector __attribute__((optimize("-fno-stack-protector=
")))
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.=
h
index e970f97a7fcb..069c981eddb0 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -203,6 +203,10 @@ struct ftrace_likely_data {
 #define asm_inline asm
 #endif
=20
+#ifndef __no_stack_protector
+# define __no_stack_protector
+#endif
+
 #ifndef __no_fgcse
 # define __no_fgcse
 #endif
--=20
2.25.1




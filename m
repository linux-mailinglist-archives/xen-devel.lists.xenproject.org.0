Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC71A6871
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 17:04:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jO0cY-0005sv-Ge; Mon, 13 Apr 2020 15:03:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pMlu=55=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1jO0cX-0005sq-Bt
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2020 15:03:33 +0000
X-Inumbo-ID: f0209514-7d97-11ea-8858-12813bfff9fa
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0209514-7d97-11ea-8858-12813bfff9fa;
 Mon, 13 Apr 2020 15:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1586790203; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NPb69smhNgO1P+KkviAiFToL+vKMqi7jVNTqvd+/2gnCbcv9y24R8zOws8A9OkHdGd4WmPuQPLlMakVNy1rUWrd0/p+jJmfMfV9zlWQA7pnRx2Py8/FadIUhgudpHY/NRqsSnTR/iFNS6Uf2vbnFW7intpBJv8O3naTSNT5Id3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1586790203;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=9Pzk0cVzBCKcfGlQdKKLQ1SX00CFPc0gWvmG8POseOM=; 
 b=MFesFXbunyENNW1kui0k53JuRrrpwJH+11cLWpTcneejw5V5mk3Sw5hR0p5Eg6+C9ARxHNJ5lj9DAey+hIWjqUo3eSQm0EI6MEqg7BjJB+o7PGDkCDtBAyiJdi/MuEFXpW93FRg3ePdfgbavNAQq8lfMVjweEj2wCh7rHbZdBGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=qubes-os.org;
 spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
 dmarc=pass header.from=<frederic.pierret@qubes-os.org>
 header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586790203; 
 s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=9Pzk0cVzBCKcfGlQdKKLQ1SX00CFPc0gWvmG8POseOM=;
 b=lQnrmEWviXsFurbfdGrSiWqbpl0fOrpU4MuSD2vtweWTqg8TBjCgvbLrOuC/dhRQ
 JqjaLXKKqWMIyNocT3CibI/HG3VPrcWN93/mREwU1NLSGgp5QQ29Dfr0z4RjPgdxNaG
 7BoCdkKZdl1RHX6/4wjqRYrnmtykfuv1SUDX10y4=
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1586790200760672.0712336468074;
 Mon, 13 Apr 2020 08:03:20 -0700 (PDT)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <20200413150314.13974-1-frederic.pierret@qubes-os.org>
Subject: [PATCH v2] xen x86: fix early boot crash with gcc-10
Date: Mon, 13 Apr 2020 17:03:14 +0200
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200413142051.GC3772@zn.tnic>
References: <20200413142051.GC3772@zn.tnic>
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
 arch/x86/xen/smp_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
--=20
2.25.2




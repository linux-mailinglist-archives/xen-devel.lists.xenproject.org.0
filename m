Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B130830478
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 12:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667268.1040597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ41j-0006NB-Br; Wed, 17 Jan 2024 11:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667268.1040597; Wed, 17 Jan 2024 11:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ41j-0006L3-80; Wed, 17 Jan 2024 11:24:11 +0000
Received: by outflank-mailman (input) for mailman id 667268;
 Mon, 15 Jan 2024 10:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Udz1=IZ=kylinos.cn=chentao@srs-se1.protection.inumbo.net>)
 id 1rPJnF-00037O-BW
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 10:02:09 +0000
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2113407c-b38d-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 11:02:05 +0100 (CET)
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 181003448; Mon, 15 Jan 2024 18:01:45 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 4FC6BE000EB9;
 Mon, 15 Jan 2024 18:01:45 +0800 (CST)
Received: from kernel.. (unknown [172.20.15.234])
 by mail.kylinos.cn (NSMail) with ESMTPA id BD46DE000EB9;
 Mon, 15 Jan 2024 18:01:40 +0800 (CST)
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
X-Inumbo-ID: 2113407c-b38d-11ee-98f1-6d05b1d4d9a1
X-UUID: aa12db9f76434887ab78b70d05aa83c1-20240115
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:169b8540-1950-4393-b39b-1669d3541b89,IP:10,
	URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-INFO: VERSION:1.1.35,REQID:169b8540-1950-4393-b39b-1669d3541b89,IP:10,UR
	L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:25
X-CID-META: VersionHash:5d391d7,CLOUDID:81fadc82-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:240115180146O41PND0C,BulkQuantity:0,Recheck:0,SF:100|17|42|74|66|38|
	24|19|101|102,TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: aa12db9f76434887ab78b70d05aa83c1-20240115
X-ns-mid: postfix-65A50289-20367574
From: Kunwu Chan <chentao@kylinos.cn>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH] x86/xen: Fix some null pointer dereference issues in smp.c
Date: Mon, 15 Jan 2024 18:01:38 +0800
Message-Id: <20240115100138.34340-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kasprintf() returns a pointer to dynamically allocated memory
which can be NULL upon failure. Ensure the allocation was successful
by checking the pointer validity.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 arch/x86/xen/smp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/xen/smp.c b/arch/x86/xen/smp.c
index 4b0d6fff88de..f27608ed80a0 100644
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -65,6 +65,8 @@ int xen_smp_intr_init(unsigned int cpu)
 	char *resched_name, *callfunc_name, *debug_name;
=20
 	resched_name =3D kasprintf(GFP_KERNEL, "resched%d", cpu);
+	if (!resched_name)
+		goto fail;
 	per_cpu(xen_resched_irq, cpu).name =3D resched_name;
 	rc =3D bind_ipi_to_irqhandler(XEN_RESCHEDULE_VECTOR,
 				    cpu,
@@ -77,6 +79,8 @@ int xen_smp_intr_init(unsigned int cpu)
 	per_cpu(xen_resched_irq, cpu).irq =3D rc;
=20
 	callfunc_name =3D kasprintf(GFP_KERNEL, "callfunc%d", cpu);
+	if (!callfunc_name)
+		goto fail;
 	per_cpu(xen_callfunc_irq, cpu).name =3D callfunc_name;
 	rc =3D bind_ipi_to_irqhandler(XEN_CALL_FUNCTION_VECTOR,
 				    cpu,
@@ -90,6 +94,8 @@ int xen_smp_intr_init(unsigned int cpu)
=20
 	if (!xen_fifo_events) {
 		debug_name =3D kasprintf(GFP_KERNEL, "debug%d", cpu);
+		if (!debug_name)
+			goto fail;
 		per_cpu(xen_debug_irq, cpu).name =3D debug_name;
 		rc =3D bind_virq_to_irqhandler(VIRQ_DEBUG, cpu,
 					     xen_debug_interrupt,
@@ -101,6 +107,8 @@ int xen_smp_intr_init(unsigned int cpu)
 	}
=20
 	callfunc_name =3D kasprintf(GFP_KERNEL, "callfuncsingle%d", cpu);
+	if (!callfunc_name)
+		goto fail;
 	per_cpu(xen_callfuncsingle_irq, cpu).name =3D callfunc_name;
 	rc =3D bind_ipi_to_irqhandler(XEN_CALL_FUNCTION_SINGLE_VECTOR,
 				    cpu,
--=20
2.39.2



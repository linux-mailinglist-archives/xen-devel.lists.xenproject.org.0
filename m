Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479C74AEBBD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 09:03:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268816.462755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHhvk-0001in-Uc; Wed, 09 Feb 2022 08:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268816.462755; Wed, 09 Feb 2022 08:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHhvk-0001gI-RF; Wed, 09 Feb 2022 08:02:24 +0000
Received: by outflank-mailman (input) for mailman id 268816;
 Wed, 09 Feb 2022 08:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zPP=SY=linutronix.de=bigeasy@srs-se1.protection.inumbo.net>)
 id 1nHhvj-0001gC-Nh
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 08:02:24 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bde2105-897e-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 09:02:22 +0100 (CET)
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
X-Inumbo-ID: 9bde2105-897e-11ec-8f75-fffcc8bd4f1a
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644393741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FtIrm50qhttDnvw+t6HEGKMbZATCUZOMdzvBi9MSe90=;
	b=M+XiBZLvnS4bNyf917WB109HyC2w29CJUrl4+O3s0DgpsdEx7qd9LvVurUJCNhRS15Nnsu
	cRSfB+3pzT1O13psRd1f1F9RUn9biTeEoiOyQmgimdTbr/vjqZy4deWCmwndr0QD2ufJ+o
	Sqd0tsdtLPAXbSLtB6Ji4LmVP+iCKv0Wi8A/f7QNPsiv7QL9eRdaHboT0vES0Rkm5q3nVj
	SpwQ1re3o986jPQhDh5fxadxCmGBF1Vzc3lThDa3bMhOehonLIvbh9MLuv6ROwY5VULVZR
	2E4X2eG/cFMezVii0GULTAbaf5XfnGRONCEx1DX7F1mYfNUvbSlZMPFwSeGCFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644393741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FtIrm50qhttDnvw+t6HEGKMbZATCUZOMdzvBi9MSe90=;
	b=+3CvOrEeIA0hMtHDBMPRo5y999b5GRmR5FqI8tJFmUGxGgnh38jpNfHNPILyt8qyLKUD1R
	20dt3aOcmPlVKbDQ==
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Longpeng <longpeng2@huawei.com>,
	Gonglei <arei.gonglei@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH REPOST v2 1/2] x86/xen: Allow to retry if cpu_initialize_context() failed.
Date: Wed,  9 Feb 2022 09:02:13 +0100
Message-Id: <20220209080214.1439408-2-bigeasy@linutronix.de>
In-Reply-To: <20220209080214.1439408-1-bigeasy@linutronix.de>
References: <20220209080214.1439408-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Boris Ostrovsky <boris.ostrovsky@oracle.com>

If memory allocation in cpu_initialize_context() fails then it will
bring up the VCPU and leave with the corresponding CPU bit set in
xen_cpu_initialized_map.
The following (presumably successful) CPU bring up will BUG in
xen_pv_cpu_up() because nothing for that VCPU would be initialized.

Clear the CPU bits, that were set in cpu_initialize_context() in case
the memory allocation fails.

[ bigeasy: Creating a patch from Boris' email. ]

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20211206152034.2150770-2-bigeasy@linutronix=
.de
---
 arch/x86/xen/smp_pv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 4a6019238ee7d..57c3f9332ec94 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -260,8 +260,11 @@ cpu_initialize_context(unsigned int cpu, struct task_s=
truct *idle)
 		return 0;
=20
 	ctxt =3D kzalloc(sizeof(*ctxt), GFP_KERNEL);
-	if (ctxt =3D=3D NULL)
+	if (ctxt =3D=3D NULL) {
+		cpumask_clear_cpu(cpu, xen_cpu_initialized_map);
+		cpumask_clear_cpu(cpu, cpu_callout_mask);
 		return -ENOMEM;
+	}
=20
 	gdt =3D get_cpu_gdt_rw(cpu);
=20
--=20
2.34.1



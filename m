Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2EAD7916
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 19:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013364.1391878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPlqv-0000qM-TV; Thu, 12 Jun 2025 17:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013364.1391878; Thu, 12 Jun 2025 17:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPlqv-0000mq-OS; Thu, 12 Jun 2025 17:36:37 +0000
Received: by outflank-mailman (input) for mailman id 1013364;
 Thu, 12 Jun 2025 17:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIJj=Y3=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1uPlqu-000083-5E
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 17:36:36 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c80b2ae2-47b3-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 19:36:34 +0200 (CEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCjL9N021397;
 Thu, 12 Jun 2025 17:36:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474dv7v8ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 17:36:18 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CHS242001227;
 Thu, 12 Jun 2025 17:36:17 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474dv7v8m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 17:36:17 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CE5jqi021839;
 Thu, 12 Jun 2025 17:36:16 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47505061m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 17:36:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 55CHaEt946072194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Jun 2025 17:36:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C36F20043;
 Thu, 12 Jun 2025 17:36:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3887420040;
 Thu, 12 Jun 2025 17:36:14 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 12 Jun 2025 17:36:14 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
 id A94ADE19DB; Thu, 12 Jun 2025 19:36:13 +0200 (CEST)
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
X-Inumbo-ID: c80b2ae2-47b3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=weooV9zJodYcbtNTa
	8+KZfA3fL5XKJwaSF2bq6quK9Y=; b=LSN9nTMcDnJIjCX8Bg00mrd05eT7hUuHF
	uuKWNUc6sZR4AMlWU7xhYoVouX1sOoYyy6PIWthmqDdNebOXQZ7B41+bNf6vlaYH
	kkZ9bo4u+cH8+LVq9514oaCRyYHVL3VX37G3J0MqL6bBW+HGsyoy6GcAyDwrNH7Y
	FHGNjuCGPCXoPxoeibvgpcrGVyOu6+gwMO3RZhdYa505EA7IhjOphEFvmjoWTlxF
	JuxiwH51mVpt3qrC3vANlOIGYgYjcGaqpg2tN/eUvq0QNMuQXODNnqQI+bRZkOXJ
	VjrIfiMKNWZyely7vz79FXHdVa4C2/7aycYSQQKthFaESJC+He5Eg==
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>,
        Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH 6/6] powerpc/64s: Do not re-activate batched TLB flush
Date: Thu, 12 Jun 2025 19:36:13 +0200
Message-ID: <8625a1d97dcf4ae499b4bb341e27346f768a7248.1749747752.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1749747752.git.agordeev@linux.ibm.com>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vQTY3M8ZzSt0cV8-T9uSmi-uBIYEQ6jo
X-Proofpoint-GUID: ilIcPrMxf5Pvcy-DGizNo5pQfOED9ogK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMiBTYWx0ZWRfX4hJe95qNcCfd ZiGA4V6bFSTahSxOdWra2ve+MTIch6VbUpSLy9/ie7s8Ie297H4KM++vXLqMaovxILSX/VEH7Wd kL8MyHFoqx96u5mOCGyBdQBufIfHdynh/CGelm35zApCFLN5oxqqgVJ1arMbCxOEKkamxhCcQye
 T4p0jaYnpDgiPAOCiq39P+LTkqDP2vbt+LMS1z2CvkzZGQexAIAmpDiNPfHVf+G1uXLcXOE6U5i OsZ7V6mTRdR0DBm/QtbuD0iTOQBU5jFIaSMQMFqtSBv6tG54QRa2g6Dp1oUK3GV/GQFz/SGEskt ZXn/w51Xb8tzMBLP0YYYHDaeDFEkaV4fsqRoFnw2dboBfFVZA1+J+xjRcI4OfWbgbBcpVESfnm6
 /7oQbflnv5Pj4LYSf4VrIQyml0ZufqpOCdiLtdZRi1M7LkYKIRyWGlH1NBkJIEu9ljeGJpAm
X-Authority-Analysis: v=2.4 cv=CfMI5Krl c=1 sm=1 tr=0 ts=684b1012 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=OhCMzGPqdLFamtb4m9QA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=477 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120132

Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
lazy mmu mode") a task can not be preempted while in lazy MMU mode.
Therefore, the batch re-activation code is never called, so remove it.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/powerpc/include/asm/thread_info.h |  2 --
 arch/powerpc/kernel/process.c          | 25 -------------------------
 2 files changed, 27 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 2785c7462ebf..092118a68862 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -154,12 +154,10 @@ void arch_setup_new_exec(void);
 /* Don't move TLF_NAPPING without adjusting the code in entry_32.S */
 #define TLF_NAPPING		0	/* idle thread enabled NAP mode */
 #define TLF_SLEEPING		1	/* suspend code enabled SLEEP mode */
-#define TLF_LAZY_MMU		3	/* tlb_batch is active */
 #define TLF_RUNLATCH		4	/* Is the runlatch enabled? */
 
 #define _TLF_NAPPING		(1 << TLF_NAPPING)
 #define _TLF_SLEEPING		(1 << TLF_SLEEPING)
-#define _TLF_LAZY_MMU		(1 << TLF_LAZY_MMU)
 #define _TLF_RUNLATCH		(1 << TLF_RUNLATCH)
 
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 855e09886503..edb59a447149 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1281,9 +1281,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
 {
 	struct thread_struct *new_thread, *old_thread;
 	struct task_struct *last;
-#ifdef CONFIG_PPC_64S_HASH_MMU
-	struct ppc64_tlb_batch *batch;
-#endif
 
 	new_thread = &new->thread;
 	old_thread = &current->thread;
@@ -1291,14 +1288,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	WARN_ON(!irqs_disabled());
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
-	batch = this_cpu_ptr(&ppc64_tlb_batch);
-	if (batch->active) {
-		current_thread_info()->local_flags |= _TLF_LAZY_MMU;
-		if (batch->index)
-			__flush_tlb_pending(batch);
-		batch->active = 0;
-	}
-
 	/*
 	 * On POWER9 the copy-paste buffer can only paste into
 	 * foreign real addresses, so unprivileged processes can not
@@ -1369,20 +1358,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	 */
 
 #ifdef CONFIG_PPC_BOOK3S_64
-#ifdef CONFIG_PPC_64S_HASH_MMU
-	/*
-	 * This applies to a process that was context switched while inside
-	 * arch_enter_lazy_mmu_mode(), to re-activate the batch that was
-	 * deactivated above, before _switch(). This will never be the case
-	 * for new tasks.
-	 */
-	if (current_thread_info()->local_flags & _TLF_LAZY_MMU) {
-		current_thread_info()->local_flags &= ~_TLF_LAZY_MMU;
-		batch = this_cpu_ptr(&ppc64_tlb_batch);
-		batch->active = 1;
-	}
-#endif
-
 	/*
 	 * Math facilities are masked out of the child MSR in copy_thread.
 	 * A new task does not need to restore_math because it will
-- 
2.48.1



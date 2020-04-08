Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74471A1B6B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 07:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM2vn-0004Ou-2r; Wed, 08 Apr 2020 05:07:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sdaI=5Y=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1jM2vm-0004OS-7l
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 05:07:18 +0000
X-Inumbo-ID: ccaca142-7956-11ea-81bb-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccaca142-7956-11ea-81bb-12813bfff9fa;
 Wed, 08 Apr 2020 05:07:10 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03854F75012937;
 Wed, 8 Apr 2020 05:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=b9ZDBcnjVqZYjAykwqlmE2xiwEK9dL8itGzqN60MSKM=;
 b=yvqh2h8fRSDw2IhBIhVmT8Jhg9RgCzoi3zM12GriJP7fRL7dt2B//8NqeTUyB00lh8X8
 IGGhpQ/2Bon2IuLfRqt9DwjBZXJ7PQf6SkIEadHvUmDYV4eToQQetFRQVdux8EYCGWin
 l4bX6zTIsPz9IeO2nXSUunQMy7sO4/t/ONz7K9g+FfZP5LYPCJQMbi+k5CH5htsMNWBq
 nM/zMdP6NNwLvJLu83EW/rx0DSl3EEyxneBAuHj+sm1CQ3GM4d717qkNjFOP/vZu6+yN
 Zy9Y59GZbOzSafi2urXoMJmSD4oLAPKhMSTKhg0MLR6pb+ZS74PmsNVFAya2wIY3SGoA qQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3091m3914c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:07:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03853Ksr158690;
 Wed, 8 Apr 2020 05:05:03 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 3091m01fjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:05:03 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 038551MG007321;
 Wed, 8 Apr 2020 05:05:01 GMT
Received: from monad.ca.oracle.com (/10.156.75.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 07 Apr 2020 22:05:01 -0700
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [RFC PATCH 04/26] x86/alternatives: Refactor alternatives_smp_module*
Date: Tue,  7 Apr 2020 22:03:01 -0700
Message-Id: <20200408050323.4237-5-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408050323.4237-1-ankur.a.arora@oracle.com>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 suspectscore=2
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080037
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080037
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 peterz@infradead.org, hpa@zytor.com, Ankur Arora <ankur.a.arora@oracle.com>,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Refactor alternatives_smp_module* logic to make it available for
holding generic late patching state.

Most of the changes are to pull the module handling logic out
from CONFIG_SMP. In addition now we unconditionally call
alternatives_smp_module_add() and make the decision on patching
for UP or not there.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/include/asm/alternative.h | 13 ++-----
 arch/x86/kernel/alternative.c      | 55 ++++++++++++++++--------------
 2 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 13adca37c99a..8235bbb746d9 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -75,24 +75,15 @@ extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);
 
 struct module;
 
-#ifdef CONFIG_SMP
 extern void alternatives_smp_module_add(struct module *mod, char *name,
 					void *locks, void *locks_end,
 					void *text, void *text_end);
 extern void alternatives_smp_module_del(struct module *mod);
-extern void alternatives_enable_smp(void);
 extern int alternatives_text_reserved(void *start, void *end);
-extern bool skip_smp_alternatives;
+#ifdef CONFIG_SMP
+extern void alternatives_enable_smp(void);
 #else
-static inline void alternatives_smp_module_add(struct module *mod, char *name,
-					       void *locks, void *locks_end,
-					       void *text, void *text_end) {}
-static inline void alternatives_smp_module_del(struct module *mod) {}
 static inline void alternatives_enable_smp(void) {}
-static inline int alternatives_text_reserved(void *start, void *end)
-{
-	return 0;
-}
 #endif	/* CONFIG_SMP */
 
 #define b_replacement(num)	"664"#num
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index fdfda1375f82..32aa1ddf441d 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -470,6 +470,13 @@ static void alternatives_smp_unlock(const s32 *start, const s32 *end,
 	}
 }
 
+static bool uniproc_patched;	/* protected by text_mutex */
+#else	/* !CONFIG_SMP */
+#define uniproc_patched false
+static inline void alternatives_smp_unlock(const s32 *start, const s32 *end,
+					   u8 *text, u8 *text_end) { }
+#endif	/* CONFIG_SMP */
+
 struct smp_alt_module {
 	/* what is this ??? */
 	struct module	*mod;
@@ -486,7 +493,6 @@ struct smp_alt_module {
 	struct list_head next;
 };
 static LIST_HEAD(smp_alt_modules);
-static bool uniproc_patched = false;	/* protected by text_mutex */
 
 void __init_or_module alternatives_smp_module_add(struct module *mod,
 						  char *name,
@@ -495,23 +501,27 @@ void __init_or_module alternatives_smp_module_add(struct module *mod,
 {
 	struct smp_alt_module *smp;
 
-	mutex_lock(&text_mutex);
+#ifdef CONFIG_SMP
+	/* Patch to UP if other cpus not imminent. */
+	if (!noreplace_smp && (num_present_cpus() == 1 || setup_max_cpus <= 1))
+		uniproc_patched = true;
+#endif
 	if (!uniproc_patched)
-		goto unlock;
+		return;
 
-	if (num_possible_cpus() == 1)
-		/* Don't bother remembering, we'll never have to undo it. */
-		goto smp_unlock;
+	mutex_lock(&text_mutex);
 
-	smp = kzalloc(sizeof(*smp), GFP_KERNEL);
-	if (NULL == smp)
-		/* we'll run the (safe but slow) SMP code then ... */
-		goto unlock;
+	smp = kzalloc(sizeof(*smp), GFP_KERNEL | __GFP_NOFAIL);
 
 	smp->mod	= mod;
 	smp->name	= name;
-	smp->locks	= locks;
-	smp->locks_end	= locks_end;
+
+	if (num_possible_cpus() != 1 || uniproc_patched) {
+		/* Remember only if we'll need to undo it. */
+		smp->locks	= locks;
+		smp->locks_end	= locks_end;
+	}
+
 	smp->text	= text;
 	smp->text_end	= text_end;
 	DPRINTK("locks %p -> %p, text %p -> %p, name %s\n",
@@ -519,9 +529,9 @@ void __init_or_module alternatives_smp_module_add(struct module *mod,
 		smp->text, smp->text_end, smp->name);
 
 	list_add_tail(&smp->next, &smp_alt_modules);
-smp_unlock:
-	alternatives_smp_unlock(locks, locks_end, text, text_end);
-unlock:
+
+	if (uniproc_patched)
+		alternatives_smp_unlock(locks, locks_end, text, text_end);
 	mutex_unlock(&text_mutex);
 }
 
@@ -540,6 +550,7 @@ void __init_or_module alternatives_smp_module_del(struct module *mod)
 	mutex_unlock(&text_mutex);
 }
 
+#ifdef CONFIG_SMP
 void alternatives_enable_smp(void)
 {
 	struct smp_alt_module *mod;
@@ -561,6 +572,7 @@ void alternatives_enable_smp(void)
 	}
 	mutex_unlock(&text_mutex);
 }
+#endif /* CONFIG_SMP */
 
 /*
  * Return 1 if the address range is reserved for SMP-alternatives.
@@ -588,7 +600,6 @@ int alternatives_text_reserved(void *start, void *end)
 
 	return 0;
 }
-#endif /* CONFIG_SMP */
 
 #ifdef CONFIG_PARAVIRT
 void __init_or_module apply_paravirt(struct paravirt_patch_site *start,
@@ -723,21 +734,15 @@ void __init alternative_instructions(void)
 
 	apply_alternatives(__alt_instructions, __alt_instructions_end);
 
-#ifdef CONFIG_SMP
-	/* Patch to UP if other cpus not imminent. */
-	if (!noreplace_smp && (num_present_cpus() == 1 || setup_max_cpus <= 1)) {
-		uniproc_patched = true;
-		alternatives_smp_module_add(NULL, "core kernel",
-					    __smp_locks, __smp_locks_end,
-					    _text, _etext);
-	}
+	alternatives_smp_module_add(NULL, "core kernel",
+				    __smp_locks, __smp_locks_end,
+				    _text, _etext);
 
 	if (!uniproc_patched || num_possible_cpus() == 1) {
 		free_init_pages("SMP alternatives",
 				(unsigned long)__smp_locks,
 				(unsigned long)__smp_locks_end);
 	}
-#endif
 
 	apply_paravirt(__parainstructions, __parainstructions_end);
 	apply_paravirt(__parainstructions_runtime,
-- 
2.20.1



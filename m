Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29FE1A1B26
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 07:05:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM2tw-0002cx-FJ; Wed, 08 Apr 2020 05:05:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sdaI=5Y=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1jM2tv-0002cp-6F
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 05:05:23 +0000
X-Inumbo-ID: 8c4f2958-7956-11ea-81bb-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c4f2958-7956-11ea-81bb-12813bfff9fa;
 Wed, 08 Apr 2020 05:05:22 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 038548DP191274;
 Wed, 8 Apr 2020 05:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=vzLY3W6pyhiry0YbTLA6k/8Hm1Z7yOv34dOpb5FTaTE=;
 b=qr0UjqR9noiEapG/2uGPeaa+qlAvFcUPOv8/v5srmCWNf6Yyqwn4Y3EB8vYUlynBtqLi
 PnTYirPsZIADmW/KoizPSQxBfFMySPcOBhJ1chkvIMKvwRawLUlqwDxtB+tTKShD0qN7
 3+Hw2lIB85sESp0QzrA82nr8Wvaf6+wQbp9gvzSxL6Qf/bdDYRNNkgZvjUVrzkq4EJig
 w2JpoTyPnomhqeeIc5Gz5M0R6v5ChJwHobiL/5/HGKRS2d8je9idVLQY8gye0GyaFN87
 njqBnrlrHSu8VZsQUMb/oY1mmXNw96ID+tuzQ0VkP+zaev/YJKYafcRfJBuiiP/GxNOR /Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3091m0s0s6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:05:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03852Yjo062439;
 Wed, 8 Apr 2020 05:05:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 3091mh1kg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:05:10 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0385589q022152;
 Wed, 8 Apr 2020 05:05:08 GMT
Received: from monad.ca.oracle.com (/10.156.75.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 07 Apr 2020 22:05:08 -0700
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [RFC PATCH 08/26] x86/paravirt: Stash native pv-ops
Date: Tue,  7 Apr 2020 22:03:05 -0700
Message-Id: <20200408050323.4237-9-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408050323.4237-1-ankur.a.arora@oracle.com>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 bulkscore=0
 mlxlogscore=986 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004080037
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Introduce native_pv_ops where we stash the pv_ops array before
hypervisor specific hooks have modified it.

native_pv_ops get used when switching between paravirt and native
pv-ops at runtime.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/include/asm/paravirt_types.h |  4 ++++
 arch/x86/kernel/paravirt.c            | 10 ++++++++++
 arch/x86/kernel/setup.c               |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index f1153f53c529..bc935eec7ec6 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -339,6 +339,7 @@ extern struct paravirt_patch_template pv_ops;
 
 #ifdef CONFIG_PARAVIRT_RUNTIME
 #define PVRT_SUFFIX ".runtime"
+extern struct paravirt_patch_template native_pv_ops;
 #else
 #define PVRT_SUFFIX ""
 #endif
@@ -775,6 +776,9 @@ extern struct paravirt_patch_site __parainstructions[],
 #ifdef CONFIG_PARAVIRT_RUNTIME
 extern struct paravirt_patch_site __parainstructions_runtime[],
 	__parainstructions_runtime_end[];
+void paravirt_ops_init(void);
+#else
+static inline void paravirt_ops_init(void) { }
 #endif
 
 #endif	/* __ASSEMBLY__ */
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index c131ba4e70ef..8c511cc4d4f4 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -458,5 +458,15 @@ NOKPROBE_SYMBOL(native_set_debugreg);
 NOKPROBE_SYMBOL(native_load_idt);
 #endif
 
+#ifdef CONFIG_PARAVIRT_RUNTIME
+__ro_after_init struct paravirt_patch_template native_pv_ops;
+
+void __init paravirt_ops_init(void)
+{
+	native_pv_ops = pv_ops;
+}
+EXPORT_SYMBOL(native_pv_ops);
+#endif
+
 EXPORT_SYMBOL(pv_ops);
 EXPORT_SYMBOL_GPL(pv_info);
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index e6b545047f38..2746a6a78fe7 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -43,6 +43,7 @@
 #include <asm/unwind.h>
 #include <asm/vsyscall.h>
 #include <linux/vmalloc.h>
+#include <asm/paravirt_types.h>
 
 /*
  * max_low_pfn_mapped: highest directly mapped pfn < 4 GB
@@ -831,6 +832,7 @@ void __init setup_arch(char **cmdline_p)
 	boot_cpu_data.x86_phys_bits = MAX_PHYSMEM_BITS;
 #endif
 
+	paravirt_ops_init();
 	/*
 	 * If we have OLPC OFW, we might end up relocating the fixmap due to
 	 * reserve_top(), so do this before touching the ioremap area.
-- 
2.20.1



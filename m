Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE4ACAD82B
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 15:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180805.1503925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSchS-0004qQ-9C; Mon, 08 Dec 2025 14:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180805.1503925; Mon, 08 Dec 2025 14:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSchS-0004oz-5q; Mon, 08 Dec 2025 14:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1180805;
 Mon, 08 Dec 2025 14:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vD9b=6O=bounce.vates.tech=bounce-md_30504962.6936e7aa.v1-cb0d43ced0d84d198b2792fdcffce040@srs-se1.protection.inumbo.net>)
 id 1vSchR-0004ot-Gx
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 14:58:53 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 684e06a6-d446-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 15:58:51 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dQ4qt1JX9zFCWZfq
 for <xen-devel@lists.xenproject.org>; Mon,  8 Dec 2025 14:58:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cb0d43ced0d84d198b2792fdcffce040; Mon, 08 Dec 2025 14:58:50 +0000
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
X-Inumbo-ID: 684e06a6-d446-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765205930; x=1765475930;
	bh=N6ImtC6HQ94S7JRDNj4U9crgTjkhJCQeX0/zZwXKPgs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=TErzBhetmplvdFjOAa8RBngfF9gGaWBITUJBh+yf9hnIQb/mzvvVAz9XP0wSozHMR
	 ZrfJXzFEHA6drcInYDvM9xN/oNp3qpEp2POFiMTtJUfcTl9Nu1I1nJs5PiP7MBsAVE
	 aPnCUz8UvJ8gA0Vz3t5PHbEI8YpPpcA8D8TQVywRaH1xu96D2CqWscgvYeFIAuZfng
	 4lvbQUlU0D0y5ob4ShAmPQkgOUFVbdsiCarM/Uh63++ayADnDVRHivpn4546Ps2/yN
	 VGUUhTVChfcJX2gbDQL26XYB9eoLgcOnAPUaugko6Hz7fE51I6k2xSOwba7Sd5t8zs
	 Yuav92ou37y0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765205930; x=1765466430; i=teddy.astie@vates.tech;
	bh=N6ImtC6HQ94S7JRDNj4U9crgTjkhJCQeX0/zZwXKPgs=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=kAaJH5y3KtSF132Fjdyu41FX6KAtP/gVQiBdtO28K99YdMiNIWKveOJxkgSwOfv6j
	 QcZE8QbwLP64JtKjolwtGHMB2IG54MqqMsyR1ocIRAp/9lmGZiJfJxEV+wetJIPYIn
	 a2IJsU8ZvkqzQWXtIUd6fPK5an7z8HeXnIsfMEYpGMf0MzPjq0yCjq6OxYwCp0Ii6V
	 xDdjxs72Vlu49h4b03CP7csSK839/QA5XKMdoqeK2Xa0MVScOWxWrNQU/J/6ZhHd0S
	 qOHl+NNd3fTs5gO2XsV0eWg88tit6+qXmEP88lS5apFPQU1J6jfEWRbBCAlY87kk+5
	 gutwHeVIdLq4g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH]=20x86/svm:=20Use=20host=5Fcpu=5Fpolicy=20instead=20of=20open-coding=20cpuid?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765205928753
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <200f5b367f3a375382324f778c730bc63124d47d.1765204254.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cb0d43ced0d84d198b2792fdcffce040?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251208:md
Date: Mon, 08 Dec 2025 14:58:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

host_cpu_policy already fetched the SVM CPUIDs, use it instead of open-coding cpuid.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
It very likely doesn't work right now, as host_cpu_policy is not evaluated at this point
(start_svm is unfortunately called before calculate_host_policy). So this is mostly a intent
rather than something ready.

There are also some other things I would like to improve on this, but not sure on the approach.

It would be nice to move svm_feature_flags to host_cpu_policy, alike other
bitmap-like leafs we have in cpu_policy. IOW move most of arch/x86/include/asm/hvm/svm/svm.h
to cpu_policy infrastructure, which could also serve later for properly managing nested SVM
features of a guest.

And also move most policy calculation to it (feature dependencies check, erratas, ...).
For instance check for AMD_ERRATUM_170 in cpu policy code, and mask cpu_has_svm_flushbyasid
if CPU is affected, trying to declutter SVM logic from some errata checks.

 xen/arch/x86/hvm/svm/asid.c          | 3 ++-
 xen/arch/x86/hvm/svm/svm.c           | 4 ++--
 xen/include/xen/lib/x86/cpu-policy.h | 5 ++++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 03f98b7a8b..0af5874b76 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -5,6 +5,7 @@
  */
 
 #include <asm/amd.h>
+#include <asm/cpu-policy.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svm.h>
 
@@ -16,7 +17,7 @@ void svm_asid_init(const struct cpuinfo_x86 *c)
 
     /* Check for erratum #170, and leave ASIDs disabled if it's present. */
     if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
-        nasids = cpuid_ebx(0x8000000aU);
+        nasids = host_cpu_policy.extd.nasid;
 
     hvm_asid_init(nasids);
 }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2d7c598ffe..e3f503c328 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -15,6 +15,7 @@
 
 #include <asm/amd.h>
 #include <asm/apic.h>
+#include <asm/cpu-policy.h>
 #include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/debugreg.h>
@@ -2494,8 +2495,7 @@ const struct hvm_function_table * __init start_svm(void)
 
     setup_vmcb_dump();
 
-    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000aU )
-        svm_feature_flags = cpuid_edx(0x8000000aU);
+    svm_feature_flags = host_cpu_policy.extd.svm_feature_flags;
 
     printk("SVM: Supported advanced features:\n");
 
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f94f23e159..1e639ae713 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -270,7 +270,10 @@ struct cpu_policy
             uint32_t /* d */:32;
 
             uint64_t :64, :64; /* Leaf 0x80000009. */
-            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
+
+            /* Leaf 0x8000000a - SVM rev and features. */
+            uint32_t :32, nasid:32, :32, svm_feature_flags:32;
+
             uint64_t :64, :64; /* Leaf 0x8000000b. */
             uint64_t :64, :64; /* Leaf 0x8000000c. */
             uint64_t :64, :64; /* Leaf 0x8000000d. */
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



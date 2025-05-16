Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AD9AB9A3B
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986884.1372421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsN3-0007Ch-5b; Fri, 16 May 2025 10:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986884.1372421; Fri, 16 May 2025 10:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsN3-0007AP-2u; Fri, 16 May 2025 10:32:53 +0000
Received: by outflank-mailman (input) for mailman id 986884;
 Fri, 16 May 2025 10:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zk3F=YA=bounce.vates.tech=bounce-md_30504962.6827127b.v1-7f39565cc8474cdab9afc80d3eba8c0e@srs-se1.protection.inumbo.net>)
 id 1uFsFS-0000kS-7H
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:25:02 +0000
Received: from mail187-4.suw11.mandrillapp.com
 (mail187-4.suw11.mandrillapp.com [198.2.187.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0562caa4-3240-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:25:00 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-4.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZzNVz4HQJzlkq4C
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 10:24:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7f39565cc8474cdab9afc80d3eba8c0e; Fri, 16 May 2025 10:24:59 +0000
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
X-Inumbo-ID: 0562caa4-3240-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747391099; x=1747661099;
	bh=09td6MHuWEdAtrsXq56Leo+iJWk3EtNEWxuIkhfA2QY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=a2gbiYcDd7G4EV3R5dxVsuqVVKQkuHXSZ49ZrcQCKwpH+qX/qpCklXy/nF5zhmYDD
	 hhiShkEoS8n5h7/Gu46AcEd3w0qx5jzrjZA/tzc9NqYGBzXekD3T0+P2feDSoqCRZ9
	 71LZ2prWtjXd88k5UBe/qm0jrtC/9ybHTqZkQVn6e/8RYSXOtHBTIXYhj8PnvRAi8j
	 yb05w6xYqgKIzo2ASJ2pKRQcfyXVLV1G7FbCfWmDA7WMxG45mfvkuK3mlmPV1iqdoJ
	 mYMg9moILLsRk0G73K4WXZesxLzlgYibF1IDQRnoNn2wmfFk6WTuvCmr0oC2HdR+YM
	 WcU0gsRV1YBhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747391099; x=1747651599; i=teddy.astie@vates.tech;
	bh=09td6MHuWEdAtrsXq56Leo+iJWk3EtNEWxuIkhfA2QY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ChFOJqpTBxrMueYRacemat+PhOtQRul24i2hKMOu+K6adyvVryfz1rexR0B7HCG8l
	 vloHswhqGTnRPsIelIFWY24288wh2izec/m9cro0zButbUNKTHp4lRRkUHi84Ja5V1
	 rCWqKsl1K1iWLOuZrv7rgdETeSijzFJ5G5qIhptnTui/53vIQ9hYw/QcV48qXgfkVz
	 tQHuNkzoly0ZXMIWoCBL5ybb0rrabfGDgl0T33yxIsac1ZouTwdK+BAcxyNTf/ORbS
	 5Aan1fymqhrtyc0MoC6NmkG5O3/Zh0QsUAtqU3Re64uoGCmyAqKK8nq7izgg2hLaq3
	 Xcp6feiEQMHBw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2016/16]=20HACK:=20Add=20sev=5Fconsole=20hypercall?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747391098333
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <ca3cae348fe6e774e0c8afda8e2adf5913e8fa44.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7f39565cc8474cdab9afc80d3eba8c0e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 10:24:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce a basic console hypercall for debugging needs under SEV
when PV console is not usable at this point. This is later on used
by the earlyprintk of the experimental SEV Linux branch.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/common/coco.c            | 6 ++++++
 xen/include/hypercall-defs.c | 2 ++
 xen/include/public/xen.h     | 1 +
 3 files changed, 9 insertions(+)

diff --git a/xen/common/coco.c b/xen/common/coco.c
index d9bd17628d..23c0da6281 100644
--- a/xen/common/coco.c
+++ b/xen/common/coco.c
@@ -131,4 +131,10 @@ long do_coco_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     }
 }
 
+long do_sev_console_op(unsigned long c)
+{
+    printk("%c", (unsigned char)c);
+    return 0;
+}
+
 __initcall(coco_init);
\ No newline at end of file
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 6c01a9e395..19f40f0b38 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -210,6 +210,7 @@ hypfs_op(unsigned int cmd, const char *arg1, unsigned long arg2, void *arg3, uns
 xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
 #endif
 coco_op(unsigned int cmd, void *arg)
+sev_console_op(unsigned long c)
 
 #ifdef CONFIG_PV
 caller: pv64
@@ -297,5 +298,6 @@ mca                                do       do       -        -        -
 paging_domctl_cont                 do       do       do       do       -
 #endif
 coco_op                            do       do       do       do       do
+sev_console_op                     do       do       do       do       -
 
 #endif /* !CPPCHECK */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e656d6f617..04fc891353 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -119,6 +119,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_dm_op                41
 #define __HYPERVISOR_hypfs_op             42
 #define __HYPERVISOR_coco_op              43
+#define __HYPERVISOR_sev_console_op       45
 
 /* Architecture-specific hypercall definitions. */
 #define __HYPERVISOR_arch_0               48
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


